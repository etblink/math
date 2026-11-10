#!/usr/bin/env python3
"""Reproducible BFSS finite-Fock forward checks, 2026-11-09.

Source assumptions: original G3C/G4A gauge orbitals are eight copies of
the complexified SU(2) adjoint (spin-one) representation. This is not a
Lean qualification receipt. Random matrices below are NOT source
Spin(9) matrices. Standard library suffices for the exact calculations;
use --matrix-check for optional NumPy/SciPy adversarial numeric tests.
"""
from collections import defaultdict
from itertools import combinations
from math import comb, cos, fsum, pi, sin
import argparse


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def spin_multiplicities(blocks=8):
    """Clebsch-Gordan recursion for (2 V_0 + 2 V_1)^tensor8."""
    old = {0: 1}
    for _ in range(blocks):
        new = defaultdict(int)
        for j, m in old.items():
            new[j] += 2*m
            for k in range(abs(j-1), j+2):
                new[k] += 2*m
        old = dict(new)
    return old


def singlets_in_fermion_degree(k):
    """[q^0 - q^1][t^k](1+t)^8(1+tq)^8(1+t/q)^8."""
    return sum(
        choose(8, a)**2 * choose(8, k-2*a)
        - choose(8, a+1)*choose(8, a)*choose(8, k-2*a-1)
        for a in range(9)
    )


def haar_su2_simpson(steps=8192):
    """Independent SU(2) Weyl integral of det(1+Ad_g)^8."""
    assert steps % 2 == 0
    h = pi / steps
    def f(i):
        psi = i*h
        return 2/pi*sin(psi)**2 * 2**24*cos(psi)**16
    return h/3 * fsum(
        (1 if i in (0, steps) else 4 if i % 2 else 2)*f(i)
        for i in range(steps+1)
    )


def matrix_negative_controls():
    import numpy as np
    from scipy.linalg import expm
    from scipy.spatial.transform import Rotation

    rng = np.random.default_rng(20261109)
    raw = rng.normal(size=(16, 16))
    r_spin = expm((raw-raw.T)/4)
    r_color = Rotation.random(random_state=rng).as_matrix()
    P = np.zeros((48, 48))
    # G1A exact source labeling: (j,color,r) -> 2*(3*j+color)+r.
    for A in range(3):
        for j in range(8):
            for r in range(2):
                P[2*(3*j+A)+r, 16*A+2*j+r] = 1
    assert np.linalg.norm(P.T@P-np.eye(48)) < 1e-10
    spin = P @ np.kron(np.eye(3), r_spin) @ P.T
    gauge = P @ np.kron(r_color, np.eye(16)) @ P.T
    wrong_gauge = np.kron(r_color, np.eye(16))
    good = np.linalg.norm(spin@gauge-gauge@spin)
    bad = np.linalg.norm(spin@wrong_gauge-wrong_gauge@spin)
    assert good < 1e-10 and bad > 1e-2

    # Genuine 3-mode exterior/minor construction, not full 24-mode Fock.
    subsets = [s for k in range(4) for s in combinations(range(3), k)]
    U = np.zeros((8, 8))
    for i, row in enumerate(subsets):
        for j, col in enumerate(subsets):
            if len(row) == len(col):
                U[i, j] = np.linalg.det(r_color[np.ix_(row, col)]) if row else 1
    parity = np.diag([(-1)**len(s) for s in subsets])
    bits = [sum(1<<m for m in s) for s in subsets]
    pos = {b: i for i, b in enumerate(bits)}
    gammas = []
    for mode in range(3):
        creator = np.zeros((8, 8), dtype=complex)
        for b, i in pos.items():
            if not b & (1<<mode):
                dest = b | (1<<mode)
                creator[pos[dest], i] = (-1)**((b & ((1<<mode)-1)).bit_count())
        gammas += [creator+creator.conj().T, 1j*(creator-creator.conj().T)]
    car = max(np.linalg.norm(gammas[i]@gammas[j]+gammas[j]@gammas[i]
        -(2 if i==j else 0)*np.eye(8)) for i in range(6) for j in range(6))
    odd = max(np.linalg.norm(parity@g@parity+g) for g in gammas)
    gauge_parity = np.linalg.norm(U@parity-parity@U)
    assert car < 1e-10 and odd < 1e-10 and gauge_parity < 1e-10
    print(f"NUMERIC correctly transported 48-label commutator: {good:.6g}")
    print(f"NUMERIC wrong-label negative control commutator: {bad:.6g}")
    print(f"NUMERIC 3-mode CAR, parity, gauge-parity residuals: {car:.3g}, {odd:.3g}, {gauge_parity:.3g}")


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--matrix-check", action="store_true", help="requires NumPy/SciPy")
    args = ap.parse_args()
    m = spin_multiplicities()
    # Independent ungraded spin character:
    expected = {j:256*(choose(16,8-j)-choose(16,7-j)) for j in range(9)}
    graded = [singlets_in_fermion_degree(k) for k in range(25)]
    assert m == expected
    assert sum((2*j+1)*n for j,n in m.items()) == 2**24
    assert m[0] == sum(graded) == 366080 == 256*1430
    assert graded == graded[::-1] and all(x>=0 for x in graded)
    assert sum(graded[::2]) == sum(graded[1::2]) == 183040
    assert min(j*(j+1) for j,n in m.items() if j>0 and n) == 2
    integral = haar_su2_simpson()
    assert abs(integral-366080) < 1e-6

    print("CONDITIONAL ORIGINAL-SOURCE SU(2) REPRESENTATION CALCULATIONS")
    print("Original Fock full dimension:", 2**24)
    print("Gauge singlets / Catalan(8) factor:", m[0], 256*1430)
    print("Even, odd gauge singlets:", sum(graded[::2]), sum(graded[1::2]))
    print("SU(2) spin-j multiplicity:", dict(sorted(m.items())))
    print("SU(2) sector dimensions:", {j:(2*j+1)*m[j] for j in sorted(m)})
    print("Fermion-number singlets k=0..24:", graded)
    print("Standard gauge Casimir smallest positive eigenvalue:", 2)
    print("Independent numeric Haar integral:", format(integral, ".9f"))
    print("Conditional Fock-vector weights: [-6,+6]; operator weight differences: [-12,+12]")
    print("Unrestricted Fock parity trace:", sum(choose(24,k)*(-1)**k for k in range(25)))
    if args.matrix_check:
        matrix_negative_controls()


if __name__ == "__main__":
    main()
