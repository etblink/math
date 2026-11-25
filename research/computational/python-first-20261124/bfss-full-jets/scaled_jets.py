"""Exact scaled integer Yukawa jets. Vp=(Z/2)^p S and dp=D_mu Vp.
Use rational integer division with remainder checks; restore powers of two in raw contractions.
Rotation-derived off-diagonal jets, fallback to ordered recurrence on degenerate slice.
"""
from higher_jets import *
from concurrent.futures import ProcessPoolExecutor

def div(v,k):
 assert k!=0 and np.all(v[1]%k==0) and np.all(v[2]%k==0),('nondivisible',k,len(v[0]))
 return v[0],v[1]//k,v[2]//k

def run_scaled(diag,P,control=False):
 t=time.monotonic();bounds[:]=[0,0];x=np.pad(np.diag(diag),((0,0),(0,6)));op=a.Z(x);V=[S];n=P+1
 for p in range(P):V.append(div(apply(op,V[-1]),2))
 tau=np.zeros((n,n),dtype=object);beta=tau.copy();nu=[];tt=[];euler=[];checks=0;rotations=0;fallbacks=0
 def ordered(b,k):
  K=a.K[b,k];ds=[zero]
  for p in range(P):ds.append(div(combine((1,apply(K,V[p])),(1,apply(op,ds[-1]))),2))
  return ds
 # Compute each pair of off-diagonal jets from a single pair of generator applications.
 for b,k in pairs:
  if k>3:continue
  if b!=k and k<3 and b>k and diag[b]**2!=diag[k]**2:continue
  group=[]
  if k==3 and diag[b]:
   ds=[div(apply(a.R[b,k],v),-8*diag[b]) for v in V];group=[(b,k,ds)];rotations+=1
  elif k<3 and b<k and diag[b]**2!=diag[k]**2:
   u,v=diag[b],diag[k];den=8*(v*v-u*u);d1=[];d2=[]
   for w in V:
    g=apply(a.G[b,k],w);r=apply(a.R[b,k],w)
    d1.append(div(combine((4*v,g),(u,r)),den));d2.append(div(combine((4*u,g),(v,r)),den))
   group=[(b,k,d1),(k,b,d2)];rotations+=2
  else:
   group=[(b,k,ordered(b,k))];fallbacks+=1
  for b,k,ds in group:
   if control and (b!=k):assert all(eq(v,w) for v,w in zip(ds,ordered(b,k))),('rotation mismatch',diag,b,k);checks+=1
   mult=6 if k==3 else 1;tau+=mult*gram(ds,ds,True)
   B=B2(x,b,k);BV=[apply(B,v) for v in V];beta-=mult*gram(BV,ds)
   if b==k:
    nu.append((gram(V,ds)*int(x[b,k])).tolist());tt.append((gram(V,BV)*int(x[b,k])).tolist());euler.append((int(x[b,k]),ds[-1]))
   print(diag,'jet',b,k,round(time.monotonic()-t,2),flush=True)
 assert eq(combine(*euler),combine((P,V[-1])))
 cv=gram(V,[apply(CV(x),v) for v in V]);scale=np.array([[2**(p+q) for q in range(n)] for p in range(n)],dtype=object)
 res={'diag':diag,'power':P,'N':N,'tau_raw':(tau*scale).tolist(),'nu_raw':(np.array(nu,dtype=object)*scale).tolist(),'B2_beta_raw':(beta*scale).tolist(),'B2_t_raw':(np.array(tt,dtype=object)*scale).tolist(),'sqrt2_i_cV_raw':(cv*scale).tolist(),'rotation_derived_directions':rotations,'ordered_directions':fallbacks,'independent_ordered_rotation_checks':checks,'transverse_multiplicity':6,'euler_exact':True,'apply_bound':str(bounds[0]),'dot_bound':str(bounds[1]),'seconds':time.monotonic()-t};(D/('jet_'+''.join(map(str,diag))+'_p'+str(P)+'.json')).write_text(json.dumps(res,indent=2)+'\n');print(diag,'complete',res['seconds'],flush=True);return res
if __name__=='__main__':
 for d in sys.argv[4:]:run_scaled(tuple(map(int,d.split(','))),int(sys.argv[3]),int(sys.argv[3])<=2)
