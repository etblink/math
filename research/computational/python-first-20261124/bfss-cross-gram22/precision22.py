"""50-digit independent orientation quadrature and mass whitening for the 22-row subspace."""
import integrate22 as t
import mpmath as mp
from functools import cache
import json
mp.mp.dps=50
O=t.O

def moment(r):
 @cache
 def E0(k,l,m):
  if (k,l,m)==O:return mp.mpf(1)
  if k:return sum(E1(k-1,l,m))
  if l:return (E0(2,l-1,m)-sum(E2(0,l-1,m)))/2
  return mp.mpf(2*m+5)/6*sum(r[i]*(E2(0,0,m-1)[i]-E1(1,0,m-1)[i]+E0(0,1,m-1)) for i in range(3))
 @cache
 def E1(k,l,m):
  return tuple(r[i]*((9+2*m)*E0(k,l,m)+(2*k*E1(k-1,l,m)[i] if k else 0)+(2*l*(E1(k+1,l-1,m)[i]-E2(k,l-1,m)[i]) if l else 0))/2 for i in range(3))
 @cache
 def E2(k,l,m):
  return tuple(r[i]*(E0(k+1,l,m)+(10+2*l+2*m)*E1(k,l,m)[i]+(2*k*E2(k-1,l,m)[i] if k else 0)-(2*l*E0(k,l-1,m+1) if l else 0))/2 for i in range(3))
 return lambda e,p:(E0(*e),)*3 if p==0 else (E1 if p==1 else E2)(*e)

def mpf(x):return mp.mpf(x.numerator)/x.denominator

def calc(n):
 nodes,ws=mp.gauss_quadrature(n,'legendre');out=[mp.zeros(22) for _ in range(3)];widths=[tuple(mpf(t.F(x)) for x in w) for w in t.W['physical_widths']]
 for iw,jw in [(0,0),(0,1),(1,1)]:
  a,b=widths[iw];c,d=widths[jw];group=[ij for ij in t.pairs if (t.R[ij[0]]['width'],t.R[ij[1]]['width'])==(iw,jw)]
  keys=set(k for ij in group for ff in t.forms[ij][:3] for k in ff)
  for q,ww in zip(nodes,ws):
   z=(q+1)/2;w=ww/2;v=mp.matrix([z,mp.sqrt(1-z*z)]);A=mp.diag([b,a]);B=c*mp.eye(2)-(c-d)*v*v.T;K=(A+B)/2;gamma=(a+c)/2
   l0=(K[0,0]+K[1,1]-mp.sqrt((K[0,0]-K[1,1])**2+4*K[0,1]**2))/2;l1=K[0,0]+K[1,1]-l0;P=(l1*mp.eye(2)-K)/(l1-l0);Q=mp.eye(2)-P
   tr=lambda M: M[0,0]+M[1,1]
   tag=lambda M,x:(tr(P*M),tr(Q*M),x)
   tags={'I':(1,1,1),'A':tag(A,a),'B':tag(B,c),'BA':tag(B*A,c*a),'scalar':(1,0,0)};r=(1/l0,1/l1,1/gamma);f=moment(r);vol=(b*d)**mp.mpf('.25')*(l0*l1*gamma)**mp.mpf('-4.5');vals={(e,p):f(e,p) for e,p,ta in keys};tab={(e,p,ta):sum(x*y for x,y in zip(tags[ta],vals[e,p])) for e,p,ta in keys}
   for i,j in group:
    for k,ff in enumerate(t.forms[i,j][:3]):out[k][i,j]+=w*vol*sum(mpf(co)*tab[key] for key,co in ff.items())
  print('mp',n,iw,jw,flush=True)
 for i,j in t.pairs:
  for o in out:o[j,i]=o[i,j]
 return out

def minq(M,A):
 d=mp.diag([1/mp.sqrt(M[i,i]) for i in range(M.rows)]);m=d*M*d;a=d*A*d;L=mp.cholesky(m);U=L**-1;v=mp.eigsy(U*a*U.T,eigvals_only=True);return v[0]

if __name__=='__main__':
 a=calc(32);b=calc(48);diff=max(abs(x-y)/max(abs(y),mp.mpf('1e-40')) for A,B in zip(a,b) for x,y in zip(A,B));print('mp convergence',mp.nstr(diff,15),flush=True)
 q=minq(b[0],b[2]);q32=minq(a[0],a[2]);old=json.loads((t.D/'results.json').read_text());err=abs(q-mp.mpf(old['subspaces']['full22']['min']));print('minq',mp.nstr(q,40),'delta',mp.nstr(err,10),flush=True)
 assert diff<mp.mpf('1e-20') and err<mp.mpf('1e-7')
 report={'precision_digits':50,'nodes':[32,48],'max_matrix_relative_convergence':mp.nstr(diff,30),'minimum_q1':mp.nstr(q,40),'minimum_q1_32':mp.nstr(q32,40),'delta_binary64':mp.nstr(err,30),'matrices':{name:[[mp.nstr(mat[i,j],45) for j in range(22)] for i in range(22)] for name,mat in zip(['mass','H','q1'],b)},'scope':'High precision numerical check, not interval certification.'};(t.D/'precision_results.json').write_text(json.dumps(report,indent=2)+'\n')
