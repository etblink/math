"""Reconstruct mixed low-degree derivative kernels with full-rank generic slice design."""
from pathlib import Path
from fractions import Fraction as F
import itertools as it,json,math,sympy as sp,sys
from functools import cache
D=Path(__file__).resolve().parent;FIT=['001','011','012','111','013','112','113','122','123','124'];HOLD=[s for s in ['023','114'] if (D/f'jet_{s}.json').exists()];rows=[json.loads((D/f'jet_{s}.json').read_text()) for s in FIT+HOLD];deg=rows[0]['degrees'];cores=rows[0]['cores'];old=json.loads((Path(sys.argv[1])/'jet_polynomials.json').read_text());base=json.loads((Path(sys.argv[2])/'jet_polynomials.json').read_text())
def exps(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def inv(d):g=[x*x for x in d];return sum(g),sum(a*b for a,b in it.combinations(g,2)),math.prod(g)
def mon(e,v):return math.prod(x**p for x,p in zip(v,e))
@cache
def setup(d,diag):
 basis=[(e,j) for j in range(3 if diag else 1) if d//2>=j for e in exps(d//2-j)];X=sp.Matrix([[mon(e,inv(r['diag']))*g**j for e,j in basis] for r in rows for g in ([x*x for x in r['diag']] if diag else [1])]);nfit=len(FIT)*(3 if diag else 1);piv=list(X[:nfit,:].T.rref()[1]);assert len(piv)==len(basis),(d,diag);return basis,X,piv,X[piv,:].inv(),nfit
fits=zeros=hold=0;out={}
for n in ['tau','nu','beta','t','v']:
 out[n]={};diag=n in ('nu','t');off={'tau':-2,'nu':0,'beta':0,'t':2,'v':3}[n]
 for p,q in it.product(range(len(cores)),repeat=2):
  key=f'{p},{q}'
  if max(p,q)<11:out[n][key]=base[n][key];continue
  d=deg[p]+deg[q]+off;ys=[F(v) for r in rows for v in ([r[n][i][p][q] for i in range(3)] if diag else [r[n][p][q]])]
  if d<0 or d%2 or (n=='t' and p==q):assert not any(ys),(n,p,q,ys);out[n][key]=[];zeros+=1;continue
  basis,X,piv,invX,nfit=setup(d,diag);c=list(invX*sp.Matrix([ys[i] for i in piv]));assert X*sp.Matrix(c)==sp.Matrix(ys),(n,p,q);fits+=1;hold+=len(ys)-nfit
  out[n][key]=[{'exponents':list(e),'G_power':j,'coefficient':str(v)} for (e,j),v in zip(basis,c) if v]
for n in out:
 for p,q in it.product(range(11),repeat=2):assert out[n][f'{p},{q}']==base[n][f'{p},{q}'],(n,p,q)
for n in ['tau','v','t']:
 for p,q in it.product(range(len(cores)),repeat=2):
  assert [{**x,'coefficient':str(F(x['coefficient'])*(-1 if n=='t' else 1))} for x in out[n][f'{p},{q}']]==out[n][f'{q},{p}']
(D/'jet_polynomials.json').write_text(json.dumps(out,indent=2)+'\n');report={'fit_fixtures':FIT,'holdouts':HOLD,'full_rank_fits':fits,'exact_heldout_values':hold,'zero_checks':zeros,'old_all_605_base_polynomials_exact':True,'direct_rotation_checks':sum(r['rotation_direct_checks'] for r in rows),'scope':'Exact mixed covariants through first Yukawa descendants and full S sector; prior 68 kernels inherited.'};(D/'base_jet_reconstruction.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
