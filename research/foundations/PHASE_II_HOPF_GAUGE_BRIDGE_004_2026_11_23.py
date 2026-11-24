from itertools import combinations
from collections import defaultdict
import sympy as S

def add(a,b): return tuple(x+y for x,y in zip(a,b))
def neg(a): return tuple(-x for x in a)
def conj(a): return (a[0],)+neg(a[1:])
def mul(a,b):
    if len(a)==1: return (a[0]*b[0],)
    k=len(a)//2; x,y=a[:k],a[k:]; u,v=b[:k],b[k:]
    return add(mul(x,u),neg(mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[S.Matrix.hstack(*(S.Matrix(mul(e,v)) for v in E)) for e in E]
O=S.zeros(8); I=S.eye(8)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
u=S.eye(16)[:,0]; w=S.eye(16)[:,1]
assert [(v.T*g*v)[0] for g in G for v in [u]]==[(w.T*g*w)[0] for g in G]
for idx in combinations(range(9),4):
    M=S.eye(16)
    for i in idx:M=M*G[i]
    if M[0,0]==1 and M[1,1]==-1 and M[:,0]==u and M[:,1]==-w:
        break
else: raise AssertionError('no witness')
assert M==M.T and M*M==S.eye(16)
print('grade four indices zero based',idx,'eigenvalues',M[0,0],M[1,1])
# 3 complex modes, 3 colors, mode-major order. Reference mode r=2.
# Work in the exact two-particle sector, dim C(9,2)=36.
n=9; states=[sum(1<<i for i in pair) for pair in combinations(range(n),2)]
loc={b:i for i,b in enumerate(states)}; d=len(states)
def ladder(b,j,create):
    if bool((b>>j)&1)==create:return None
    return b^(1<<j), (-1)**((b&((1<<j)-1)).bit_count())
def bil(i,j):
    A=S.zeros(d)
    for k,b in enumerate(states):
        x=ladder(b,j,False)
        if x is None:continue
        y=ladder(x[0],i,True)
        if y is not None:A[loc[y[0]],k]=x[1]*y[1]
    return A
def op(m,a): return 3*m+a
def pair(m):
    p=S.zeros(d,1)
    for a in range(3):p[loc[(1<<op(m,a))|(1<<op(2,a))]]=1
    return p/S.sqrt(3)
P,Q=pair(0),pair(1)
assert (P.T*P)[0]==(Q.T*Q)[0]==1 and (P.T*Q)[0]==0
N=[sum((bil(op(m,a),op(m,a)) for a in range(3)),S.zeros(d)) for m in range(3)]
# Compression of M to the two real spinor directions is diag(1,-1),
# promoted to a color-contracted occupation difference, not a native Spin(9) intertwiner.
D=N[0]-N[1]; T=N[0]*N[2]; E0=T # projection only on named code span
for a,b in combinations(range(3),2):
    K=sum((bil(op(m,a),op(m,b))-bil(op(m,b),op(m,a)) for m in range(3)),S.zeros(d))
    assert K*P==K*Q==S.zeros(d,1)
    for A in [*N,D,T]:assert K*A-A*K==S.zeros(d)
for A in [D,T]:assert A==A.T
assert D*P==P and D*Q==-Q and T*P==P and T*Q==S.zeros(d,1)
assert (P.T*T*P)[0]==1 and (Q.T*T*Q)[0]==0
# Symmetric same-color contraction cannot lift a symmetric coefficient via a Majorana bilinear.
# {gamma_i,gamma_j}=2delta_ij, so sum M_ij gamma_i gamma_j=tr(M) I per color.
assert S.trace(M)==0
print('two-particle sector dimension',d,'three color Lie generators annihilate both states; commutators zero')
print('witness eigenvalues D:',1,-1,'quartic T:',1,0)
print('PASS')
