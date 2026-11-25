"""Finite ordered jets through Z^2, Z=sqrt(2)Y. Exact integer receipts.
Usage: python jet2.py COVARIANT_DIR SEED_NPZ 1,2,3 [more fixtures].
B2=2B, V0=V in t=sqrt(2)theta convention; sqrt(2)*i c V=i sum t-linear(X) V0.
"""
import sys, numpy as np, itertools as it, json, time
from pathlib import Path
D=Path(__file__).resolve().parent
sys.path.insert(0,sys.argv[1]);import covariant_audit as a
f=np.load(sys.argv[2]);S=a.check((f['masks'].astype(np.int32),f['real'].astype(float)+1j*f['imag'].astype(float)));N=a.norm2(S);assert N==8072064
pairs=list(it.product(range(3),range(9)))
def dot(v,w):
 _,i,j=np.intersect1d(v[0],w[0],assume_unique=True,return_indices=True);bound=max(1,int(a.size(v)*a.size(w)));assert bound<2**49
 step=max(1,min(65536,2**49//bound));r=z=0
 for k in range(0,len(i),step):
  x=np.vdot(v[1][i[k:k+step]],w[1][j[k:k+step]]);assert x.real==int(x.real) and x.imag==int(x.imag);r+=int(x.real);z+=int(x.imag)
 return r,z

def msum(v,w):return [[dot(x,y)[0] for y in w] for x in v]
def B2(x,b,k):
 terms=[]
 for c,i in pairs:
  if x[c,i] and (c,i)!=(b,k):terms.append((int(x[c,i]),a.bilinear(c,b,a.S[i]@a.S[k])))
 return a.opsum(*terms)
def CV(x):
 terms=[]
 for c,i in pairs:
  if x[c,i]:
   for j,k in it.combinations(range(9),2):
    for b,coef in enumerate(np.cross(x[:,j],x[:,k])):
     if coef:terms.append((1j*int(x[c,i])*int(coef),a.bilinear(c,b,a.S[i]@a.S[j]@a.S[k])))
 return a.opsum(*terms)
def run(diag):
 t=time.monotonic();x=np.pad(np.diag(diag),((0,0),(0,6)));op=a.Z(x);V=[S,a.apply(op,S)];V.append(a.apply(op,V[1]));tau=np.zeros((3,3),dtype=object);beta=tau.copy();nu=[];tt=[];euler=[];checks=0
 for b,k in pairs:
  K=a.K[b,k];d1=a.apply(K,S);d2=a.combine((1,a.apply(K,V[1])),(1,a.apply(op,d1)));ds=[a.zero,d1,d2]
  tau+=np.array(msum(ds,ds),dtype=object)
  B=B2(x,b,k);BV=[a.apply(B,v) for v in V];beta-=np.array(msum(BV,ds),dtype=object)
  if b==k:
   nu.append((np.array(msum(V,ds),dtype=object)*int(x[b,k])).tolist());tt.append((np.array(msum(V,BV),dtype=object)*int(x[b,k])).tolist());euler.append((int(x[b,k]),d2))
  if k>=3 and x[b,b]:
   assert a.eq(a.apply(a.R[b,k],V[2]),a.combine((-8*int(x[b,b]),d2)));checks+=1
  print(diag,'jet',b,k,flush=True)
 assert a.eq(a.combine(*euler),a.combine((2,V[2])))
 cv=msum(V,[a.apply(CV(x),v) for v in V]);res={'diag':diag,'N':N,'tau_raw':tau.tolist(),'nu_raw':nu,'B2_beta_raw':beta.tolist(),'B2_t_raw':tt,'sqrt2_i_cV_raw':cv,'transverse_checks':checks,'euler_exact':True,'seconds':time.monotonic()-t};(D/('jet_'+''.join(map(str,diag))+'.json')).write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res),flush=True)
if __name__=='__main__':
 for d in sys.argv[3:]:run(tuple(map(int,d.split(','))))
