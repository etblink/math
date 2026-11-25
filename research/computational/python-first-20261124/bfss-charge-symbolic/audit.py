"""Exact abstract-Clifford polynomial audit, no Fock-state expansion.
T_d and B use the source charge Q=-i T_d partial_d/sqrt(2)+B.
Coordinates indexed color*9+space; Clifford labels spin*3+color.
"""
from collections import defaultdict
from itertools import combinations, product
from functools import cache
import json
from pathlib import Path
WORDS = 'JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split()
G = [[(i ^ sum(1 << (3-k) for k,c in enumerate(w) if c in 'JX'),
       (-1)**sum((i >> (3-k)) & 1 for k,c in enumerate(w) if c in 'JZ'))
      for i in range(16)] for w in WORDS]

def gamma_word(word, i):
    sign = 1
    for r in word:
        i, s = G[r][i]
        sign *= s
    return i, sign

def t(i,a): return 1 << (3*i+a)
def x(a,i): return 9*a+i

def add(out,key,v):
    if v:
        v += out.get(key,0)
        if v: out[key] = v
        else: out.pop(key,None)

@cache
def cliff(a,b):
    sign = 1
    while a:
        low = a & -a
        if (b & (low-1)).bit_count() & 1: sign = -sign
        a ^= low
    return sign

def mul(A,B):
    out = {}
    for (m,a),u in A.items():
        for (n,b),v in B.items():
            add(out,(tuple(sorted(m+n)),a^b),u*v*cliff(a,b))
    return out

def accumulate(out,A,factor=1):
    for k,v in A.items(): add(out,k,factor*v)

def differentiate(A,d):
    out = {}
    for (m,a),v in A.items():
        if d in m:
            k = m.index(d)
            add(out,(m[:k]+m[k+1:],a),m.count(d)*v)
    return out

def coordinate_times(A,d):
    return {(tuple(sorted((d,)+m)),a):v for (m,a),v in A.items()}

def require_eq(a,b,label):
    if a != b:
        z=dict(a); accumulate(z,b,-1)
        raise AssertionError((label,len(z),list(z.items())[:4]))

D=list(product(range(3),range(9)))
T = {d:[] for d in D}
B = []
for alpha in range(16):
    for a,i in D:
        j,w=gamma_word((i,),alpha)
        T[a,i].append({((),t(j,a)):w})
    out={}
    for i,j in combinations(range(9),2):
        k,w=gamma_word((i,j),alpha)
        for a in range(3):
            b,c=(a+1)%3,(a+2)%3
            add(out,(tuple(sorted((x(b,i),x(c,j)))),t(k,a)),w)
            add(out,(tuple(sorted((x(c,i),x(b,j)))),t(k,a)),-w)
    B.append(out)

# 16 times the kinetic block, exactly the gamma contraction used by B2.
A={}
for d,e in product(D,repeat=2):
    out={}
    for alpha in range(16): accumulate(out,mul(T[d][alpha],T[e][alpha]))
    A[d,e]=out
    a,i=d; b,k=e; expected={}
    for j in range(16):
        l,w=gamma_word((i,k),j)
        accumulate(expected,mul({((),t(j,a)):w},{((),t(l,b)):1}))
    require_eq(out,expected,('B2 coefficient',d,e))
for d,e in product(D,repeat=2):
    out=dict(A[d,e]);accumulate(out,A[e,d])
    require_eq(out,{((),0):32} if d==e else {},('kinetic symmetry',d,e))

# Potential square: independent direct expansion of cross-product norm.
V={}
for i,j in combinations(range(9),2):
    for a in range(3):
        b,c=(a+1)%3,(a+2)%3
        cross={(tuple(sorted((x(b,i),x(c,j)))),0):1,
               (tuple(sorted((x(c,i),x(b,j)))),0):-1}
        accumulate(V,mul(cross,cross),16)
B2={}
for b in B: accumulate(B2,mul(b,b))
require_eq(B2,V,'potential square')

# Cross block C_d = sum_alpha T_d B_alpha; reverse block = -C_d.
C={}; div={}; radial={}
for d in D:
    out={}; reverse={}
    for alpha in range(16):
        accumulate(out,mul(T[d][alpha],B[alpha]))
        accumulate(reverse,mul(B[alpha],T[d][alpha]))
    require_eq(reverse,{k:-v for k,v in out.items()},('cross anticommutator',d))
    C[d]=out
    accumulate(div,differentiate(out,x(*d)))
    accumulate(radial,coordinate_times(out,x(*d)))

# Unscaled Yukawa L, with Z=i L and Y=Z/sqrt(2).
L={}
for a,i in D:
    b,c=(a+1)%3,(a+2)%3
    for j in range(16):
        k,w=gamma_word((i,),j)
        accumulate(L,mul({((x(a,i),),t(j,b)):w},{((),t(k,c)):1}))
require_eq(div,{k:-16*v for k,v in L.items()},'Yukawa divergence')

# Radial mixed correction: archived CV/i uses gamma_i gamma_j gamma_k.
expected={}
for c,i in D:
    for j,k in combinations(range(9),2):
        for b in range(3):
            a,e=(b+1)%3,(b+2)%3
            for al in range(16):
                be,w=gamma_word((i,j,k),al)
                blade=t(al,c)^t(be,b)
                s=cliff(t(al,c),t(be,b))
                add(expected,(tuple(sorted((x(c,i),x(a,j),x(e,k)))),blade),w*s)
                add(expected,(tuple(sorted((x(c,i),x(e,j),x(a,k)))),blade),-w*s)
require_eq(radial,expected,'CV/i radial block')

# Negative controls: sign-reversed divergence; dropping radial mixed term;
# off-diagonal kinetic term omitted (B2 would vanish).
radial_kin={}
for e in D:
    out={}
    for d in D:
        if d!=e: accumulate(out,coordinate_times(A[d,e],x(*d)))
    radial_kin[e]=out
assert div and radial and any(radial_kin.values())
report={'kinetic_block_checks':len(A),'kinetic_symmetry_checks':len(A),
        'potential_polynomial_monomials':len(V),'cross_anticommutator_checks':len(C),
        'yukawa_divergence_terms':len(div),'radial_cv_terms':len(radial),
        'radial_b2_terms':sum(map(len,radial_kin.values())),
        'negative_controls':{'reverse_yukawa_sign':len(div),'omit_cv':len(radial),
                             'omit_b2':sum(map(len,radial_kin.values()))},
        'all_exact':True,'scope':'Abstract Clifford polynomial identities, not a kernel or physical-domain certificate'}
print(json.dumps(report,indent=2))
Path(__file__).with_name('results.json').write_text(json.dumps(report,indent=2)+'\n')
