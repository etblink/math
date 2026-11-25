"""Exact sixth-degree stencil control for second and third Yukawa descendants."""
from mixed96 import *

def evaluate(x):
 z=a.Z(x);V=[phi(x),h3(x)]
 for p in range(3):V += [act(z,V[-2]),act(z,V[-1])]
 return V[4:]

results=[]
for diag,b,k in [((0,0,1),0,0),((0,1,1),0,1)]:
 x=np.pad(np.diag(diag),((0,0),(0,6)));e=np.zeros_like(x);e[b,k]=1;K=a.K[b,k];z=a.Z(x)
 V=[phi(x),h3(x)];D0=[dphi(x,e),dh(x,e)];D=D0[:]
 for p in range(3):
  j=2*p;V += [act(z,V[j]),act(z,V[j+1])];D += [lin((1,act(K,V[t])),(1,act(z,D[t]))) for t in (j,j+1)]
 samples={i:evaluate(x+i*e) for i in [-3,-2,-1,1,2,3]}
 for j,name in enumerate(['Y2_Phi','Y2_H3','Y3_Phi','Y3_H3']):
  fd=scale(F(1,60),lin(*[(c,samples[i][j]) for i,c in [(-3,-1),(-2,9),(-1,-45),(1,45),(2,-9),(3,1)]]))
  assert eqr(fd,D[j+4]),(diag,b,k,name)
  wrong=lin((1,fd),(-1,act(z,D[j+2])))
  results.append({'diag':diag,'direction':[b,k],'core':name,'exact_difference_agreement':True,'derivative_support':len(D[j+4][0][0]),'omit_K_times_previous_residual_support':len(wrong[0][0])})
  print(results[-1],flush=True)
assert any(r['omit_K_times_previous_residual_support'] for r in results)
(Path(__file__).resolve().parent/'finite_difference_controls.json').write_text(json.dumps(results,indent=2)+'\n')
