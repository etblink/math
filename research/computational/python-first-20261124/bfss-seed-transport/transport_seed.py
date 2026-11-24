import numpy as np, itertools, json, sys, time, hashlib
from scipy.sparse import csr_matrix
from pathlib import Path
from collections import Counter
D=Path(__file__).resolve().parent
alpha='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/-'
vals=[-120,-104,-84,-56,-54,-48,-42,-40,-39,-33,-32,-30,-28,-26,-25,-24,-21,-20,-18,-17,-16,-15,-13,-12,-11,-10,-9,-8,-7,-5,-4,-2,-1,1,2,4,5,6,7,8,9,10,11,12,13,15,16,17,20,21,24,25,26,28,30,32,33,39,40,42,48,54,56,84,104]
N=1<<24
# Historical source Pauli words, external realification from companion model.py.
I=np.eye(2,dtype=int); X=np.array([[0,1],[1,0]]); Z=np.diag([1,-1]); J=np.array([[0,1],[-1,0]]); Y=np.array([[0,-1j],[1j,0]])
def word(w):
 m=np.ones((1,1),int)
 for c in w:m=np.kron(m,dict(I=I,X=X,Z=Z,J=J)[c])
 return m
S=np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']])
def E(a,b):
 m=np.zeros((4,4),int);m[a-1,b-1]=1;m[b-1,a-1]=-1;return m
rho=[E(1,2)+E(3,4),1j*(E(1,2)-E(3,4)),E(1,3)-E(2,4),1j*(E(1,3)+E(2,4)),E(1,4)+E(2,3),1j*(E(1,4)-E(2,3))]
A=[]
for h in [X,Y,-Z]:
 H=np.kron(np.eye(4,dtype=int),h);A.append(np.kron(H.real,I)-np.kron(H.imag,J))
for r in rho:
 B=np.kron(r,J);A.append(np.kron(B.real,Z)+np.kron(B.imag,X))
A=np.array(A,dtype=int);flip=np.ones(9,int);flip[-1]=-1
for i,j in itertools.product(range(16),repeat=2):
 P=np.zeros((16,16),int);P[i,j]=1
 for k in range(9):P=P+flip[k]*A[k]@P@S[k]
 if np.any(P):P=P//np.gcd.reduce(abs(P.ravel()));break
assert np.array_equal(P.T@P,4*np.eye(16,dtype=int));assert all(np.array_equal(A[i]@P,flip[i]*P@S[i]) for i in range(9));O=P/2
# Actual seed expansion, raw integer coefficients, normalize at end.
s=''.join((D/'seed_packed.txt').read_text().split());assert len(s)==3750
seed={}
for i in range(0,len(s),5):
 f=[alpha.index(c) for c in s[i:i+4]];v=vals[alpha.index(s[i+4])];assert f==sorted(f)
 for t in set(itertools.permutations(f)):
  m=sum(x<<(6*j) for j,x in enumerate(t));assert m not in seed;seed[m]=v
norm2=sum(v*v for v in seed.values());assert len(seed)==14240 and norm2==1144*84**2
psi=np.zeros(N,complex);psi[list(seed)]=list(seed.values())
# Exterior map U: from companion spherical occupation to Cartesian occupation,
# rows ordered 3*rho+a and columns 2*c+rho. Determinants include fermionic signs.
h=1/np.sqrt(2);UC=np.array([[h,0,-h],[1j*h,0,1j*h],[0,1,0]])
L=np.zeros((6,6),complex)
for a,c,r in itertools.product(range(3),range(3),range(2)):L[3*r+a,2*c+r]=UC[a,c]
assert np.max(abs(L@L.conj().T-np.eye(6)))<1e-14
occ=lambda m,n:[i for i in range(n) if m>>i&1]
F=np.zeros((64,64),complex)
for i,j in itertools.product(range(64),repeat=2):
 if i.bit_count()==j.bit_count(): F[i,j]=np.linalg.det(L[np.ix_(occ(i,6),occ(j,6))]) if i else 1
assert np.max(abs(F@F.conj().T-np.eye(64)))<1e-14
# Matrix acts on contiguous bit block; no full Fock operator.
def apply_local(v,M,bits,offset):
 n=1<<bits;inner=1<<offset
 a=v.reshape(-1,n,inner).transpose(1,0,2).reshape(n,-1)
 z=csr_matrix(M)@a
 return np.ascontiguousarray(z.reshape(n,-1,inner).transpose(1,0,2)).reshape(-1)
