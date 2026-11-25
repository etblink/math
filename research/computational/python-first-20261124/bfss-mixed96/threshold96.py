"""Exact test of rational sufficient and necessary threshold comparisons for the 96-row system."""
from pathlib import Path
from fractions import Fraction as F
import gzip,json,math,sys
if hasattr(sys,'set_int_max_str_digits'):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent
r=json.loads((D/'mixed96_brackets.json').read_text());raw=json.loads(gzip.decompress((D/'mixed96_matrices.json.gz').read_bytes()));M,A=([[F(x) for x in row] for row in raw[k]] for k in ['mass','q1']);b=r['S+Phi+H3'];lo,hi,q=map(F,[b['lower'],b['upper'],b['rational_rayleigh_upper']]);assert lo<q<hi
# kappa=(36+8sqrt(14))/25, sqrt(14)<15/4 so kappa<66/25.
# And sqrt(14)>374/100, so kappa>1648/625 and kappa^-1<625/1648.
assert F(15,4)**2>14>F(374,100)**2
kup=F(66,25);klow=(36+8*F(374,100))/25;upper=1/klow
report={'rational_sufficient_target':'3/8','kappa_upper':str(kup),'threshold_upper':str(upper),'bracket':[str(lo),str(hi)],'trial_q':str(q),'sufficient_target_crossed':q<F(3,8),'sharp_threshold_excluded_by_bracket':lo>upper,'scope':'finite matrix only; no physical domain or carrier claim'}
if q<F(3,8):report['conditional_fidelity_lower_bound']=str(1-kup*q)
(D/'threshold96.json').write_text(json.dumps(report,indent=2)+'\n');print({k:v for k,v in report.items() if k!='trial_q'})
