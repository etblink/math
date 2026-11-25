"""Coefficient-space audit of the B and cubic cV insertions in the finite CAR representation.
Represent t=sqrt(2)theta bilinears by twice their skew coefficient matrix; omit scalar Clifford contractions.
This audit checks every ordered B coordinate pair against all rotations and cV tangent covariance on fixtures.
"""
import sys,itertools as it,json
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent
sys.path.insert(0,sys.argv[1]);import covariant_audit as a
G=a.S.astype(np.int64);I=np.eye(16,dtype=np.int64);pairs=list(it.product(range(3),range(9)));ix={p:k for k,p in enumerate(pairs)}
E=np.eye(3,dtype=np.int64)
def plane(n,i,j):
 p=np.zeros((n,n),np.int64);p[i,j]=1;p[j,i]=-1;return p

def skew(a,b,M):
 A=np.kron(np.outer(E[a],E[b]),M);return A-A.T
# B2= sum t^a Gamma_i Gamma_k t^b minus 16*delta, hence pure bivector.
B=np.array([[skew(c,b,G[i]@G[k]) for b,k in pairs] for c,i in pairs],dtype=np.int16)
assert np.array_equal(B,-B.swapaxes(0,1)) and not np.any(np.diagonal(B,axis1=0,axis2=1))
# D is the commutator action on Majorana coefficient columns, scaled as in G2/R8.
def comm(D,M):
 # D has at most one nonzero per row/column. Vectorized signed permutations avoid cubic matrix multiplication.
 j=np.argmax(abs(D),axis=1);w=D[np.arange(48),j];return (M[...,j,:]*w.reshape((1,)*(M.ndim-2)+(48,1)))+(M[..., :,j]*w.reshape((1,)*(M.ndim-2)+(1,48)))
def expected(B,L,scale):
 # For a basis covariant indexed by coordinate columns, [D,B_ij] = scale*sum L_ki B_kj + scale*sum L_kj B_ik.
 # Sparse signed permutation with at most one nonzero per column.
 j=np.argmax(abs(L),axis=0);w=L[j,np.arange(27)];return scale*(B[j,:,:,:]*w[:,None,None,None]+B[:,j,:,:]*w[None,:,None,None])

def cv(X):
 # imaginary unit common to i cV omitted. Scalar term is zero by trace or color antisymmetry.
 C=np.zeros((48,48),np.int64);scalar=0
 for c,i in pairs:
  if not X[c,i]:continue
  for j,k in it.combinations(range(9),2):
   for b,w in enumerate(np.cross(X[:,j],X[:,k])):
    if not w:continue
    M=G[i]@G[j]@G[k];coef=int(w)*int(X[c,i]);C+=coef*skew(c,b,M)
    if c==b:scalar+=coef*int(np.trace(M))
 assert scalar==0
 return C
rotations=[]
for i,j in it.combinations(range(3),2):
 L=plane(3,i,j);rotations.append(('color',i,j,2*np.kron(L,I),np.kron(L,np.eye(9,dtype=np.int64)),2))
for i,j in it.combinations(range(9),2):
 L=plane(9,i,j);rotations.append(('space',i,j,4*np.kron(E,G[i]@G[j]),np.kron(E,L),8))
fixtures=[np.pad(np.diag([1,2,3]),((0,0),(0,6))),np.array([[1,0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,0,0],[1,0,0,0,0,0,1,0,0]],int)]
checks=0;cvchecks=0;bad=0
for name,i,j,Dg,L,scale in rotations:
 lhs=comm(Dg,B);rhs=expected(B,L,scale);assert np.array_equal(lhs,rhs),(name,i,j,np.count_nonzero(lhs-rhs));checks+=27*27
 if not bad:bad=int(np.count_nonzero(lhs+rhs))
 for X in fixtures:
  dx=(L@X.ravel()).reshape(3,9)
  # Centered 4-point difference exact for cubics: (-F(2)+8F(1)-8F(-1)+F(-2))/12.
  d=-cv(X+2*dx)+8*cv(X+dx)-8*cv(X-dx)+cv(X-2*dx)
  lhs=12*comm(Dg,cv(X));assert np.array_equal(lhs,scale*d),(name,i,j,np.count_nonzero(lhs-scale*d));cvchecks+=1
assert bad>0
r={'B_basis_pair_commutators_exact':checks,'cubic_cV_tangent_checks_exact':cvchecks,'cubic_fixtures':2,'reversed_sign_B_nonzero_coefficients':bad,'scope':'Exact finite bivector covariance identities; cV tangent fixtures are finite controls, general covariance also follows from invariant epsilon and Clifford tensors. No physical-carrier qualification.'};(D/'covariance_results.json').write_text(json.dumps(r,indent=2)+'\n');print(r,flush=True)
