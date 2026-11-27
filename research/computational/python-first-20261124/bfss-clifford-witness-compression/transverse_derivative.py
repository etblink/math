"""Exact transverse derivative shortcut at frozen source X[2,2]=1.
Only local finite integer occupation arithmetic; no physical-domain claim.
"""
import hashlib,json,itertools,math
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent
p=D/'reconstructed_seed.npz'
if not p.exists():p=D.parent/'bfss-seed-transport/source_seed_integer.npz'
assert hashlib.sha256(p.read_bytes()).hexdigest()=='131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7'
f=np.load(p); S=(f['masks'].astype(np.int64),f['real'].astype(np.complex128));assert not np.any(f['imag'])
words='JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split();flip=[sum(1<<(3-k) for k,c in enumerate(w) if c in 'JX') for w in words];sign=[sum(1<<(3-k) for k,c in enumerate(w) if c in 'JZ') for w in words]
parity=np.array([i.bit_count()%2 for i in range(256)],dtype=np.int8)
def par(x):return parity[x&255]^parity[(x>>8)&255]^parity[(x>>16)&255]
def major(i,v):
 m,c=v;s,a=divmod(i,3);b=3*(s//2)+a;z=1-2*par(m&((1<<b)-1))
 if s%2:z=z*(1j*(1-2*((m>>b)&1)))
 return m^(1<<b),c*z
# Term lists written left to right; coefficient includes i.
def terms(a,r):return [((3*j+(a+1)%3,3*(j^flip[r])+(a+2)%3),1j*(-1)**((j&sign[r]).bit_count())) for j in range(16)]
def term(v,t):
 w,z=t
 for i in reversed(w):v=major(i,v)
 return v[0],v[1]*z
maxbound=0
applications=0
# Output dense scratch 16M, no full matrix. All integer arithmetic exact binary64
# under conservative bound on absolute real/imaginary components of sums.
def combine(parts):
 global maxbound
 parts=list(parts);bound=sum(abs(k)*(float(np.max(abs(c.real)+abs(c.imag))) if len(c) else 0) for k,(m,c) in parts)
 assert bound<2**52;maxbound=max(maxbound,bound)
 out=np.zeros(1<<24,np.complex128)
 for k,(m,c) in parts:out[m]+=k*c
 nz=np.flatnonzero(out);return nz,out[nz]
def apply(ts,v):
 global applications
 applications+=1
 return combine((1,term(v,t)) for t in ts)
def eq(v,w):return np.array_equal(v[0],w[0]) and np.array_equal(v[1],w[1])
def norm2(v):return sum(int(a.real)**2+int(a.imag)**2 for a in v[1])
P=terms(2,2); assert len(set(i for t,_ in P for i in t))==32
powers=[S]
for k in range(5):powers.append(apply(P,powers[-1]))
report={'scope':'Exact integer finite transverse derivative tests at X[2,2]=1, no generic-rank or domain conclusion','fixture':[2,2],'derivatives':{},'seed_sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
for a,r in [(0,0),(0,2)]:
 B=terms(a,r); C=[]
 for w,z in B:
  hits=[(t,u) for t,u in P if len(set(w)&set(t))%2]
  assert len(hits)==1
  t,u=hits[0];C.append((w+t,z*u))
 bv=[apply(B,v) for v in powers[:5]];cv=[apply(C,v) for v in powers[:5]]
 # Separate literal product-rule recursion D_n=B Z^(n-1)S+Z D_(n-1).
 direct=bv[0]; rows=[]
 for n in range(1,6):
  if n>1:direct=combine([(1,bv[n-1]),(1,apply(P,direct))])
  shortcut=combine((math.comb(n,k+1)*(-2)**k,(bv if k%2==0 else cv)[n-1-k]) for k in range(n))
  assert eq(direct,shortcut),(a,r,n)
  naive=combine([(n,bv[n-1])]); rows.append({'n':n,'support':len(direct[0]),'norm2':norm2(direct),'naive_commuting_formula_residual_norm2':norm2(combine([(1,direct),(-1,naive)]))})
 report['derivatives'][f'{a},{r}']=rows
report['applications']=applications;report['maximum_integer_bound']=maxbound
(D/'transverse_derivative_results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
