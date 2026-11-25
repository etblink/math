"""Independent comparisons with saved reference vectors, extra derivative holdouts, and projector identities."""
import json,math,itertools as it
from fractions import Fraction as F
from pathlib import Path
D=Path(__file__).resolve().parent;P=json.loads((D/'cross_polynomials.json').read_text());J=json.loads((D/'base_jet_polynomials.json').read_text());N=8072064
assert not P['S,H3']['1'] and not P['Phi,H3']['0'];assert P['S,H3']['3']==P['H3,H3']['0']
# Reference norm comparisons from independent direct tensor and Casimir calculations.
refs=[]
for fixture,s in [('rank1','001'),('rank3','123')]:
 ref=json.loads((D.parent/'bfss-tensor-20261124'/f'{fixture}.json').read_text());r=json.loads((D/f'mom_{s}.json').read_text());v=F(int(ref['2sqrt2_H3_numerator']['integer_norm2']),N*8*int(ref['denominator'])**2);assert v==F(r['moments']['H3,H3']['0']);assert ref['2sqrt2_H3_numerator']['support']==r['base_support']['H3'];refs.append({'fixture':fixture,'H3_norm2':str(v),'support':r['base_support']['H3']})
ref=json.loads((D.parent/'bfss-covariants-20261124'/'rank1.json').read_text());v=F(int(ref['sqrt2_phi']['integer_norm2']),2*N);assert v==F(json.loads((D/'mom_001.json').read_text())['moments']['Phi,Phi']['0']);refs.append({'fixture':'rank1','Phi_norm2':str(v)})
checks=0
for s in ['012','013','111']:
 r=json.loads((D/f'basejet_{s}.json').read_text());g=[x*x for x in r['diag']];sv=sum(g);u=sum(x*y for x,y in it.combinations(g,2));v=math.prod(g)
 for n in J:
  for key,pol in J[n].items():
   p,q=map(int,key.split(','));diag=n in ('nu','t')
   for i in range(3 if diag else 1):
    calc=sum(F(c['coefficient'])*math.prod(x**e for x,e in zip([sv,u,v],c['exponents']))*(g[i]**c['G_power'] if diag else 1) for c in pol);raw=F(r[n][i][p][q] if diag else r[n][p][q]);assert calc==raw,(s,n,key,i);checks+=1
report={'reference_norms':refs,'H3_projector_mass_identity':True,'YS_H3_orthogonal':True,'Phi_H3_base_orthogonal':True,'additional_jet_holdouts':['012','013','111'],'additional_scalar_checks':checks};(D/'additional_controls.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
