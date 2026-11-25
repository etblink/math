"""Exact rank checks for degree-16 and degree-18 invariant designs."""
import sympy as sp, itertools as it, math,json
from pathlib import Path
F=['001','011','012','111','013','112','023','113','122','114','123','133']; H=['124','223']
def exps(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def rank(sts,d,diag):
 basis=[(e,j) for j in range(3 if diag else 1) if d//2>=j for e in exps(d//2-j)];X=[]
 for st in sts:
  g=[int(x)**2 for x in st]; inv=[sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)];X += [[math.prod(x**p for x,p in zip(inv,e))*gg**j for e,j in basis] for gg in (g if diag else [1])]
 return sp.Matrix(X).rank(),len(basis)
D=Path(__file__).resolve().parent;degrees=list(range(9))+[p+3 for p in range(4) for f in ('Phi','H3')];ranks=[]
for d,diag in sorted({(degrees[p]+degrees[q]+off,di) for p,q in it.product(range(17),repeat=2) if max(p,q)>=13 for off,di in [(-2,False),(0,True),(0,False),(2,True),(3,False)] if (degrees[p]+degrees[q]+off)%2==0}):
 r,n=rank(F,d,diag);assert r==n;ranks.append(dict(degree=d,diagonal=diag,rank=r,needed=n))
assert json.loads((D/'design_rank.json').read_text())=={'fit':F,'designs':ranks}
out={str((d,di)):{'fit_rank':list(rank(F,d,di)),'all_rank':list(rank(F+H,d,di))} for d,di in [(16,False),(18,False),(16,True),(18,True)]}
G=F.copy()
for st in ['014','024','134','125','234','135','144','233','224']:
 if all(rank(G,d,di)[0]==rank(G,d,di)[1] for d,di in [(18,False),(18,True)]):break
 if any(rank(G+[st],d,di)[0]>rank(G,d,di)[0] for d,di in [(18,False),(18,True)]):G.append(st)
out['suggested_final_fit']=G;out['holdouts']=H
assert out==json.loads((D/'future104_design.json').read_text());print('exact rank design checks passed')
