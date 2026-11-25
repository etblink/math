"""Reoptimized counterfactuals and residual mass fractions for the 96-row mixed system."""
from pathlib import Path
import gzip,json,itertools as it
import numpy as np
from scipy.linalg import eigh,solve
from fractions import Fraction as F
import sys
if hasattr(sys,"set_int_max_str_digits"):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent
r=json.loads((D/'mixed104_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed104_matrices.json.gz').read_bytes()));M,A=[np.array([[float(F(v)) for v in row] for row in raw[k]]) for k in ['mass','q1']];d=np.sqrt(np.diag(M));M=M/np.outer(d,d);A=A/np.outer(d,d)
def eig(ix):return float(eigh(A[np.ix_(ix,ix)],M[np.ix_(ix,ix)],eigvals_only=True)[0])
S=[i for i,r in enumerate(rows) if r['seed']=='S'];O=[i for i,r in enumerate(rows) if r['seed']=='S' or r['power']<=3];N=[i for i,r in enumerate(rows) if i not in O];P4=[i for i in N if rows[i]['seed']=='Phi' and rows[i]['power']==4];H4=[i for i in N if rows[i]['seed']=='H3' and rows[i]['power']==4];P5=[i for i in N if rows[i]['seed']=='Phi' and rows[i]['power']==5];H5=[i for i in N if rows[i]['seed']=='H3' and rows[i]['power']==5];sets={'S':S,'96':O,'96+Phi4':O+P4,'96+H3_4':O+H4,'100':O+P4+H4,'100+Phi5':O+P4+H4+P5,'100+H3_5':O+P4+H4+H5,'104':O+N,'96+Phi4+Phi5':O+P4+P5,'96+H3_4+H3_5':O+H4+H5,'S+Phi':[i for i,r in enumerate(rows) if r['seed']!='H3'],'S+H3':[i for i,r in enumerate(rows) if r['seed']!='Phi']}
result={k:{'rows':len(ix),'minimum':eig(ix)} for k,ix in sets.items()}
T=M[np.ix_(N,N)]-M[np.ix_(N,O)]@solve(M[np.ix_(O,O)],M[np.ix_(O,N)],assume_a='pos');assert np.min(np.diag(T))>0
res={str(rows[i]['label']):float(T[j,j]) for j,i in enumerate(N)}
BD=D.parent/'bfss-cross-gram22';BD=BD if BD.exists() else BD.with_name('bfss-cross-gram22-20261124');w=json.loads((BD/'trial-104.json').read_text());coeff=dict(zip(w['labels'],map(F,w['reduced_basis_coefficients'])));MR,AR=([[F(x) for x in row] for row in raw[k]] for k in ['mass','q1'])
for k,ix in sets.items():
 c=[coeff[rows[i]['label']] for i in ix];quad=lambda B:sum(c[m]*B[i][j]*c[n] for m,i in enumerate(ix) for n,j in enumerate(ix));q=quad(AR)/quad(MR);result[k]['frozen_published_coefficients_rayleigh_exact']=str(q);result[k]['frozen_published_coefficients_rayleigh_decimal']=float(q)
report={'reoptimized_subspaces':result,'conditional_mass_residual_fraction_by_label':res,'conditional_mass_residual_fraction_range':{k:[min(res[str(rows[i]['label'])] for i in ix),max(res[str(rows[i]['label'])] for i in ix)] for k,ix in [('Y4_Phi',P4),('Y4_H3',H4),('Y5_Phi',P5),('Y5_H3',H5)]},'scope':'Numerical diagnostics of exact rational 104-row finite system; not native physical qualification.'}
(D/'scc104.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:{'rows':v['rows'],'minimum':v['minimum']} for k,v in result.items()},indent=2))
