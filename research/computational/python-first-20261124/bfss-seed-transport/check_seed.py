"""Exact Gaussian-integer bilinear tests on reconstructed source candidate.
Integers are represented by binary64 complex numbers only after bounding all
intermediate integer sums below 2**53. This is exact for the test, not for the
preceding floating point transport itself.
"""
from pathlib import Path
import itertools,json, numpy as np
D=Path(__file__).resolve().parent
f=np.load(D/'source_seed.npz');masks=f['masks'];c=f['coefficients'];norm2=int(f['raw_norm2']);z=np.rint(c.real)+1j*np.rint(c.imag)
assert np.max(abs(z-c))<1e-9
assert int(np.vdot(z,z).real)==norm2
I=np.eye(2,dtype=int); X=np.array([[0,1],[1,0]]); Z=np.diag([1,-1]); J=np.array([[0,1],[-1,0]])
def word(w):
 m=np.ones((1,1),int)
 for a in w:m=np.kron(m,dict(I=I,X=X,Z=Z,J=J)[a])
 return m
S=np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]);assert all(np.array_equal(S[i]@S[j]+S[j]@S[i],2*(i==j)*np.eye(16,dtype=int)) for i,j in itertools.product(range(9),repeat=2))
# t=sqrt(2)*theta, label by (real spin alpha, color a), complex bit 3*(alpha//2)+a.
def action(m,alpha,a):
 bit=3*(alpha//2)+a; sign=np.ones(len(m),dtype=np.int64)
 for k in range(bit):sign*=1-2*((m>>k)&1)
 phase=sign if alpha%2==0 else 1j*sign*(1-2*((m>>bit)&1))
 return m^(1<<bit),phase

def residual(terms,m,c):
 # Worst case bound per accumulator using total L1; exact additions, multiplications by +/-1,+/-i.
 assert sum(abs(w) for _,_,_,_,w in terms)*sum(abs(x.real)+abs(x.imag) for x in c)<2**53
 tt=[];vv=[]
 for a,al,b,be,w in terms:
  q,s=action(m,be,b);t,p=action(q,al,a);tt.append(t);vv.append(w*s*p*c)
 targets=np.concatenate(tt);values=np.concatenate(vv);order=np.argsort(targets,kind='stable');targets=targets[order];values=values[order];starts=np.r_[0,np.flatnonzero(targets[1:]!=targets[:-1])+1];s=np.add.reduceat(values,starts)
 return {'nonzero':int(np.count_nonzero(s)), 'max':float(np.max(abs(s))), 'norm2':float(np.vdot(s,s).real)}
gauge={(a,b):[(a,al,b,al,1) for al in range(16)] for a,b in itertools.combinations(range(3),2)}
spin={}
for i,j in itertools.combinations(range(9),2):
 M=S[i]@S[j];spin[i,j]=[(a,int(al),a,int(be),int(M[al,be])) for a in range(3) for al,be in zip(*np.nonzero(M))]
# G scaled by 2; R scaled by 8. Zero tests independent of scalar factor.
results={};
for label,gs in [('2G',gauge),('8R',spin)]:
 for (i,j),terms in gs.items():results[f'{label}_{i}_{j}']=residual(terms,masks,z)
print('generator nonzero count',sum(r['nonzero']>0 for r in results.values()),flush=True)
# Perturb a single nonzero occupation coefficient. Preserve all terms otherwise.
zc=z.copy();zc[0]+=1;control=residual(spin[0,3],masks,zc)
# Omit the final fermionic permutation signs, equivalently undo just those signs.
p=[8*(i%3)+i//3 for i in range(24)];par=np.zeros(len(masks),dtype=np.int64)
for i in range(24):
 for j in range(i+1,24):
  if p[i]>p[j]:par^=((masks>>i)&1)*((masks>>j)&1)
wrong=z*(1-2*par);unsigned=residual(gauge[0,1],masks,wrong)
# The exact candidate is stored as integer coefficients, with norm normalization sqrt(norm2).
np.savez_compressed(D/'source_seed_integer.npz',masks=masks.astype(np.uint32),real=z.real.astype(np.int16),imag=z.imag.astype(np.int16),raw_norm2=norm2)
r={'generator_results':results,'all_zero':all(v['nonzero']==0 for v in results.values()),'coefficient_perturbation':control,'unsigned_permutation':unsigned,'exact_norm_squared':norm2,'max_integer_rounding_residual':float(np.max(abs(z-c))),'nonzero_imag_coeffs':int(np.count_nonzero(z.imag))}
(D/'generator_checks.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k!='generator_results'})
assert r['all_zero'] and control['nonzero']>0 and unsigned['nonzero']>0
