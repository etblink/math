"""Frozen rank-one two-quantum band: transverse Yukawa mixing. Not native BFSS."""
from collections import defaultdict
from itertools import product
import sympy as s

def conj(a): return (a[0],)+tuple(-x for x in a[1:])
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mul(a,b):
    if len(a)==1:return (a[0]*b[0],)
    k=len(a)//2;x,y=a[:k],a[k:];u,v=b[:k],b[k:]
    return add(mul(x,u),tuple(-z for z in mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
I=s.eye(8); O=s.zeros(8); Id=s.eye(16)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
assert all(G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id for i,j in product(range(9),repeat=2))
entries=[[(j,k,int(G[v][j,k])) for j,k in product(range(16),repeat=2) if G[v][j,k]] for v in range(8)]
# Occupation convention: fast 0..15, Cartan 16..23; 8..15 filled in fast vacuum.
vac=65280
zero=(0,)*16
# bosons 0..7 positive charge, 8..15 negative charge. c† positive charge.
def ferm(b,j,create):
    occ=(b>>j)&1
    if occ==int(create):return None
    return b^(1<<j), (-1)**((b&((1<<j)-1)).bit_count())
def eta(b,j):
    k=16+j//2; occ=(b>>k)&1
    return b^(1<<k),(-1)**((b&((1<<k)-1)).bit_count())*(1 if j%2==0 else 1j*(1-2*occ))
def props(key):
    b,n=key;p=(b&255).bit_count();h=8-((b>>8)&255).bit_count()
    bp=sum(n[:8]);bm=sum(n[8:]);return p+h+bp+bm,p-h+bp-bm,b.bit_count()%2
# V=sum eta_j Gamma_v[j,k] ((b+†+b-) c_k -(b-†+b+) c†_k).
# Project output onto energy 2, no oscillator cutoff beyond that projection.
def apply(V):
    out=defaultdict(complex)
    for (b,n),z in V.items():
        assert props((b,n))[:2]==(2,0)
        for v,terms in enumerate(entries):
            for j,k,g in terms:
                for fc,bc,idx,sg in [(False,True,v,1),(False,False,v+8,1),(True,True,v+8,-1),(True,False,v,-1)]:
                    a=ferm(b,k,fc)
                    if a is None or (not bc and not n[idx]):continue
                    w,ph=eta(a[0],j); nn=list(n);nn[idx]+=1 if bc else -1
                    dest=(w,tuple(nn));energy,q,par=props(dest)
                    assert q==0 and par==b.bit_count()%2
                    if energy!=2:continue
                    # In the neutral two-quantum band only occupations 0 or 1 occur.
                    assert max(n)<=1 and max(nn)<=1
                    out[dest]+=z*sg*g*a[1]*ph
    return {k:v for k,v in out.items() if v}
def state(b,inds):
    n=list(zero)
    for j in inds:n[j]+=1
    return {(b,tuple(n)):1}
def channel(key):
    b,n=key;return {0:'FF',1:'mixed',2:'BB'}[sum(n)]
def norm(V):return sum(int(z.real)**2+int(z.imag)**2 for z in V.values())
def inner(V,W):return sum(complex(z).conjugate()*W.get(k,0) for k,z in V.items())
def report(label,V):
    W=apply(V); by={c:norm({k:z for k,z in W.items() if channel(k)==c}) for c in ('BB','FF','mixed')}
    assert inner(V,apply(W))==norm(W) # Hermiticity control for tested vectors
    assert all(props(k)[1]==0 for k in W)
    print(label,'input norm²',norm(V),'output norms²',by)
    return by
BB=state(vac,[0,9]); FF=state(vac^1^(1<<8),[])
FP=state(vac|1,[9]); FH=state(vac^(1<<8),[1])
assert report('BB',BB)=={'BB':0,'FF':0,'mixed':16}
assert report('FF',FF)=={'BB':0,'FF':0,'mixed':16}
assert report('positive particle + negative boson',FP)=={'BB':8,'FF':8,'mixed':0}
assert report('negative hole + positive boson',FH)=={'BB':8,'FF':8,'mixed':0}
# Clifford contraction of V tensor E+ to E- (negative boson, positive particle).
C=s.Matrix.hstack(*(g[8:,:8] for g in G[:8]));assert C*C.T==8*I
cols=[state(vac|(1<<k),[v+8]) for v,k in product(range(8),repeat=2)]
def encode(vec):return {next(iter(cols[i])):int(x) for i,x in enumerate(vec) if x}
a=C.T[:,0]; b=C.nullspace()[0];assert C*a==8*I[:,0] and C*b==s.zeros(8,1)
for label,x in [('rank-8 image',a),('rank-56 kernel',b)]:
    res=report(label,encode(x));assert res['BB']+res['FF']>0 and res['mixed']==0
print('PASS: first-order intra-band mixing in the transverse Yukawa model')
