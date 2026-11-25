"""Exact rational reduced mass and multiplicative blocks for the 56 S descendants.
Independent numerical orientation quadrature checks rational formulas.
No kinetic or full weighted-supercharge claim.
"""
import math,json,itertools as it,sys
from pathlib import Path
from fractions import Fraction as F
from collections import defaultdict
from functools import cache
import numpy as np
from scipy.special import roots_legendre
D=Path(__file__).resolve().parent
W=json.loads((D/'trial-104.json').read_text());P=json.loads((D/'moment_polynomials.json').read_text())['moment_polynomials_Y'];old=json.loads(Path(sys.argv[1]).read_text())
O=(0,0,0);S=(1,0,0);U=(0,1,0)
def addex(a,b):return tuple(x+y for x,y in zip(a,b))
def plus(*terms):
 z=defaultdict(F)
 for c,p in terms:
  if c:
   for e,v in p.items():z[e]+=c*v
 return {e:v for e,v in z.items() if v}
def times(p,q):
 z=defaultdict(F)
 for e,a in p.items():
  for f,b in q.items():z[addex(e,f)]+=a*b
 return {e:v for e,v in z.items() if v}
def shift(p,e):return {addex(k,e):v for k,v in p.items()}
def mono(e):return {e:F(1)}
@cache
def E0(k,l,m):
 if (k,l,m)==O:return mono(O)
 if k:return plus(*[(1,p) for p in E1(k-1,l,m)])
 if l:return plus((F(1,2),E0(2,l-1,m)),*[(F(-1,2),p) for p in E2(0,l-1,m)])
 a,b,c=E2(0,0,m-1),E1(1,0,m-1),E0(0,1,m-1)
 return plus(*[(F(2*m+5,6),shift(plus((1,a[i]),(-1,b[i]),(1,c)),tuple(int(j==i) for j in range(3)))) for i in range(3)])
@cache
def E1(k,l,m):
 out=[]
 for i in range(3):
  p=plus((9+2*m,E0(k,l,m)),*(([(2*k,E1(k-1,l,m)[i])] if k else [])+([(2*l,E1(k+1,l-1,m)[i]),(-2*l,E2(k,l-1,m)[i])] if l else [])))
  out.append(shift(plus((F(1,2),p)),tuple(int(j==i) for j in range(3))))
 return tuple(out)
@cache
def E2(k,l,m):
 out=[]
 for i in range(3):
  p=plus((1,E0(k+1,l,m)),(10+2*l+2*m,E1(k,l,m)[i]),*(([(2*k,E2(k-1,l,m)[i])] if k else [])+([(-2*l,E0(k,l-1,m+1))] if l else [])))
  out.append(shift(plus((F(1,2),p)),tuple(int(j==i) for j in range(3))))
 return tuple(out)
e1={tuple(int(i==j) for i in range(3)):F(1) for j in range(3)};e2={tuple(int(i!=j) for i in range(3)):F(1) for j in range(3)};e3={(1,1,1):F(1)}
@cache
def elementary_power(e):
 p=mono(O)
 for x,n in zip([e1,e2,e3],e):
  for _ in range(n):p=times(p,x)
 return p
@cache
def symmetric(e):
 p=E0(*e).copy();out={}
 while p:
  a,b,c=max(p);assert a>=b>=c,(e,a,b,c);k=(a-b,b-c,c);v=p[a,b,c];out[k]=v;p=plus((1,p),(-v,elementary_power(k)))
 return out
widths=[tuple(map(F,w)) for w in W['physical_widths']]
@cache
def exact(e,iw,jw):
 a,b=widths[iw];c,d=widths[jw];assert b==d
 gamma=(a+c)/2;eta=(a-b)/2;xi=(c-d)/2;D0=(gamma-eta)*(gamma-xi);D1=D0-eta*xi;k1=3*gamma-eta-xi;k2=2*gamma-eta-xi
 @cache
 def R(L):
  n=3+L;return D0**(-4-L)*sum(F(math.comb(n,t),2*t+1)*(eta*xi)**t/D1**t for t in range(n+1))
 return sum(v*sum(math.comb(i,t)*(gamma*k2)**(i-t)*k1**j*R(i+j+k-t) for t in range(i+1))/gamma**(5+i+j+k) for (i,j,k),v in symmetric(e).items())
