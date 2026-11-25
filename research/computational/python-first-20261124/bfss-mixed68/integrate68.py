"""Exact integrated mixed low-power system: S through Y^2, plus Phi0 and H3_0.
Reuse archived exact orientation integrals and derivative polynomial assembly.
"""
import sys,json,gzip,itertools as it,math,time
from pathlib import Path
import sys
if hasattr(sys,"set_int_max_str_digits"):sys.set_int_max_str_digits(0)
from fractions import Fraction as F
from collections import defaultdict
import numpy as np
from scipy.linalg import eigh
D=Path(__file__).resolve().parent;CD=Path(sys.argv[4]).resolve();MD=Path(sys.argv[1]).resolve();OD=Path(sys.argv[2]).resolve();FD=Path(sys.argv[3]).resolve();sys.path.insert(0,str(FD));sys.argv=[sys.argv[0],str(MD),str(OD),str(FD)];import integrate56 as z
P=json.loads((CD/'cross_polynomials.json').read_text());J=json.loads((D/'jet_polynomials.json').read_text());allrows=json.loads((CD/'rows104.json').read_text());rows=[r for r in allrows if r['power']<=(8 if r['seed']=='S' else 0)];N=len(rows);assert N==68
cores=[('S',p) for p in range(9)]+[('Phi',0),('H3',0)];degrees=list(range(9))+[3,3];order=['S','Phi','H3'];O=z.O;S=z.S;U=z.U;V=z.V;add=z.add
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
full=json.loads(gzip.decompress((CD/'matrices.json.gz').read_bytes()));ids=[allrows.index(r) for r in rows];M=[[F(full['mass'][i][j]) for j in ids] for i in ids];H=[[F(0) for _ in rows] for _ in rows];A=[[F(0) for _ in rows] for _ in rows];keys=set();checks=0
for i,j in it.combinations_with_replacement(range(N),2):
 r,t=rows[i],rows[j];iw,jw=r['width'],t['width']
 for out,w in [(H,False),(A,True)]:
  ff=form(r,t,w);keys.update((*x,iw,jw) for x in ff);val=sum(c*z.integral(*x,iw,jw) for x,c in ff.items());out[i][j]=out[j][i]=val
  assert val==sum(c*z.integral(*x,jw,iw) for x,c in form(t,r,w).items()),(i,j,w);checks+=1
print('exact matrices',N,'checks',checks,'keys',len(keys),flush=True)
old=json.loads(gzip.decompress((FD/'matrices.json.gz').read_bytes()));oldrows=json.loads((MD/'rows56.json').read_text());ix=[i for i,r in enumerate(rows) if r['seed']=='S'];iy=[next(j for j,s in enumerate(oldrows) if s['label']==rows[i]['label']) for i in ix]
assert len(ix)==56;assert all(T[i][j]==F(old[k][p][q]) for k,T in [('mass',M),('H',H),('q1',A)] for i,p in zip(ix,iy) for j,q in zip(ix,iy));err=0.
prior=json.loads(gzip.decompress((CD/'mixed44_matrices.json.gz').read_bytes()));pr=json.loads((CD/'mixed44_results.json').read_text())['rows'];ix44=[next(i for i,r in enumerate(rows) if r['label']==s['label']) for s in pr];assert all(T[i][j]==F(prior[k][p][q]) for k,T in [('mass',M),('H',H),('q1',A)] for p,i in enumerate(ix44) for q,j in enumerate(ix44));print('old56 and old44 exact',flush=True)
for x in keys:
 v=float(z.integral(*x));n=z.numer(*x,32);err=max(err,abs(v-n)/max(abs(v),1e-100))
assert err<1e-10

def ldl(A):
 # Fraction-free symmetric elimination after positive diagonal integer congruence.
 d=[math.lcm(*(v.denominator for v in row)) for row in A];B=[[int(A[i][j]*d[i]*d[j]) for j in range(len(A))] for i in range(len(A))];p=1;out=[]
 for k in range(len(B)):
  a=B[k][k];assert a>0,(k,a);out.append(a)
  for i in range(k+1,len(B)):
   for j in range(i,len(B)):
    b,r=divmod(a*B[i][j]-B[k][i]*B[k][j],p);assert r==0;B[i][j]=b
  p=a
 return out
piv=ldl(A);assert len(piv)==68
mf,af=np.array(M,float),np.array(A,float)
def eig(ix):
 m=mf[np.ix_(ix,ix)];a=af[np.ix_(ix,ix)];d=np.sqrt(np.diag(m));v,c=eigh(a/np.outer(d,d),m/np.outer(d,d));return float(v[0])
report={'rows':rows,'old56_exact_all_entries':True,'old44_exact_all_entries':True,'reverse_order_exact':checks,'moment_count':len(keys),'quadrature_relative':err,'weighted_positive_pivots':len(piv),'subspaces':{'+'.join(s):{'rows':len(ii:=[i for i,r in enumerate(rows) if r['seed'] in s]),'minimum':eig(ii)} for s in [('S',),('S','Phi'),('S','H3'),('S','Phi','H3')]},'scope':'Finite reconstructed rational 68-row mixed subspace, not full 80 or 104 weighted integration.'}
(D/'mixed68_matrices.json.gz').write_bytes(gzip.compress((json.dumps({k:[[str(x) for x in r] for r in v] for k,v in [('mass',M),('H',H),('q1',A)]},separators=(',',':'))+'\n').encode(),mtime=0));(D/'mixed68_results.json').write_text(json.dumps(report,indent=2)+'\n');print({k:v for k,v in report.items() if k!='rows'},flush=True)
