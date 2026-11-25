"""Exact integrated mixed low-power system: S through Y^2, plus Phi0 and H3_0.
Reuse archived exact orientation integrals and derivative polynomial assembly.
"""
import sys,json,gzip,itertools as it,math,time
from pathlib import Path
from fractions import Fraction as F
from collections import defaultdict
import numpy as np
from scipy.linalg import eigh
D=Path(__file__).resolve().parent;MD=Path(sys.argv[1]).resolve();OD=Path(sys.argv[2]).resolve();FD=Path(sys.argv[3]).resolve();sys.path.insert(0,str(FD));sys.argv=[sys.argv[0],str(MD),str(OD),str(FD)];import integrate56 as z
P=json.loads((D/'cross_polynomials.json').read_text());J=json.loads((D/'base_jet_polynomials.json').read_text());allrows=json.loads((D/'rows104.json').read_text());rows=[r for r in allrows if r['power']<=(2 if r['seed']=='S' else 0)];N=len(rows);assert N==44
cores=[('S',0),('S',1),('S',2),('Phi',0),('H3',0)];degrees=[0,1,2,3,3];order=['S','Phi','H3'];O=z.O;S=z.S;U=z.U;V=z.V;add=z.add
# Same algebraic assembly as integrate56.py, but generalized to cross-family mass kernels.
def form(a,b,weighted):
 e,h=tuple(a['exponents']),tuple(b['exponents']);p,q=cores.index((a['seed'],a['power'])),cores.index((b['seed'],b['power']));pq=f'{p},{q}';qp=f'{q},{p}';eh=add(e,h);out=defaultdict(F);name=','.join(sorted([a['seed'],b['seed']],key=order.index));k=a['power']+b['power']
 def inc(ex,g,t,c):
  if not c:return
  if g>=3:
   inc(add(ex,S),g-1,t,c);inc(add(ex,U),g-2,t,-c);inc(add(ex,V),g-3,t,c)
  else:out[ex,g,t]+=c
 def put(ex,g,t,c):
  inc(ex,g,t,c)
  if weighted:inc(add(ex,S),g,t,c)
 if (degrees[p]+degrees[q])%2==0:
  for v in P[name][str(k)]:
   ac=F(v['coefficient']);aex=tuple(v['exponents'])
   for j,g,c in z.deriv(e):
    for l,ll,d in z.deriv(h):put(add(add(j,l),aex),g+ll+1,'I',ac*F(c*d,2))
    put(add(add(j,h),aex),g+1,'B',-ac*F(c,2))
   for l,ll,d in z.deriv(h):put(add(add(e,l),aex),ll+1,'A',-ac*F(d,2))
   put(add(eh,aex),1,'BA',ac/2);put(add(add(eh,aex),U),0,'scalar',ac)
 else:
  for v in P[name][str(k+1)]:put(add(eh,tuple(v['exponents'])),0,'scalar',F(v['coefficient']))
 for key,ds,other,tag in [(pq,z.deriv(e),h,'A'),(qp,z.deriv(h),e,'B')]:
  for r in J['nu'][key]:
   ex=tuple(r['exponents']);g=r['G_power'];c=F(r['coefficient'])/2
   for j,kk,d in ds:put(add(add(j,other),ex),g+kk,'I',c*d)
   put(add(eh,ex),g,tag,-c)
 for r in J['tau'][pq]:put(add(eh,tuple(r['exponents'])),0,'scalar',F(r['coefficient'])/2)
 if weighted:
  for r in J['t'][pq]:
   ex=tuple(r['exponents']);g=r['G_power'];c=F(r['coefficient'])/8
   for kk,ll,d in z.deriv(h):inc(add(add(e,kk),ex),g+ll,'I',-c*d)
   inc(add(eh,ex),g,'B',c)
  for n in ['beta','v']:
   for r in J[n][pq]:inc(add(eh,tuple(r['exponents'])),0,'scalar',-F(r['coefficient'])/8)
 return {k:v for k,v in out.items() if v}
full=json.loads(gzip.decompress((D/'matrices.json.gz').read_bytes()));ids=[allrows.index(r) for r in rows];M=[[F(full['mass'][i][j]) for j in ids] for i in ids];H=[[F(0) for _ in rows] for _ in rows];A=[[F(0) for _ in rows] for _ in rows];keys=set();checks=0
for i,j in it.combinations_with_replacement(range(N),2):
 r,t=rows[i],rows[j];iw,jw=r['width'],t['width']
 for out,w in [(H,False),(A,True)]:
  ff=form(r,t,w);keys.update((*x,iw,jw) for x in ff);val=sum(c*z.integral(*x,iw,jw) for x,c in ff.items());out[i][j]=out[j][i]=val
  assert val==sum(c*z.integral(*x,jw,iw) for x,c in form(t,r,w).items()),(i,j,w);checks+=1
print('exact matrices',N,'checks',checks,'keys',len(keys),flush=True)
old=json.loads(gzip.decompress((FD/'matrices.json.gz').read_bytes()));oldrows=json.loads((MD/'rows56.json').read_text());ix=[i for i,r in enumerate(rows) if r['seed']=='S'];iy=[next(j for j,s in enumerate(oldrows) if s['label']==rows[i]['label']) for i in ix]
assert len(ix)==32;assert all(T[i][j]==F(old[k][p][q]) for k,T in [('mass',M),('H',H),('q1',A)] for i,p in zip(ix,iy) for j,q in zip(ix,iy));err=0.
for x in keys:
 v=float(z.integral(*x));n=z.numer(*x,32);err=max(err,abs(v-n)/max(abs(v),1e-100))
assert err<1e-10

def ldl(A):
 L=[[F(0) for _ in A] for _ in A];p=[]
 for i in range(len(A)):
  for j in range(i):L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*p[k] for k in range(j)))/p[j]
  d=A[i][i]-sum(L[i][k]**2*p[k] for k in range(i));assert d>0,(i,d);p.append(d);L[i][i]=1
 return p
piv=ldl(A);assert len(piv)==44
mf,af=np.array(M,float),np.array(A,float)
def eig(ix):
 m=mf[np.ix_(ix,ix)];a=af[np.ix_(ix,ix)];d=np.sqrt(np.diag(m));v,c=eigh(a/np.outer(d,d),m/np.outer(d,d));return float(v[0])
report={'rows':rows,'old32_exact_all_entries':True,'reverse_order_exact':checks,'moment_count':len(keys),'quadrature_relative':err,'weighted_positive_pivots':len(piv),'subspaces':{'+'.join(s):{'rows':len(ii:=[i for i,r in enumerate(rows) if r['seed'] in s]),'minimum':eig(ii)} for s in [('S',),('S','Phi'),('S','H3'),('S','Phi','H3')]},'scope':'Finite reconstructed rational 44-row mixed subspace, not full 80 or 104 weighted integration.'}
(D/'mixed44_matrices.json.gz').write_bytes(gzip.compress((json.dumps({k:[[str(x) for x in r] for r in v] for k,v in [('mass',M),('H',H),('q1',A)]},separators=(',',':'))+'\n').encode(),mtime=0));(D/'mixed44_results.json').write_text(json.dumps(report,indent=2)+'\n');print({k:v for k,v in report.items() if k!='rows'},flush=True)
