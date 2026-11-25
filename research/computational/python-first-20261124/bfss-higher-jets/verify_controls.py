"""Compare all low-degree raw contraction blocks and the p8/p4 nested fixture."""
import sys,json
from pathlib import Path
D=Path(__file__).resolve().parent;old=Path(sys.argv[1]);x=json.loads((D/'jet_123_p2.json').read_text());y=json.loads((old/'jet_123.json').read_text());keys=['tau_raw','nu_raw','B2_beta_raw','B2_t_raw','sqrt2_i_cV_raw'];assert all(x[k]==y[k] for k in keys)
r=json.loads((D/'jet_112_p8.json').read_text());q=json.loads((D/'jet_112_p4.json').read_text());n=5
for k in keys:
 cut=lambda a:[row[:n] for row in a[:n]]
 assert ([cut(a) for a in r[k]] if k in ['nu_raw','B2_t_raw'] else cut(r[k]))==q[k],k
assert r['euler_exact'] and r['transverse_checks']==3
print('all five p2 and p8/p4 contraction families match exactly')
