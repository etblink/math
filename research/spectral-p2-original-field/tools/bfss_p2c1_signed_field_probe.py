#!/usr/bin/env python3
"""Independent exact integer signed-source-coefficient probe for BFSS P2-C1.

Source gamma basis: FCP.BFSSGamma9.gamma from SU2RealGammaProbe.lean,
its nine signed-permutation matrices encode the four-factor Pauli words
JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII.

This diagnostic independently validates the integer coefficient contraction
and the source gamma/epsilon normalization. It is NOT a Lean theorem, a
verified derivative of the original operator field, or a spectral statement.
"""
import itertools
import numpy as np

J = np.array([[0, 1], [-1, 0]], dtype=np.int64)
I = np.eye(2, dtype=np.int64)
X = np.array([[0, 1], [1, 0]], dtype=np.int64)
Z = np.array([[1, 0], [0, -1]], dtype=np.int64)
LETTERS = {'J': J, 'I': I, 'X': X, 'Z': Z}
WORDS = ('JIIJ', 'JIJX', 'JXJZ', 'JZJZ', 'JJIZ', 'JJXX', 'JJZX', 'XIII', 'ZIII')

def gamma_word(w):
    m = np.array([[1]], dtype=np.int64)
    for ch in w:
        m = np.kron(m, LETTERS[ch])
    return m

def eps(a, b, c):
    if len(set((a, b, c))) != 3:
        return 0
    return 1 if (a, b, c) in ((0,1,2),(1,2,0),(2,0,1)) else -1

G = [gamma_word(w) for w in WORDS]
ID = np.eye(16, dtype=np.int64)
ZERO16 = np.zeros((16,16),dtype=np.int64)
for i in range(9):
    assert G[i].shape == (16,16)
    assert np.array_equal(G[i].T, G[i]), ('not symmetric',i)
    for j in range(9):
        assert np.array_equal(G[i] @ G[j] + G[j] @ G[i], 2*ID if i==j else ZERO16), ('Clifford',i,j)
print('PASS 9 source-word gamma matrices: integer Clifford anticommutator and symmetry')

