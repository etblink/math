"""Exact negative Rayleigh direction for the deliberately t-omitted matrix; not a physical charge form."""
import integrate56 as m
from fractions import Fraction as F
from pathlib import Path
import numpy as np,json,gzip,itertools as it
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
raw=json.loads(gzip.decompress((D/'matrices.json.gz').read_bytes()));M,A=([[F(x) for x in r] for r in raw[k]] for k in ['mass','q1']);N=len(M);B=[r.copy() for r in A];asym=[]
for i,j in it.combinations_with_replacement(range(N),2):
 r,t=m.rows[i],m.rows[j];p,q=r['power'],t['power'];iw,jw=r['width'],t['width']
 if m.J['t'][f'{p},{q}']:
  v=sum(c*m.integral(*x,iw,jw) for x,c in m.form(r,t,True,False).items());rev=sum(c*m.integral(*x,jw,iw) for x,c in m.form(t,r,True,False).items());B[i][j]=B[j][i]=v
  if v!=rev:asym.append({'labels':[r['label'],t['label']],'forward_minus_reverse':str(v-rev)})
mf,bf=np.array(M,float),np.array(B,float);d=np.sqrt(np.diag(mf));v,c=eigh(bf/np.outer(d,d),mf/np.outer(d,d));c=c[:,0]/d;c/=np.max(np.abs(c));coef=[F.from_float(float(x)).limit_denominator(10**30) for x in c]
def quad(T):return sum(coef[i]*T[i][j]*coef[j] for i in range(N) for j in range(N))
q=quad(B)/quad(M);valid=quad(A)/quad(M);assert q<0 and valid>0 and asym
r={'omitted_t_forced_symmetric_rational_rayleigh':str(q),'omitted_t_rayleigh_decimal':float(q),'same_direction_correct_rayleigh':str(valid),'same_direction_correct_decimal':float(valid),'coefficient_vector':list(map(str,coef)),'nonhermitian_pairs_without_t':len(asym),'first_exact_asymmetry':asym[0],'scope':'Negative control only: the t-omitted one-sided expression is non-Hermitian; forced symmetrization is an intentionally damaged matrix.'};(D/'omit_t_control.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ['coefficient_vector','omitted_t_forced_symmetric_rational_rayleigh','same_direction_correct_rayleigh']})
