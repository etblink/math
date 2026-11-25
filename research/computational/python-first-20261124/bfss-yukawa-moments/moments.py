"""Exact integer occupation Krylov moments of Z=sqrt(2)Y.
Usage: python moments.py COVARIANT_DIR SEED_NPZ [workers].
Invariant reconstruction assumes equivariance and singlet conventions.
"""
import sys,json,itertools as it,math,hashlib,time
from pathlib import Path
from concurrent.futures import ProcessPoolExecutor
import numpy as np
import sympy as sp
D=Path(__file__).resolve().parent
sys.path.insert(0,sys.argv[1]);import covariant_audit as a
seedpath=Path(sys.argv[2]);f=np.load(seedpath);seed=(f['masks'].astype(np.int32),f['real'].astype(np.int64),f['imag'].astype(np.int64));N=sum(int(r)**2+int(i)**2 for r,i in zip(seed[1],seed[2]));assert N==8072064
def exponents(k):return [(k-2*j-3*l,j,l) for l in range(k//3+1) for j in range((k-3*l)//2+1)]
def inv(d):
 x,y,z=[int(t)**2 for t in d];return x+y+z,x*y+x*z+y*z,x*y*z
def row(d,k):return [math.prod(x**p for x,p in zip(inv(d),e)) for e in exponents(k)]
choices=sorted(it.combinations_with_replacement(range(5),3),key=lambda d:(sum(d),max(d),d));choices=[d for d in choices if any(d) and math.gcd(*d)==1];fits=set()
for k in range(1,9):
 r=[];old=0
 for d in choices:
  z=row(d,k);rank=sp.Matrix(r+[z]).rank()
  if rank>old:r.append(z);fits.add(d);old=rank
  if rank==len(exponents(k)):break
 assert old==len(exponents(k)),(k,old)
fits=sorted(fits);hold=[d for d in [(0,1,4),(1,2,4),(2,3,4),(1,3,4)] if d not in fits][:2];assert len(hold)==2
def norm(v):return sum(int(r)**2+int(i)**2 for r,i in zip(v[1],v[2]))
def inner(v,w):
 _,i,j=np.intersect1d(v[0],w[0],assume_unique=True,return_indices=True);re=im=0
 for ar,ai,br,bi in zip(v[1][i],v[2][i],w[1][j],w[2][j]):
  ar,ai,br,bi=map(int,(ar,ai,br,bi));re+=ar*br+ai*bi;im+=ar*bi-ai*br
 return re,im
def run(d):
 t=time.monotonic();x=np.pad(np.diag(d),((0,0),(0,6)));op=a.Z(x);rbuf=np.zeros(1<<24,np.int64);ibuf=np.zeros_like(rbuf);v=seed;ev=[N];od=[];supports=[len(v[0])];bounds=[]
 def apply(v):
  m,r,i=v;mx=int(max(np.max(np.abs(r),initial=0),np.max(np.abs(i),initial=0)));bound=mx*sum(int(abs(w.real)+abs(w.imag)) for _,_,w in op);assert bound<2**62,(d,bound);bounds.append(bound)
  for flip,p,w in op:
   z=m&p;sg=(1-2*(a.parity[z&4095]^a.parity[z>>12])).astype(np.int64);rr,ii=int(w.real),int(w.imag);j=m^flip
   if rr:rbuf[j]+=rr*sg*r;ibuf[j]+=rr*sg*i
   if ii:rbuf[j]-=ii*sg*i;ibuf[j]+=ii*sg*r
  j=np.flatnonzero((rbuf!=0)|(ibuf!=0)).astype(np.int32);r=rbuf[j].copy();i=ibuf[j].copy();rbuf[j]=0;ibuf[j]=0;return j,r,i
 for k in range(1,9):
  vprev,v=v,apply(v);ev.append(norm(v));od.append(inner(vprev,v));supports.append(len(v[0]));assert od[-1]==(0,0),(d,k,od[-1])
 u=apply(seed);w=apply(u);z=apply(w);assert inner(u,z)==(ev[2],0)
 out={'diag':d,'invariants':inv(d),'even_moments_raw':list(map(str,ev)),'odd_moments_raw':od,'supports':supports,'bounds':list(map(str,bounds)),'split_1_3_exact':True,'seconds':time.monotonic()-t};print(d,'supports',supports,'seconds',out['seconds'],flush=True);return out
def main():
 print('fits',fits,'hold',hold,flush=True);path=D/'pointwise_moments.json';data=json.loads(path.read_text())['rows'] if path.exists() else [];assert [tuple(x['diag']) for x in data]==(fits+hold)[:len(data)]
 with ProcessPoolExecutor(max_workers=int(sys.argv[3]) if len(sys.argv)>3 else 2) as pool:
  for x in pool.map(run,(fits+hold)[len(data):]):
   data.append(x);path.write_text(json.dumps({'seed_sha256':hashlib.sha256(seedpath.read_bytes()).hexdigest(),'norm2':N,'fits':fits,'holdouts':hold,'rows':data},indent=2)+'\n')
 coeffs={}
 for k in range(9):
  M=sp.Matrix([row(d,k) for d in fits]);y=sp.Matrix([sp.Rational(x['even_moments_raw'][k],N*2**k) for x in data[:len(fits)]]);co=list(M.gauss_jordan_solve(y)[0]);assert len(co)==len(exponents(k))
  for x in data:assert sum(c*r for c,r in zip(co,row(x['diag'],k)))==sp.Rational(x['even_moments_raw'][k],N*2**k),(k,x['diag'])
  coeffs[str(2*k)]={'exponents':exponents(k),'coefficients':list(map(str,co))}
 assert coeffs['2']['coefficients']==['80/3']
 rank1=next(x for x in data if tuple(x['diag'])==(0,0,1));nodes=list(range(0,17,2));V=sp.Matrix([[sp.Integer(n)**(2*k) for n in nodes] for k in range(9)]);prob=V.inv()*sp.Matrix([sp.Rational(m,N) for m in rank1['even_moments_raw']]);assert all(p>=0 for p in prob) and sum(prob)==1
 result={'moment_polynomials_Y':coeffs,'odd_moments_zero':True,'fit_count':len(fits),'holdout_count':len(hold),'rank_one_abs_Z_spectrum':nodes,'rank_one_probabilities':list(map(str,prob)),'scope':'Exact finite integer Krylov contractions; invariant polynomial reconstruction uses equivariance, no typed source or energy/domain qualification.'};(D/'moment_polynomials.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2),flush=True)
if __name__=='__main__':main()
