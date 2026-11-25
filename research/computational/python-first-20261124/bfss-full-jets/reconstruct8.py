"""Exact homogeneous invariant reconstruction of all five differential families.
12 fitting configurations, two independent holdouts. Validate all inherited p<=4 polynomials.
"""
from pathlib import Path
from fractions import Fraction as F
from functools import cache
import itertools as it,json,math,sympy as sp,sys
D=Path(__file__).resolve().parent
FIT=['001','011','012','111','013','112','023','113','122','114','123','133']; HOLD=['124','223']
P=int(sys.argv[2]) if len(sys.argv)>2 else 8
# Degree-limited runs can use the available high-power receipts, with explicit holdouts.
rows=[json.loads((D/f'jet_{s}_p8.json').read_text()) for s in FIT+HOLD]
old=json.loads((Path(sys.argv[1])/'jet_polynomials.json').read_text())
def exps(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def inv(d):g=[x*x for x in d];return sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)
def mon(e,v):return math.prod(x**p for x,p in zip(v,e))
counts={'fits':0,'parity_zero':0,'antisymmetry_zero':0,'nonzero':0,'holdout_scalar_values':0}
@cache
def setup(degree,diag):
 basis=[(e,j) for j in range(3 if diag else 1) if degree//2>=j for e in exps(degree//2-j)]
 def design(r):
  v=inv(r['diag']);return [[mon(e,v)*g**j for e,j in basis] for g in ([x*x for x in r['diag']] if diag else [1])]
 designrows=[v for r in rows for v in design(r)];nfit=sum(len(design(r)) for r in rows[:len(FIT)])
 X=sp.Matrix(designrows[:nfit]);piv=X.T.rref()[1];assert len(piv)==len(basis),(degree,diag,len(piv),len(basis));inverse=X[list(piv),:].inv()
 return basis,designrows,piv,inverse,nfit

def fit(name,p,q):
 parity=1 if name=='v' else 0;off={'tau':-2,'nu':0,'beta':0,'t':2,'v':3}[name];diag=name in ('nu','t');degree=p+q+off
 key={'tau':'tau_raw','nu':'nu_raw','beta':'B2_beta_raw','t':'B2_t_raw','v':'sqrt2_i_cV_raw'}[name]
 def get(r):
  data=r[key];vals=[data[a][p][q] for a in range(3)] if diag else [data[p][q]]
  if (p+q)%2!=parity or degree<0 or (name=='t' and p==q):assert not any(vals),(name,p,q,vals);return [F(0)]*len(vals)
  scale=r['N']*2**((p+q+(name=='v'))//2)*(2 if name in ('beta','t') else 1)
  return [F(x,scale) for x in vals]
 ys=[v for r in rows for v in get(r)]
 if degree<0 or (p+q)%2!=parity:
  counts['parity_zero']+=1;return []
 if name=='t' and p==q:
  counts['antisymmetry_zero']+=1;return []
 basis,X,piv,inverse,nfit=setup(degree,diag);c=list(inverse*sp.Matrix([ys[i] for i in piv]));assert all(sum(co*x for co,x in zip(c,v))==y for v,y in zip(X,ys)),(name,p,q)
 counts['fits']+=1;counts['holdout_scalar_values']+=len(ys)-nfit;counts['nonzero']+=any(c)
 return [{'exponents':list(e),'G_power':j,'coefficient':str(co)} for (e,j),co in zip(basis,c) if co]
result={name:{f'{p},{q}':fit(name,p,q) for p,q in it.product(range(P+1),repeat=2)} for name in ['tau','nu','beta','t','v']}
assert all(result[n][k]==v for n,table in old.items() for k,v in table.items())
# Extra structural t antisymmetry and tau/v symmetry.
for name in ('tau','v','t'):
 for p,q in it.product(range(P+1),repeat=2):
  r=result[name][f'{p},{q}'];w=result[name][f'{q},{p}'];assert len(r)==len(w)
  for a,b in zip(r,w):assert a['exponents']==b['exponents'] and a['G_power']==b['G_power'] and F(a['coefficient'])==(-1 if name=='t' else 1)*F(b['coefficient'])
(D/'jet_polynomials.json').write_text(json.dumps(result,indent=2)+'\n');counts.update(prior_polynomials_exact=True,fit_fixtures=FIT,holdouts=HOLD,full_rank_designs=[{'degree':d,'diagonal':di,'rank':len(setup(d,di)[0])} for d,di in sorted(setup.cache_info() and {(p+q+off,di) for p,q in it.product(range(P+1),repeat=2) for name,off,di in [('tau',-2,False),('nu',0,True),('beta',0,False),('t',2,True),('v',3,False)] if p+q+off>=0 and (p+q)%2==(name=='v') and not(name=='t' and p==q)})],t_nonzero=[k for k,v in result['t'].items() if v]);(D/'reconstruction_summary.json').write_text(json.dumps(counts,indent=2)+'\n');print(counts)
