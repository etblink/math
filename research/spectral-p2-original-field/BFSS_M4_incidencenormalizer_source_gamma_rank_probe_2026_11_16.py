#!/usr/bin/env python3
"""Finite incidence normalizer using literal SU2RealGammaProbe signed permutations.

SOURCE GAMMA SNAPSHOT blob b9b8192055c70f0d001d7982669b9823c55562ed.
Not a Lean theorem and not yet a full original BFSS Hamiltonian or physical
Source48Label/gauge-domain binding. Runs canonical independent control first.
Requires numpy and scipy.
"""
import numpy as np
from scipy.sparse import csr_matrix, vstack
import BFSS_M4_incidencenormalizer_canonical_rank_probe_2026_11_16 as control

# Literal Fin 9 -> Fin 16 -> Fin 16: private def perm, source row arrays.
perm=[
[9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6],
[11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4],
[14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1],
[10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5],
[12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3],
[15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0],
[13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2],
[8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7],
list(range(16))]
# Literal Fin 9 -> Fin 16 -> Int: private def sign, source row arrays.
sign=[
[1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,-1,1,-1,1],
[1,1,-1,-1,1,1,-1,-1,-1,-1,1,1,-1,-1,1,1],
[1,-1,-1,1,1,-1,-1,1,-1,1,1,-1,-1,1,1,-1],
[1,-1,-1,1,-1,1,1,-1,-1,1,1,-1,1,-1,-1,1],
[1,-1,1,-1,-1,1,-1,1,-1,1,-1,1,1,-1,1,-1],
[1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1],
[1,1,-1,-1,-1,-1,1,1,-1,-1,1,1,1,1,-1,-1],
[1]*16,
[1]*8+[-1]*8]

g=[]
for p,s in zip(perm,sign):
    m=np.zeros((16,16),dtype=np.int64)
    m[np.arange(16),p]=s
    g.append(m)
I16=np.eye(16,dtype=np.int64)
assert len(g)==9
assert all(np.array_equal(x,x.T) for x in g)
for i in range(9):
    for j in range(9):
        assert np.array_equal(g[i]@g[j]+g[j]@g[i],
            (2 if i==j else 0)*I16),(i,j)

Y=[np.kron(x,l) for x in g for l in control.color]
Urows=np.stack([control.coords(y) for y in Y])
assert np.array_equal(Urows@Urows.T,16*np.eye(27,dtype=np.int64))
U=csr_matrix(Urows)
M=vstack([16*control.ad_matrix(y)-U.T@(U@control.ad_matrix(y))
         for y in Y],format="csr")
Gram=M.T@M
I3=np.eye(3,dtype=np.int64)
z=[np.kron(g[i]@g[j],I3) for i in range(9) for j in range(i+1,9)]
z += [np.kron(I16,l) for l in control.color]
Z=np.stack([control.coords(x) for x in z],axis=1)
assert Z.shape==(1128,39)
assert np.count_nonzero(M@Z)==0
for p in (97,101,103,1009):
    rg=control.rank_mod(Gram,p)
    rz=control.rank_mod(Z,p)
    assert (rg,rz)==(1089,39),(p,rg,rz)
    print(f"SOURCE gamma GF({p}) Gram rank: {rg}; known generator rank: {rz}")
print("Exact source signed-permutation gamma normalizer nullity: 39")
print("NOT a Lean-qualified source-48 Fock lift or BFSS Hamiltonian theorem")
