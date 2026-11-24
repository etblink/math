"""Independent projected transverse Yukawa model; no native BFSS spectral claim."""
from pathlib import Path
from collections import Counter
import runpy
import numpy as np
m=runpy.run_path(str(Path(__file__).with_name('PHASE_II_INTERACTION_011_2026_11_23.py')))
apply=m['apply']; state=m['state']; vac=m['vac']; props=m['props']
# Positive species: B+_v or particle_k; negative species: B-_v or hole_k.
# Cartan indices 0..7 couple to the negative charge, 8..15 to positive.
def key(p,q,l,h):
    b=vac | (l<<16) | (h<<20); inds=[]
    if p<8:inds.append(p)
    else:b|=1<<(p-8)
    if q<8:inds.append(8+q)
    else:b^=1<<q
    return next(iter(state(b,inds)))
def split(k):
    b,n=k; assert props(k)[:2]==(2,0)
    p=next((i for i in range(8) if n[i]),None)
    q=next((i for i in range(8,16) if n[i]),None)
    if p is None:p=8+((b&255).bit_length()-1)
    if q is None:q=8+((((~b)>>8)&255).bit_length()-1)
    else:q-=8
    return p,q,(b>>16)&15,(b>>20)&15
# Build matrices for each charge with the other held in a boson state.
def matrix(positive):
    M=np.zeros((256,256),dtype=np.complex128)
    for u in range(16):
        for v in range(16):
            k=key(u,0,0,v) if positive else key(0,u,v,0)
            for k2,z in apply({k:1}).items():
                p,q,l,h=split(k2)
                if positive and q==0 and l==0:M[16*p+h,16*u+v]+=z
                if not positive and p==0 and h==0:M[16*q+l,16*u+v]+=z
    return M
P=matrix(True); N=matrix(False)
for name,A in [('plus',P),('minus',N)]:
    assert np.array_equal(A,A.conj().T)
    assert np.count_nonzero(A)==2048
    vals=np.linalg.eigvalsh(A)
    print(name,'numerical spectrum',Counter(np.round(vals,9)))
    print('unique squared eigvals',np.unique(np.round(vals**2,8)))
# Exact Gaussian-integer matrix polynomial, bounded intermediate products.
from math import comb
mult={2*k:comb(8,4+k) for k in range(-4,5)}
for A in (P,N):
    B=A@A; I=np.eye(256,dtype=np.complex128); Q=B.copy()
    for r in (4,16,36,64):
        assert np.max(np.abs(Q)) * 256 * np.max(np.abs(B-r*I))<2**52
        Q=Q@(B-r*I)
    assert np.count_nonzero(Q)==0
    D=np.diag([(-1)**(u//16>=8) for u in range(256)])
    assert np.array_equal(D@A@D,-A)
    powers=I.copy()
    for k in range(5):
        assert np.trace(powers)==sum(n*v**(2*k) for v,n in mult.items())
        if k<4:
            assert np.max(np.abs(powers))*256*np.max(np.abs(B))<2**52
            powers=powers@B
    assert sum(mult.values())==256
    print('exact annihilator + moments PASS')
D=np.diag([(-1)**((u//16>=8)+(u%16).bit_count()) for u in range(256)])
assert np.array_equal(D@N,N@D)
# The positive factor carries the negative species/low Cartan parity sign.
# Negative conversion crosses the positive fast occupation twice, hence no sign.
for q,l in [(q,l) for q in range(16) for l in range(16)]:
    for p,h in [(0,0),(8,1)]:
        k=key(p,q,l,h);actual=apply({k:1});pred={}
        for idx in np.flatnonzero(P[:,16*p+h]):
            p2,h2=divmod(int(idx),16);pred[key(p2,q,l,h2)]=P[idx,16*p+h]*D[16*q+l,16*q+l]
        for idx in np.flatnonzero(N[:,16*q+l]):
            q2,l2=divmod(int(idx),16);pred[key(p,q2,l2,h)]=N[idx,16*q+l]
        assert actual==pred
print('512 spectator-factor checks PASS')
# V=P tensor D+I tensor N, [D,N]=0; P has symmetric spectrum.
full=Counter()
for u,m in mult.items():
    for v,n in mult.items():full[u+v]+=m*n
assert full=={2*k:comb(16,8+k) for k in range(-8,9)}
print('full projected spectrum',sorted(full.items()),'dim',sum(full.values()),'kernel',full[0])
print('PASS')
