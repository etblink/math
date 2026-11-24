"""Independent real Clifford model; NOT the original BFSS gamma representation."""
from itertools import product
import sympy as s

def add(a,b): return tuple(x+y for x,y in zip(a,b))
def neg(a): return tuple(-x for x in a)
def conj(a): return (a[0],)+neg(a[1:])
def mul(a,b):
    if len(a)==1: return (a[0]*b[0],)
    k=len(a)//2; x,y=a[:k],a[k:]; u,v=b[:k],b[k:]
    return add(mul(x,u),neg(mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
O=s.zeros(8); I=s.eye(8)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
for i,j in product(range(9),repeat=2):
    assert G[i]*G[j]+G[j]*G[i]==2*int(i==j)*s.eye(16)
def hopf(v): return s.Matrix([(v.T*g*v)[0] for g in G])
a=s.Matrix(s.symbols('a:8',real=True)); b=s.Matrix(s.symbols('b:8',real=True)); v=a.col_join(b)
h=hopf(v)
assert s.expand(h.dot(h)-v.dot(v)**2)==0
# Rank-one projectors are sign-blind, but distinguish lines in the same fiber.
u=s.eye(16)[:,0]; w=s.eye(16)[:,1]
assert hopf(u)==hopf(w)==s.eye(9)[:,8]
assert u*u.T==(-u)*(-u).T and u*u.T!=w*w.T
assert s.trace(u*u.T*u*u.T)==1 and s.trace(u*u.T*w*w.T)==0
# Clifford volume products give a spanning real symmetric observable family (grades 0,1,4).
from itertools import combinations
from functools import reduce
from operator import mul as mm
B=[reduce(mm,(G[i] for i in idx),s.eye(16)) for k in (0,1,4) for idx in combinations(range(9),k)]
assert len(B)==136 and all(M==M.T for M in B)
assert all((M.T*M).trace()==16 for M in B)
# Orthogonality via exact flattened matrix product.
F=s.Matrix([list(M) for M in B]); assert F*F.T==16*s.eye(136)
print('81 Clifford checks; polynomial norm identity; north fiber sign/line controls; 136 symmetric basis elements: PASS')
print('north pole',list(hopf(u)),'projector comparison',1,0)
