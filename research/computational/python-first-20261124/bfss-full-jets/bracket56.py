"""Exact rational bound on complete finite S-descendant sector; not a physical certificate."""
from pathlib import Path
import gzip,json,math
from fractions import Fraction as F
import numpy as np
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
raw=json.loads(gzip.decompress((D/'matrices.json.gz').read_bytes()));M,A=([[F(x) for x in r] for r in raw[k]] for k in ['mass','q1']);N=len(M);assert N==56

def ldl(A):
 L=[[F(0) for _ in A] for _ in A];p=[]
 for i in range(len(A)):
  for j in range(i):L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*p[k] for k in range(j)))/p[j]
  d=A[i][i]-sum(L[i][k]**2*p[k] for k in range(i));assert d>0,(i,d);p.append(d);L[i][i]=1
 return p
m,a=np.array(M,float),np.array(A,float);d=np.sqrt(np.diag(m));v,c=eigh(a/np.outer(d,d),m/np.outer(d,d));c=c[:,0]/d;c/=np.max(np.abs(c));coeff=[F.from_float(float(x)).limit_denominator(10**30) for x in c]
# Numerical estimate chooses bracket only; positive LDL and rational trial quotient verify it.
lo=F(math.floor(v[0]*10**6),10**6);hi=lo+F(1,10**6)
p=ldl([[A[i][j]-lo*M[i][j] for j in range(N)] for i in range(N)])
def quad(T):return sum(coeff[i]*T[i][j]*coeff[j] for i in range(N) for j in range(N))
rq=quad(A)/quad(M);print("trial",float(rq),"bracket",float(lo),float(hi),flush=True);assert lo<rq<hi
report={'lower':str(lo),'upper':str(hi),'strict_lower_positive_pivots':len(p),'rational_rayleigh_upper':str(rq),'rational_rayleigh_decimal':float(rq),'rational_trial_coefficients':list(map(str,coeff)),'comparison_3_over_8':{'lower_above_target':lo>F(3,8),'trial_below_target':rq<F(3,8)},'scope':'Exact rational lower and upper bounds for finite reconstructed 56-row matrices only; not full 104-row witness or physical domain.'};(D/'eigen_bracket.json').write_text(json.dumps(report,indent=2)+'\n');(D/'lower_pivots.json.gz').write_bytes(gzip.compress((json.dumps(list(map(str,p)))+'\n').encode(),mtime=0));print('bracket',float(lo),float(rq),float(hi),'pivots',len(p),flush=True)
