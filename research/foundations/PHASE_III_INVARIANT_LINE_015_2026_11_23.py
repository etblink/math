"""Exact Weyl-character multiplicities for the 48-Majorana Lie module.
Uses weight units 4*Spin9 and 2*color (SO3 angular weights).
No global vector lift, full Fock matrix or Lean evaluation assumed.
"""
from itertools import product, permutations
from collections import Counter
from math import prod

def parity(p):
    return (-1)**sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p)))

# Pick one member of each opposite pair in the real spinor x adjoint weights.
# A spinor weight is (±1/2)^4, a color weight is -1,0,+1.
# A quantized skew generator gives occupation shifts ±1/2 of those weights.
planes=[(1,*s,c) for s in product((-1,1),repeat=3) for c in (-1,0,1)]
assert len(planes)==24
W=Counter({(0,0,0,0,0):1})
for a in planes:
    N=Counter()
    for x,n in W.items():
        for sign in (-1,1):
            N[tuple(v+sign*u for v,u in zip(x,a))]+=n
    W=N
assert sum(W.values())==2**24
# Weyl numerator coefficient: multiplicity of lambda = sum det(w) m(lambda+rho-w rho).
# rho_B4=(7/2,5/2,3/2,1/2), scaled by 4.
rho=(14,10,6,2)
alt=[]
for p in permutations(range(4)):
    for s in product((-1,1),repeat=4):
        alt.append((tuple(rho[i]-s[i]*rho[p[i]] for i in range(4)),parity(p)*prod(s)))
assert len(alt)==384

def spin_singlet_weight(c):
    return sum(sign*W[(*a,2*c)] for a,sign in alt)

m={c:spin_singlet_weight(c) for c in range(-13,14)}
assert all(v>=0 for v in m.values()) and all(m[c]==m[-c] for c in m)
assert sum(m.values())==14
mult={j:m[j]-m[j+1] for j in range(13)}
assert all(v>=0 for v in mult.values())
assert sum((2*j+1)*n for j,n in mult.items())==14
assert mult[0]==1
print('weight count:',len(W),'dimension:',sum(W.values()))
print('Spin9 singlet color weight multiplicities:',{j:v for j,v in m.items() if v})
print('color spin irreps:',{j:v for j,v in mult.items() if v})
print('Spin9 singlets:',sum(m.values()),'; one color generator kernel:',m[0],'; full joint kernel:',mult[0])
# Independent factor check: restrict to spin only in one color and decompose into 44,84,128.
V=Counter({(0,0,0,0):1})
for a in [(1,*s) for s in product((-1,1),repeat=3)]:
    N=Counter()
    for x,n in V.items():
        for sign in (-1,1):N[tuple(v+sign*u for v,u in zip(x,a))]+=n
    V=N
assert sum(V.values())==256
# B4 highest weights in scaled units, enumerate dominant support.
mu={w:sum(s*V[tuple(x+y for x,y in zip(w,a))] for a,s in alt) for w in V if w[0]>=w[1]>=w[2]>=w[3]>=0}
mu={w:n for w,n in mu.items() if n}
assert mu=={(8,0,0,0):1,(4,4,4,0):1,(6,2,2,2):1}
print('single-color control:',mu)
print('PASS')
