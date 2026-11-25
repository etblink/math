"""Independent full direct-derivative fixture replay for mixed104.

No historical C++ kernels, rotation derivative shortcuts, cyclic H3 anchor
or polynomial reconstruction. Python arbitrary precision Gaussian integers.
Run from checkout: python replay_direct_fixture.py 001 --output /tmp/001.json
Expensive; start with rank-one fixture. All 27 derivatives are evaluated.
The comparison covers max(p,q)>=17 only, not archived old-old placeholders.
"""
import argparse, hashlib, itertools as it, json, re, sys
from fractions import Fraction
from pathlib import Path
from functools import lru_cache
D=Path(__file__).resolve().parent.parent
ROOT=next(p for p in D.parents if (p/'lean').is_dir())
sys.path.insert(0,str(D/'bfss-seed-transport'))
from independent_integer_recheck import read_seed, scatter, gather, rotate, words_and_terms, self_test
N=8072064
SCALE=330
P=list(it.product(range(3),range(9)))
PAIRS=list(it.combinations(range(3),2))
SP=list(it.combinations(range(9),2))
DEG=list(range(9))+[p+3 for p in range(6) for _ in range(2)]
def pin(path,sha):
    b=path.read_bytes()
    assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==sha
    return b
def gamma():
    _,f,s,_=words_and_terms()
    return [[(a^f[i],(-1)**((a&s[i]).bit_count())) for a in range(16)] for i in range(9)]
def mul(A,B):
    return [(B[j][0],w*B[j][1]) for j,w in A]
def add(out,m,r,i):
    a,b=out.get(m,(0,0));v=a+r,b+i
    if v!=(0,0):out[m]=v
    else:out.pop(m,None)
def lin(*parts):
    out={}
    for c,v in parts:
        if c:
            for m,(r,i) in v.items():add(out,m,c*r,c*i)
    return out
def bil(a,b,M,phase=0):
    return [(i,a,j,b,w,phase) for i,(j,w) in enumerate(M)]
def ops(*parts):
    return [(p,u,q,v,c*k,h) for k,T in parts if k for p,u,q,v,c,h in T]
STATS={'dual_calls':0}
def apply(T,V):
    if not T or not V:return {}
    out={}
    for h in sorted({t[-1] for t in T}):
        terms=[t[:5] for t in T if t[-1]==h]
        A,ta=scatter(V,terms);B,tb=gather(V,terms)
        assert A==B and ta==tb,('integer action mismatch',STATS)
        STATS['dual_calls']+=1
        for m,(a,b) in A.items():add(out,m,*rotate(a,b,h))
    return out
def dot_complex(A,B):
    r=i=0
    for m,(a,b) in A.items():
        c,d=B.get(m,(0,0));r+=a*c+b*d;i+=a*d-b*c
    return r,i

def dot(A,B):
    r,i=dot_complex(A,B)
    assert i==0,('imaginary contraction',i)
    return r
def tensor(x,e=None):
    # Literal color symmetrization and both trace insertions. All scalar ints.
    @lru_cache(None)
    def U(a,b,c,i,j,k):
        result=0
        for A,B,C in it.permutations((a,b,c)):
            p,q,r=9*A+i,9*B+j,9*C+k
            if e is None:result+=x[p]*x[q]*x[r]
            else:result+=(p==e)*x[q]*x[r]+x[p]*(q==e)*x[r]+x[p]*x[q]*(r==e)
        return result
    @lru_cache(None)
    def tr(c,i,j,k):return sum(U(a,a,c,i,j,k) for a in range(3))
    @lru_cache(None)
    def F(a,b,c,i,j,k):
        return 5*U(a,b,c,i,j,k)-(a==b)*tr(c,i,j,k)-(a==c)*tr(b,i,j,k)-(b==c)*tr(a,i,j,k)
    @lru_cache(None)
    def trace(a,b,c,k):return sum(F(a,b,c,i,i,k) for i in range(9))
    T={}
    for p,(a,i) in enumerate(P):
        for q,(b,j) in enumerate(P):
            for r,(c,k) in enumerate(P):
                v=(i==j)*trace(a,b,c,k)+(i==k)*trace(a,b,c,j)+(j==k)*trace(a,b,c,i)
                if v:T.setdefault(p,{}).setdefault(q,[]).append((v,r))
    return T
def cross(x,j,k,b):
    a,c=(b+1)%3,(b+2)%3
    return x[9*a+j]*x[9*c+k]-x[9*c+j]*x[9*a+k]
