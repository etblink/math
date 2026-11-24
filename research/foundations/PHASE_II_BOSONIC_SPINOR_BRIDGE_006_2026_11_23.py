"""Independent Clifford/CAR checks. No native BFSS identification."""
from itertools import combinations,product
from collections import defaultdict
import sympy as s

def conj(a): return (a[0],)+tuple(-x for x in a[1:])
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mul(a,b):
    if len(a)==1:return (a[0]*b[0],)
    k=len(a)//2;x,y=a[:k],a[k:];u,v=b[:k],b[k:]
    return add(mul(x,u),tuple(-z for z in mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
I=s.eye(8);O=s.zeros(8);Id=s.eye(16)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
for i,j in product(range(9),repeat=2):
    assert G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id
for r in range(4):
    X=s.eye(9)[:,:3]*s.diag(*(int(i<r) for i in range(3)))
    A=G[r]*G[r+1];R=s.eye(9);R[r,r]=R[r+1,r+1]=-1
    assert R*X==X and A*A==-Id and A.T*A==Id
    assert all(A*G[i]*A.T==R[i,i]*G[i] for i in range(9))
print('bosonic ranks 0..3: fixed half-turn, spin lift squares to -I: PASS')
def cliff(v):return sum((v[i]*G[i] for i in range(9)),s.zeros(16))
def volume(X):
    a,b,c=[X[:,i] for i in range(3)];A,B,C=map(cliff,(a,b,c))
    return A*B*C-a.dot(b)*C+a.dot(c)*B-b.dot(c)*A
X=s.eye(9)[:,:3];J=volume(X)
Y=s.Matrix([[1,2,0],[0,1,3],[0,0,2],[1,0,1],[0,2,1],[0,0,0],[1,0,0],[0,1,0],[0,0,1]])
R=s.eye(9);R[0,0]=R[4,4]=-1;A=G[0]*G[4]
C=s.Matrix([[0,-1,0],[1,0,0],[0,0,1]])
for Z in (X,Y,X*s.diag(1,1,0)):
    T=volume(Z);d=(Z.T*Z).det()
    assert T.T==-T and T*T==-d*Id
    assert volume(Z*C)==T and volume(R*Z)==A*T*A.T
    print('volume Gram determinant',d,'skew, square, gauge and spin controls PASS')
assert J*J==-Id
# Sparse 48 Majoranas on 24 complex modes. Small Gaussian integer amplitudes.
def accum(dst,b,c):
    dst[b]+=c
    if not dst[b]:del dst[b]
def gamma(V,k,a):
    j=3*(k//2)+a;out=defaultdict(complex)
    for b,c in V.items():
        occ=(b>>j)&1;sg=(-1)**((b&((1<<j)-1)).bit_count())
        accum(out,b^(1<<j),c*sg*(1 if k%2==0 else 1j*(1-2*occ)))
    return dict(out)
def scale(V,c):return {b:c*x for b,x in V.items() if c*x}
def plus(*Vs):
    out=defaultdict(complex)
    for V in Vs:
        for b,c in V.items():accum(out,b,c)
    return dict(out)
def K(V,k,l):return scale(plus(*(gamma(gamma(V,l,a),k,a) for a in range(3))),1j)
def Lcol(V,a,b):return plus(*(gamma(gamma(V,k,b),k,a) for k in range(16)))
def pair(m,n):return {(1<<(3*m+a))|(1<<(3*n+a)):1 for a in range(3)}
def inner(V,W):return sum(c.conjugate()*W.get(b,0) for b,c in V.items())
def full(V,k):return plus(*(K(K(V,k,l),k,l) for l in range(16) if l!=k))
def partial(V,k):return plus(*(K(K(V,k,l),k,l) for l in range(8,16)))
def H(V):return plus(*(scale(K(V,k,l),int(J[k,l])) for k,l in combinations(range(16),2) if J[k,l]))
V0={0:1};P=pair(0,4);Q=pair(1,4);V=plus(V0,P,Q);F={ (1<<24)-1:1}
for name,W in [('vac',V0),('P',P),('Q',Q),('superposition',V),('filled',F)]:
    assert all(not Lcol(W,a,b) for a,b in combinations(range(3),2))
    for k in range(16):assert full(W,k)==scale(W,51)
    out=H(W)
    assert all(not Lcol(out,a,b) for a,b in combinations(range(3),2))
    assert all(b.bit_count()%2==0 for b in out)
    assert inner(W,out).imag==0
    print(name,'full contraction = 51 I; volume witness mean',inner(W,out)/inner(W,W),'norm² ratio',inner(out,out)/inner(W,W))
assert inner(P,partial(P,0))/inner(P,P)==32
assert inner(P,partial(P,2))/inner(P,P)==24
# Verify volume operator acts nontrivially on vacuum, not a scalar on singlets.
assert H(V0) and H(V0)!=scale(V0,inner(V0,H(V0)))
print('partial witness survives, volume witness non-scalar on singlets: PASS')
