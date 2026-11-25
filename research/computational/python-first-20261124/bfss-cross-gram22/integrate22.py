from pathlib import Path
from fractions import Fraction as F
from functools import cache
from collections import defaultdict
import json,math,numpy as np
from scipy.special import roots_legendre
from scipy.linalg import eigh
D=Path(__file__).resolve().parent
W=json.loads((D/'trial-104.json').read_text());rows=[]
for off,w in [(0,0),(424,1)]:
 for i,p,e in [(0,0,[0,0,0]),(1,1,[0,0,0]),(53,0,[1,0,0]),(54,1,[1,0,0]),(106,0,[0,1,0]),(107,1,[0,1,0]),(159,0,[1,1,0]),(160,1,[1,1,0]),(212,0,[0,0,1]),(213,1,[0,0,1]),(265,0,[1,0,1])]:rows.append(dict(label=i+off,power=p,exponents=e,width=w))
R=rows;labels=[r['label'] for r in R];assert all(i in W['labels'] for i in labels);widths=[tuple(map(float,map(F,w))) for w in W['physical_widths']]
O=(0,0,0);S=(1,0,0);U=(0,1,0);V=(0,0,1)
def add(a,b):return tuple(x+y for x,y in zip(a,b))
def inc(z,e,p,t,c):
 if not c:return
 if p>=3:
  inc(z,add(e,S),p-1,t,c);inc(z,add(e,U),p-2,t,-c);inc(z,add(e,V),p-3,t,c)
 else:z[e,p,t]+=c

def deriv(e):
 k,l,m=e;z=[]
 if k:z.append(((k-1,l,m),0,2*k))
 if l:z.extend([((k+1,l-1,m),0,2*l),((k,l-1,m),1,-2*l)])
 if m:z.extend([((k,l+1,m-1),0,2*m),((k+1,l,m-1),1,-2*m),((k,l,m-1),2,2*m)])
 return z

def form(a,b,weighted,direct=False):
 e,h=tuple(a['exponents']),tuple(b['exponents']);p,q=a['power'],b['power'];z=defaultdict(F);norm=F(80,3) if p==q==1 else F(1);shift=S if p==q==1 else O
 def put(x,g,t,c):
  for w in ([O,S] if weighted else [O]):inc(z,add(add(x,shift),w),g,t,c*norm)
 eh=add(e,h)
 if p==q:
  for j,g,c in deriv(e):
   for k,l,d in deriv(h):put(add(j,k),g+l+1,'I',F(c*d,2))
   put(add(j,h),g+1,'B',F(-c,2))
  for k,l,d in deriv(h):put(add(e,k),l+1,'A',F(-d,2))
  put(eh,1,'BA',F(1,2));put(add(eh,U),0,'scalar',1)
 elif direct:
  for t in ('A','B'):put(add(eh,S),1,t,F(5,3));put(eh,2,t,F(-5,3))
  for ds,other in [(deriv(e),h),(deriv(h),e)]:
   for j,g,c in ds:
    x=add(j,other);put(add(x,S),g+1,'I',F(-5*c,3));put(x,g+2,'I',F(5*c,3))
 else:
  inc(z,add(eh,S),0,'scalar',F(80,3))
  if weighted:inc(z,add(eh,(2,0,0)),0,'scalar',F(80,3));inc(z,add(eh,U),0,'scalar',F(20,3))
 return {k:c for k,c in z.items() if c}
def mass(a,b):
 if a['power']!=b['power']:return {}
 e=add(tuple(a['exponents']),tuple(b['exponents']));p=a['power'];return {(add(e,S) if p else e,0,'scalar'):F(80,3) if p else F(1)}
