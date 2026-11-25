"""Independent consistency checks using the archived 104 mass-contraction polynomials.
Checks each completed raw fixture, excluding inherited placeholders; then checks polynomial
identities for the reconstructed mixed kernels in the Cayley-Hamilton quotient.
Usage: python identity_audit.py CROSS_FAMILY_DIR
"""
from pathlib import Path
from fractions import Fraction as F
import itertools as it,math,json,sys
import sympy as sp
D=Path(__file__).resolve().parent
P=json.loads((Path(sys.argv[1])/'cross_polynomials.json').read_text());order=['S','Phi','H3']
cores=[('S',p) for p in range(9)]+[('Phi',0),('H3',0),('Phi',1),('H3',1)];deg=list(range(9))+[3,3,4,4]
s,u,v,g=sp.symbols('s u v g');CH=g**3-s*g**2+u*g-v

def mp(p,q):
 a,b=cores[p],cores[q];key=','.join(sorted([a[0],b[0]],key=order.index));k=a[1]+b[1]
 return P[key][str(k)]
def expr(P):return sum(sp.Rational(x['coefficient'])*s**x['exponents'][0]*u**x['exponents'][1]*v**x['exponents'][2]*g**x.get('G_power',0) for x in P)
def rem(a):return sp.Poly(sp.rem(sp.expand(a),CH,g),s,u,v,g).as_expr()
def tr(a):
 a=sp.Poly(rem(a),g);return sp.expand(3*a.nth(0)+s*a.nth(1)+(s*s-2*u)*a.nth(2))
def inv(x):return [sum(x),sum(a*b for a,b in it.combinations(x,2)),math.prod(x)]
count=0;files=[];maxnew=11
for path in sorted(D.glob('jet_[0-9][0-9][0-9].json')):
 r=json.loads(path.read_text());x=[a*a for a in r['diag']];e=inv(x);n=0
 for p,q in it.product(range(13),repeat=2):
  if max(p,q)<maxnew:continue
  poly=mp(p,q);G=sum(F(a['coefficient'])*math.prod(t**k for t,k in zip(e,a['exponents'])) for a in poly)
  nu=[F(r['nu'][b][p][q]) for b in range(3)];nr=[F(r['nu'][b][q][p]) for b in range(3)];t=[F(r['t'][b][p][q]) for b in range(3)]
  assert sum(nu)==deg[q]*G,(path,p,q,'Euler')
  assert sum(t)==0,(path,p,q,'trace t')
  for b in range(3):
   derivative=F(0)
   for a in poly:
    powers=a['exponents'];c=F(a['coefficient']);dr=[1,e[0]-x[b],e[1]-e[0]*x[b]+x[b]**2]
    for i,k in enumerate(powers):
     if k:derivative+=2*x[b]*c*k*dr[i]*math.prod(y**(n-(j==i)) for j,(y,n) in enumerate(zip(e,powers)))
   assert nu[b]+nr[b]==derivative,(path,p,q,b,'mass derivative')
  n+=5
 count+=n;files.append({'fixture':r['diag'],'scalar_equalities':n})
print('raw',count,len(files),flush=True)
report={'raw_fixture_checks':files,'raw_exact_scalar_equalities':count}
if (D/'jet_polynomials.json').exists():
 J=json.loads((D/'jet_polynomials.json').read_text());n=0
 for p,q in it.product(range(13),repeat=2):
  if max(p,q)<maxnew:continue
  G=expr(mp(p,q));nu=expr(J['nu'][f'{p},{q}']);nr=expr(J['nu'][f'{q},{p}']);t=expr(J['t'][f'{p},{q}'])
  assert tr(nu)==sp.expand(deg[q]*G),(p,q,'Euler')
  assert tr(t)==0,(p,q,'trace t')
  rhs=2*g*(sp.diff(G,s)+(s-g)*sp.diff(G,u)+(u-s*g+g*g)*sp.diff(G,v))
  assert rem(nu+nr-rhs)==0,(p,q,'mass derivative');n+=3
 report['exact_polynomial_identities']=n
 print('polynomial',n,flush=True)
(D/'identity_audit.json').write_text(json.dumps(report,indent=2)+'\n')
