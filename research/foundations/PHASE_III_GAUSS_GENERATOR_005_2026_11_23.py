"""Exact single spin-pair color block; no native Lean or unbounded proof."""
import sympy as s
from itertools import product, combinations
I=s.eye(8); zero=s.zeros(8)
# Three complex color modes in one spin pair, occupation bit order.
a=[]
for j in range(3):
    M=s.zeros(8)
    for b in range(8):
        if b>>j&1: M[b^(1<<j),b]=(-1)**((b&((1<<j)-1)).bit_count())
    a.append(M)
c=[(M+M.T,s.I*(M.T-M)) for M in a]
for p,r,q,t in product(range(3),range(2),range(3),range(2)):
    assert c[p][r]*c[q][t]+c[q][t]*c[p][r]==2*int(p==q and r==t)*I
T=[s.Matrix([[0,1],[1,0]])/s.sqrt(2),s.Matrix([[0,-s.I],[s.I,0]])/s.sqrt(2),s.diag(1,-1)/s.sqrt(2)]
C=[s.Matrix(3,3,lambda p,q:s.LeviCivita(p,q,k)) for k in range(3)]
D=[]
for k,B in enumerate(C):
    # g_k(t)=exp(i t T_k) has adjoint velocity sqrt(2) B.
    for q in range(3):
        assert s.simplify(s.I*(T[k]*T[q]-T[q]*T[k])-s.sqrt(2)*sum((B[p,q]*T[p] for p in range(3)),s.zeros(2)))==s.zeros(2)
    K=sum((B[p,q]*(c[p][r]*c[q][r])/2 for p,q in combinations(range(3),2) for r in range(2)),zero)
    E=sum((B[p,q]*a[p].T*a[q] for p,q in product(range(3),repeat=2)),zero)
    assert K==E and K.H==-K and K[:,0]==s.zeros(8,1)
    for q,r in product(range(3),range(2)):
        assert K*c[q][r]-c[q][r]*K==sum((B[p,q]*c[p][r] for p in range(3)),zero)
    D.append(K)
for p,q in product(range(3),repeat=2):
    # Our matrices have the negative cross-product convention.
    assert C[p]*C[q]-C[q]*C[p]==-sum((s.LeviCivita(p,q,k)*C[k] for k in range(3)),s.zeros(3))
    assert D[p]*D[q]-D[q]*D[p]==-sum((s.LeviCivita(p,q,k)*D[k] for k in range(3)),zero)
# Exact quarter turns: exterior representation from minors of real R.
for k,B in enumerate(C):
    R=s.eye(3)+B+B*B
    U=s.zeros(8)
    for x,y in product(range(8),repeat=2):
        rows=[j for j in range(3) if x>>j&1]; cols=[j for j in range(3) if y>>j&1]
        if len(rows)==len(cols):U[x,y]=R.extract(rows,cols).det() if rows else 1
    assert U.T*U==I and U[:,0]==I[:,0] and U**4==I
    for q,r in product(range(3),range(2)):
        assert U*c[q][r]*U.T==sum((R[p,q]*c[p][r] for p in range(3)),zero)
    assert D[k]**3==-D[k] and U==I+D[k]+D[k]**2
# Scalar shift passes the one-axis covariance test but fails full Lie algebra.
shift=D[0]+s.I*I
assert shift*c[1][0]-c[1][0]*shift==D[0]*c[1][0]-c[1][0]*D[0]
assert D[1]*D[2]-D[2]*D[1]!=-shift
print('36 CAR, 9 Pauli adjoint, 18 generator covariance, 9 Lie bracket, 18 quarter-turn covariance checks PASS')
print('K(C tensor I2)=dGamma(C); vacuum fixed; all 3 quarter turns match exactly; scalar-phase negative control PASS')
