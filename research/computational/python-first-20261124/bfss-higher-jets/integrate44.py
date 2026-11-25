"""Exact rational integration of S descendants through Y^4 sector; independent quadrature control.
Usage: python integrate44.py MOMENT_DIR CROSS_GRAM22_DIR ORDERED_JETS_DIR
"""
import sys,json,math,itertools as it,gzip
from pathlib import Path
from fractions import Fraction as F
from collections import defaultdict
from functools import cache
import numpy as np
from scipy.special import roots_legendre
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
MD=Path(sys.argv[1]).resolve();OLD=Path(sys.argv[2]).resolve();JOLD=Path(sys.argv[3]).resolve();sys.path.insert(0,str(MD));sys.argv[1]=str(OLD/'results.json');import integrate_mass as m
P=m.P;J=json.loads((D/'jet_polynomials.json').read_text());rows=[r for r in json.loads((MD/'rows56.json').read_text()) if r['power']<=4];labels=[r['label'] for r in rows];N=len(rows);O=(0,0,0);S=(1,0,0);U=(0,1,0);V=(0,0,1);add=m.addex

def deriv(e):
 k,l,n=e;z=[]
 if k:z.append(((k-1,l,n),0,2*k))
 if l:z.extend([((k+1,l-1,n),0,2*l),((k,l-1,n),1,-2*l)])
 if n:z.extend([((k,l+1,n-1),0,2*n),((k+1,l,n-1),1,-2*n),((k,l,n-1),2,2*n)])
 return z

def form(a,b,weighted,include_t=True):
 e,h=tuple(a['exponents']),tuple(b['exponents']);p,q=a['power'],b['power'];pq=f'{p},{q}';qp=f'{q},{p}';eh=add(e,h);z=defaultdict(F)
 def inc(ex,g,t,c):
  if not c:return
  if g>=3:
   inc(add(ex,S),g-1,t,c);inc(add(ex,U),g-2,t,-c);inc(add(ex,V),g-3,t,c)
  else:z[ex,g,t]+=c
 def put(ex,g,t,c):
  inc(ex,g,t,c)
  if weighted:inc(add(ex,S),g,t,c)
 # gradient profile/profile terms and multiplication blocks (u and Y)
 if (p+q)%2==0:
  mm=P[str(p+q)]
  for aex,ac in zip(mm['exponents'],mm['coefficients']):
   ac=F(ac);aex=tuple(aex)
   for j,g,c in deriv(e):
    for k,l,d in deriv(h):put(add(add(j,k),aex),g+l+1,'I',ac*F(c*d,2))
    put(add(add(j,h),aex),g+1,'B',-ac*F(c,2))
   for k,l,d in deriv(h):put(add(add(e,k),aex),l+1,'A',-ac*F(d,2))
   put(add(eh,aex),1,'BA',ac/2);put(add(add(eh,aex),U),0,'scalar',ac)
 else:
  mm=P[str(p+q+1)]
  for ex,c in zip(mm['exponents'],mm['coefficients']):put(add(eh,tuple(ex)),0,'scalar',F(c))
 # profile/core gradient terms nu, core/core gradient tau
 for x,ds,other,tag in [(pq,deriv(e),h,'A'),(qp,deriv(h),e,'B')]:
  for r in J['nu'][x]:
   ex=tuple(r['exponents']);g=r['G_power'];c=F(r['coefficient'])/2
   for j,k,d in ds:put(add(add(j,other),ex),g+k,'I',c*d)
   put(add(eh,ex),g,tag,-c)
 for r in J['tau'][pq]:put(add(eh,tuple(r['exponents'])),0,'scalar',F(r['coefficient'])/2)
 if weighted:
  for r in J['t'][pq] if include_t else []:
   ex=tuple(r['exponents']);g=r['G_power'];c=F(r['coefficient'])/8
   for k,l,d in deriv(h):inc(add(add(e,k),ex),g+l,'I',-c*d)
   inc(add(eh,ex),g,'B',c)
  for name in ['beta','v']:
   for r in J[name][pq]:inc(add(eh,tuple(r['exponents'])),0,'scalar',-F(r['coefficient'])/8)
 return {k:v for k,v in z.items() if v}
