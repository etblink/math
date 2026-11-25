"""Exact eighth-degree stencil control for fourth and fifth Yukawa descendants."""
from mixed104 import *

def evaluate(x):
 z=a.Z(x);V=[phi(x),h3(x)]
 for p in range(5):V += [act(z,V[-2]),act(z,V[-1])]
 return V[8:]

results=[]
for diag,b,k in [((0,0,1),0,0),((0,1,1),0,1)][:1 if "--rank-one-only" in sys.argv else 2]:
 x=np.pad(np.diag(diag),((0,0),(0,6)));e=np.zeros_like(x);e[b,k]=1;K=a.K[b,k];z=a.Z(x)
 V=[phi(x),h3(x)];D0=[dphi(x,e),dh(x,e)];D=D0[:]
 for p in range(5):
  j=2*p;V += [act(z,V[j]),act(z,V[j+1])];D += [lin((1,act(K,V[t])),(1,act(z,D[t]))) for t in (j,j+1)]
 accum=[prim(zero) for _ in range(4)]
 for i,c in [(-4,3),(-3,-32),(-2,168),(-1,-672),(1,672),(2,-168),(3,32),(4,-3)]:
  accum=[lin((1,u),(c,v)) for u,v in zip(accum,evaluate(x+i*e))]
 for j,name in enumerate(['Y4_Phi','Y4_H3','Y5_Phi','Y5_H3']):
  fd=scale(F(1,840),accum[j])
  assert eqr(fd,D[j+8]),(diag,b,k,name)
  wrong=lin((1,fd),(-1,act(z,D[j+6])))
  results.append({'diag':diag,'direction':[b,k],'core':name,'exact_difference_agreement':True,'derivative_support':len(D[j+8][0][0]),'omit_K_times_previous_residual_support':len(wrong[0][0])})
  print(results[-1],flush=True)
assert any(r['omit_K_times_previous_residual_support'] for r in results)
(Path(__file__).resolve().parent/'finite_difference_controls.json').write_text(json.dumps(results,indent=2)+'\n')
