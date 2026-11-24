"""Independent normalized 16-supercharge Clifford module, not native BFSS."""
import numpy as np
import scipy.sparse as sp
from itertools import combinations
from collections import Counter

# Source SU2RealGammaProbe.lean Pauli-word convention (pinned source read).
from functools import reduce
J=np.array([[0,1],[-1,0]],dtype=np.int64); X=np.array([[0,1],[1,0]],dtype=np.int64)
Z=np.diag([1,-1]); I=np.eye(2,dtype=np.int64); I16=np.eye(16,dtype=np.int64)
words=['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']
gens={'J':J,'X':X,'Z':Z,'I':I}
G=[reduce(np.kron,(gens[c] for c in w)) for w in words]
for i in range(9):
    for j in range(9):assert np.array_equal(G[i]@G[j]+G[j]@G[i],2*(i==j)*I16)
# integer Gaussian sparse operations, magnitudes small; no numerical eigensolver needed for certification
n=256; U=sp.eye(n,format='csr',dtype=np.complex128)
C=[]
for k in range(16):
    mode=k//2; bits=np.arange(n); phase=np.array([(-1)**((int(b)&((1<<mode)-1)).bit_count()) for b in bits],dtype=complex)
    if k%2:phase*=1j*(1-2*((bits>>mode)&1))
    C.append(sp.csr_matrix((phase,(bits^(1<<mode),bits)),shape=(n,n)))
def eq(a,b):
    d=(a-b).tocsr();d.eliminate_zeros();return d.nnz==0
for i in range(16):
    for j in range(16): assert eq(C[i]@C[j]+C[j]@C[i],2*(i==j)*U)
M=[]; Q=sp.csr_matrix((n,n),dtype=complex); cas=Q.copy()
# 4 times spin generator K(G_iG_j/2)
for i,j in combinations(range(9),2):
    A=G[i]@G[j]; B=sum((int(A[a,b])*(C[a]@C[b]) for a,b in combinations(range(16),2) if A[a,b]),sp.csr_matrix((n,n),dtype=complex))
    assert eq(B.getH(),-B); M.append(B)
    B2=B@B;cas+=B2
    # Full polynomial isolates weight magnitude 2 (B²=-64).
    R=B2@(B2+4*U)@(B2+16*U)@(B2+36*U)
    assert eq(R@(B2+64*U),0*U)
    # denom (-64)*(-60)*(-48)*(-28)
    den=64*60*48*28
    assert eq(R@R,den*R)
    Q+=R
assert eq(cas,-288*U)
# Scale Q=2 sum plane weight projectors, expected eigenvalues 0,2,9
assert np.all((128*Q.data.real)%den==0) and np.all((128*Q.data.imag)%den==0)
Q=Q.copy();Q.data=(np.round(128*Q.data.real/den)+1j*np.round(128*Q.data.imag/den))/64
assert eq(Q@(Q-2*U)@(Q-9*U),0*U)
P44num=11*Q-Q@Q # denominator 18
assert eq(P44num@P44num,18*P44num)
assert P44num.diagonal().sum()==18*44
par=sp.diags([(-1)**int(b).bit_count() for b in range(n)],format='csr',dtype=complex)
sgn=1 if eq(par@P44num,P44num) else -1
assert eq(par@P44num,sgn*P44num)
P128num=9*(U-sgn*par);P84num=18*U-P128num-P44num
Ps=[P44num,P84num,P128num]
for p,rank in zip(Ps,(44,84,128)):
    assert eq(p.getH(),p) and eq(p@p,18*p) and p.diagonal().sum()==18*rank
    for B in M:assert eq(B@p,p@B)
for p,q in combinations(Ps,2):assert eq(p@q,0*U)
print('81 spatial Clifford checks; 256 supercharge CAR checks; 36 spin generators')
print('quadratic Casimir = 18 I across all sectors; parity containing 44:',sgn)
print('projector ranks:',[int(p.diagonal().sum().real/18) for p in Ps])
print('all 108 projector-rotation commutators zero; completeness and orthogonality PASS')
# A fixed grade-three skew Majorana bilinear and a symmetric traceless rank-two polarization.
# Tensor model: rotation generators act on rank-two tensors; grade-three bilinear is distinct.
# Show a single plane test misses most of 44; trace of rank-two plane projector.
B=M[0];B2=B@B;R=B2@(B2+4*U)@(B2+16*U)@(B2+36*U)
assert R.diagonal().sum()==2*den
print('single-plane extreme-weight projector rank 2; all-plane span rank 44')

# Cartan slow Fock module: north-pole stabilizer Spin(8), singlet within 44.
# Scale Casimir by 16, eigenvalues 0,112,256 on 1+8+35.
H8=-sum((B@B for B,(i,j) in zip(M,combinations(range(9),2)) if j<8),0*U)
R=P44num@(H8-112*U)@(H8-256*U)
rden=18*112*256
assert eq(R@H8,0*U) and eq(R@R,rden*R) and R.diagonal().sum()==rden
# B_9ij = i/2 sum theta_a (Gamma9 Gamma_i Gamma_j)_ab theta_b, theta=C/sqrt(2).
# 2 B_9ij = i sum upper entries C_a C_b. Test squared norm on rank-one scalar.
values=[]
for i,j in combinations(range(8),2):
    A=G[8]@G[i]@G[j]; assert np.array_equal(A.T,-A)
    V=1j*sum((int(A[a,b])*(C[a]@C[b]) for a,b in combinations(range(16),2) if A[a,b]),0*U)
    W=V@R
    assert eq(P84num@W,18*W)
    value=(R@V@V).diagonal().sum()/rden/4
    assert value.real>0 and value.imag==0
    values.append(float(value.real))
print('Spin(8) invariant line in 44: rank 1; 28 grade-three bilinears map it into 84')
print('squared norm values for B_9ij:',Counter(values))
