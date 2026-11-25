from pathlib import Path
import gzip,json,sys
from fractions import Fraction as F
if hasattr(sys,'set_int_max_str_digits'):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent
w=json.loads((D/'trial-104.json').read_text());r=json.loads((D/'mixed104_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed104_matrices.json.gz').read_bytes()));assert len(rows)==104 and {x['label'] for x in rows}==set(w['labels']);coeff=dict(zip(w['labels'],map(F,w['reduced_basis_coefficients'])));c=[coeff[x['label']] for x in rows]
vals={}
for k in ['mass','H','q1']:
 vals[k]=sum(c[i]*F(raw[k][i][j])*c[j] for i in range(104) for j in range(104))
assert vals['mass']>0
q=vals['q1']/vals['mass'];kappa_upper=F(66,25);assert F(15,4)**2>14
out={'basis_count':104,'labels':[x['label'] for x in rows],'published_reduced_coefficients_exact':list(map(str,c)),'quadratic_forms':{k:str(v) for k,v in vals.items()},'q1_exact':str(q),'q1_decimal':float(q),'H_exact':str(vals['H']/vals['mass']),'H_decimal':float(vals['H']/vals['mass']),'target':'3/8','strict_target_crossed':q<F(3,8),'conditional_fidelity_lower_bound_rational':str(1-kappa_upper*q),'conditional_fidelity_lower_bound_decimal':float(1-kappa_upper*q),'scope':'finite reconstructed matrices; the conditional fidelity bound assumes the physical carrier, weighted domain and auxiliary theorem transport.'}
(D/'published_witness104.json').write_text(json.dumps(out,indent=2)+'\n');print({k:v for k,v in out.items() if k not in ('labels','published_reduced_coefficients_exact','quadratic_forms','q1_exact','H_exact','conditional_fidelity_lower_bound_rational')})
