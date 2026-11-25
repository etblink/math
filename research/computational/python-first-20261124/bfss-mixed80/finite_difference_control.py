"""Exact fourth-degree finite difference control for the new descendants.
Same argument layout as mixed80.py (first five arguments). The stencil is exact for degree <=4.
"""
from mixed80 import *

def evaluate(x):
 z=a.Z(x);return [act(z,phi(x)),act(z,h3(x))]
results=[]
for diag,b,k in [((0,0,1),0,0),((1,2,3),0,1)]:
 x=np.pad(np.diag(diag),((0,0),(0,6)));e=np.zeros_like(x);e[b,k]=1;K=a.K[b,k];z=a.Z(x)
 P,H=phi(x),h3(x);Dp,Dh=dphi(x,e),dh(x,e)
 actual=[lin((1,act(K,v)),(1,act(z,d))) for v,d in [(P,Dp),(H,Dh)]]
 samples={i:evaluate(x+i*e) for i in [-2,-1,1,2]}
 for j,name in enumerate(['Y_Phi','Y_H3']):
  fd=scale(F(1,12),lin((1,samples[-2][j]),(-8,samples[-1][j]),(8,samples[1][j]),(-1,samples[2][j])))
  assert eqr(fd,actual[j]),(diag,b,k,name)
  wrong=lin((1,fd),(-1,act(z,[Dp,Dh][j])))
  results.append({'diag':diag,'direction':[b,k],'core':name,'exact_difference_agreement':True,'derivative_support':len(actual[j][0][0]),'omit_K_times_base_residual_support':len(wrong[0][0])})
  print(results[-1],flush=True)
assert any(r['omit_K_times_base_residual_support'] for r in results)
(D/'finite_difference_control.json').write_text(json.dumps(results,indent=2)+'\n')