# independent row-angle moments: t_i=G_ii, c_ij=normalized row dot products
@cache
def rising(x,n):return math.prod(x+j for j in range(n))
@cache
def angle1(a,b,d):
 if a%2:return F(0)
 return rising(F(1,2),a//2)*rising(F(d-1,2),b)/rising(F(d,2),a//2+b)
@cache
def angle(a,b,c):return sum(math.comb(c,j)*angle1(a+c-j,j//2,9)*angle1(b+c-j,j//2,9)*angle1(j,0,8) for j in range(0,c+1,2))
def mul(a,b):
 z=defaultdict(int)
 for e,c in a.items():
  for f,d in b.items():z[add(e,f)]+=c*d
 return {e:c for e,c in z.items() if c}
zero=(0,)*6;sp={tuple(int(i==j) for i in range(6)):1 for j in range(3)};up={};ijs=[(0,1),(0,2),(1,2)]
for a,(i,j) in enumerate(ijs):
 e=tuple(int(t in (i,j)) for t in range(3));up[e+(0,0,0)]=1;up[e+tuple(2*int(t==a) for t in range(3))]=-1
vp={(1,1,1,0,0,0):1,(1,1,1,2,0,0):-1,(1,1,1,0,2,0):-1,(1,1,1,0,0,2):-1,(1,1,1,1,1,1):2}
@cache
def invariant(e):
 if e==O:return {zero:1}
 i=next(i for i,x in enumerate(e) if x);f=list(e);f[i]-=1;return mul(invariant(tuple(f)),[sp,up,vp][i])
@cache
def coeff(e,p,i):
 f=invariant(e)
 if p==1:f=mul(f,{tuple(int(j==i) for j in range(6)):1})
 if p==2:
  g={tuple(2*int(j==i) for j in range(6)):1}
  for c,(j,k) in enumerate(ijs):
   if i in (j,k):g[tuple(int(t in (j,k)) for t in range(3))+tuple(2*int(t==c) for t in range(3))]=1
  f=mul(f,g)
 z=defaultdict(F)
 for ex,c in f.items():z[ex[:3]]+=c*angle(*ex[3:])*math.prod(rising(F(9,2),n) for n in ex[:3])
 return {ex:c for ex,c in z.items() if c}
# exact coefficients, then vectorized numerical evaluation
@cache
def prepared(e,p,i):
 a=coeff(e,p,i);return np.array(list(a),int),np.array(list(a.values()),float)
def angular(e,p,r):
 out=[]
 for i in range(3):
  a,b=prepared(e,p,i);out.append(float(b@np.prod(r**a,axis=1)))
 return np.array(out)
# Stein recurrence from pinned companion gaussian.py, independent of row-angle derivation

def stein(r):
 @cache
 def E0(k,l,m):
  if (k,l,m)==O:return 1.
  if k:return sum(E1(k-1,l,m))
  if l:return (E0(2,l-1,m)-sum(E2(0,l-1,m)))/2
  return (2*m+5)/6*sum(r*(E2(0,0,m-1)-E1(1,0,m-1)+E0(0,1,m-1)))
 @cache
 def E1(k,l,m):
  z=np.full(3,(9+2*m)*E0(k,l,m))
  if k:z+=2*k*E1(k-1,l,m)
  if l:z+=2*l*(E1(k+1,l-1,m)-E2(k,l-1,m))
  return r*z/2
 @cache
 def E2(k,l,m):
  z=E0(k+1,l,m)+(10+2*l+2*m)*E1(k,l,m)
  if k:z=z+2*k*E2(k-1,l,m)
  if l:z=z-2*l*E0(k,l-1,m+1)
  return r*z/2
 return lambda e,p:np.full(3,E0(*e)) if p==0 else (E1 if p==1 else E2)(*e)
pairs=[(i,j) for i in range(22) for j in range(i,22)]
forms={ij:[mass(R[ij[0]],R[ij[1]]),form(R[ij[0]],R[ij[1]],False),form(R[ij[0]],R[ij[1]],True),form(R[ij[0]],R[ij[1]],True,True)] for ij in pairs};keys=set(k for ff in forms.values() for f in ff for k in f);momkeys=set((e,p) for e,p,t in keys)
print('moment keys',len(keys),'distinct',len(momkeys),flush=True)
for e,p in momkeys:
 for i in range(3):prepared(e,p,i)
print('cached',coeff.cache_info(),flush=True)
def integrate(n,method):
 x,wt=roots_legendre(n);out=np.zeros((4,22,22));err=direct=0
 for iw,jw in [(0,0),(0,1),(1,1)]:
  group=[ij for ij in pairs if (R[ij[0]]['width'],R[ij[1]]['width'])==(iw,jw)];a,b=widths[iw];c,d=widths[jw]
  for z,w in zip((x+1)/2,wt/2):
   v=np.array([z,np.sqrt(1-z*z),0]);A=np.diag([b,a,a]);B=c*np.eye(3)-(c-d)*np.outer(v,v);K=(A+B)/2;lam,Q=np.linalg.eigh(K);r=1/lam;vol=(b*d)**.25*np.prod(lam)**(-4.5);tags={'I':np.ones(3),'A':np.diag(Q.T@A@Q),'B':np.diag(Q.T@B@Q),'BA':np.diag(Q.T@B@A@Q),'scalar':np.array([1.,0.,0.])};f=stein(r);vals={}
   for e,p in momkeys:
    aa=angular(e,p,r);bb=f(e,p);err=max(err,float(np.max(abs(aa-bb)/np.maximum(abs(aa),1e-30))));vals[e,p]=aa if method=='angular' else bb
   tab={(e,p,t):float(tags[t]@vals[e,p]) for e,p,t in keys}
   for i,j in group:
    v=[math.fsum(float(c)*tab[k] for k,c in ff.items()) for ff in forms[i,j]];direct=max(direct,abs(v[2]-v[3])/max(1e-30,abs(v[2])));out[:,i,j]+=w*vol*np.array(v)
  print(method,n,iw,jw,'moments',err,'direct',direct,flush=True)
 for i,j in pairs:out[:,j,i]=out[:,i,j]
 assert err<1e-10 and direct<1e-10
 return out,{'method':method,'nodes':n,'max_moment_relative_disagreement':err,'max_direct_vs_ibp_relative_disagreement':direct}
def eig(M,A,ix):
 M=M[np.ix_(ix,ix)];A=A[np.ix_(ix,ix)];d=np.sqrt(np.diag(M));m=M/np.outer(d,d);a=A/np.outer(d,d);v,c=eigh(a,m);return {'min':float(v[0]),'mass_min_eigenvalue_scaled':float(np.linalg.eigvalsh(m)[0]),'mass_condition_scaled':float(np.linalg.cond(m)),'eigenvalues':v.tolist(),'relative_eigen_residual':float(np.linalg.norm(a@c[:,0]-v[0]*m@c[:,0])/(np.linalg.norm(a@c[:,0])+abs(v[0])*np.linalg.norm(m@c[:,0]))),'coefficients':(c[:,0]/d).tolist()}
if __name__=='__main__':
 a,ar=integrate(32,'angular');b,br=integrate(64,'stein');err=float(np.max(abs(a-b)/np.maximum(abs(b),1e-30)));assert err<1e-9
 M,H,A,Ad=b;old=json.loads((D/'old4.json').read_text());ix=[labels.index(i) for i in old['labels']];old_error={name:float(np.max(abs(mat[np.ix_(ix,ix)]-np.array(old[name]))/np.maximum(abs(np.array(old[name])),1e-30))) for name,mat in [('mass',M),('H',H),('q1',A)]};assert max(old_error.values())<1e-10
 scalar=[i for i,r in enumerate(R) if not r['power']];ys=[i for i,r in enumerate(R) if r['power']];bad=A.copy();bad[np.ix_(scalar,ys)]=0;bad[np.ix_(ys,scalar)]=0;low=[i for i,r in enumerate(R) if 2*r['exponents'][0]+4*r['exponents'][1]+6*r['exponents'][2]<=4];C=np.array([float(W['reduced_basis_coefficients'][W['labels'].index(i)]) for i in labels]);report={'rows':R,'labels':labels,'mass':M.tolist(),'H':H.tolist(),'q1':A.tolist(),'q1_direct':Ad.tolist(),'checks':[ar,br],'max_quadrature_relative_disagreement':err,'previous4_relative_disagreement':old_error,'subspaces':{'full22':eig(M,A,list(range(22))),'scalar12':eig(M,A,scalar),'YS10':eig(M,A,ys),'lowdegree':eig(M,A,low),'no_cross22':eig(M,bad,list(range(22))),'original4':eig(M,A,ix)},'truncated_witness_q1':float(C@A@C/(C@M@C)),'scope':'22 actual rows, inherited finite kernel identities, noncertified integration; no full witness or physical domain claim.'};(D/'results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k not in ('mass','H','q1','q1_direct')},indent=2))
