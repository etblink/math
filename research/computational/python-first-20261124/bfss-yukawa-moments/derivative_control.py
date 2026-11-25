"""Finite product-rule controls for higher Yukawa powers; exact Gaussian integers."""
import sys,itertools as it,json
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent;sys.path.insert(0,sys.argv[1]);import covariant_audit as a
f=np.load(sys.argv[2]);S=a.check((f['masks'].astype(np.int32),f['real'].astype(float)+1j*f['imag'].astype(float)))
def powop(op,v,p):
 for _ in range(p):v=a.apply(op,v)
 return v
def deriv(Z,K,p):
 return a.combine(*[(1,powop(Z,a.apply(K,powop(Z,S,j)),p-1-j)) for j in range(p)])
# Exact degree-9 annihilator on rank-one seed, using the independently inferred spectral support.
x=np.pad(np.diag([1,0,0]),((0,0),(0,6)));Z=a.Z(x);v=S
for z in [4,8,12,16]:v=a.combine((1,powop(Z,v,2)),(-z*z,v))
v=a.apply(Z,v);assert len(v[0])==0
# Removing the highest spectral root must leave a nonzero result.
v=S
for z in [4,8,12]:v=a.combine((1,powop(Z,v,2)),(-z*z,v))
v=a.apply(Z,v);bad=a.stats(v);assert bad['support']>0
rows=[]
for name,d in [('rank1',[1,0,0]),('rank3',[1,2,3])]:
 x=np.pad(np.diag(d),((0,0),(0,6)));Z=a.Z(x)
 for c,i in ([(0,0),(0,1),(1,3)] if name=='rank1' else [(0,0)]):
  K=a.K[c,i];E=np.zeros_like(x);E[c,i]=1
  for p in [2,3]:
   correct=deriv(Z,K,p);naive=a.combine((p,a.apply(K,powop(Z,S,p-1))))
   res=a.combine((1,correct),(-1,naive));fd=a.combine((1,powop(a.Z(x+E),S,p)),(-1,powop(a.Z(x-E),S,p)))
   if p==3:fd=a.combine((1,fd),(-2,powop(K,S,3)))
   assert a.eq(fd,a.combine((2,correct)))
   rows.append({'fixture':name,'direction':[c,i],'power':p,'exact_finite_difference':True,'naive_residual':a.stats(res)})
   print(name,c,i,p,rows[-1]['naive_residual']['support'],flush=True)
report={'rank1_degree9_annihilator_exact_zero':True,'omit_highest_root':bad,'derivative_rows':rows,'scope':'Exact finite product-rule controls, not complete derivative contraction blocks.'};(D/'derivative_controls.json').write_text(json.dumps(report,indent=2)+'\n')
