"""Reference-free even Hopf-fiber observable, independent CAR model."""
from collections import defaultdict
from itertools import combinations, product
import sympy as s

def conj(a): return (a[0],)+tuple(-x for x in a[1:])
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mul(a,b):
    if len(a)==1: return (a[0]*b[0],)
    k=len(a)//2; x,y=a[:k],a[k:]; u,v=b[:k],b[k:]
    return add(mul(x,u),tuple(-z for z in mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
I=s.eye(8); O=s.zeros(8)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
for i,j in product(range(9),repeat=2):
    assert G[i]*G[j]+G[j]*G[i]==2*int(i==j)*s.eye(16)
for k in (0,2):
    v=s.eye(16)[:,k]; h=[(v.T*g*v)[0] for g in G]
    assert h==[0]*8+[1]
    H=s.Matrix.hstack(*(g*v-hh*v for g,hh in zip(G,h)))
    assert H*H.T==s.diag(*([0]*8+[1]*8))
# 24 complex modes, index 3*j+a; real spinor components 2*j,2*j+1.
# Sparse integer Gaussian amplitudes, unnormalized singlets of norm squared 3.
def accum(dst,b,c):
    dst[b]+=c
    if not dst[b]:del dst[b]
def gamma(V,k,a):
    j=3*(k//2)+a; out=defaultdict(complex)
    for b,c in V.items():
        occ=(b>>j)&1; sg=(-1)**((b&((1<<j)-1)).bit_count())
        accum(out,b^(1<<j),c*sg*(1 if k%2==0 else 1j*(1-2*occ)))
    return dict(out)
def scale(V,c):return {b:c*x for b,x in V.items() if c*x}
def plus(*Vs):
    out=defaultdict(complex)
    for V in Vs:
        for b,c in V.items():accum(out,b,c)
    return dict(out)
def K(V,k,l):return scale(plus(*(gamma(gamma(V,l,a),k,a) for a in range(3))),1j)
def B(V,k):return plus(*(K(K(V,k,l),k,l) for l in range(8,16)))
def pair(m,n):return {(1<<(3*m+a))|(1<<(3*n+a)):1 for a in range(3)}
def inner(V,W):return sum(c.conjugate()*W.get(b,0) for b,c in V.items())
def bil(V,i,j):
    out=defaultdict(complex)
    for b,c in V.items():
        if not (b>>j)&1:continue
        sg=(-1)**((b&((1<<j)-1)).bit_count()); b1=b^(1<<j)
        if (b1>>i)&1:continue
        accum(out,b1^(1<<i),c*sg*(-1)**((b1&((1<<i)-1)).bit_count()))
    return dict(out)
def color(V,a,b):return plus(*(plus(bil(V,3*m+a,3*m+b),scale(bil(V,3*m+b,3*m+a),-1)) for m in range(8)))
P=pair(0,4); Q=pair(1,4); vac={0:1}
for V in (P,Q,vac):
    for a,b in combinations(range(3),2):
        assert not color(V,a,b)
        for k in (0,2):assert not color(B(V,k),a,b)
    for k in (0,2):
        assert inner(V,B(V,k)).imag==0
        assert all(b.bit_count()%2==0 for b in B(V,k))
    print('norm²',inner(V,V),'B(e0), B(e2):',inner(V,B(V,0))/inner(V,V),inner(V,B(V,2))/inner(V,V))
assert inner(P,B(P,0))!=inner(P,B(P,2))
assert inner(Q,B(Q,0))!=inner(Q,B(Q,2))
assert inner(vac,B(vac,0))==inner(vac,B(vac,2))
print('PASS')