def run(diag,out):
    g=gamma();seed=read_seed();assert dot(seed,seed)==N
    K=[bil((a+1)%3,(a+2)%3,g[i],1) for a,i in P]
    x=[diag[a] if a==i else 0 for a,i in P]
    def Z(y):return ops(*[(y[9*a+i],K[k]) for k,(a,i) in enumerate(P)])
    def M(y,d,c):return ops(*[(y[9*d+i],K[9*c+i]) for i in range(9)])
    def L(y):return [Z(y)]+[ops((1,M(y,d,c)),(-1,M(y,c,d))) for d,c in PAIRS]
    z=Z(x);ls=L(x);w=apply(z,seed)
    first=[apply(k,seed) for k in K]
    def H(T):
        outer={}
        for p,qs in T.items():
            mid={}
            for q,rs in qs.items():
                v=lin(*[(c,first[r]) for c,r in rs])
                mid=lin((1,mid),(1,apply(K[q],v)))
            if mid:outer=lin((1,outer),(1,apply(K[p],mid)))
        return outer # 330 * scaled H3
    def Phi():
        return lin((320*SCALE*sum(v*v for v in x),w),*[(-2*SCALE,apply(l,apply(l,w))) for l in ls])
    V=[lin((SCALE,seed))]
    for _ in range(8):V.append(apply(z,V[-1]))
    V.extend([Phi(),H(tensor(x))])
    for _ in range(5):V.extend([apply(z,V[-2]),apply(z,V[-1])])
    assert len(V)==21
    active=[(p,q) for p,q in it.product(range(21),repeat=2) if max(p,q)>=17]
    # Diagnostic, not an acceptance relaxation: retain both components.
    imaginary=[];real_errors=[];hermitian_errors=[];completed=[]
    anchor=dot(V[10],V[10])
    expected_anchor=36*265261122846720 if diag==(0,0,1) else None
    anchor_ok=expected_anchor is None or anchor==expected_anchor
    checkpoint=out.with_name(out.stem+'-checkpoint.json')
    def save_checkpoint():
        checkpoint.write_text(json.dumps({'diag':diag,'completed_coordinates':completed,'imaginary':imaginary,'hermitian_errors':hermitian_errors,'H3_scaled_norm2':str(anchor),'H3_expected_scaled_norm2':str(expected_anchor),'H3_anchor_ok':anchor_ok,'accumulation':STATS},indent=2)+'\n')
    save_checkpoint()
    assert anchor_ok,('H3 anchor',anchor,expected_anchor)
    def gram(A,B,family,coord):
        result={pq:dot_complex(A[pq[0]],B[pq[1]]) for pq in active}
        if family=='tau':
            for (p,q),(r,i) in result.items():
                if result[q,p]!=(r,-i):hermitian_errors.append([coord,p,q])
        for (p,q),(r,i) in result.items():
            if i:
                if not imaginary:print('first imaginary component',family,coord,p,q,r,i,flush=True)
                imaginary.append([family,coord,p,q,str(r),str(i)])
        return {pq:r for pq,(r,i) in result.items()}
    def B2(b,k):return ops(*[(x[9*a+i],bil(a,b,mul(g[i],g[k]))) for a,i in P if x[9*a+i] and (a,i)!=(b,k)])
    CV=ops(*[(x[9*c+i]*cross(x,j,k,b),bil(c,b,mul(mul(g[i],g[j]),g[k]),1)) for c,i in P if x[9*c+i] for j,k in SP for b in range(3) if cross(x,j,k,b)])
    tau=dict.fromkeys(active,0);beta=dict.fromkeys(active,0);nu=[];tt=[];eu=[{} for _ in V]
    for k,(b,i) in enumerate(P):
        e=[int(j==k) for j in range(27)];dz=K[k];dl=L(e);dw=first[k]
        dphi=lin((640*SCALE*x[k],w),(320*SCALE*sum(v*v for v in x),dw),*[(-2*SCALE,v) for l,h in zip(ls,dl) for v in (apply(h,apply(l,w)),apply(l,apply(h,w)),apply(l,apply(l,dw)))])
        A=[{}]
        for j in range(8):A.append(lin((1,apply(dz,V[j])),(1,apply(z,A[-1]))))
        A.extend([dphi,H(tensor(x,k))])
        for j in range(9,19,2):
            A.extend([lin((1,apply(dz,V[r])),(1,apply(z,A[r]))) for r in (j,j+1)])
        BV=[apply(B2(b,i),v) for v in V]
        for pq,val in gram(A,A,'tau',[b,i]).items():tau[pq]+=val
        for pq,val in gram(BV,A,'beta',[b,i]).items():beta[pq]-=val
        if b==i:
            nu.append({pq:x[k]*v for pq,v in gram(V,A,'nu',[b,i]).items()})
            tt.append({pq:x[k]*v for pq,v in gram(V,BV,'t',[b,i]).items()})
        if x[k]:eu=[lin((1,u),(x[k],v)) for u,v in zip(eu,A)]
        completed.append([b,i]);save_checkpoint()
        print('direct derivative',b,i,flush=True)
    euler_errors=[p for p,(u,d,v) in enumerate(zip(eu,DEG,V)) if u!=lin((d,v))]
    cv=gram(V,[apply(CV,v) for v in V],'v',None)
    save_checkpoint()
    path=D/'bfss-mixed104'/('jet_'+''.join(map(str,diag))+'.json')
    if diag==(0,0,1):pin(path,'89a8c71ccf96f20ed9f6c378341d826135b47afd')
    receipt=json.loads(path.read_text());assert receipt['degrees']==DEG
    counts={};errors=[]
    for name,group in [('tau',[tau]),('beta',[beta]),('nu',nu),('t',tt),('v',[cv])]:
        counts[name]=0
        for axis,A in enumerate(group):
            for (p,q),v in A.items():
                parity=DEG[p]+DEG[q]+(name=='v')
                if parity%2 and v:real_errors.append([name,axis,p,q,str(v),'odd-degree nonzero'])
                actual=Fraction(v,N*SCALE*SCALE*2**(parity//2)*(2 if name in ('beta','t') else 1))
                r=receipt[name][axis] if name in ('nu','t') else receipt[name]
                expected=Fraction(r[p][q]);counts[name]+=1
                if actual!=expected:errors.append([name,axis,p,q,str(actual),str(expected)])
    report={'diag':diag,'receipt_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'comparisons':counts,'errors':errors,'odd_degree_errors':real_errors,'Euler_exact':not euler_errors,'Euler_errors':euler_errors,'H3_anchor_ok':anchor_ok,'H3_scaled_norm2':str(anchor),'H3_expected_scaled_norm2':str(expected_anchor),'imaginary_count':len(imaginary),'imaginary':imaginary,'hermitian_errors':hermitian_errors,'accumulation':STATS,'scope':'max(p,q)>=17; literal direct 27-coordinate derivatives; no old-old placeholders'}
    out.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='imaginary'},indent=2),flush=True)
    assert not errors and not real_errors and not euler_errors and anchor_ok and not hermitian_errors,('real/source diagnostics',errors[:5],real_errors[:5],euler_errors,anchor_ok,hermitian_errors[:5])
    print('BFSS_DIRECT_FIXTURE_REAL_RECEIPTS_PASS',flush=True)
    assert not imaginary,('historical zero-imaginary premise discrepancy',len(imaginary),imaginary[:5])
    assert 'numpy' not in sys.modules
    print('BFSS_DIRECT_FIXTURE_EXACT_PASS',flush=True)
