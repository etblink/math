"""Exact invariant reconstruction for cross-family mass and Y moments."""
from pathlib import Path
from fractions import Fraction as F
import itertools as it,json,math,sympy as sp,sys
D=Path(__file__).resolve().parent
FIT=['001','011','012','111','013','112','023','113','122','114','123','133']; HOLD=['124','223']
rows=[json.loads((D/f'mom_{s}.json').read_text()) for s in FIT+HOLD]
old=json.loads((Path(sys.argv[1])/'moment_polynomials.json').read_text())['moment_polynomials_Y'];deg={'S':0,'Phi':3,'H3':3}
def exps(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def inv(d):g=[x*x for x in d];return sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)
def mon(e,v):return math.prod(x**p for x,p in zip(v,e))
from functools import cache
@cache
def setup(k):
 basis=exps(k);X=sp.Matrix([[mon(e,inv(r['diag'])) for e in basis] for r in rows]);piv=list(X[:len(FIT),:].T.rref()[1]);assert len(piv)==len(basis),(k,piv,basis);return basis,X,piv,X[piv,:].inv()
polys={};fits=zeros=hold=0
for name in rows[0]['moments']:
 l,r=name.split(',');polys[name]={}
 for key in rows[0]['moments'][name]:
  d=deg[l]+deg[r]+int(key);ys=[F(r['moments'][name][key]) for r in rows]
  if d%2:assert not any(ys);zeros+=1;polys[name][key]=[];continue
  basis,X,piv,invX=setup(d//2);c=list(invX*sp.Matrix([ys[i] for i in piv]));assert X*sp.Matrix(c)==sp.Matrix(ys),(name,key);fits+=1;hold+=len(HOLD)
  polys[name][key]=[{'exponents':list(e),'coefficient':str(v)} for e,v in zip(basis,c) if v]
for key,p in old.items():
 expected=[{'exponents':e,'coefficient':str(F(c))} for e,c in zip(p['exponents'],p['coefficients']) if F(c)];assert polys['S,S'][key]==expected,(key,polys['S,S'][key],expected)
summary={'fit_fixtures':FIT,'holdouts':HOLD,'full_rank_fits':fits,'parity_zeros':zeros,'heldout_values':hold,'Hermitian_split_checks':sum(r['Hermitian_split_checks'] for r in rows),'odd_degree_zero_checks':sum(r['odd_degree_zero_checks'] for r in rows),'prior_S_moments_exact':True,'nonzero_polynomials':{n:sum(bool(x) for x in p.values()) for n,p in polys.items()},'scope':'Exact rational interpolation conditional on finite covariance and parity.'}
(D/'cross_polynomials.json').write_text(json.dumps(polys,indent=2)+'\n');(D/'reconstruction.json').write_text(json.dumps(summary,indent=2)+'\n');print(summary)
