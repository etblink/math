"""Exact compositional distinguishability of real quantum channels."""
from itertools import product
import sympy as s
I=s.eye(2); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1)
J=s.Matrix([[0,-1],[1,0]]) # real orthogonal, J^T=-J
K=s.kronecker_product
W=-K(J,J) # Y tensor Y
E=(s.eye(4)+W)/2
phi=s.Matrix([1,0,0,1])/s.sqrt(2)
B=phi*phi.T
basis=[I,X,Z,J]
t=s.symbols('t',real=True)
def channel(M,t,anc=False):
    mats=[I,J,X,Z]
    if anc: mats=[K(U,I) for U in mats]
    weights=[(1+t)/4,(1+t)/4,(1-t)/4,(1-t)/4]
    return s.simplify(sum((w*U*M*U.T for w,U in zip(weights,mats)),s.zeros(M.rows)))
assert all(U.T*U==I for U in [I,J,X,Z])
assert E==E.T and E*E==E
for M in [I,X,Z]:
    assert channel(M,t)==s.trace(M)*I/2
assert channel(J,t)==t*J
rho=channel(B,t,True)
assert rho==(s.eye(4)-t*W)/4
assert s.trace(E*rho)==(1-t)/2
assert rho.eigenvals()=={(1-t)/4:2,(1+t)/4:2}
for A,C in product([I,X,Z],repeat=2):
    assert s.trace(K(A,C)*rho)==int(A==I and C==I)
# Product preparations with arbitrary real local density matrices cannot reveal t.
a,b,c,d=s.symbols('a b c d',real=True)
R=s.Matrix([[a,b],[b,1-a]]); S=s.Matrix([[c,d],[d,1-c]])
assert channel(K(R,S),t,True)==K(I/2,S)
# Two devices in sequence multiply the hidden parameter.
u=s.symbols('u',real=True)
for M in basis:
    assert channel(channel(M,t),u)==channel(M,t*u)
# Classical control: action on pure deterministic distributions specifies the full matrix.
p,q,r,v=s.symbols('p q r v',real=True)
T=s.Matrix([[p,q],[1-p,1-q]]); V=s.Matrix([[r,v],[1-r,1-v]])
assert (T-V).subs({r:p,v:q})==s.zeros(2)
assert K(T-V,I).subs({r:p,v:q})==s.zeros(4)
print('symbolic Choi output:',rho)
print('joint readout:',s.trace(E*rho),'spectrum:',rho.eigenvals())
for tt in [-1,-s.Rational(1,2),0,s.Rational(1,2),1]:
    print('t=',tt,'P(+)=',s.trace(E*rho.subs(t,tt)))
print('composition: t*u; all assertions passed')
