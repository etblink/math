from pathlib import Path
import gzip,json,sys,math,re
from fractions import Fraction as F
if hasattr(sys,'set_int_max_str_digits'):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent
w=json.loads((D/'trial-104.json').read_text());r=json.loads((D/'mixed104_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed104_matrices.json.gz').read_bytes()));assert len(rows)==104 and {x['label'] for x in rows}==set(w['labels']);coeff=dict(zip(w['labels'],map(F,w['reduced_basis_coefficients'])));lam=F(w['lambda_exact']);deg=[x['power']+(3 if x['seed']!='S' else 0)+sum(2*(j+1)*v for j,v in enumerate(x['exponents'])) for x in rows];assert max(deg)==8
# U_lambda acts by x -> sqrt(lambda)x, with common normalization canceling.
# Coefficient lambda^(d/2) = lambda^floor(d/2) * sqrt(lambda)^(d mod 2).
c=[coeff[x['label']]*lam**(d//2) for x,d in zip(rows,deg)];par=[d%2 for d in deg]
def quad(k):
 a,b=F(0),F(0)
 for i in range(104):
  for j in range(104):
   t=c[i]*F(raw[k][i][j])*c[j];p=par[i]+par[j]
   if p==1:b+=t
   else:a+=t*lam**(p//2)
 return a,b
vals={k:quad(k) for k in ['mass','H','q1']};m,mb=vals['mass'];assert m>0 and mb==0
h=tuple(x/m for x in vals['H']);q=tuple(x/m for x in vals['q1']);aux=tuple(x-y for x,y in zip(q,h));ext=json.loads((D/'companion_check104.json').read_text());scale=10**100;a=math.isqrt(lam.numerator*scale**2//lam.denominator);sl,su=F(a,scale),F(a+1,scale);assert sl**2<lam<su**2
def bounds(pair):
 a,b=pair;return a+min(b*sl,b*su),a+max(b*sl,b*su)
report={}
for k,pair in [('q_H',h),('q_aux',aux),('q1',q)]:
 lo,hi=bounds(pair);match=re.fullmatch(r'\[([^ ]+) \+/- ([^\]]+)\]',ext[k]);mid,rad=map(F,match.groups());contained=mid-rad<=lo<=hi<=mid+rad;report[k]={'exact_Q_sqrt_lambda':list(map(str,pair)),'lower':str(lo),'upper':str(hi),'decimal':float((lo+hi)/2),'companion_interval':ext[k],'contained_in_companion_interval':contained,'absolute_disagreement_upper_decimal':float(max(abs(lo-mid),abs(hi-mid)))}
lo,hi=bounds(q);assert hi<F(3,8);assert F(15,4)**2>14;kappa_upper=F(66,25);f=1-kappa_upper*hi
out={'basis_count':104,'labels':[x['label'] for x in rows],'degree':deg,'lambda_exact':str(lam),'transformed_coefficient_rational_factor':list(map(str,c)),'transformed_coefficient_sqrt_lambda_power':par,'quadratic_forms':{k:list(map(str,v)) for k,v in vals.items()},'sqrt_lambda_bracket':[str(sl),str(su)],'comparisons':report,'q1_strict_target_crossed':True,'conditional_fidelity_lower_bound_rational':str(f),'conditional_fidelity_lower_bound_decimal':float(f),'scope':'finite reconstructed matrices; the conditional fidelity bound assumes source-carrier, weighted domain and auxiliary theorem identification.'}
(D/'published_witness104.json').write_text(json.dumps(out,indent=2)+'\n');print({k:{'decimal':v['decimal'],'contained':v['contained_in_companion_interval'],'error_upper':v['absolute_disagreement_upper_decimal']} for k,v in report.items()});print('fidelity conservative',float(f));assert all(v['contained_in_companion_interval'] for v in report.values()),'disagreement with archived companion interval'
