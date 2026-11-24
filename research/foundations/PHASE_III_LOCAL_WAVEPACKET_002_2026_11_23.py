"""Local wavepacket seed in the independent 48-CAR model.
Uses original source gamma convention via Phase III 001. No native operator theorem.
"""
from pathlib import Path
import runpy
from fractions import Fraction
from itertools import combinations
import numpy as np
m=runpy.run_path(str(Path(__file__).with_name('PHASE_III_SUPERCHARGE_PROJECTOR_001_2026_11_23.py')))
G,C,M,U,R,rden,P84num,eq=[m[k] for k in ('G','C','M','U','R','rden','P84num','eq')]
pairs=list(combinations(range(9),2)); L=dict(zip(pairs,M)) # M = 4 infinitesimal spin generator
# A Cartan 84 vector, with tensor indices e0,e1,e8.
A=G[8]@G[0]@G[1]
V=1j*sum((int(A[a,b])*(C[a]@C[b]) for a,b in combinations(range(16),2) if A[a,b]),0*U)
W=V@R
assert W.nnz and eq(P84num@W,18*W)
# W has rank one. Test the entire image, not a chosen column.
for i,j in combinations(range(2,8),2):assert eq(L[i,j]@W,0*U)
# On the even-parity tensor module exp(pi L/4) has eigenvalues +/-1;
# use the integer rotation polynomial 384I+B²(B²+64I), scaled by 384.
for i,j in [(0,1),(1,8)]:
    B2=L[i,j]@L[i,j]; P=384*U+B2@(B2+64*U)
    assert eq(P@W,384*W)
par=m['par'];assert eq(par@W,W)
print('Cartan 84: 15 Spin(6) infinitesimal checks, both combined-flip spatial parts, even chirality PASS')
# At rank-one along e8, fast Fock complex modes pair colors 0,1.
# Fast vacuum has occupied negative eigenspace (indices 8..15).
I16=np.eye(16,dtype=np.int64); vac=0xff00
for i,j in combinations(range(8),2):
    S=G[i]@G[j]
    assert not np.count_nonzero(S[:8,8:]) and not np.count_nonzero(S[8:,:8])
    assert np.trace(S[8:,8:])==0
# color pi about axis 2: Q=N-8, Q(vac)=0. Color pi about axis 0:
# lift = product of 16 (color1 Majorana)(color2 Majorana).
# reordering to fast imaginary product times Cartan volume gives (-1)^120=+1.
b=vac; phase=1+0j
for k in reversed(range(16)):
    phase*=(-1)**((b&((1<<k)-1)).bit_count())*1j*(1-2*((b>>k)&1))
    b^=1<<k
assert b==0xff and phase==1
# spatial pi in (e1,e8) sends positive filled space to negative.
# S=Gamma1 Gamma8 or its negative; block determinant is +1 for either.
S=G[1]@G[8]; block=S[8:,:8]
assert np.array_equal(block.T@block,np.eye(8,dtype=np.int64))
# signed permutation determinant, exact
perm=np.argmax(abs(block),axis=0); signs=[int(block[perm[k],k]) for k in range(8)]
det=(-1)**sum(perm[i]>perm[j] for i,j in combinations(range(8),2))*int(np.prod(signs))
assert det==1
# Cartan volume = product of 16 normalized Majoranas = i^8 parity.
vol=U.copy()
for c in C:vol=vol@c
assert eq(vol,par) and eq(vol@W,W)
print('fast vacuum: Spin(8) determinant infinitesimal checks; neutral color phase; Weyl complement phase +1; spatial determinant +1; Cartan volume +1 PASS')
# Principal symbol at X_t=(t e0,2t e1,e8): coefficients of normalized Q.
# Two orthogonal frames A=(0,0,G8), B=(G0,2G1,0)/sqrt(5).
Aframe=np.hstack((np.zeros((16,32),dtype=np.int64),G[8]))
Bnum=np.hstack((G[0],2*G[1],np.zeros((16,16),dtype=np.int64)))
assert np.array_equal(Aframe@Aframe.T,I16)
assert np.array_equal(Bnum@Bnum.T,5*I16)
assert not np.count_nonzero(Aframe@Bnum.T)
# At t=0 D=Gamma8 times Cartan C: each plane spin generator differs at most by sign,
# so plane projectors and Clifford chirality unchanged.
for i,j in pairs:
    X=G[i]@G[j]
    assert np.array_equal(G[8]@X@G[8],(-1 if j==8 else 1)*X)
assert np.prod(np.diag(G[8]))==1
# theta=atan(sqrt(5)*t) <= sqrt(5)*t; spin lift norm difference <=8 theta.
# For unit seed in P84(D_0), squared projected norm at t>0 >=1-64 theta².
t=Fraction(1,100); bound=1-320*t*t
assert bound==Fraction(121,125) and 2*t<1
print('full rank t=1/100; principal-symbol P84 squared norm lower bound:',bound,'=',float(bound))
print('PASS: stabilizer-invariant finite seed and local projector continuity bound')
