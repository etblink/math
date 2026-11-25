"""Exact source-normalized plane central action and spinor Cartan audit.
Integer signed permutations and Gaussian-integer matrix pairs only.
No full Fock expansion, no numerical eigensolver or phase convention fit.
"""
from itertools import combinations, product
from pathlib import Path
import json
import numpy as np

WORDS = 'JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split()
I = np.eye(16, dtype=object)
Z = np.zeros((16, 16), dtype=object)
G = []
for word in WORDS:
    f = sum(1 << (3-k) for k,c in enumerate(word) if c in 'JX')
    s = sum(1 << (3-k) for k,c in enumerate(word) if c in 'JZ')
    M = Z.copy()
    for i in range(16): M[i, i^f] = (-1)**((i&s).bit_count())
    G.append(M)

def eq(a,b):
    assert np.array_equal(a,b)

def packed_label(i,a):
    return 2*(3*(i//2)+a)+i%2

def mul_blade(a,b):
    sign=1
    while a:
        bit=a&-a
        if (b&(bit-1)).bit_count()%2: sign=-sign
        a ^= bit
    return sign

planes=[]
for r,s in combinations(range(9),2):
    M=G[r]@G[s]
    eq(M.T,-M); eq(M@M,-I)
    pairs=[]
    for i,a in product(range(16),range(3)):
        nz=np.flatnonzero(M[i])
        assert len(nz)==1
        j=int(nz[0]); w=int(M[i,j]); assert w in (-1,1) and i!=j
        p,q=packed_label(i,a),packed_label(j,a)
        if p<q: pairs.append((p,q,w))
    assert len(pairs)==24 and sorted(k for p,q,w in pairs for k in (p,q))==list(range(48))
    # exp(2*pi*(w/4)*t_p*t_q) = w*t_p*t_q. All factors commute.
    mask=0; sign=1
    for p,q,w in pairs:
        b=(1<<p)|(1<<q)
        sign*=w*mul_blade(mask,b)
        mask^=b
    assert mask==(1<<48)-1 and sign==1
    # The full ordered blade is product over 24 modes of i*(1-2n).
    # i**24=1, hence exactly occupation parity. Squaring is identity.
    assert mul_blade(mask,mask)==1
    # Incorrect doubled scale gives exp(pi*w*t_p*t_q)=-I per pair.
    assert (-1)**len(pairs)==1 and mask!=0
    planes.append({'plane':[r,s],'pairs':len(pairs),'central_blade_sign':sign,
                   'central_blade_mask':hex(mask),'doubled_scale_blade_mask':'0x0'})

# Four disjoint generators; J = (H_0+...+H_3)/2, H_k=-i gamma_r gamma_s.
C=[G[r]@G[s] for r,s in [(0,1),(2,3),(4,5),(6,7)]]
for a in C: eq(a.T,-a);eq(a@a,-I)
for a,b in combinations(C,2): eq(a@b,b@a)

def mm(a,b):
    r,i=a;s,j=b
    return (r@s-i@j,r@j+i@s)

def same(a,b):
    eq(a[0],b[0]);eq(a[1],b[1])

P=[]; weights=[]
for signs in product((-1,1),repeat=4):
    # numerator of the product of four half-projectors.
    p=(I.copy(),Z.copy())
    for sign,a in zip(signs,C): p=mm(p,(I,-sign*a))
    same(mm(p,p),(16*p[0],16*p[1]))
    same(p,(p[0].T,-p[1].T))
    assert int(np.trace(p[0]))==16 and int(np.trace(p[1]))==0
    for s,a in zip(signs,C): same(mm((Z,-a),p),(s*p[0],s*p[1]))
    P.append(p);weights.append({'signs':list(signs),'twice_J_weight':sum(signs),'rank':1})
for p,q in combinations(P,2): same(mm(p,q),(Z,Z))
same((sum((p[0] for p in P),Z.copy()),sum((p[1] for p in P),Z.copy())),(16*I,Z))
# Trace of every nonempty Cartan product: zero even word trace.
for sel in product((0,1),repeat=4):
    a=I.copy()
    for b,c in zip(sel,C):
        if b:a=a@c
    assert int(np.trace(a))==(16 if not any(sel) else 0)
result={'plane_matchings':len(planes),'central_parity_matches':len(planes),
        'four_pi_identity_checks':len(planes),'doubled_normalization_controls':len(planes),
        'cartan_commutators':6,'cartan_product_trace_checks':16,
        'joint_projector_rank_checks':len(P),'joint_projector_idempotency_checks':len(P),
        'joint_projector_orthogonality_checks':120,'joint_weight_checks':64,
        'highest_weight_rank':sum(w['rank'] for w in weights if w['twice_J_weight']==4),
        'weights':weights,'planes':planes,'all_exact':True,
        'scope':'Finite Clifford and spinor coefficient audit; analytical global vector action and operator closures are not Lean-qualified.'}
print(json.dumps({k:v for k,v in result.items() if k not in ('planes','weights')},indent=2))
Path(__file__).with_name('results.json').write_text(json.dumps(result,indent=2)+'\n')