# matrix moment E_p in e(K^-1), times I, K^-1, K^-2; shift by K^-1 with CH
zero=({}, {}, {})
def mpadd(*items):return tuple(m.plus(*[(c,v[i]) for c,v in items]) for i in range(3))
def sc(p):return (p,{}, {})
def rmult(v):return (m.shift(v[2],V),m.plus((1,v[0]),(-1,m.shift(v[2],U))),m.plus((1,v[1]),(1,m.shift(v[2],S))))
@cache
def E(e,p):
 k,l,n=e
 if p==0:return sc(m.symmetric(e))
 if p==1:
  z=[(9+2*n,E(e,0))]
  if k:z.append((2*k,E((k-1,l,n),1)))
  if l:z.extend([(2*l,E((k+1,l-1,n),1)),(-2*l,E((k,l-1,n),2))])
 else:
  z=[(1,E((k+1,l,n),0)),(10+2*l+2*n,E(e,1))]
  if k:z.append((2*k,E((k-1,l,n),2)))
  if l:z.append((-2*l,E((k,l-1,n+1),0)))
 return mpadd((F(1,2),rmult(mpadd(*z))))
@cache
def integral(e,p,tag,iw,jw):
 if tag=='scalar':assert p==0;return m.exact(e,iw,jw)
 a,b=m.widths[iw];c,d=m.widths[jw];g=(a+c)/2;h=(a-b)/2;k=(c-d)/2;D0=(g-h)*(g-k);D1=D0-h*k;k1=3*g-h-k;k2=2*g-h-k
 @cache
 def R(r,L):
  n=3+L-r;assert n>=0
  return D0**(r-4-L)*sum(F(math.comb(n,t),2*r+2*t+1)*(h*k)**t/D1**(r+t) for t in range(n+1))
 factors={('n',0):[(0,0,1)],('m',0):[(0,0,1)],('z',0):[(0,1,1)],('n',1):[(1,0,g-k),(1,1,k)],('m',1):[(1,0,g-h),(1,1,h)],('z',1):[(1,1,g)],('n',2):[(2,0,(g-k)**2),(2,1,k*(2*g-k))],('m',2):[(2,0,(g-h)**2),(2,1,h*(2*g-h))],('z',2):[(2,1,g*g-h*k),(2,2,h*k)]}
 @cache
 def emon(e,kind,j):
  i,l,n=e
  if kind=='I':
   if j==0:return 3*m.exact(e,iw,jw) if False else 3*emon(e,'one',0)
   if j==1:return emon(add(e,S),'one',0)
   return emon(add(e,(2,0,0)),'one',0)-2*emon(add(e,U),'one',0)
  ff=[(0,0,1)] if kind=='one' else factors[kind,j]
  return sum(math.comb(i,t)*(g*k2)**(i-t)*k1**l*co*R(r,i+l+n-t+dp) for t in range(i+1) for dp,r,co in ff)/g**(5+i+l+n)
 def atom(kind):return sum(v*emon(ex,kind,j) for j,pol in enumerate(E(e,p)) for ex,v in pol.items())
 tr=atom('I')
 if tag=='I':return tr
 if tag=='A':return a*tr-2*h*atom('n')
 if tag=='B':return c*tr-2*k*atom('m')
 if tag=='BA':return a*c*tr-2*h*c*atom('n')-2*k*a*atom('m')+4*h*k*atom('z')
 raise ValueError(tag)
# independent orientation quadrature with eigenvalue polynomials from prior scalar/diagonal Stein implementation
@cache
def numer(e,p,tag,iw,jw,n):
 a,b=map(float,m.widths[iw]);c,d=map(float,m.widths[jw]);nodes,weights=roots_legendre(n);out=0.
 pols=[m.E0(*e)]*3 if p==0 else (m.E1 if p==1 else m.E2)(*e)
 for z,w in zip((nodes+1)/2,weights/2):
  A=np.diag([b,a,a]);v=np.array([z,np.sqrt(1-z*z),0]);B=c*np.eye(3)-(c-d)*np.outer(v,v);K=(A+B)/2;lam,Q=np.linalg.eigh(K);r=1/lam
  vals=np.array([math.fsum(float(co)*math.prod(x**y for x,y in zip(r,ex)) for ex,co in pol.items()) for pol in pols]);mat={'I':np.ones(3),'A':np.diag(Q.T@A@Q),'B':np.diag(Q.T@B@Q),'BA':np.diag(Q.T@B@A@Q),'scalar':np.array([1,0,0])}[tag];out+=w*(b*d)**.25*np.prod(lam)**(-4.5)*float(mat@vals)
 return out

