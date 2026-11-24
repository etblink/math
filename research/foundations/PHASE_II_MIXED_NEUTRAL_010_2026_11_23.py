"""Independent quadratic fast model: two-quanta neutral channels."""
from itertools import product
from collections import Counter
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
assert all(G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id for i,j in product(range(9),repeat=2))
# Distinct + and - charge quanta, each 8 bosonic and 8 fermionic modes.
channels=Counter((p[0],m[0]) for p,m in product(product('BF',range(8)),repeat=2))
assert channels=={('B','B'):64,('B','F'):64,('F','B'):64,('F','F'):64}
# At north pole, common tangent plane 0,1; tangent Levi-Civita and spin curvatures.
V=s.zeros(8);V[0,1]=1;V[1,0]=-1
S=G[0]*G[1]/2;Sp=S[:8,:8];Sm=S[8:,8:]
# Verify the Clifford contraction intertwiners for all 28 tangent rotations.
Cplus=s.Matrix.hstack(*(g[8:,:8] for g in G[:8]));Cminus=s.Matrix.hstack(*(g[:8,8:] for g in G[:8]))
for C in (Cplus,Cminus): assert C*C.T==8*I
for a in range(8):
    for b in range(a+1,8):
        v=s.zeros(8);v[a,b]=1;v[b,a]=-1
        z=G[a]*G[b]/2;zp=z[:8,:8];zm=z[8:,8:]
        assert Cplus*(s.kronecker_product(v,I)+s.kronecker_product(I,zp))==zm*Cplus
        assert Cminus*(s.kronecker_product(v,I)+s.kronecker_product(I,zm))==zp*Cminus
for name,A,B in [('BB',V,V),('FF',Sp,-Sm.T),('BF',V,-Sm.T),('FB',Sp,V)]:
    F=s.kronecker_product(A,I)+s.kronecker_product(I,B)
    ev=F.eigenvals();print(name,'dim',F.rows,'curvature eigenvalues',ev,'norm²',s.trace(F.T*F))
    expected={'BB':{2*s.I:1,-2*s.I:1,s.I:12,-s.I:12,0:38},'FF':{s.I:16,-s.I:16,0:32},'BF':{3*s.I/2:4,-3*s.I/2:4,s.I/2:28,-s.I/2:28},'FB':{3*s.I/2:4,-3*s.I/2:4,s.I/2:28,-s.I/2:28}}[name]
    assert ev==expected
    H=s.kronecker_product(I if name[0]=='B' else -I,I if name[1]=='B' else -I)
    assert H==((-1)**name.count('F'))*s.eye(64)
# Bundle decomposition ch(E+)=8+a, ch(E-)=8-a, ch(T_C)=8.
a=s.symbols('a'); truncated=lambda e:s.rem(s.expand(e),a*a,a)
assert truncated(8*(8+a)-(8-a))==56+9*a
assert truncated(8*(8-a)-(8+a))==56-9*a
assert truncated(8*(8+a)+8*(8-a))==128
# Exchange swaps the two mixed channels; no choice of Weyl lift phase assumed.
assert Cplus.rank()==Cminus.rank()==8
print('Clifford contraction ranks 8, kernels 56; 28 covariance checks per map PASS')
print('neutral channel counts',dict(channels),'total',sum(channels.values()))
print('PASS')
