"""Exact transport verification in Q(i,sqrt(2)).
Use integer Gaussian coefficients in binary64 with explicit conservative
intermediate bounds <2**53; every multiply and sum in propagation is exact.
The only irrational symbol sqrt(2) is handled as a separate coefficient.
"""
import itertools,json, numpy as np, sympy as sp
from pathlib import Path
from scipy.sparse import csr_matrix
D=Path(__file__).resolve().parent
N=1<<24
alpha='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/-'
vals=[-120,-104,-84,-56,-54,-48,-42,-40,-39,-33,-32,-30,-28,-26,-25,-24,-21,-20,-18,-17,-16,-15,-13,-12,-11,-10,-9,-8,-7,-5,-4,-2,-1,1,2,4,5,6,7,8,9,10,11,12,13,15,16,17,20,21,24,25,26,28,30,32,33,39,40,42,48,54,56,84,104]
s=''.join((D/'seed_packed.txt').read_text().split());assert len(s)==3750
h=2166136261
for c in s:h=((h^ord(c))*16777619)&0xffffffff
assert h==0x528ac3d8
# source table transcribed from exact pinned SU2RealGammaProbe.lean, compare every entry to Pauli reconstruction.
perm=[[9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6],[11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4],[14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1],[10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5],[12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3],[15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0],[13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2],[8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7],list(range(16))]
sign=[[1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,-1,1,-1,1],[1,1,-1,-1,1,1,-1,-1,-1,-1,1,1,-1,-1,1,1],[1,-1,-1,1,1,-1,-1,1,-1,1,1,-1,-1,1,1,-1],[1,-1,-1,1,-1,1,1,-1,-1,1,1,-1,1,-1,-1,1],[1,-1,1,-1,-1,1,-1,1,-1,1,-1,1,1,-1,1,-1],[1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1],[1,1,-1,-1,-1,-1,1,1,-1,-1,1,1,1,1,-1,-1],[1]*16,[1]*8+[-1]*8]
I=np.eye(2,dtype=int);X=np.array([[0,1],[1,0]]);Z=np.diag([1,-1]);J=np.array([[0,1],[-1,0]]);Y=np.array([[0,-1j],[1j,0]])
def word(w):
 m=np.ones((1,1),int)
 for c in w:m=np.kron(m,dict(I=I,X=X,Z=Z,J=J)[c])
 return m
S=np.zeros((9,16,16),int);S[np.arange(9)[:,None],np.arange(16),np.array(perm)]=sign
assert np.array_equal(S,np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]))
# Rebuild external gamma exactly following pinned realification formula.
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
assert np.array_equal(P.T@P,4*np.eye(16,dtype=int));assert all(np.array_equal(A[i]@P,flip[i]*P@S[i]) for i in range(9))
seed={}
for i in range(0,len(s),5):
 f=[alpha.index(c) for c in s[i:i+4]];v=vals[alpha.index(s[i+4])]
 for t in set(itertools.permutations(f)):
  m=sum(x<<(6*j) for j,x in enumerate(t));assert m not in seed;seed[m]=v
norm2=sum(v*v for v in seed.values());assert norm2==8072064
# Exact exterior 3-mode block, 2*F3 represented in Z[i]+sqrt(2) Z[i].
U=sp.Matrix([[1/sp.sqrt(2),0,-1/sp.sqrt(2)],[sp.I/sp.sqrt(2),0,sp.I/sp.sqrt(2)],[0,1,0]])
assert sp.simplify(U.H*U)==sp.eye(3)
occ=lambda m,n:[i for i in range(n) if m>>i&1]
root=sp.sqrt(2)
def ring(z):
 z=sp.expand(z);a=sp.expand(z).coeff(root,0);b=sp.expand(z).coeff(root,1)
 assert sp.simplify(z-a-root*b)==0
 assert all(v.is_Integer for x in [a,b] for v in [sp.re(x),sp.im(x)])
 return complex(a),complex(b)
F3=np.zeros((2,8,8),complex)
for i,j in itertools.product(range(8),repeat=2):
 if i.bit_count()==j.bit_count():
  f=U.extract(occ(i,3),occ(j,3)).det() if i else 1;F3[:,i,j]=ring(2*f)
# 4*F6; explicit fermionic permutation from c*2+rho to rho*3+c.
def perm_mask(m,p):
 o=occ(m,len(p));return sum(1<<p[i] for i in o),(-1)**sum(p[i]>p[j] for i,j in itertools.combinations(o,2))
