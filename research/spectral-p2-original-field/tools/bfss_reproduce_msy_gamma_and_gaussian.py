from pathlib import Path
import itertools
import re
import sys

import numpy as np
from scipy import integrate, special

source = Path(sys.argv[1]).read_text()

def table(lean_name):
    body = re.search(r"private def " + lean_name + r" :.*?\n(.*?)(?:\n\n|\Z)", source, re.S)[1]
    return np.array([list(map(int, re.findall(r"-?\d+", s)))
                     for s in re.findall(r"!\[(.*?)\]", body, re.S)])

perm, sign = table("perm"), table("sign")
assert perm.shape == sign.shape == (9, 16)
S = np.zeros((9, 16, 16), dtype=np.int64)
S[np.arange(9)[:, None], np.arange(16), perm] = sign

I2 = np.eye(2, dtype=np.int64)
X = np.array([[0, 1], [1, 0]])
Y = np.array([[0, -1j], [1j, 0]])
Z = np.diag([1, -1])
J = np.array([[0, 1], [-1, 0]])

def E(a, b):
    m = np.zeros((4, 4), dtype=np.int64)
    m[a - 1, b - 1] = 1
    m[b - 1, a - 1] = -1
    return m

rho = [E(1, 2)+E(3, 4), 1j*(E(1, 2)-E(3, 4)),
       E(1, 3)-E(2, 4), 1j*(E(1, 3)+E(2, 4)),
       E(1, 4)+E(2, 3), 1j*(E(1, 4)-E(2, 3))]
external = []
for h in [X, Y, -Z]:
    H = np.kron(np.eye(4, dtype=np.int64), h)
    external.append(np.kron(H.real, I2) - np.kron(H.imag, J))
for r in rho:
    B = np.kron(r, J)
    external.append(np.kron(B.real, Z) + np.kron(B.imag, X))
A = np.array(external, dtype=np.int64)
I16 = np.eye(16, dtype=np.int64)
for g in [S, A]:
    assert np.array_equal(g, g.transpose(0, 2, 1))
    for i, j in itertools.product(range(9), repeat=2):
        assert np.array_equal(g[i] @ g[j] + g[j] @ g[i], 2*(i == j)*I16)

def orientation(g):
    v = I16
    for m in g:
        v = v @ m
    scalar = v[0, 0].item()
    assert abs(scalar) == 1 and np.array_equal(v, scalar*I16)
    return scalar

s, a = orientation(S), orientation(A)
print("Ordered Clifford products (source, Appendix A):", s, a)
flip = np.ones(9, dtype=np.int64)
flip[8] = s * a
print("Spatial axis signs:", flip.tolist())

# The nine involutions M -> flip_i A_i M S_i commute. Their
# common +1 projection, with integer scale, yields an intertwiner.
def intertwiner(spatial_signs):
    for i, j in itertools.product(range(16), repeat=2):
        p = np.zeros((16, 16), dtype=np.int64)
        p[i, j] = 1
        for k in range(9):
            p = p + spatial_signs[k] * (A[k] @ p @ S[k])
        if np.any(p):
            common = np.gcd.reduce(np.abs(p.ravel()))
            return p // common
    return None

P = intertwiner(flip)
assert P is not None
c = (P.T @ P)[0, 0].item()
assert c > 0
assert np.array_equal(P.T @ P, c * I16)
assert np.array_equal(P @ P.T, c * I16)
for k in range(9):
    assert np.array_equal(A[k] @ P, flip[k] * P @ S[k])
print("P.T @ P scalar:", c, "nonzero entries:", np.count_nonzero(P))
print("P =", P.tolist())
# A common consecutive-pair complex structure on each color's Majoranas.
pairing = np.kron(np.eye(8, dtype=np.int64), J)
anti_numerator = P + pairing @ P @ pairing
anti_gram = anti_numerator.T @ anti_numerator
gram_scale = 4*c
assert np.array_equal(anti_gram @ anti_gram, gram_scale * anti_gram)
assert np.trace(anti_gram) == 8*gram_scale
print("Pairing anti-linear Gram projector: real rank 8, complex rank 4 per color")
if s != a:
    assert intertwiner(np.ones(9, dtype=np.int64)) is None
    print("Orientation-preserving identity-axis control: no nonzero intertwiner")
else:
    bad = flip.copy()
    bad[8] *= -1
    assert intertwiner(bad) is None
    print("Single-axis reversal control: no nonzero intertwiner")

