from pathlib import Path
import json,math,itertools as it,sympy as sp
D=Path(__file__).resolve().parent;design=json.loads((D/'design.json').read_text());fit=design['suggested_final_fit'];hold=design['holdouts'];degrees=list(range(9))+[p+3 for p in range(6) for f in ('Phi','H3')]
def rank(d,diag):
 k=d//2;basis=[((k-j-2*b-3*c,b,c),j) for j in range(3 if diag else 1) if k>=j for c in range((k-j)//3+1) for b in range((k-j-3*c)//2+1)];X=[]
 for st in fit:
  g=[int(x)**2 for x in st];v=[sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)];X.extend([[math.prod(x**p for x,p in zip(v,e))*gg**j for e,j in basis] for gg in (g if diag else [1])]);
 return sp.Matrix(X).rank(),len(basis)
r=[]
for d,di in sorted({(degrees[p]+degrees[q]+off,diag) for p,q in it.product(range(21),repeat=2) if max(p,q)>=17 for off,diag in [(-2,False),(0,True),(0,False),(2,True),(3,False)] if (degrees[p]+degrees[q]+off)%2==0}):
 a,b=rank(d,di);assert a==b,(d,di,a,b);r.append({'degree':d,'tensor':di,'rank':a,'columns':b})
assert not set(fit)&set(hold)
(D/'design_rank.json').write_text(json.dumps({'fit':fit,'holdouts':hold,'ranks':r},indent=2)+'\n');print('design checks',len(r),'max columns',max(x['columns'] for x in r))
