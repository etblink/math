from pathlib import Path
from fractions import Fraction as F
import json,re,sys
if hasattr(sys,'set_int_max_str_digits'):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent;w=json.loads((D/'published_witness104.json').read_text());ext=json.loads((D/'companion_check104.json').read_text());h=F(w['H_exact']);q=F(w['q1_exact']);out={}
for key,val in [('q_H',h),('q_aux',q-h),('q1',q)]:
 m=re.fullmatch(r'\[([^ ]+) \+/- ([^\]]+)\]',ext[key]);assert m,key;c,r=map(F,m.groups());diff=abs(val-c);out[key]={'companion_interval':ext[key],'absolute_disagreement_exact':str(diff),'absolute_disagreement_decimal':float(diff),'contained_in_interval':diff<=r,'ratio_to_radius':float(diff/r)}
(D/'companion_comparison.json').write_text(json.dumps(out,indent=2)+'\n');print({k:{'contained':v['contained_in_interval'],'error':v['absolute_disagreement_decimal']} for k,v in out.items()});assert all(v['contained_in_interval'] for v in out.values()),'disagreement with archived companion interval'
