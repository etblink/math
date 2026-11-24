"""Finite Appendix-A transport test. Matrix recipes transcribed from pinned
bfss_reproduce_msy_gamma_and_gaussian.py; source Pauli words from D1G.
Test: exact signed coefficient identities; actual eight-mode transformed vacuum.
No claim of external published occupation-state transport or differential domain.
"""
import numpy as np, itertools, json
from pathlib import Path
from scipy.linalg import eigh
I=np.eye(2,dtype=int); X=np.array([[0,1],[1,0]]); Z=np.diag([1,-1]); J=np.array([[0,1],[-1,0]]); Y=1j*np.array([[0,-1],[1,0]])
def word(w):
    m=np.ones((1,1),int)
    for c in w:m=np.kron(m,dict(I=I,X=X,Z=Z,J=J)[c])
    return m
S=np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]); I16=np.eye(16,dtype=int)
def E(a,b):
    m=np.zeros((4,4),int);m[a-1,b-1]=1;m[b-1,a-1]=-1;return m
rho=[E(1,2)+E(3,4),1j*(E(1,2)-E(3,4)),E(1,3)-E(2,4),1j*(E(1,3)+E(2,4)),E(1,4)+E(2,3),1j*(E(1,4)-E(2,3))]
A=[]
for h in [X,Y,-Z]:
    H=np.kron(np.eye(4,dtype=int),h);A.append(np.kron(H.real,I)-np.kron(H.imag,J))
for r in rho:
    B=np.kron(r,J);A.append(np.kron(B.real,Z)+np.kron(B.imag,X))
A=np.array(A,dtype=int);flip=np.ones(9,int);flip[-1]=-1
for G in (S,A):
    for i,j in itertools.product(range(9),repeat=2):assert np.array_equal(G[i]@G[j]+G[j]@G[i],2*(i==j)*I16)
def intertwiner(sign):
    for i,j in itertools.product(range(16),repeat=2):
        p=np.zeros((16,16),int);p[i,j]=1
        for k in range(9):p=p+sign[k]*A[k]@p@S[k]
        if np.any(p):return p//np.gcd.reduce(abs(p.ravel()))
P=intertwiner(flip); assert np.array_equal(P.T@P,4*I16);O=P/2
kmax=max(np.max(abs(flip[i]*A[i]@P-P@S[i])) for i in range(9)); cmax=max(np.max(abs(flip[i]*flip[j]*A[i]@A[j]@P-P@S[i]@S[j])) for i,j in itertools.combinations(range(9),2))
wrongk=max(np.max(abs(A[i]@P-P@S[i])) for i in range(9));wrongc=max(np.max(abs(A[i]@A[j]@P-P@S[i]@S[j])) for i,j in itertools.combinations(range(9),2))
assert kmax==cmax==0 and wrongk>0 and wrongc>0 and intertwiner(np.ones(9,int)) is None
# original annihilator mapped to Appendix A Cartesian 8-mode Fock block
z=O[:,::2]+1j*O[:,1::2];U=(z[::2]-1j*z[1::2]).T/2;V=(z[::2]+1j*z[1::2]).T/2
u=np.linalg.svd(U,compute_uv=False);v=np.linalg.svd(V,compute_uv=False)
car1=np.max(abs(U@U.conj().T+V@V.conj().T-np.eye(8)));car2=np.max(abs(U@V.T+V@U.T))
# construct N_b through actual bitmask Fock matrices; validate vacuum in 256-dimensional space.
C=[]
for m in range(8):
    c=np.zeros((256,256),complex)
    for b in range(256):
        if b>>m&1:c[b^(1<<m),b]=(-1)**((b&((1<<m)-1)).bit_count())
    C.append(c)
C=np.array(C);B=np.einsum('jk,kab->jab',U,C)+np.einsum('jk,kab->jab',V,C.conj().transpose(0,2,1));N=sum(b.conj().T@b for b in B)
vals,vec=eigh(N,subset_by_index=[0,1]);psi=vec[:,0];masks=np.arange(256);numbers=np.array([int(b).bit_count() for b in masks]);probs=abs(psi)**2
ann=max(np.linalg.norm(b@psi) for b in B);orig_vac=np.eye(256)[:,0];bad=max(np.linalg.norm(b@orig_vac) for b in B)
# Recover Gaussian-integer exact vacuum coefficients relative to first nonzero.
support=np.flatnonzero(probs>1e-12); rel=psi/psi[support[0]]; zexact=np.rint(rel.real)+1j*np.rint(rel.imag)
assert np.max(abs(rel-zexact))<1e-10
# All entries of 4B are Gaussian integers; exact arithmetic in binary floats at these small sizes.
assert np.max(abs(4*B-np.rint((4*B).real)-1j*np.rint((4*B).imag)))==0
exact_res=max(np.max(abs((4*b)@zexact)) for b in B); assert exact_res==0
norm2=int(np.vdot(zexact,zexact).real)
res=dict(exact_vacuum_integer_norm2=norm2,exact_annihilation_residual=float(exact_res),exact_vacuum_coefficients=[[int(i),int(zexact[i].real),int(zexact[i].imag)] for i in support],P=P.tolist(),det_O=float(np.linalg.det(O)),kinetic_integer_residual=int(kmax),cubic_integer_residual=int(cmax),wrong_kinetic_integer_residual=int(wrongk),wrong_cubic_integer_residual=int(wrongc),same_axis_intertwiner_exists=False,linear_singular_values=u.tolist(),antilinear_singular_values=v.tolist(),car_1=float(car1),car_2=float(car2),transformed_number_lowest_eigenvalues=vals.tolist(),annihilation_residual=float(ann),unchanged_vacuum_residual=float(bad),vacuum_number_mean=float(probs@numbers),vacuum_number_variance=float(probs@(numbers-4)**2),vacuum_weight_outside_four_particles=float(probs[numbers!=4].sum()),vacuum_support=[int(b) for b in masks[probs>1e-12]])
Path(__file__).with_name('transport_results.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps({k:v for k,v in res.items() if k!='P'},indent=2))
