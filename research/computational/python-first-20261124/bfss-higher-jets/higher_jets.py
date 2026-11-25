"""Exact int64 occupation jets with bounded int128 contractions. Compile exact_kernels.cpp first."""
import sys,numpy as np,itertools as it,json,time,ctypes as ct
from pathlib import Path
D=Path(__file__).resolve().parent
sys.path.insert(0,sys.argv[1]);import covariant_audit as a
f=np.load(sys.argv[2]);S=(f['masks'].astype(np.int32),f['real'].astype(np.int64),f['imag'].astype(np.int64));N=int(f['raw_norm2']);assert N==8072064
lib=ct.CDLL(str(D/'exact_kernels.so'));ptr=ct.c_void_p;ii=ct.c_int
lib.apply.argtypes=[ptr,ptr,ptr,ii,ptr,ptr,ptr,ptr,ii,ptr,ptr,ptr,ptr,ptr,ii];lib.apply.restype=ii
lib.inner.argtypes=[ptr,ptr,ptr,ii,ptr,ptr,ptr,ii,ptr];lib.inner.restype=None
sr=np.zeros(1<<24,np.int64);si=np.zeros_like(sr);om=np.empty(1<<24,np.int32);orr=np.empty_like(sr);oi=np.empty_like(sr)
zero=(np.empty(0,np.int32),np.empty(0,np.int64),np.empty(0,np.int64));bounds=[0,0]
def arg(v):return [x.ctypes.data for x in v]+[len(v[0])]
def mx(v):return int(max(np.max(abs(v[1]),initial=0),np.max(abs(v[2]),initial=0)))
def apply(op,v):
 if not len(v[0]) or not op:return zero
 bound=mx(v)*sum(int(abs(w.real)+abs(w.imag)) for _,_,w in op);bounds[0]=max(bounds[0],bound);assert bound<2**63,('apply bound',bound)
 f,p,r,i=[np.array(z,dtype=t) for z,t in zip(zip(*[(f,p,int(w.real),int(w.imag)) for f,p,w in op]),[np.int32,np.int32,np.int64,np.int64])]
 n=lib.apply(*arg(v),f.ctypes.data,p.ctypes.data,r.ctypes.data,i.ctypes.data,len(f),sr.ctypes.data,si.ctypes.data,om.ctypes.data,orr.ctypes.data,oi.ctypes.data,len(om));assert n>=0
 return om[:n].copy(),orr[:n].copy(),oi[:n].copy()
def combine(*terms):
 bound=sum(abs(c)*mx(v) for c,v in terms);assert bound<2**63
 for c,(m,r,i) in terms:
  sr[m]+=c*r;si[m]+=c*i
 m=np.flatnonzero((sr!=0)|(si!=0)).astype(np.int32);r=sr[m].copy();i=si[m].copy();sr[m]=0;si[m]=0;return m,r,i
def dot(v,w):
 factor=2*mx(v)*mx(w);bound=factor*min(len(v[0]),len(w[0]));bounds[1]=max(bounds[1],bound)
 out=np.empty(4,np.uint64)
 def signed(lo,hi):
  z=int(lo)+(int(hi)<<64);return z-(1<<128) if z>=1<<127 else z
 def raw(v,w):
  lib.inner(*arg(v),*arg(w),out.ctypes.data);return signed(*out[:2]),signed(*out[2:])
 if bound<2**126:return raw(v,w)
 assert factor<2**126
 step=(2**126-1)//factor;re=im=0
 for k in range(0,len(v[0]),step):
  a=v[0][k:k+step];lo,hi=np.searchsorted(w[0],[a[0],a[-1]],side='left');hi+=int(hi<len(w[0]) and w[0][hi]==a[-1]);r,i=raw(tuple(x[k:k+step] for x in v),tuple(x[lo:hi] for x in w));re+=r;im+=i
 return re,im
def gram(V,W,symmetric=False):
 n=len(V);out=np.zeros((n,len(W)),dtype=object)
 for p in range(n):
  for q in range(p if symmetric else 0,len(W)):
   r,i=dot(V[p],W[q]);assert i==0,(p,q,r,i);out[p,q]=r
   if symmetric:out[q,p]=r
 return out
pairs=list(it.product(range(3),range(9)))
def B2(x,b,k):return a.opsum(*[(int(x[c,i]),a.bilinear(c,b,a.S[i]@a.S[k])) for c,i in pairs if x[c,i] and (c,i)!=(b,k)])
def CV(x):return a.opsum(*[(1j*int(x[c,i])*int(co),a.bilinear(c,b,a.S[i]@a.S[j]@a.S[k])) for c,i in pairs if x[c,i] for j,k in it.combinations(range(9),2) for b,co in enumerate(np.cross(x[:,j],x[:,k])) if co])
def eq(v,w):return all(np.array_equal(x,y) for x,y in zip(v,w))
def run(diag,P):
 t=time.monotonic();bounds[:]=[0,0];x=np.pad(np.diag(diag),((0,0),(0,6)));op=a.Z(x);V=[S];n=P+1
 for p in range(P):V.append(apply(op,V[-1]))
 tau=np.zeros((n,n),dtype=object);beta=tau.copy();nu=[];tt=[];euler=[];checks=0
 for b,k in pairs:
  if k>3:continue
  mult=6 if k==3 else 1;K=a.K[b,k];ds=[zero]
  for p in range(P):ds.append(combine((1,apply(K,V[p])),(1,apply(op,ds[-1]))))
  tau+=mult*gram(ds,ds,True)
  B=B2(x,b,k);BV=[apply(B,v) for v in V];beta-=mult*gram(BV,ds)
  if b==k:
   nu.append((gram(V,ds)*int(x[b,k])).tolist());tt.append((gram(V,BV)*int(x[b,k])).tolist());euler.append((int(x[b,k]),ds[-1]))
  if k>=3 and x[b,b]:assert eq(apply(a.R[b,k],V[-1]),combine((-8*int(x[b,b]),ds[-1])));checks+=1
  print(diag,'jet',b,k,round(time.monotonic()-t,2),flush=True)
 assert eq(combine(*euler),combine((P,V[-1])))
 cv=gram(V,[apply(CV(x),v) for v in V]);res={'diag':diag,'power':P,'N':N,'tau_raw':tau.tolist(),'nu_raw':nu,'B2_beta_raw':beta.tolist(),'B2_t_raw':tt,'sqrt2_i_cV_raw':cv.tolist(),'transverse_checks':checks,'transverse_multiplicity':6,'euler_exact':True,'apply_bound':str(bounds[0]),'dot_bound':str(bounds[1]),'seconds':time.monotonic()-t};(D/('jet_'+''.join(map(str,diag))+'_p'+str(P)+'.json')).write_text(json.dumps(res,indent=2)+'\n');print(diag,'complete',res['seconds'],flush=True)
if __name__=='__main__':
 for d in sys.argv[4:]:run(tuple(map(int,d.split(','))),int(sys.argv[3]))
