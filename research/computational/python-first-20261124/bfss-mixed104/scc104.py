"""Reoptimized counterfactuals and residual mass fractions for the 96-row mixed system."""
from pathlib import Path
import gzip,json,itertools as it
import numpy as np
from scipy.linalg import eigh,solve
from fractions import Fraction as F
import sys,math
if hasattr(sys,"set_int_max_str_digits"):sys.set_int_max_str_digits(0)
D=Path(__file__).resolve().parent
r=json.loads((D/'mixed104_results.json').read_text());rows=r['rows'];raw=json.loads(gzip.decompress((D/'mixed104_matrices.json.gz').read_bytes()));M,A=[np.array([[float(F(v)) for v in row] for row in raw[k]]) for k in ['mass','q1']];d=np.sqrt(np.diag(M));M=M/np.outer(d,d);A=A/np.outer(d,d)
def eig(ix):return float(eigh(A[np.ix_(ix,ix)],M[np.ix_(ix,ix)],eigvals_only=True)[0])
S=[i for i,r in enumerate(rows) if r['seed']=='S'];O=[i for i,r in enumerate(rows) if r['seed']=='S' or r['power']<=3];N=[i for i,r in enumerate(rows) if i not in O];P4=[i for i in N if rows[i]['seed']=='Phi' and rows[i]['power']==4];H4=[i for i in N if rows[i]['seed']=='H3' and rows[i]['power']==4];P5=[i for i in N if rows[i]['seed']=='Phi' and rows[i]['power']==5];H5=[i for i in N if rows[i]['seed']=='H3' and rows[i]['power']==5];sets={'S':S,'96':O,'96+Phi4':O+P4,'96+H3_4':O+H4,'100':O+P4+H4,'100+Phi5':O+P4+H4+P5,'100+H3_5':O+P4+H4+H5,'104':O+N,'96+Phi4+Phi5':O+P4+P5,'96+H3_4+H3_5':O+H4+H5,'S+Phi':[i for i,r in enumerate(rows) if r['seed']!='H3'],'S+H3':[i for i,r in enumerate(rows) if r['seed']!='Phi']}
for cap in [0,1,2,3,4,5,6,7,8]:sets['S_through'+str(cap)]=[i for i,r in enumerate(rows) if r['seed']=='S' and r['power']<=cap]
for cap in [0,1,2,3]:sets['mixed_through'+str(cap)]=[i for i,r in enumerate(rows) if r['seed']=='S' or r['power']<=cap]
result={k:{'rows':len(ix),'minimum':eig(ix)} for k,ix in sets.items()}
T=M[np.ix_(N,N)]-M[np.ix_(N,O)]@solve(M[np.ix_(O,O)],M[np.ix_(O,N)],assume_a='pos');assert np.min(np.diag(T))>0
res={str(rows[i]['label']):float(T[j,j]) for j,i in enumerate(N)}
BD=D.parent/'bfss-cross-gram22';BD=BD if BD.exists() else BD.with_name('bfss-cross-gram22-20261124');w=json.loads((BD/'trial-104.json').read_text());coeff=dict(zip(w['labels'],map(F,w['reduced_basis_coefficients'])));MR,AR=([[F(x) for x in row] for row in raw[k]] for k in ['mass','q1'])
lam=F(w['lambda_exact']);deg=[r['power']+(3 if r['seed']!='S' else 0)+sum(2*(j+1)*v for j,v in enumerate(r['exponents'])) for r in rows];scale=10**90;slo=F(math.isqrt(lam.numerator*scale**2//lam.denominator),scale);shi=slo+F(1,scale);assert slo*slo<lam<shi*shi
for k,ix in sets.items():
 c=[coeff[rows[i]['label']]*lam**(deg[i]//2) for i in ix];par=[deg[i]%2 for i in ix]
 def quad(B):
  a,b=F(0),F(0)
  for m,i in enumerate(ix):
   for n,j in enumerate(ix):
    x=c[m]*B[i][j]*c[n];p=par[m]+par[n]
    if p==1:b+=x
    else:a+=x*lam**(p//2)
  return a,b
 m,mb=quad(MR);assert m>0 and mb==0;q=tuple(x/m for x in quad(AR));lo=q[0]+min(q[1]*slo,q[1]*shi);hi=q[0]+max(q[1]*slo,q[1]*shi);result[k]['frozen_dilated_published_coefficients_rayleigh_Q_sqrt_lambda']=list(map(str,q));result[k]['frozen_dilated_published_coefficients_rayleigh_bounds']=[str(lo),str(hi)];result[k]['frozen_dilated_published_coefficients_rayleigh_decimal']=float((lo+hi)/2)
 # Rational reoptimized directions for each nested subspace, independent of float output.
 m0=np.array([[float(MR[i][j]) for j in ix] for i in ix]);a0=np.array([[float(AR[i][j]) for j in ix] for i in ix]);dd=np.sqrt(np.diag(m0));ev,z=eigh(a0/np.outer(dd,dd),m0/np.outer(dd,dd));z=z[:,0]/dd;z/=np.max(abs(z));cc=[F.from_float(float(x)).limit_denominator(10**30) for x in z];rq=lambda B:sum(cc[p]*B[i][j]*cc[q] for p,i in enumerate(ix) for q,j in enumerate(ix));exact=rq(AR)/rq(MR);result[k]['rational_reoptimized_trial_upper']=str(exact);result[k]['rational_reoptimized_trial_decimal']=float(exact);result[k]['rational_reoptimized_trial_coefficients']=list(map(str,cc));result[k]['strict_3_over_8']=exact<F(3,8);result[k]['strict_25_over_66']=exact<F(25,66)
report={'reoptimized_subspaces':result,'conditional_mass_residual_fraction_by_label':res,'conditional_mass_residual_fraction_range':{k:[min(res[str(rows[i]['label'])] for i in ix),max(res[str(rows[i]['label'])] for i in ix)] for k,ix in [('Y4_Phi',P4),('Y4_H3',H4),('Y5_Phi',P5),('Y5_H3',H5)]},'scope':'Numerical diagnostics of exact rational 104-row finite system; not native physical qualification.'}
(D/'scc104.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:{'rows':v['rows'],'minimum':v['minimum']} for k,v in result.items()},indent=2))
