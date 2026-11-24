"""Exact finite covariant audit, not a source domain or spectrum theorem.
Usage: python covariant_audit.py ../bfss-seed-transport/source_seed_integer.npz rank1
X is color x space. t=sqrt(2)*theta; Z=sqrt(2)*Y, G2=2G, R8=8R.
Gaussian integers stored in complex128 with component bounds below 2**50.
"""
import hashlib,itertools as it,json,sys,time,math
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent
I=np.eye(2,dtype=int); X2=np.array([[0,1],[1,0]]); Z2=np.diag([1,-1]); J=np.array([[0,1],[-1,0]])
def word(w):
    m=np.ones((1,1),int)
    for c in w:m=np.kron(m,dict(I=I,X=X2,Z=Z2,J=J)[c])
    return m
S=np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']])
assert all(np.array_equal(S[i]@S[j]+S[j]@S[i],2*(i==j)*np.eye(16,dtype=int)) for i,j in it.product(range(9),repeat=2))
parity=np.array([i.bit_count()%2 for i in range(4096)],dtype=np.int8)
scratch=np.zeros(1<<24,dtype=np.complex128)
zero=(np.empty(0,dtype=np.int32),np.empty(0,dtype=np.complex128))
def size(v):return np.max(np.abs(v[1].real)+np.abs(v[1].imag),initial=0)
def check(v):
    assert size(v)<2**50 and np.array_equal(v[1].real,np.rint(v[1].real)) and np.array_equal(v[1].imag,np.rint(v[1].imag))
    return v
def finish():
    m=np.flatnonzero(scratch).astype(np.int32);c=scratch[m].copy();scratch[m]=0
    return check((m,c))
def combine(*items):
    assert sum(abs(k)*size(v) for k,v in items)<2**50
    for k,(m,c) in items:
        if k:scratch[m]+=k*c
    return finish()
