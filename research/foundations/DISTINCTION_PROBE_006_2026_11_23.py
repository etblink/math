"""Three-path phase comparison: exact restricted-model witness and controls."""
from itertools import product, combinations
import sympy as s

pairs = list(combinations(range(3), 2))
signs = {tuple(a[i]*a[j] for i,j in pairs) for a in product((-1,1), repeat=3)}
assert len(signs) == 4
assert min(map(sum, signs)) == -1
# Any convex mixture of these four vertices obeys the same bound.
G = s.Matrix([[1, -s.Rational(1,2), -s.Rational(1,2)],
              [-s.Rational(1,2), 1, -s.Rational(1,2)],
              [-s.Rational(1,2), -s.Rational(1,2), 1]])
c = tuple(G[i,j] for i,j in pairs)
assert sum(c) == -s.Rational(3,2)
assert G.rank() == 2 and G.eigenvals() == {s.Rational(3,2):2, 0:1}
# Ordinary real two-component wave model with the same pair overlaps.
V = s.Matrix([[1, -s.Rational(1,2), -s.Rational(1,2)],
              [0, s.sqrt(3)/2, -s.sqrt(3)/2]])
assert V.T*V == G
# Complex scalar amplitudes; normalized pure quantum state.
a = s.Matrix([1, (-1+s.I*s.sqrt(3))/2, (-1-s.I*s.sqrt(3))/2])
rho = s.simplify(a*a.conjugate().T/3)
assert s.simplify(rho*rho-rho) == s.zeros(3)
assert rho.rank() == 1 and s.re(rho) == G/3
real_mixed = G/3
assert real_mixed.rank() == 2 and real_mixed.trace() == 1
assert real_mixed.eigenvals() == {s.Rational(1,2):2,0:1}
# Fixed intensity normalization: unnormalized subset energy, no renormalization.
I = {}
for mask in range(8):
    v = sum((a[i] for i in range(3) if mask & (1<<i)),s.S(0))
    I[mask] = s.simplify(v*s.conjugate(v))
I3 = I[7]-I[3]-I[5]-I[6]+I[1]+I[2]+I[4]-I[0]
assert I3 == 0
# Nonzero third-order term can be manufactured by changing the readout law.
J = {k:v**2 for k,v in I.items()}
assert J[7]-J[3]-J[5]-J[6]+J[1]+J[2]+J[4]-J[0] == 0
# A generic nonlinear example, with all amplitudes +1.
J = {k:k.bit_count()**4 for k in range(8)}
assert J[7]-J[3]-J[5]-J[6]+J[1]+J[2]+J[4]-J[0] == 36
# Real measurements cannot distinguish the complex pure state from its real part.
for i,j in pairs:
    E = s.zeros(3); E[i,j] = E[j,i] = 1
    assert s.simplify(s.trace(E*(rho-real_mixed))) == 0
# Imaginary antisymmetric Hermitian observable distinguishes them in complex QM.
Y=s.zeros(3); Y[0,1]=-s.I; Y[1,0]=s.I
contrast=s.simplify(s.trace(Y*(rho-real_mixed)))
assert contrast == s.sqrt(3)/3
print('sign correlation vertices:',sorted(signs))
print('restricted classical bound:',min(map(sum,signs)))
print('three-phase correlations:',c,'sum:',sum(c))
print('Gram spectrum:',G.eigenvals())
print('pure complex / mixed real ranks:',rho.rank(),real_mixed.rank())
print('subset intensities:',I,'I3:',I3)
print('imaginary observable contrast:',contrast)
print('all assertions passed')
