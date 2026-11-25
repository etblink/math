"""Nested reoptimized counterfactuals and mass projection diagnostics for mixed 80 rows."""
from pathlib import Path
import gzip,json,itertools as it
import numpy as np
from scipy.linalg import eigh,solve
from fractions import Fraction as F
D=Path(__file__).resolve().parent
r=json.loads((D/'mixed80_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed80_matrices.json.gz').read_bytes()));M,A=[np.array([[float(F(v)) for v in row] for row in raw[k]]) for k in ['mass','q1']];d=np.sqrt(np.diag(M));M=M/np.outer(d,d);A=A/np.outer(d,d)
def eig(ix):return float(eigh(A[np.ix_(ix,ix)],M[np.ix_(ix,ix)],eigvals_only=True)[0])
S=[i for i,r in enumerate(rows) if r['seed']=='S'];P0=[i for i,r in enumerate(rows) if r['seed']=='Phi' and r['power']==0];H0=[i for i,r in enumerate(rows) if r['seed']=='H3' and r['power']==0];P1=[i for i,r in enumerate(rows) if r['seed']=='Phi' and r['power']==1];H1=[i for i,r in enumerate(rows) if r['seed']=='H3' and r['power']==1];O=S+P0+H0;N=P1+H1
sets={'S':S,'S+Phi0':S+P0,'S+H3_0':S+H0,'S+both0':O,'S+Phi0+Phi1':S+P0+P1,'S+H3_0+H3_1':S+H0+H1,'68+Phi1':O+P1,'68+H3_1':O+H1,'80':O+N,'S+Phi1+H3_1_without_base':S+N}
result={k:{'rows':len(ix),'minimum':eig(ix)} for k,ix in sets.items()}
# New directions: residual mass fraction and exact-form-derived numerical energy effects.
T=M[np.ix_(N,N)]-M[np.ix_(N,O)]@solve(M[np.ix_(O,O)],M[np.ix_(O,N)],assume_a='pos');assert np.min(np.diag(T))>0
res={str(rows[i]['label']):float(T[j,j]) for j,i in enumerate(N)}
q0=result['S+both0']['minimum'];qP=result['68+Phi1']['minimum'];qH=result['68+H3_1']['minimum'];qB=result['80']['minimum'];
# Exact rational witness coefficient truncations use actual trial metadata.
BD=D.parent/'bfss-cross-gram22';BD=BD if BD.exists() else BD.with_name('bfss-cross-gram22-20261124');w=json.loads((BD/'trial-104.json').read_text());coeff=dict(zip(w['labels'],map(F,w['reduced_basis_coefficients'])));MR,AR=([[F(x) for x in row] for row in raw[k]] for k in ['mass','q1'])
for k,ix in sets.items():
 c=[coeff[rows[i]['label']] for i in ix];quad=lambda B:sum(c[m]*B[i][j]*c[n] for m,i in enumerate(ix) for n,j in enumerate(ix));q=quad(AR)/quad(MR);result[k]['frozen_published_coefficients_rayleigh_exact']=str(q);result[k]['frozen_published_coefficients_rayleigh_decimal']=float(q)
report={'reoptimized_subspaces':result,'conditional_mass_residual_fraction_by_label':res,'conditional_mass_residual_fraction_range':{k:[min(res[str(rows[i]['label'])] for i in ix),max(res[str(rows[i]['label'])] for i in ix)] for k,ix in [('Y_Phi',P1),('Y_H3',H1)]},'marginal_first_descendant_gain':{'Phi':q0-qP,'H3':q0-qH,'joint':q0-qB,'nonadditive':qP+qH-q0-qB},'scope':'Numerical reoptimization diagnostics of exact rational finite matrices; no full single-family 80 or 104 physical claim.'}
(D/'scc80.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
