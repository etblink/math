"""Exact real/complex tomography controls; no empirical inference."""
from itertools import product
from collections import Counter
import sympy as s
I=s.eye(2); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1)
Y=s.Matrix([[0,-s.I],[s.I,0]])
P={'I':I,'X':X,'Y':Y,'Z':Z}
K=s.kronecker_product
W=K(Y,Y)
assert W==W.conjugate() and W==W.T and W*W==s.eye(4)
rhos=[(s.eye(4)+a*W)/4 for a in (1,0,-1)]
for a,r in zip((1,0,-1),rhos):
    assert r==r.T and r==r.conjugate() and r.trace()==1
    assert all(v>=0 for v in r.eigenvals())
    for u,v in product('IXZ',repeat=2):
        assert s.trace(r*K(P[u],P[v]))==int(u==v=='I')
    assert s.trace(r*W)==a
    assert s.trace(r*(s.eye(4)+W)/2)==s.Rational(1+a,2)
assert rhos[1]==K(I/2,I/2)
# Real Bell basis measurement, no locally admissible Y needed.
B=s.Matrix([[1,1,0,0],[0,0,1,1],[0,0,1,-1],[1,-1,0,0]])/s.sqrt(2)
assert B.T*B==s.eye(4)
assert B.T*W*B==s.diag(-1,1,1,-1)
for a,r in zip((1,0,-1),rhos):
    print('a=',a,'spectrum',r.eigenvals(),'Bell probabilities',list((B.T*r*B).diagonal()))
# Pauli strings with even Y count form the real symmetric subspace.
for n in range(1,7):
    counts=Counter(w.count('Y') for w in product('IXYZ',repeat=n))
    local=counts[0]; full=sum(v for k,v in counts.items() if k%2==0)
    d=2**n
    assert local==3**n and full==d*(d+1)//2
    print('n',n,'local',local,'real global',full,'hidden',full-local,'complex global',4**n)
# Explicit realification: preserve expectation, not tensor-product structure.
def realify(M):
    A=s.re(M); C=s.im(M)
    return A.row_join(-C).col_join(C.row_join(A))
r=s.Matrix([[1,-s.I],[s.I,1]])/2
for E in P.values():
    R=realify(r)/2; F=realify(E)
    assert R==R.T and F==F.T and R.trace()==1
    assert s.trace(R*F)==s.trace(r*E)
print('all assertions passed')
