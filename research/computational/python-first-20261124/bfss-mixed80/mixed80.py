"""Low-degree mixed-family jets: S0,S1,S2,Phi0,H3_0. Exact rational factors."""
from cross_moments import *
cores=[('S',p) for p in range(9)]+[('Phi',0),('H3',0),('Phi',1),('H3',1)];degrees=list(range(9))+[3,3,4,4]
def h_tensor(B):
 parts=[]
 for j in range(9):
  rhs=sp.Matrix(B[:,:,:,j].ravel().tolist())/3;q=MI*rhs[piv,:];assert M*q==rhs
  w=lin(*[(F(int(c.p),int(c.q)),v) for c,v in zip(q,vs)])
  if j:w=scale(F(-1,8),act(a.R[0,j],w))
  parts.append((1,w))
 return lin(*parts)
def dh(x,e):
 g=x@x.T;dg=e@x.T+x@e.T
 return h_tensor(5*(sym(dg,x)+sym(g,e))-sym(np.eye(3,dtype=int),np.trace(dg)*x+np.trace(g)*e+2*dg@x+2*g@e))
def phi_ops(x):return [a.Z(x)]+[a.opsum((1,a.M(x,d,c)),(-1,a.M(x,c,d))) for d,c in it.combinations(range(3),2)]
def dphi(x,e):
 ops=phi_ops(x);dops=phi_ops(e);w=act(ops[0],seed);dw=act(dops[0],seed);terms=[(320*int(np.sum(x*e)),w),(160*int(np.sum(x*x)),dw)]
 for L,dL in zip(ops,dops):terms.extend([(-1,act(dL,act(L,w))),(-1,act(L,act(dL,w))),(-1,act(L,act(L,dw)))])
 return scale(2,lin(*terms))
def runjet(diag):
 t=time.monotonic();x=np.pad(np.diag(diag),((0,0),(0,6)));z=a.Z(x);w=act(z,seed);V=[seed]
 for p in range(8):V.append(act(z,V[-1]))
 V += [phi(x),h3(x)];V += [act(z,V[9]),act(z,V[10])];n=len(V);tau=np.zeros((n,n),dtype=object);beta=tau.copy();nu=[];tt=[];euler=[];ctrl=0
 def gr(U,W):return np.array([[inner(u,w) if max(p,q)>=11 else F(0) for q,w in enumerate(W)] for p,u in enumerate(U)],dtype=object)
 def direct(b,k):
  e=np.zeros_like(x);e[b,k]=1;K=a.K[b,k];ds=[prim(zero)]
  for p in range(8):ds.append(lin((1,act(K,V[p])),(1,act(z,ds[-1]))))
  ds += [dphi(x,e),dh(x,e)]
  return ds+[lin((1,act(K,V[j])),(1,act(z,ds[j]))) for j in (9,10)]
 for b,k in pairs:
  if k>3:continue
  if b!=k and k<3 and b>k and diag[b]**2!=diag[k]**2:continue
  if k==3 and diag[b]:group=[(b,k,[scale(F(-1,8*diag[b]),act(a.R[b,k],v)) for v in V])]
  elif k<3 and b<k and diag[b]**2!=diag[k]**2:
   u,v=diag[b],diag[k];den=8*(v*v-u*u);d1=[];d2=[]
   for p in V:
    g=act(a.G[b,k],p);r=act(a.R[b,k],p);d1.append(scale(F(1,den),lin((4*v,g),(u,r))));d2.append(scale(F(1,den),lin((4*u,g),(v,r))))
   group=[(b,k,d1),(k,b,d2)]
  else:group=[(b,k,direct(b,k))]
  for b,k,ds in group:
   if diag==(1,1,2) and (b,k)==(0,2):
    assert all(eqr(v,w) for v,w in zip(ds,direct(b,k)));ctrl+=n
   mult=6 if k==3 else 1;tau+=mult*gr(ds,ds);B=B2(x,b,k);BV=[act(B,v) for v in V];beta-=mult*gr(BV,ds)
   if b==k:nu.append(gr(V,ds)*int(x[b,k]));tt.append(gr(V,BV)*int(x[b,k]));euler.append((int(x[b,k]),ds))
   print(diag,b,k,round(time.monotonic()-t,2),flush=True)
 for p,d in enumerate(degrees):assert eqr(lin(*[(c,ds[p]) for c,ds in euler]),scale(d,V[p]))
 cv=gr(V,[act(CV(x),v) for v in V]);out={}
 for name,T in [('tau',tau),('nu',np.array(nu,dtype=object)),('beta',beta),('t',np.array(tt,dtype=object)),('v',cv)]:
  for p,q in it.product(range(n),repeat=2):
   parity=degrees[p]+degrees[q]+(name=='v');den=2**(parity//2)*(2 if name in ('beta','t') else 1)
   if name in ('nu','t'):
    if parity%2:assert not any(T[:,p,q]);
    T[:,p,q]=[str(F(v)/den) for v in T[:,p,q]]
   else:
    if parity%2:assert not T[p,q];
    T[p,q]=str(F(T[p,q])/den)
  out[name]=T.tolist()
 out.update({'diag':diag,'cores':cores,'degrees':degrees,'Euler_exact':True,'rotation_direct_checks':ctrl,'seconds':time.monotonic()-t});(D/('jet_'+''.join(map(str,diag))+'.json')).write_text(json.dumps(out,indent=2)+'\n');print('done',diag,out['seconds'],flush=True)
if __name__=='__main__':
 for d in sys.argv[6:]:
  if not (D/('jet_'+d.replace(',','')+'.json')).exists():runjet(tuple(map(int,d.split(','))))