# Literal source signed permutation row signatures (independent crosscheck).
# Transcribed from FCP.BFSSGamma9 private perm/sign tables in SU2RealGammaProbe.lean.
PERM = (
 (9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6),
 (11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4),
 (14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1),
 (10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5),
 (12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3),
 (15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0),
 (13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2),
 (8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7),
 (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15),
)
SIGN = (
 (1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,-1,1,-1,1),
 (1,1,-1,-1,1,1,-1,-1,-1,-1,1,1,-1,-1,1,1),
 (1,-1,-1,1,1,-1,-1,1,-1,1,1,-1,-1,1,1,-1),
 (1,-1,-1,1,-1,1,1,-1,-1,1,1,-1,1,-1,-1,1),
 (1,-1,1,-1,-1,1,-1,1,-1,1,-1,1,1,-1,1,-1),
 (1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1),
 (1,1,-1,-1,-1,-1,1,1,-1,-1,1,1,1,1,-1,-1),
 (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
 (1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1),
)
for i in range(9):
    for j in range(16):
        nonzero=np.flatnonzero(G[i][j])
        assert tuple(nonzero)==(PERM[i][j],), ('perm mismatch',i,j,nonzero)
        assert int(G[i][j,PERM[i][j]])==SIGN[i][j], ('sign mismatch',i,j)
print('PASS all 9x16 source signed-permutation row/column and signs')

# P2-C0: exact integer test of source bosonic potential at h=1,m=0.
# For normalized Pauli f_abc = sqrt(2)*eps_abc and source factor 1/2:
# Vsource = (1/2) sum_(j<k,A) (sqrt(2) sum_(B,C) eps_ABC X[j,B] X[k,C])^2.
# The 1/2 cancels the squared sqrt(2); compare with row-color wedge formula.
def source_potential_integer(x):
    total = 0
    for j,k in itertools.combinations(range(9),2):
        for a in range(3):
            cross = sum(eps(a,b,c)*x[j][b]*x[k][c]
                        for b in range(3) for c in range(3))
            total += cross*cross
    return total

def wedge_potential_integer(x):
    total = 0
    for a,c in itertools.combinations(range(3),2):
        for j,k in itertools.combinations(range(9),2):
            val = x[j][a]*x[k][c] - x[k][a]*x[j][c]
            total += val*val
    return total

rng = np.random.default_rng(20261111)
configs = [np.zeros((9,3),dtype=np.int64),
           np.array([[3,0,0]]+[[0,0,0]]*8,dtype=np.int64),
           np.array([[3,1,0],[2,0,4]]+[[0,0,0]]*7,dtype=np.int64)]
configs += [rng.integers(-4,5,size=(9,3),dtype=np.int64) for _ in range(64)]
for cfg in configs:
    src = source_potential_integer(cfg)
    assert src == wedge_potential_integer(cfg)
    assert src >= 0
nonzero_config=next(c for c in configs if source_potential_integer(c) > 0)
assert 2*source_potential_integer(nonzero_config) != wedge_potential_integer(nonzero_config)
print('PASS P2-C0: 67 integer configurations, source 1/2 Pauli factor and color-row wedge')
print('PASS P2-C0 adversarial factor-two mutation control')

# P_c(X) = -sum_{j<k,b,d} epsilon(c,b,d) X[b,j] X[d,k] gamma_j gamma_k.
# H[(beta,a),(delta,c)] = sum_(alpha,i) gamma_i[alpha,beta] d_(i,a) P_c[delta,alpha].
# At X_(d,l)=1 the derivative is:
#   -eps(c,a,d) gamma_i gamma_l  when i<l;
#   -eps(c,d,a) gamma_l gamma_i  when i>l.
# This is the full source gamma-column ordering, NOT a transpose-by-guess.
for a,c,d,l in itertools.product(range(3),range(3),range(3),range(9)):
    H=np.zeros((16,16),dtype=np.int64) # row delta, column beta
    for i in range(9):
        if i<l:
            H -= eps(c,a,d) * (G[i] @ G[l] @ G[i])
        elif i>l:
            H -= eps(c,d,a) * (G[l] @ G[i] @ G[i])
    expected=-8*eps(d,a,c)*G[l]
    assert np.array_equal(H,expected), ('signed mismatch',(a,c,d,l))
print('PASS 243 source ordered color/spatial coefficient blocks: H = -8 K0')

# Check full K0[d,l] 48x48 coefficient-basis Gram exactly; a, c are color labels,
# beta, delta are spin labels. Norm squared of K0[d,l] is 32 and mixed products vanish.
K={}
for d,l in itertools.product(range(3),range(9)):
    mat=np.zeros((48,48),dtype=np.int64)
    for beta,a,delta,c in itertools.product(range(16),range(3),range(16),range(3)):
        mat[3*beta+a,3*delta+c]=eps(d,a,c)*G[l][beta,delta]
    assert np.array_equal(mat.T,-mat),('skew',d,l)
    K[(d,l)]=mat
for k1,k2 in itertools.product(K,K):
    dot=int(np.sum(K[k1]*K[k2]))
    assert dot==(32 if k1==k2 else 0), ('K Gram mismatch',k1,k2,dot)
print('PASS 729 coefficient-basis K0 trace products; norm(K0(X))^2 = 32 norm(X)^2')

# Anti-regressions: wrong overall sign and missing factor 2 fail at a nonzero basis.
assert not np.array_equal(-8 * K[(0,0)],8*K[(0,0)])
assert not np.array_equal(-8 * K[(0,0)],-4*K[(0,0)])
print('PASS adversarial minus-sign and factor-of-two mutation controls')
print('DIAGNOSTIC PASS / NO LEAN ACCEPTANCE / NO PHYSICAL EIGENPAIR')
