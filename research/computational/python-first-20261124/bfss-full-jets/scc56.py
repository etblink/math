"""Counterfactual row deletion in the finite 56-row S-sector, using principal submatrices.
Numerical subspace estimates only; certified full-sector bracket is separate.
"""
import json,gzip
from pathlib import Path
from fractions import Fraction as F
import numpy as np
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
report=json.loads((D/'integrated.json').read_text());rows=report['rows'];data=json.loads(gzip.decompress((D/'matrices.json.gz').read_bytes()));M,A=(np.array([[float(F(x)) for x in r] for r in data[k]]) for k in ['mass','q1']);N=len(rows)
def eig(test):
 ids=[i for i,r in enumerate(rows) if test(r)];m=M[np.ix_(ids,ids)];a=A[np.ix_(ids,ids)];d=np.sqrt(np.diag(m));v=eigh(a/np.outer(d,d),m/np.outer(d,d),eigvals_only=True);return {'n':len(ids),'min':float(v[0])}
full=eig(lambda r:True);out={'full':full,'omit_single_power':{str(p):eig(lambda r:r['power']!=p) for p in range(9)},'keep_one_width':{str(w):eig(lambda r:r['width']==w) for w in range(2)},'no_invariant_multipliers':eig(lambda r:not any(r['exponents'])),'only_higher_power':eig(lambda r:r['power']>=5),'scope':'Numerical variational minima of actual row-deletion principal subspaces; not full physical-space lower bounds or causal identification.'}
assert all(x['min']>=full['min']-1e-7 for group in ['omit_single_power','keep_one_width'] for x in out[group].values());(D/'scc56.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2),flush=True)
