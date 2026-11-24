"""Finite coefficient checks and countermodels, not an unbounded operator proof."""
import sympy as s
from itertools import product,combinations
from functools import reduce
I=s.eye(2); J=s.Matrix([[0,1],[-1,0]]); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1)
words=['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']
G=[reduce(s.kronecker_product,[dict(I=I,J=J,X=X,Z=Z)[c] for c in w]) for w in words]
for i,j in product(range(9),repeat=2):
    assert G[i].T==G[i] and G[i]*G[j]+G[j]*G[i]==2*int(i==j)*s.eye(16)
# For fixed unit supercharge direction v, 27 kinetic coefficient vectors in R48.
# Matrix identity for each same-color pair: symmetrized Gram is delta_ij I.
for i,j in product(range(9),repeat=2):
    A=G[i].T*G[j]
    assert A+A.T==2*int(i==j)*s.eye(16)
for v in [s.eye(16)[:,0],s.Matrix(range(1,17)),s.Matrix([(-1)**i for i in range(16)])]:
    F=s.Matrix.hstack(*(g*v for g in G))
    assert F.T*F==v.dot(v)*s.eye(9)
    Fc=s.kronecker_product(s.eye(3),F)
    assert Fc.T*Fc==v.dot(v)*s.eye(27)
print('81 Clifford identities; universal symmetrized kinetic Gram; 3 explicit 48x27 frames PASS')
# Average squares does not determine individual squares.
A=s.diag(1,0); B=s.diag(0,1); H=(A*A+B*B)/2
assert H==s.eye(2)/2 and A*A!=H and B*B!=H
# Equal squares and self-adjointness alone do not imply off-diagonal CAR.
A=B=Z; assert A*A==B*B==s.eye(2) and A*B+B*A==2*s.eye(2)
# A common square with eigenvalues approaching zero and a kernel.
# Finite truncations of direct sum of Pauli charges scaled by 1/j.
for n in [1,4,16]:
    Q1=s.diag(s.zeros(1),*(X/j for j in range(1,n+1)))
    Q2=s.diag(s.zeros(1),*(Z/j for j in range(1,n+1)))
    H=Q1*Q1; E=s.diag(0,*([1]*(2*n)))
    inv=s.diag(0,*(j*s.eye(2) for j in range(1,n+1)))
    C1=Q1*inv; C2=Q2*inv
    assert Q2*Q2==H and Q1*Q2+Q2*Q1==s.zeros(2*n+1)
    assert C1*C1==C2*C2==E and C1*C2+C2*C1==s.zeros(2*n+1)
    assert C1.T==C1 and C2.T==C2
    print('n=',n,'min positive H=',s.Rational(1,n*n),'inverse sqrt norm=',n,'normalized norm=1')
print('PASS: both negative controls and zero-gap normalization model')
