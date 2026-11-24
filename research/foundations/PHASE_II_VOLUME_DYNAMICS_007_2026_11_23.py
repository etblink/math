"""Independent Clifford/CAR checks for volume observable dynamics."""
from itertools import combinations
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
assert all(G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id for i in range(9) for j in range(9))
def cliff(v):return sum((v[i]*G[i] for i in range(9)),s.zeros(16))
def volume(X):
    x,y,z=[X[:,i] for i in range(3)];A,B,C=map(cliff,(x,y,z))
    return A*B*C-x.dot(y)*C+x.dot(z)*B-y.dot(z)*A
# Use color-major coefficient order, with arbitrary overall Yukawa normalization omitted.
C=[s.Matrix(3,3,lambda a,b:s.LeviCivita(a,b,c)) for c in range(3)]
# Exact CAR monomial multiplication, gamma_i^2=1.
def prod(a,b):
    swaps=sum((b&((1<<i)-1)).bit_count() for i in range(48) if a>>i&1)
    return a^b,(-1)**swaps
# K(A)=1/2 sum upper-triangle A_ij gamma_i gamma_j; use 2K for integer coefficients.
def biv(A):return {(1<<i)|(1<<j):A[i,j] for i,j in combinations(range(A.rows),2) if A[i,j]}
def comm(A,B):
    out=defaultdict(int)
    for a,x in A.items():
        for b,y in B.items():
            k,p=prod(a,b);_,q=prod(b,a)
            out[k]+=x*y*(p-q)
    return {k:v for k,v in out.items() if v}
X0=s.eye(9)[:,:3]
X1=s.Matrix([[1,2,0],[0,1,3],[0,0,2],[1,0,1],[0,2,1],[0,0,0],[1,0,0],[0,1,0],[0,0,1]])
for X in [X0,X1,X0*s.diag(1,1,0),s.zeros(9,3)]:
    T=volume(X); A=s.kronecker_product(s.eye(3),T)
    B=sum((s.kronecker_product(C[c],cliff(X[:,c])) for c in range(3)),s.zeros(48))
    assert A.T==-A and B.T==-B
    assert all(T*cliff(X[:,c])==cliff(X[:,c])*T for c in range(3))
    assert A*B==B*A and not comm(biv(A),biv(B))
    print('rank',X.rank(),'Gram determinant',(X.T*X).det(),'coefficient and CAR commutators zero')
# Exact orientation derivative for normalized volume, keeping the Gram determinant positive.
t=s.symbols('t',real=True); X=X0.copy(); X[3,0]=t
J=volume(X)/s.sqrt(1+t*t); D=J.diff(t).subs(t,0)
assert D==G[3]*G[1]*G[2] and D*D==-Id
# In the paired occupation convention, apply 2K(I_color tensor T) to the vacuum.
# color-major real index a*16+k maps to complex index 3*(k//2)+a.
def gamma_vac_action(V,k,a):
    j=3*(k//2)+a;out=defaultdict(complex)
    for b,c in V.items():
        occ=(b>>j)&1;sg=(-1)**((b&((1<<j)-1)).bit_count())
        out[b^(1<<j)]+=c*sg*(1 if k%2==0 else 1j*(1-2*occ))
    return dict(out)
def apply_volume(T,V):
    out=defaultdict(complex)
    for i,j in combinations(range(16),2):
        if not T[i,j]:continue
        for a in range(3):
            for b,c in gamma_vac_action(gamma_vac_action(V,j,a),i,a).items():out[b]+=int(T[i,j])*c*1j
    return {b:c for b,c in out.items() if c}
vac={0:1}
def pair(m,n):return {(1<<(3*m+a))|(1<<(3*n+a)):1 for a in range(3)}
def norm2(V):return sum(int(c.real)**2+int(c.imag)**2 for c in V.values())
assert norm2(apply_volume(volume(X0),vac))==24
print('J vacuum output norm squared 24')
assert not apply_volume(D,vac)
print('orientation derivative vacuum blindness: retained negative control')
for m,n in combinations(range(8),2):
    W=pair(m,n);out=apply_volume(D,W)
    if norm2(out)>0:
        print('orientation derivative on unnormalized singlet pair',m,n,'output norm squared',norm2(out),'input norm squared 3');break
else:raise AssertionError('no separating pair')
# Verify gauge invariance of output by direct creation-annihilation generators.
def bil(V,i,j):
    out=defaultdict(complex)
    for b,c in V.items():
        if not ((b>>j)&1):continue
        sg=(-1)**((b&((1<<j)-1)).bit_count());b1=b^(1<<j)
        if (b1>>i)&1:continue
        out[b1^(1<<i)]+=c*sg*(-1)**((b1&((1<<i)-1)).bit_count())
    return out
def color(V,a,b):
    out=defaultdict(complex)
    for m in range(8):
        for v,c in bil(V,3*m+a,3*m+b).items():out[v]+=c
        for v,c in bil(V,3*m+b,3*m+a).items():out[v]-=c
    return {v:c for v,c in out.items() if c}
for V in (W,out,vac,apply_volume(volume(X0),vac)):
    assert all(not color(V,a,b) for a,b in combinations(range(3),2))
    assert all(b.bit_count()%2==0 for b in V)
# gradient of gauge-invariant shape coordinate F(X)=(XX^T)[3,0] at X0
z=s.Matrix(9,3,lambda i,j:s.Symbol(f'z{i}_{j}',real=True));F=(z*z.T)[3,0]
sub=dict(zip(z,X0));grad=s.Matrix(9,3,lambda i,j:s.diff(F,z[i,j]).subs(sub))
assert grad==s.eye(9)[:,3]*s.Matrix([[1,0,0]])
print('gauge-invariant shape gradient isolates orientation derivative: PASS')
# For epsilon=1, J_reg(r X0)=r^3/sqrt(r^6+1) J0.
r=s.symbols('r',positive=True);f=r**3/s.sqrt(r**6+1)
assert s.simplify(s.diff(f,r)-3*r**2/(r**6+1)**s.Rational(3,2))==0
print('radial derivative at r=1:',s.diff(f,r).subs(r,1))
print('PASS')
