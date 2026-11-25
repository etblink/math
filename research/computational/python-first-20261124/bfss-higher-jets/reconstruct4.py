"""Exact interpolation through Y^4 with seven fit fixtures and independent holdout."""
from pathlib import Path
from fractions import Fraction as F
import itertools as it,json,math,sympy as sp,sys
D=Path(__file__).resolve().parent
rows=[json.loads((D/f'jet_{s}_p4.json').read_text()) for s in ['100','110','120','111','112','122','123','124']]
old=json.loads((Path(sys.argv[1])/'jet_polynomials.json').read_text())
def exps(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def inv(d):g=[x*x for x in d];return sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)
def mon(e,v):return math.prod(x**p for x,p in zip(v,e))
counts={'fits':0,'parity_zero':0,'nonzero':0,'holdout_scalar_values':0}
def fit(name,p,q):
 parity=1 if name=='v' else 0;off={'tau':-2,'nu':0,'beta':0,'t':2,'v':3}[name];diag=name in ('nu','t');degree=p+q+off
 key={'tau':'tau_raw','nu':'nu_raw','beta':'B2_beta_raw','t':'B2_t_raw','v':'sqrt2_i_cV_raw'}[name]
 def get(r):
  data=r[key];vals=[data[a][p][q] for a in range(3)] if diag else [data[p][q]]
  if (p+q)%2!=parity or degree<0:assert not any(vals);return [F(0)]*len(vals)
  scale=r['N']*2**((p+q+(name=='v'))//2)*(2 if name in ('beta','t') else 1)
  return [F(x,scale) for x in vals]
 if degree<0 or (p+q)%2!=parity:
  for r in rows:get(r)
  counts['parity_zero']+=1;return []
 basis=[(e,j) for j in range(3 if diag else 1) if degree//2>=j for e in exps(degree//2-j)]
 def design(r):
  v=inv(r['diag']);return [[mon(e,v)*g**j for e,j in basis] for g in ([x*x for x in r['diag']] if diag else [1])]
 X=sp.Matrix([v for r in rows[:-1] for v in design(r)]);y=sp.Matrix([x for r in rows[:-1] for x in get(r)])
 assert X.rank()==len(basis),(name,p,q,X.rank(),len(basis))
 c=list(X.gauss_jordan_solve(y)[0]);assert all(sum(co*x for co,x in zip(c,v))==y for r in rows for v,y in zip(design(r),get(r))),(name,p,q)
 counts['fits']+=1;counts['holdout_scalar_values']+=len(get(rows[-1]));counts['nonzero']+=any(c)
 return [{'exponents':list(e),'G_power':j,'coefficient':str(co)} for (e,j),co in zip(basis,c) if co]
result={name:{f'{p},{q}':fit(name,p,q) for p,q in it.product(range(5),repeat=2)} for name in ['tau','nu','beta','t','v']}
assert all(result[n][k]==v for n,table in old.items() for k,v in table.items())
(D/'jet_polynomials.json').write_text(json.dumps(result,indent=2)+'\n');counts['prior_polynomials_exact']=True;counts['t_nonzero']=[k for k,v in result['t'].items() if v];(D/'reconstruction_summary.json').write_text(json.dumps(counts,indent=2)+'\n');print(counts)