F6=np.zeros((2,64,64),complex);p6=[3*(i%2)+i//2 for i in range(6)]
for m in range(64):
 q,sg=perm_mask(m,p6)
 for n in range(64):
  a,b=F3[:,n&7,q&7];c,d=F3[:,n>>3,q>>3]
  F6[:,n,m]=sg*np.array([a*c+2*b*d,a*d+b*c])
# integer exact sparse propagation. Work only with nonzero masks to avoid two full arrays for the ring stage.
def sparse_ring_apply(state,M,offset,bits):
 out={};mask=(1<<bits)-1
 # python complex exact operations are safe since sum of absolute component bounds is tracked.
 mx=max(abs(a.real)+abs(a.imag)+2*(abs(b.real)+abs(b.imag)) for a,b in state.values())
 mat_bound=max(sum(abs(x.real)+abs(x.imag)+2*(abs(y.real)+abs(y.imag)) for x,y in zip(M[0,i],M[1,i])) for i in range(1<<bits))
 assert mx*mat_bound<2**50
 columns=[[(i,M[0,i,j],M[1,i,j]) for i in range(1<<bits) if M[0,i,j]!=0 or M[1,i,j]!=0] for j in range(1<<bits)]
 for m,(a,b) in state.items():
  j=(m>>offset)&mask;base=m^(j<<offset)
  for i,c,d in columns[j]:
   k=base|(i<<offset);e,f=out.get(k,(0j,0j));out[k]=(e+a*c+2*b*d,f+a*d+b*c)
 return {k:v for k,v in out.items() if v!=(0j,0j)}
state={m:(complex(v),0j) for m,v in seed.items()}
for k in range(4):state=sparse_ring_apply(state,F6,6*k,6)
assert all(b==0 and a.real%256==0 and a.imag%256==0 for a,b in state.values())
cart={m:a/256 for m,(a,b) in state.items()};assert len(cart)==19136 and sum(abs(z.real)**2+abs(z.imag)**2 for z in cart.values())==norm2
# One-color Fock map constructed exactly from B4=4*b and integer vacuum.
O=P/2;z=O[:,::2]+1j*O[:,1::2];U8=(z[::2]-1j*z[1::2]).T/2;V8=(z[::2]+1j*z[1::2]).T/2
C=np.zeros((8,256,256),complex)
for j in range(8):
 for m in range(256):
  if m>>j&1:C[j,m^(1<<j),m]=(-1)**((m&((1<<j)-1)).bit_count())
B4=4*(np.einsum('jk,kab->jab',U8,C)+np.einsum('jk,kab->jab',V8,C.conj().transpose(0,2,1)))
assert np.array_equal(B4,np.rint(B4.real)+1j*np.rint(B4.imag))
# derive exact vacuum from previously observed factored occupied vector and verify all annihilators.
# use fixed rational vector, not eigensolver output.
v4=np.zeros(256,complex)
for m in [85,86,89,90,101,102,105,106,149,150,153,154,165,166,169,170]:
 v4[m]=(-1)**(int(bool(m&8))+int(bool(m&32)))
assert np.vdot(v4,v4)==16 and all(np.max(abs(b@v4))==0 for b in B4)
scale=64
T4=np.zeros((256,256),complex);T4[:,0]=(scale//4)*v4
for m in range(1,256):
 j=(m&-m).bit_length()-1;v=B4[j].conj().T@T4[:,m^(1<<j)];assert np.all(v.real%4==0) and np.all(v.imag%4==0);T4[:,m]=v/4
assert np.array_equal(T4.conj().T@T4,scale**2*np.eye(256))
assert all(np.array_equal(B4[j]@T4,4*T4@C[j]) for j in range(8))
assert all(T4[i,j]==0 for i,j in itertools.product(range(256),repeat=2) if (i.bit_count()-j.bit_count())%2)
# Dense vector, sparse local 256x256 operator, exact Gaussian-integer propagation with bounds.
p=[8*(i%3)+i//3 for i in range(24)];inv=np.argsort(p).tolist();v=np.zeros(N,complex)
for m,z in cart.items():q,sg=perm_mask(m,p);v[q]=sg*z
M=T4.conj().T;row_bound=float(np.max(np.sum(abs(M.real)+abs(M.imag),axis=1)));denom=1;bounds=[]
for a in range(3):
 mx=float(np.max(abs(v.real)+abs(v.imag)));bound=mx*row_bound;assert bound<2**50;bounds.append(bound)
 inner=1<<(8*a);t=v.reshape(-1,256,inner).transpose(1,0,2).reshape(256,-1);z=csr_matrix(M)@t
 v=np.ascontiguousarray(z.reshape(256,-1,inner).transpose(1,0,2)).reshape(-1);denom*=scale
 del t,z
nz=np.flatnonzero(v);assert np.all(v[nz].real%denom==0) and np.all(v[nz].imag%denom==0)
out={}
for m in nz:
 q,sg=perm_mask(int(m),inv);out[q]=sg*v[m]/denom
f=np.load(D/'source_seed_integer.npz');expected={int(m):complex(r,i) for m,r,i in zip(f['masks'],f['real'],f['imag'])};assert out==expected
report={'packed_fnv1a32':'528ac3d8','gamma_literal_table_entries_checked':9*16*16,'exact_ring_color_transform':True,'external_cartesian_support':len(cart),'exact_local_unitary':True,'exact_local_intertwining_all_8':True,'exact_full_seed_transport_matches_integer_candidate':True,'source_support':len(out),'integer_squared_norm':norm2,'cartesian_denominator':256,'spin_transform_denominator':denom,'spin_accumulator_bounds':bounds,'scope':'Exact finite occupation arithmetic, not Lean or differential-domain qualification.'}
(D/'exact_transport_results.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