def bilinear(a,b,M,scale=1):
    out=[]
    for al,be in zip(*np.nonzero(M)):
        p=3*(int(al)//2)+a;q=3*(int(be)//2)+b
        l=(1<<(p+int(al)%2))-1;r=(1<<(q+int(be)%2))-1
        out.append(((1<<p)^(1<<q),l^r,complex(scale*int(M[al,be])*1j**(int(al)%2+int(be)%2)*(-1)**((l&(1<<q))!=0))))
    return out
def apply(op,v):
    m,c=v
    if not len(m) or not op:return zero
    assert sum(abs(w.real)+abs(w.imag) for _,_,w in op)*size(v)<2**50
    for flip,p,w in op:
        z=m&p;sg=1-2*(parity[z&4095]^parity[z>>12]);scratch[m^flip]+=w*sg*c
    return finish()
def opsum(*parts):
    out={}
    for k,op in parts:
        for f,p,w in op:out[f,p]=out.get((f,p),0)+k*w
    return [(f,p,w) for (f,p),w in out.items() if w]
def eq(a,b):return np.array_equal(a[0],b[0]) and np.array_equal(a[1],b[1])
def norm2(v):return sum(int(a.real)**2+int(a.imag)**2 for a in v[1])
def stats(v):return {'support':len(v[0]),'integer_norm2':str(norm2(v)),'max_component':int(size(v))}
G={(a,b):bilinear(a,b,np.eye(16,dtype=int)) for a,b in it.combinations(range(3),2)}
R={(i,j):opsum(*[(1,bilinear(a,a,S[i]@S[j])) for a in range(3)]) for i,j in it.combinations(range(9),2)}
K={(a,i):bilinear((a+1)%3,(a+2)%3,S[i],1j) for a,i in it.product(range(3),range(9))}
def Z(x):return opsum(*[(int(x[a,i]),K[a,i]) for a,i in it.product(range(3),range(9)) if x[a,i]])
def M(x,d,c):return opsum(*[(int(x[d,i]),K[c,i]) for i in range(9) if x[d,i]])
def square(op,v):return apply(op,apply(op,v))
def casimir(ops,v):return combine(*[(-1,square(o,v)) for o in ops.values()])
def phinum(x,v,direct=False):
    z=Z(x);w=apply(z,v);terms=[(160*int(np.sum(x*x)),w),(-1,square(z,w))]
    if direct:
        for d,c in it.product(range(3),repeat=2):
            a,b=M(x,d,c),M(x,c,d);terms.extend([(-1,square(a,w)),(1,apply(a,apply(b,w)))])
    else:
        terms.extend([(-1,square(opsum((1,M(x,d,c)),(-1,M(x,c,d))),w)) for d,c in it.combinations(range(3),2)])
    return combine(*terms)
def plane(dim,i,j):
    b=np.zeros((dim,dim),int);b[i,j]=1;b[j,i]=-1;return b
def main():
    path=Path(sys.argv[1]);name=sys.argv[2];f=np.load(path);v=check((f['masks'].astype(np.int32),f['real'].astype(float)+1j*f['imag'].astype(float)))
    assert norm2(v)==8072064 and len(v[0])==19136
    fixtures={k:np.pad(np.diag(d),((0,0),(0,6))) for k,d in [('rank1',[1,0,0]),('rank2',[1,2,0]),('rank3',[1,2,3])]}
    fixtures['oblique']=np.array([[1,0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,0,0],[1,0,0,0,0,0,1,0,0]],int)
    x=fixtures[name];z=Z(x);y=apply(z,v);phi=phinum(x,v);direct=phinum(x,v,True);assert eq(phi,direct)
    # Independently verify finite covariance of the linear generator on S.
    errs={}
    for kind,i,j in [('color',0,1),('space',0,8)]:
        B=plane(3 if kind=='color' else 9,i,j);dx=B@x if kind=='color' else -x@B
        g=G[i,j] if kind=='color' else R[i,j];factor=2 if kind=='color' else 8
        actual=apply(g,y);expect=combine((factor,apply(Z(dx),v)))
        errs[kind]=stats(combine((1,actual),(-1,expect)));assert errs[kind]['support']==0
    report={'input_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'fixture':name,'x':x.tolist(),'Z_S':stats(y),'sqrt2_phi':stats(phi),'direct_trace_agrees':True,'Y_covariance_residual':errs}
    print(json.dumps(report),flush=True)
    # C4=4*C2 and K64=64*Ksp. First build the exact projected numerator.
    w=apply(z,square(z,v));p=casimir(G,w);p=combine((1,casimir(G,p)),(-8,p));p=combine((1,casimir(G,p)),(-24,p))
    assert eq(casimir(G,p),combine((48,p)))
    # Divide the projector numerator exactly when possible to avoid overflow.
    den=48*40*24
    d=math.gcd(den,*[int(a) for a in p[1].real],*[int(a) for a in p[1].imag]);den//=d;p=check((p[0],p[1]/d))
    kp=casimir(R,p);h=combine((1920,p),(-1,kp));hden=1408*den
    d=math.gcd(hden,*[int(a) for a in h[1].real],*[int(a) for a in h[1].imag]);hden//=d;h=check((h[0],h[1]/d)) # h/hden = 2sqrt(2)*H3 on unnormalized S
    kh=casimir(R,h);ch=casimir(G,h)
    report['H3']={'Z3_S':stats(w),'Pi3_Z3_S_numerator':stats(p),'Pi3_denominator':den,'2sqrt2_H3_numerator':stats(h),'H3_denominator':hden,'C4_eigen48':eq(ch,combine((48,h))),'K64_eigen512':eq(kh,combine((512,h))),'K64_H3':stats(kh)}
    report['scope']='Exact finite algebra on pinned seed; no typed source or weighted domain proof.'
    print(json.dumps(report),flush=True);(D/(name+'.json')).write_text(json.dumps(report,indent=2)+'\n')
if __name__=='__main__':main()
