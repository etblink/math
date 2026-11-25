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
import numpy as np
D=Path(__file__).resolve().parent.parent
ROOT=next(p for p in D.parents if (p/'lean').is_dir())
sys.path.insert(0,str(D/'bfss-seed-transport'))
from independent_integer_recheck import read_seed
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
    src=pin(ROOT/'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMSYPythonGammaRows.lean','818ff344566c2f2552a30591d92fb7f718efe866').decode()
    def read(n):return list(map(int,re.search(r'def '+n+r'[^\n]*\n?\s*!\[([^\]]+)\]',src)[1].split(',')))
    f,s=read('pythonFlipMask'),read('pythonSignMask')
    g=np.zeros((9,16,16),dtype=np.int64)
    for i,a in it.product(range(9),range(16)):g[i,a,a^f[i]]=(-1)**((a&s[i]).bit_count())
    assert all(np.array_equal(g[i]@g[j]+g[j]@g[i],2*(i==j)*np.eye(16,dtype=int)) for i,j in it.product(range(9),repeat=2))
    return g
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
    # Literal right-to-left Majorana actions, not archived compiled masks.
    return [(3*(int(i)//2)+a,int(i)%2,3*(int(j)//2)+b,int(j)%2,int(M[i,j]),phase) for i,j in zip(*np.nonzero(M))]
def ops(*parts):
    return [(p,u,q,v,c*k,h) for k,T in parts if k for p,u,q,v,c,h in T]
def apply(T,V):
    out={}
    for p,u,q,v,c,h in T:
        for m,(r,i) in V.items():
            n=m^(1<<q)
            phase=(h+u+v+2*((m&((1<<q)-1)).bit_count()+v*((m>>q)&1)+(n&((1<<p)-1)).bit_count()+u*((n>>p)&1)))%4
            a,b=((r,i),(-i,r),(-r,-i),(i,-r))[phase]
            add(out,n^(1<<p),c*a,c*b)
    return out
def dot(A,B):
    r=i=0
    for m,(a,b) in A.items():
        c,d=B.get(m,(0,0));r+=a*c+b*d;i+=a*d-b*c
    assert i==0,('imaginary contraction',i)
    return r
def tensor(x,e=None):
    # Differentiate the three literal tensor factors before trace insertion.
    def outer(a,b,c):return np.einsum('ai,bj,ck->abcijk',a,b,c)
    T=outer(x,x,x) if e is None else outer(e,x,x)+outer(x,e,x)+outer(x,x,e)
    U=sum(T.transpose(p+(3,4,5)) for p in it.permutations(range(3)))
    def trace_insert(t,space):
        if space:t=t.transpose(3,4,5,0,1,2)
        z=np.einsum('aacijk->cijk',t);I=np.eye(t.shape[0],dtype=np.int64)
        a=np.einsum('ab,cijk->abcijk',I,z)+np.einsum('ac,bijk->abcijk',I,z)+np.einsum('bc,aijk->abcijk',I,z)
        return a.transpose(3,4,5,0,1,2) if space else a
    return trace_insert(5*U-trace_insert(U,False),True).transpose(0,3,1,4,2,5).reshape(27,27,27)
def run(diag,out):
    g=gamma();seed=read_seed();assert dot(seed,seed)==N
    K=[bil((a+1)%3,(a+2)%3,g[i],1) for a,i in P]
    x=np.pad(np.diag(diag),((0,0),(0,6)))
    def Z(y):return ops(*[(int(y[a,i]),K[k]) for k,(a,i) in enumerate(P)])
    def M(y,d,c):return ops(*[(int(y[d,i]),K[9*c+i]) for i in range(9)])
    def L(y):return [Z(y)]+[ops((1,M(y,d,c)),(-1,M(y,c,d))) for d,c in PAIRS]
    z=Z(x);ls=L(x);w=apply(z,seed)
    first=[apply(k,seed) for k in K]
    def H(T):
        outer={}
        for p in range(27):
            mid={}
            for q in range(27):
                if not np.any(T[p,q]):continue
                v=lin(*[(int(T[p,q,r]),first[r]) for r in range(27) if T[p,q,r]])
                mid=lin((1,mid),(1,apply(K[q],v)))
            if mid:outer=lin((1,outer),(1,apply(K[p],mid)))
        return outer # 330 * scaled H3
    def Phi():
        return lin((320*SCALE*int(np.sum(x*x)),w),*[(-2*SCALE,apply(l,apply(l,w))) for l in ls])
    V=[lin((SCALE,seed))]
    for _ in range(8):V.append(apply(z,V[-1]))
    V.extend([Phi(),H(tensor(x))])
    for _ in range(5):V.extend([apply(z,V[-2]),apply(z,V[-1])])
    assert len(V)==21
    active=[(p,q) for p,q in it.product(range(21),repeat=2) if max(p,q)>=17]
    def gram(A,B):return {(p,q):dot(A[p],B[q]) for p,q in active}
    def B2(b,k):return ops(*[(int(x[a,i]),bil(a,b,g[i]@g[k])) for a,i in P if x[a,i] and (a,i)!=(b,k)])
    CV=ops(*[(int(x[c,i])*int(co),bil(c,b,g[i]@g[j]@g[k],1)) for c,i in P if x[c,i] for j,k in SP for b,co in enumerate(np.cross(x[:,j],x[:,k])) if co])
    tau=dict.fromkeys(active,0);beta=dict.fromkeys(active,0);nu=[];tt=[];eu=[{} for _ in V]
    for k,(b,i) in enumerate(P):
        e=np.zeros_like(x);e[b,i]=1;dz=K[k];dl=L(e);dw=first[k]
        dphi=lin((640*SCALE*int(np.sum(x*e)),w),(320*SCALE*int(np.sum(x*x)),dw),*[(-2*SCALE,v) for l,h in zip(ls,dl) for v in (apply(h,apply(l,w)),apply(l,apply(h,w)),apply(l,apply(l,dw)))])
        A=[{}]
        for j in range(8):A.append(lin((1,apply(dz,V[j])),(1,apply(z,A[-1]))))
        A.extend([dphi,H(tensor(x,e))])
        for j in range(9,19,2):
            A.extend([lin((1,apply(dz,V[r])),(1,apply(z,A[r]))) for r in (j,j+1)])
        BV=[apply(B2(b,i),v) for v in V]
        for pq,val in gram(A,A).items():tau[pq]+=val
        for pq,val in gram(BV,A).items():beta[pq]-=val
        if b==i:
            nu.append({pq:int(x[b,i])*v for pq,v in gram(V,A).items()})
            tt.append({pq:int(x[b,i])*v for pq,v in gram(V,BV).items()})
        if x[b,i]:eu=[lin((1,u),(int(x[b,i]),v)) for u,v in zip(eu,A)]
        print('direct derivative',b,i,flush=True)
    assert all(u==lin((d,v)) for u,d,v in zip(eu,DEG,V))
    cv=gram(V,[apply(CV,v) for v in V])
    path=D/'bfss-mixed104'/('jet_'+''.join(map(str,diag))+'.json')
    if diag==(0,0,1):pin(path,'89a8c71ccf96f20ed9f6c378341d826135b47afd')
    receipt=json.loads(path.read_text());assert receipt['degrees']==DEG
    counts={};errors=[]
    for name,group in [('tau',[tau]),('beta',[beta]),('nu',nu),('t',tt),('v',[cv])]:
        counts[name]=0
        for axis,A in enumerate(group):
            for (p,q),v in A.items():
                parity=DEG[p]+DEG[q]+(name=='v')
                if parity%2:assert v==0
                actual=Fraction(v,N*SCALE*SCALE*2**(parity//2)*(2 if name in ('beta','t') else 1))
                r=receipt[name][axis] if name in ('nu','t') else receipt[name]
                expected=Fraction(r[p][q]);counts[name]+=1
                if actual!=expected:errors.append([name,axis,p,q,str(actual),str(expected)])
    report={'diag':diag,'receipt_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'comparisons':counts,'errors':errors,'Euler_exact':True,'scope':'max(p,q)>=17; literal direct 27-coordinate derivatives; no old-old placeholders'}
    out.write_text(json.dumps(report,indent=2)+'\n')
    assert not errors,errors[:5]
    print(json.dumps(report,indent=2))
def selftest():
    # Compare direct actions to an independently specified two-mode example.
    assert apply([(0,0,0,0,1,0)],{0:(2,3),1:(4,5)})=={0:(2,3),1:(4,5)}
    assert apply([(0,0,0,1,1,0)],{0:(2,3),1:(4,5)})=={0:(-3,2),1:(5,-4)}
    x=np.zeros((3,9),dtype=np.int64);x[0,0]=1
    T=tensor(x);assert np.count_nonzero(T)==175 and int(np.sum(T*T))==36*330
    assert np.array_equal(tensor(x,x),3*T)
    # Five-point stencil is exact for cubic polynomials; no finite difference tolerance.
    for a,i in P:
        e=np.zeros_like(x);e[a,i]=1
        assert np.array_equal(12*tensor(x,e),8*(tensor(x+e)-tensor(x-e))-(tensor(x+2*e)-tensor(x-2*e)))
    assert sum(1 for p,q in it.product(range(21),repeat=2) if max(p,q)>=17)==152
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('diag',nargs='?',default='001');p.add_argument('--output',type=Path);p.add_argument('--self-test',action='store_true');a=p.parse_args()
    selftest()
    if not a.self_test:
        assert len(a.diag)==3 and a.output is not None
        run(tuple(map(int,a.diag)),a.output)
