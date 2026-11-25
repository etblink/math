"""Independently compare high-order ordered jets with rotation formulas, coefficientwise."""
from scaled_jets import *
x=np.pad(np.diag([1,2,3]),((0,0),(0,6)));op=a.Z(x);V=[S]
for p in range(8):V.append(div(apply(op,V[-1]),2))
checks=[]
for b,k in [(0,1),(1,0),(0,3)]:
 ds=[zero];K=a.K[b,k]
 for p in range(8):ds.append(div(combine((1,apply(K,V[p])),(1,apply(op,ds[-1]))),2))
 for p,w in enumerate(V):
  if k>=3:r=div(apply(a.R[b,k],w),-8*int(x[b,b]))
  else:
   i,j=sorted((b,k));u,v=int(x[i,i]),int(x[j,j]);den=8*(v*v-u*u);g=apply(a.G[i,j],w);sp=apply(a.R[i,j],w);r=div(combine((4*(v if b==i else u),g),(u if b==i else v,sp)),den)
  assert eq(r,ds[p]),(b,k,p)
  checks.append({'direction':[b,k],'power':p,'support':len(r[0])})
 print('direction',b,k,'all 9 powers exact',flush=True)
report={'fixture':[1,2,3],'ordered_vs_rotation_exact':len(checks),'checks':checks,'scope':'Independent recurrence and tangent evaluation of the same finite representation.'};(D/'high_rotation_control.json').write_text(json.dumps(report,indent=2)+'\n')