# Dimensionless isotropic Gaussian gauge-singlet control.
# Density is (alpha/pi)^(d/2) exp(-alpha*R^2).
d = 27
alpha = np.cbrt(16.0)
radius = 6.0
gamma_const = special.gamma(d / 2)

def mass_density(z):
    return np.exp((d/2-1)*np.log(z)-z)/gamma_const if z else 0.0

ball_quad, _ = integrate.quad(mass_density, 0, alpha*radius**2)
ball_cdf = special.gammainc(d/2, alpha*radius**2)
assert abs(ball_cdf-ball_quad) < 3e-12
moment = 27/(2*alpha)
energy = 27*alpha/4 + 54/alpha**2
aux = 783/8 + 837/alpha**3
residual = np.sqrt(16*energy)
for key, val in [("Gaussian alpha", alpha), ("E", energy), ("charge norm", residual),
                 ("weighted charge energy", aux), ("R^2 moment", moment),
                 ("ball probability", ball_cdf),
                 ("ball probability quadrature", ball_quad),
                 ("ball tail probability", special.gammaincc(d/2, alpha*radius**2))]:
    print(f"{key}: {val:.15g}")

if len(sys.argv) > 2:
    from fractions import Fraction
    import json
    state = json.loads(Path(sys.argv[2]).read_text())
    row = state["basis"][0]
    seed = next(s for s in state["seeds"]["seeds"] if s["name"] == "S")
    assert seed["degree"] == 0 and row["seed"] == "S" and row["power"] == 0
    assert row["invariant"] == [0, 0, 0]
    profile = row["profile"]
    assert profile["kind"] == "projected_gaussian"
    a, b = (float(Fraction(profile[k])) for k in ["a", "b"])
    I = np.eye(3)
    n = np.array([1, 0, 0])
    Mn = a*I-(a-b)*np.outer(n, n)

    def mixed(t):
        m = np.array([t, np.sqrt(1-t*t), 0])
        Mm = a*I-(a-b)*np.outer(m, m)
        K = (Mn+Mm)/2
        exact_det_formula = a*((a+b)**2-(a-b)**2*t*t)/4
        assert np.isclose(np.linalg.det(K), exact_det_formula, atol=1e-13, rtol=0)
        cov = np.linalg.inv(K)/2
        weight = exact_det_formula**(-4.5)
        moment = 9*np.trace(cov)
        kinetic = 4.5*np.trace(Mn @ Mm @ cov)
        potential = 36*(np.trace(cov)**2-np.trace(cov @ cov))
        return weight*np.array([1, moment, kinetic, potential])

    weighted_integrals, err = integrate.quad_vec(mixed, 0, 1, epsabs=1e-13, epsrel=1e-12)
    norm, mom, kin, pot = weighted_integrals/weighted_integrals[0]
    z = np.pi**(27/2)*weighted_integrals[0]
    assert abs(mixed(1)[3]/mixed(1)[0] - (
        36*((1/(2*b)+1/a)**2-((1/(2*b))**2+2*(1/(2*a))**2)))) < 1e-12
    print(f"External raw basis row 0 (a={a}, b={b}, unit constant spinor)")
    for key,val in [("squared norm",z),("R^2 moment",mom),("kinetic",kin),
                    ("quartic",pot),("ordinary E",kin+pot),
                    ("native-style charge norm",np.sqrt(16*(kin+pot))),
                    ("ball R=6 probability lower bound",1-mom/36),
                    ("quadrature error estimate, unscaled",err)]:
        print(f"{key}: {val:.15g}")

if len(sys.argv) > 3:
    lean_candidate = Path(sys.argv[3]).read_text()

    def candidate_rows(name):
        body = re.search(r"private def " + name + r" :.*?\n(.*?)(?:\n\n|\Z)",
                         lean_candidate, re.S)[1]
        return np.array([list(map(int, re.findall(r"-?\d+", row)))
                         for row in re.findall(r"!\[([^\[\]]*)\]", body, re.S)])

    external_perm = np.argmax(np.abs(A), axis=2)
    external_sign = A[np.arange(9)[:, None], np.arange(16), external_perm]
    assert np.array_equal(candidate_rows("appendixPerm"), external_perm)
    assert np.array_equal(candidate_rows("appendixSign"), external_sign)
    assert np.array_equal(candidate_rows("basisInt"), P)
    assert np.array_equal(candidate_rows("sourcePerm"), perm)
    assert np.array_equal(candidate_rows("sourceSign"), sign)
    print("Lean certificate tables match the independent source and Appendix A calculation")