def summary(v):
 nz=np.flatnonzero(abs(v)>1e-9)
 return {'support':len(nz),'norm2':float(np.vdot(v,v).real),'max_abs':float(np.max(abs(v))),'odd_support':sum(int(x).bit_count()%2 for x in nz)}
res={'seed':summary(psi),'source_commit':'93d7adb2a62e8f9a3ecfe3f7e709eea1910914ea','companion_commit':'96b19b1fef98486e43bc2527604966c86afd7ca7','companion_blob':'cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc','denominator':84,'stored_norm':'1/1144'}
for i in range(4):psi=apply_local(psi,F,6,6*i)
res['external_cartesian']=summary(psi);print('cart',res['external_cartesian'],flush=True)
# Exact signed permutation between spin-major and color-major occupation.
def permute(v,p,signed=True):
 masks=np.flatnonzero(abs(v)>1e-10).astype(np.int64);t=np.zeros_like(masks);par=np.zeros_like(masks)
 for i in range(24):
  b=(masks>>i)&1;t|=b<<p[i]
  if signed:
   for j in range(i+1,24):
    if p[j]<p[i]:par^=b*((masks>>j)&1)
 out=np.zeros_like(v);out[t]=v[masks]*(1-2*par);return out
p=[8*(i%3)+i//3 for i in range(24)];inv=np.argsort(p).tolist();psi=permute(psi,p)
# Local intertwiner source -> external Cartesian, original annihilator b mapped to external.
z=O[:,::2]+1j*O[:,1::2];U=(z[::2]-1j*z[1::2]).T/2;V=(z[::2]+1j*z[1::2]).T/2
C=np.zeros((8,256,256),complex)
for m in range(8):
 for b in range(256):
  if b>>m&1:C[m,b^(1<<m),b]=(-1)**((b&((1<<m)-1)).bit_count())
B=np.einsum('jk,kab->jab',U,C)+np.einsum('jk,kab->jab',V,C.conj().transpose(0,2,1))
# reconstruct vacuum by diagonalizing N_b, then snap to independently checked exact coefficients
from scipy.linalg import eigh
N_b=sum(b.conj().T@b for b in B);_,vec=eigh(N_b,subset_by_index=[0,0]);v=vec[:,0];v/=v[np.flatnonzero(abs(v)>1e-10)[0]];v=np.rint(v.real)+1j*np.rint(v.imag);assert all(np.max(abs(b@v))==0 for b in B);v/=np.linalg.norm(v)
T=np.zeros((256,256),complex);T[:,0]=v;bd=[csr_matrix(b.conj().T) for b in B]
for m in range(1,256):
 j=(m&-m).bit_length()-1;T[:,m]=bd[j]@T[:,m^(1<<j)]
res['local_unitary_residual']=float(np.max(abs(T.conj().T@T-np.eye(256))))
res['local_intertwiner_residual']=float(max(np.max(abs(B[j]@T-T@C[j])) for j in range(8)))
res['local_parity_residual']=float(max(abs(T[i,j]) for i,j in itertools.product(range(256),repeat=2) if (i.bit_count()-j.bit_count())%2))
assert res['local_unitary_residual']<1e-13 and res['local_intertwiner_residual']<1e-13 and res['local_parity_residual']==0
for a in range(3):psi=apply_local(psi,T.conj().T,8,8*a);print('color',a,summary(psi),flush=True)
psi=permute(psi,inv);res['source_cartesian']=summary(psi)
# Save compact source coefficients; exact generator checks below use integer-scaled candidates.
masks=np.flatnonzero(abs(psi)>1e-9).astype(np.int64);coeff=psi[masks];del psi
np.savez_compressed(D/'source_seed.npz',masks=masks,coefficients=coeff,raw_norm2=norm2)
res['norm_relative_error']=abs(res['source_cartesian']['norm2']/norm2-1)
res['particle_number_histogram']={str(k):{'support':int(sum(int(m).bit_count()==k for m in masks)),'probability':float(sum(abs(c)**2 for m,c in zip(masks,coeff) if int(m).bit_count()==k)/norm2)} for k in sorted(set(int(m).bit_count() for m in masks))}
# Try recovering dyadic lattice; numerical result alone doesn't prove equality with transported seed.
for q in [1,2,4,8,16,32,64,128,256,512,1024,2048,4096]:
 err=np.max(abs(q*coeff-(np.rint((q*coeff).real)+1j*np.rint((q*coeff).imag))))
 if err<1e-6:break
res['lattice_scale']=q;res['lattice_max_residual']=float(err)
print('source',res['source_cartesian'],'lattice',q,err,flush=True)
(D/'results.json').write_text(json.dumps(res,indent=2)+'\n')
