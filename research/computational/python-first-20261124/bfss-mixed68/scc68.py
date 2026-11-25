"""Nested, reoptimized structural counterfactuals for the finite 68-row matrices."""
import gzip,json,itertools as it
from pathlib import Path
import numpy as np
from fractions import Fraction as F
from scipy.linalg import eigh,solve
D=Path(__file__).resolve().parent
r=json.loads((D/'mixed68_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed68_matrices.json.gz').read_bytes()));M,A=[np.array([[float(F(v)) for v in row] for row in raw[k]]) for k in ['mass','q1']];d=np.sqrt(np.diag(M));M=M/np.outer(d,d);A=A/np.outer(d,d)
def eig(i):return float(eigh(A[np.ix_(i,i)],M[np.ix_(i,i)],eigvals_only=True)[0])
S=[i for i,r in enumerate(rows) if r['seed']=='S'];P=[i for i,r in enumerate(rows) if r['seed']=='Phi'];H=[i for i,r in enumerate(rows) if r['seed']=='H3'];N=P+H
out=[]
for p in range(2,9):
 s=[i for i in S if rows[i]['power']<=p];q=eig(s);qp=eig(s+P);qh=eig(s+H);qb=eig(s+N)
 out.append(dict(max_S_power=p,S_rows=len(s),S=q,S_Phi=qp,S_H3=qh,S_both=qb,both_improvement=q-qb,both_relative=(q-qb)/q,nonadditive_gain=qp+qh-q-qb))
# Quantify nonredundancy in the mass norm independently from energy effects.
# These are diagonal-scaled numerical diagnostics, not certified eigenvalue bounds.
T=M[np.ix_(N,N)]-M[np.ix_(N,S)]@solve(M[np.ix_(S,S)],M[np.ix_(S,N)],assume_a='pos');residuals={str(rows[i]['label']):float(T[j,j]) for j,i in enumerate(N)}
assert min(residuals.values())>0
report={'nested_reoptimization':out,'conditional_mass_residual_fraction_by_label':residuals,'conditional_mass_residual_fraction_range':{k:[min(residuals[str(rows[i]['label'])] for i in ix),max(residuals[str(rows[i]['label'])] for i in ix)] for k,ix in [('Phi',P),('H3',H)]},'scope':'Numerical structural diagnostics of exact rational finite matrices; no global or physical inference.'}
(D/'scc68.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