def main():
 old=json.loads((OLD/'results.json').read_text());base=json.loads(gzip.decompress((MD/'exact_matrices.json.gz').read_bytes()));allrows=json.loads((MD/'rows56.json').read_text());ids=[next(i for i,r in enumerate(allrows) if r['label']==j) for j in labels];M=[[F(base['mass'][i][j]) for j in ids] for i in ids];H=[[F(0) for _ in rows] for _ in rows];A=[[F(0) for _ in rows] for _ in rows];keys=set()
 for i,j in it.combinations_with_replacement(range(N),2):
  r,t=rows[i],rows[j];iw,jw=r['width'],t['width']
  for out,w in [(H,False),(A,True)]:
   ff=form(r,t,w);keys.update((*x,iw,jw) for x in ff);out[i][j]=out[j][i]=sum(c*integral(*x,iw,jw) for x,c in ff.items())
 print('exact matrices',N,'keys',len(keys),flush=True)
 # check every distinct moment with 32-node quadrature, not just a selected matrix entry
 err=0.
 for x in keys:
  v=float(integral(*x));q=numer(*x,32);err=max(err,abs(v-q)/max(abs(v),1e-100))
 assert err<1e-10,err
 matrices={'mass':M,'H':H,'q1':A};floats={k:np.array(v,float) for k,v in matrices.items()};ix=[labels.index(i) for i in old['labels']];errs={k:float(np.max(np.abs(v[np.ix_(ix,ix)]-np.array(old[k]))/np.maximum(np.abs(np.array(old[k])),1e-30))) for k,v in floats.items()};print('old22 discrepancies',errs,flush=True);assert max(errs.values())<1e-9
 def eig(ix):
  m,a=[floats[k][np.ix_(ix,ix)] for k in ['mass','q1']];d=np.sqrt(np.diag(m));m=m/np.outer(d,d);a=a/np.outer(d,d);v=eigh(a,m,eigvals_only=True);return {'min':float(v[0]),'mass_condition':float(np.linalg.cond(m))}
 def ldl(A):
  L=[[F(0) for _ in A] for _ in A];p=[]
  for i in range(len(A)):
   for j in range(i):L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*p[k] for k in range(j)))/p[j]
   d=A[i][i]-sum(L[i][k]**2*p[k] for k in range(i));assert d>0,(i,d);p.append(d);L[i][i]=1
  return p
 # Independently check the previously integrated 32 rows, including all exact entries.
 prev=json.loads(gzip.decompress((JOLD/'matrices.json.gz').read_bytes()));oldrows=[r for r in rows if r['power']<=2];ix32=[labels.index(r['label']) for r in oldrows];assert all(matrices[k][i][j]==F(prev[k][a][b]) for k in matrices for a,i in enumerate(ix32) for b,j in enumerate(ix32))
 # The one-sided weighted expression must be Hermitian after integration, not by fiat.
 # Compare every reverse ordering and isolate the contribution of t.
 no_t=np.array(A,float);reverse_checks=0;affected=0
 for i,j in it.combinations_with_replacement(range(N),2):
  r,t=rows[i],rows[j];iw,jw=r['width'],t['width']
  ff=form(t,r,True);rev=sum(c*integral(*x,jw,iw) for x,c in ff.items());assert rev==A[i][j],(i,j,rev-A[i][j]);reverse_checks+=1
  if J['t'][f"{r['power']},{t['power']}"]:
   val=sum(c*integral(*x,iw,jw) for x,c in form(r,t,True,False).items());no_t[i,j]=no_t[j,i]=float(val);affected+=val!=A[i][j]
 d=np.sqrt(np.diag(floats['mass']));nt_min=float(eigh(no_t/np.outer(d,d),floats['mass']/np.outer(d,d),eigvals_only=True)[0])
 piv=ldl(A);report={'rows':rows,'labels':labels,'exact_moment_keys':len(keys),'exact_vs_quadrature_relative':err,'old22_relative_errors':errs,'old32_exact_all_entries':True,'reverse_order_exact':reverse_checks,'nonzero_t_affected_matrix_entries':affected,'omit_t_forced_symmetric_min':nt_min,'weighted_positive_pivots':len(piv),'subspaces':{'full':eig(list(range(N))),'old22':eig(ix),'through_Y3':eig([i for i,r in enumerate(rows) if r['power']<=3]),'Y3_Y4_only':eig([i for i,r in enumerate(rows) if r['power']>=3]),'through_Y2':eig([i for i,r in enumerate(rows) if r['power']<=2])},'scope':'Exact rational integrated matrices conditional on finite invariant kernels; no physical-domain conclusion.'}
 (D/'integrated.json').write_text(json.dumps(report,indent=2)+'\n');(D/'matrices.json.gz').write_bytes(gzip.compress((json.dumps({k:[[str(x) for x in r] for r in v] for k,v in matrices.items()},separators=(',',':'))+'\n').encode(),mtime=0));print(json.dumps(report,indent=2),flush=True)
if __name__=='__main__':main()