def selftest():
    self_test()
    g=gamma()
    for i,j in it.product(range(9),repeat=2):
        A,B=mul(g[i],g[j]),mul(g[j],g[i])
        assert all((a==b and w==-v) if i!=j else (a==k and b==k and w==v==1) for k,((a,w),(b,v)) in enumerate(zip(A,B)))
    x=[int(k==0) for k in range(27)]
    T=tensor(x)
    assert sum(len(rs) for qs in T.values() for rs in qs.values())==175
    assert sum(v*v for qs in T.values() for rs in qs.values() for v,k in rs)==11880
    def flat(T):return {(p,q,k):v for p,qs in T.items() for q,rs in qs.items() for v,k in rs}
    for k in range(27):
        A=flat(tensor(x,k));B=flat(tensor([v+int(j==k) for j,v in enumerate(x)]));C=flat(tensor([v-int(j==k) for j,v in enumerate(x)]));D=flat(tensor([v+2*int(j==k) for j,v in enumerate(x)]));E=flat(tensor([v-2*int(j==k) for j,v in enumerate(x)]))
        assert all(12*A.get(t,0)==8*(B.get(t,0)-C.get(t,0))-(D.get(t,0)-E.get(t,0)) for t in set(A)|set(B)|set(C)|set(D)|set(E))
    assert 'numpy' not in sys.modules
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('diag',nargs='?',default='001');p.add_argument('--output',type=Path);p.add_argument('--self-test',action='store_true');a=p.parse_args()
    selftest()
    print('BFSS_DIRECT_FIXTURE_SELFTEST_PASS',flush=True)
    if not a.self_test:
        assert len(a.diag)==3 and a.output is not None
        run(tuple(map(int,a.diag)),a.output)
