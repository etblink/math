"""Exact cross-family Krylov moments with rational vector factors.
Arguments: COVARIANT_DIR SEED_NPZ TENSOR_DIR MAX_S MAX_C diag ...
Vectors carry (sqrt(2))**degree times physical covariant on unnormalized seed.
"""
from higher_jets import *
from fractions import Fraction as F
import math, sympy as sp
TD=Path(sys.argv[3]);PS=int(sys.argv[4]);PC=int(sys.argv[5]);
def prim(v,c=F(1)):
 if not len(v[0]):return zero,F(1)
 g=int(np.gcd.reduce(np.gcd(abs(v[1]),abs(v[2]))));assert g>0
 return (v[0],v[1]//g,v[2]//g),c*g
def act(op,w):return prim(apply(op,w[0]),w[1])
def scale(c,w):return w[0],w[1]*c
def lin(*terms):
 terms=[(F(c)*w[1],w[0]) for c,w in terms if c and w[1] and len(w[0][0])];
 if not terms:return zero,F(1)
 den=math.lcm(*(c.denominator for c,v in terms));nums=[int(c*den) for c,v in terms];g=math.gcd(*nums)
 return prim(combine(*[(n//g,v) for n,(_,v) in zip(nums,terms)]),F(g,den))
def inner(v,w):
 r,i=dot(v[0],w[0]);assert not i,(r,i);return F(r,N)*v[1]*w[1]
def eqr(v,w):return len(lin((1,v),(-1,w))[0][0])==0
seed=prim(S)
f=np.load(TD/'rank1_vector.npz');h0=prim((f['masks'].astype(np.int32),f['real'].astype(np.int64),f['imag'].astype(np.int64)),F(1,int(f['denominator'])))
u=np.zeros((3,3,3),np.int64);u[0,0,0]=5
for c in range(3):u[c,c,0]-=1;u[c,0,c]-=1;u[0,c,c]-=1
words=json.loads((TD/'orbit_results.json').read_text())['color_generator_words'];bs=[];vs=[]
for word in words:
 b=u.copy();w=h0
 for i,j in word:
  B=a.plane(3,i,j);b=2*sum(np.moveaxis(np.tensordot(B,b,axes=(1,k)),0,k) for k in range(3));w=act(a.G[i,j],w)
 bs.append(b);vs.append(w)
M=sp.Matrix(np.stack([b.ravel() for b in bs],axis=1).tolist());piv=list(M.T.rref()[1]);assert len(piv)==7;MI=M[piv,:].inv()
def sym(G,X):return np.einsum('ab,ck->abck',G,X)+np.einsum('ac,bk->abck',G,X)+np.einsum('bc,ak->abck',G,X)
def B15(x):
 g=x@x.T;return 5*sym(g,x)-sym(np.eye(3,dtype=int),np.trace(g)*x+2*g@x)
def h3(x):
 B=B15(x);parts=[]
 for j in range(9):
  rhs=sp.Matrix(B[:,:,:,j].ravel().tolist())/3;q=MI*rhs[piv,:];assert M*q==rhs
  w=lin(*[(F(int(c.p),int(c.q)),v) for c,v in zip(q,vs)])
  if j:w=scale(F(-1,8),act(a.R[0,j],w))
  parts.append((1,w))
 return lin(*parts)
def phi(x):
 z=a.Z(x);w=act(z,seed);ops=[z]+[a.opsum((1,a.M(x,d,c)),(-1,a.M(x,c,d))) for d,c in it.combinations(range(3),2)]
 return scale(2,lin((160*int(np.sum(x*x)),w),*[(-1,act(op,act(op,w))) for op in ops]))
def run(diag):
 t=time.monotonic();x=np.pad(np.diag(diag),((0,0),(0,6)));z=a.Z(x);V={'S':[seed],'Phi':[phi(x)],'H3':[h3(x)]};deg={'S':0,'Phi':3,'H3':3};ps={'S':PS,'Phi':PC,'H3':PC}
 if diag==(1,0,0):assert eqr(V['H3'][0],h0)
 for n in V:
  for p in range(ps[n]):V[n].append(act(z,V[n][-1]))
  print(diag,n,'Krylov',ps[n], 'seconds',round(time.monotonic()-t,2),flush=True)
 report={};checks=0;zeros=0
 for l,r in it.combinations_with_replacement(V,2):
  result={}
  for k in range(ps[l]+ps[r]+1):
   splits=[(p,k-p) for p in range(ps[l]+1) if 0<=k-p<=ps[r]];p,q=splits[len(splits)//2];val=inner(V[l][p],V[r][q]);degree=deg[l]+deg[r]+k
   if len(splits)>1:
    p2,q2=splits[0];assert inner(V[l][p2],V[r][q2])==val;checks+=1
   if degree%2:assert val==0;zeros+=1
   result[str(k)]=str(val/2**(degree//2))
  report[l+','+r]=result
 out={'diag':diag,'max_S':PS,'max_C':PC,'moments':report,'Hermitian_split_checks':checks,'odd_degree_zero_checks':zeros,'base_support':{n:len(v[0][0][0]) for n,v in V.items()},'seconds':time.monotonic()-t}
 (D/('mom_'+''.join(map(str,diag))+'.json')).write_text(json.dumps(out,indent=2)+'\n');print('done',diag,out['seconds'],flush=True)
if __name__=='__main__':
 for d in sys.argv[6:]:run(tuple(map(int,d.split(','))))
