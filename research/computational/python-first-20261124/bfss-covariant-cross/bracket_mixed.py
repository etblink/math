"""Exact rational brackets for low-order mixed variational subspaces."""
from pathlib import Path
import gzip,json,math
from fractions import Fraction as F
import numpy as np
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
raw=json.loads(gzip.decompress((D/'mixed44_matrices.json.gz').read_bytes()));rows=json.loads((D/'mixed44_results.json').read_text())['rows'];M0,A0=([[F(x) for x in r] for r in raw[k]] for k in ['mass','q1'])
def ldl(A):
 L=[[F(0) for _ in A] for _ in A];p=[]
 for i in range(len(A)):
  for j in range(i):L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*p[k] for k in range(j)))/p[j]
  d=A[i][i]-sum(L[i][k]**2*p[k] for k in range(i));assert d>0,(i,d);p.append(d);L[i][i]=1
 return p
report={};pivots={}
for families in [('S',),('S','Phi'),('S','H3'),('S','Phi','H3')]:
 ix=[i for i,r in enumerate(rows) if r['seed'] in families];M,A=([[T[i][j] for j in ix] for i in ix] for T in [M0,A0]);N=len(ix);m,a=np.array(M,float),np.array(A,float);d=np.sqrt(np.diag(m));v,c=eigh(a/np.outer(d,d),m/np.outer(d,d));c=c[:,0]/d;c/=np.max(abs(c));coeff=[F.from_float(float(x)).limit_denominator(10**30) for x in c];lo=F(math.floor(v[0]*10**6),10**6);hi=lo+F(1,10**6);p=ldl([[A[i][j]-lo*M[i][j] for j in range(N)] for i in range(N)])
 def quad(T):return sum(coeff[i]*T[i][j]*coeff[j] for i in range(N) for j in range(N))
 rq=quad(A)/quad(M);assert lo<rq<hi;name='+'.join(families);report[name]={'rows':N,'labels':[rows[i]['label'] for i in ix],'lower':str(lo),'upper':str(hi),'strict_lower_positive_pivots':len(p),'rational_rayleigh_upper':str(rq),'rational_rayleigh_decimal':float(rq),'rational_trial_coefficients':list(map(str,coeff))};pivots[name]=list(map(str,p));print(name,N,float(lo),float(rq),float(hi),flush=True)
(D/'mixed_brackets.json').write_text(json.dumps(report,indent=2)+'\n');(D/'mixed_lower_pivots.json.gz').write_bytes(gzip.compress((json.dumps(pivots)+'\n').encode(),mtime=0))