def numerical(e,iw,jw,n):
 a,b=map(float,widths[iw]);c,d=map(float,widths[jw]);x,w=roots_legendre(n);z=(x+1)/2;out=0.
 pp=E0(*e);ee=np.array(list(pp),int);cc=np.array(list(pp.values()),float)
 for zz,ww in zip(z,w/2):
  v=np.array([zz,np.sqrt(1-zz*zz),0]);K=(np.diag([b,a,a])+c*np.eye(3)-(c-d)*np.outer(v,v))/2;lam=np.linalg.eigvalsh(K);out+=ww*(b*d)**.25*np.prod(lam)**(-4.5)*float(cc@np.prod((1/lam)**ee,axis=1))
 return out

def main():
 # Labels checked against independently exported companion metadata, not inferred from ordinal positions.
 global rows,labels
 rows=json.loads((D/'rows56.json').read_text());labels=[x['label'] for x in rows];assert len(labels)==56 and len(set(labels))==56
 pairs=list(it.combinations_with_replacement(range(56),2));blocks={'mass':(0,O),'Y':(1,O),'u':(0,U),'sY':(1,S),'su':(0,addex(S,U))};results={b:[[F(0) for _ in rows] for _ in rows] for b in blocks};keys=set()
 for i,j in pairs:
  r,t=rows[i],rows[j];p,q=r['power'],t['power'];e=addex(r['exponents'],t['exponents']);iw,jw=r['width'],t['width']
  for name,(power,shift0) in blocks.items():
   if (p+q+power)%2:continue
   m=P[str(p+q+power)];total=F(0)
   for ex,c in zip(m['exponents'],m['coefficients']):
    g=addex(addex(e,shift0),ex);keys.add((g,iw,jw));total+=F(c)*exact(g,iw,jw)
   results[name][i][j]=results[name][j][i]=total
 print('exact keys',len(keys),flush=True)
 # compare every distinct moment to independent numerical quadrature (two node counts)
 err=0.;conv=0.
 for g,iw,jw in sorted(keys):
  v=float(exact(g,iw,jw));a=numerical(g,iw,jw,32);b=numerical(g,iw,jw,48);err=max(err,abs(b-v)/max(abs(v),1e-100));conv=max(conv,abs(a-b)/max(abs(b),1e-100))
 assert err<1e-10 and conv<1e-10
 M=np.array(results['mass'],float);ix=[labels.index(i) for i in old['labels']];m=np.array(old['mass']);old_err=float(np.max(abs(M[np.ix_(ix,ix)]-m)/np.maximum(abs(m),1e-30)));assert old_err<1e-10
 # Exact rational LDL^T positivity on both parity sectors and the full mass matrix.
 def ldl(A):
  L=[[F(0) for _ in A] for _ in A];p=[]
  for i in range(len(A)):
   for j in range(i):L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*p[k] for k in range(j)))/p[j]
   d=A[i][i]-sum(L[i][k]**2*p[k] for k in range(i));assert d>0,(i,d);p.append(d);L[i][i]=1
  return p
 pivots=ldl(results['mass']);diag=np.sqrt(np.diag(M));cond=float(np.linalg.cond(M/np.outer(diag,diag)))
 c=[F(W['reduced_basis_coefficients'][W['labels'].index(i)]) for i in labels]
 norm=sum(c[i]*results['mass'][i][j]*c[j] for i in range(56) for j in range(56));assert norm>0
 def quadratic(A):return sum(c[i]*A[i][j]*c[j] for i in range(56) for j in range(56))/norm
 report={'labels':labels,'rows':rows,'exact_moment_keys':len(keys),'relative_exact_vs_quadrature':err,'quadrature_convergence':conv,'old22_mass_relative_disagreement':old_err,'exact_mass_positive_pivots':len(pivots),'mass_condition_scaled_binary64':cond,'truncated_released_coefficients_norm_squared':float(norm),'truncated_released_multiplicative_expectations':{name:float(quadratic(A)) for name,A in results.items() if name!='mass'},'scope':'Exact rational reduced mass and multiplication blocks conditional on reconstructed finite invariant kernels. No kinetic, full auxiliary form, or physical domain conclusion.'};print(json.dumps(report,indent=2),flush=True)
 (D/'integration_summary.json').write_text(json.dumps(report,indent=2)+'\n');(D/'exact_matrices.json').write_text(json.dumps({k:[[str(x) for x in r] for r in A] for k,A in results.items()},separators=(',',':'))+'\n');(D/'mass_ldl_pivots.json').write_text(json.dumps(list(map(str,pivots)))+'\n')
if __name__=='__main__':main()
