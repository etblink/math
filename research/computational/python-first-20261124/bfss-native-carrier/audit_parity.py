"""Independent finite sign/phase audit: pinned Mathlib sorting permutation vs bitmask rule.
This audits the computational labels, not a Lean proof of the native transition.
"""
import hashlib,json,itertools
from pathlib import Path
import numpy as np
p=Path(__file__).resolve().parent
seed=p.parent/'bfss-seed-transport/source_seed_integer.npz'
with np.load(seed) as z:
 masks=list(map(int,z['masks'])); norm2=sum(int(a)**2+int(b)**2 for a,b in zip(z['real'],z['imag']))
assert norm2==8072064 and len(set(masks))==19136
pairs=0;bad=0;wrong=0;odd_wrong=0
for m in masks:
 A=[j for j in range(24) if m>>j&1]
 for j in range(24):
  occupied=j in A
  B=[k for k in A if k!=j]
  unsorted=[j]+B
  target=sorted(unsorted)
  perm=[target.index(k) for k in unsorted]
  inversions=sum(x>y for x,y in itertools.combinations(perm,2))
  sig=(-1)**inversions
  bit_sig=(-1)**((m&((1<<j)-1)).bit_count())
  assert sig==bit_sig
  dest=B if occupied else target
  assert sum(1<<k for k in dest)==m^(1<<j)
  for rho in (0,1):
   actual=sig*(1 if rho==0 else (-1j if occupied else 1j))
   candidate=bit_sig if rho==0 else 1j*(-1)**((m&((1<<(j+1))-1)).bit_count())
   bad+=actual!=candidate
   wrong+=actual!=(1 if rho==0 else (-1j if occupied else 1j))
   odd_wrong+=rho==1 and actual!=-candidate
   pairs+=1
assert bad==0 and wrong>0 and odd_wrong>0
r={'seed_sha256':hashlib.sha256(seed.read_bytes()).hexdigest(),'support':len(masks),'norm_squared':norm2,'native_permutation_model_checks':pairs,'mismatch':bad,'omit_exterior_sign_mismatch':wrong,'reverse_odd_phase_mismatch':odd_wrong,'scope':'Finite seed-support parity checks; native Lean transition candidate unqualified.'}
(p/'parity_results.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
