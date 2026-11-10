#!/usr/bin/env python3
"""Exact finite-arithmetic checks for SU(2)-adjoint/Spin(8) feasibility.

Not a BFSS source-specific Lean theorem, experimental claim, GUT construction,
or qualified proof of a Spin(8) subgroup of the original source stabilizer.
The J matrices and quarter-turn rotations are the standard real SO(3)
adjoint model; source G3A identification must be proved separately.
Python 3 standard library only; no numerical floating-point thresholds.
"""
from fractions import Fraction


J1 = ((0, 0, 0), (0, 0, -1), (0, 1, 0))
J2 = ((0, 0, 1), (0, 0, 0), (-1, 0, 0))
J3 = ((0, -1, 0), (1, 0, 0), (0, 0, 0))
RX90 = ((1, 0, 0), (0, 0, -1), (0, 1, 0))
RY90 = ((0, 0, 1), (0, 1, 0), (-1, 0, 0))


def commutant_equations(generators):
    """Coefficient rows for [G,X]=0, with 9 unknown X_(a,b)."""
    rows = []
    for g in generators:
        for i in range(3):
            for j in range(3):
                rows.append([
                    (g[i][a] if b == j else 0)
                    - (g[b][j] if i == a else 0)
                    for a in range(3) for b in range(3)
                ])
    return rows


def exact_rank(rows):
    """Gaussian elimination in Q; no float/approximate comparisons."""
    a = [[Fraction(x) for x in row] for row in rows]
    m, n = len(a), len(a[0])
    pivot_row = 0
    for col in range(n):
        piv = next((i for i in range(pivot_row, m) if a[i][col]), None)
        if piv is None:
            continue
        a[pivot_row], a[piv] = a[piv], a[pivot_row]
        factor = a[pivot_row][col]
        a[pivot_row] = [x / factor for x in a[pivot_row]]
        for i in range(m):
            if i != pivot_row and a[i][col]:
                k = a[i][col]
                a[i] = [x - k*y for x, y in zip(a[i], a[pivot_row])]
        pivot_row += 1
        if pivot_row == m:
            break
    return pivot_row


def center_traces(multiplicity):
    """Traces of the three nonidentity central elements on Spin(8) 8s."""
    signs = {
        "8v": (+1, -1, -1),
        "8s": (-1, +1, -1),
        "8c": (-1, -1, +1),
    }
    return tuple(
        8 * sum(multiplicity.get(rep, 0) * sign[k]
                for rep, sign in signs.items())
        for k in range(3)
    )


def main():
    lie = commutant_equations((J1, J2, J3))
    rotations = commutant_equations((RX90, RY90))
    assert len(lie) == 27 and len(rotations) == 18
    assert exact_rank(lie) == 8
    assert exact_rank(rotations) == 8

    # Identity is in the exact kernel, and rank 8 gives no other direction.
    identity_vector = (1, 0, 0, 0, 1, 0, 0, 0, 1)
    assert all(sum(x*y for x, y in zip(row, identity_vector)) == 0
               for row in lie + rotations)
    print("SU2_ADJOINT_REAL_COMMUTANT: rank 8/9, kernel = R * I3")
    print("FINITE_TWO_QUARTERTURN_WITNESSES: rank 8/9")

    # Consequence of End_SU2(R3 ⊗ R16) = I3 ⊗ End(R16):
    ranks = tuple(3*k for k in range(17))
    assert 16 not in ranks and 24 in ranks and 48 in ranks
    print("GAUGE_INVARIANT_REAL_SOURCE_RANKS: multiples of 3 (0..48)")
    print("RANK_16_BLOCK_OBSTRUCTED; RANK_24_PLUS_24_ALLOWED")

    # Spin(8) center character order: z_v, z_s, z_c.
    original = {"8v": 0, "8s": 3, "8c": 3}
    balanced = {"8v": 2, "8s": 2, "8c": 2}
    assert center_traces(original) == (-48, 0, 0)
    assert center_traces(balanced) == (-16, -16, -16)
    print("ORIGINAL_3S_PLUS_3C_CENTER_TRACES:", center_traces(original))
    print("TRIALITY_BALANCED_2V_PLUS_2S_PLUS_2C_TRACES:",
          center_traces(balanced))

    twisted = (
        ("8s", "8c"),
        ("8c", "8v"),
        ("8v", "8s"),
    )
    signatures = [center_traces({k: pair.count(k)
                                for k in ("8v", "8s", "8c")})
                  for pair in twisted]
    assert signatures == [(-16, 0, 0), (0, -16, 0), (0, 0, -16)]
    assert len(set(signatures)) == 3
    print("THREE_DIFFERENT_TWISTED_BLOCK_SIGNATURES:", signatures)
    print("TRIALITY_TWISTS_CANNOT_BE_INTERTWINED_BY_UNBROKEN_COLOR_SU2")

    print("FINITE_EXACT_CHECK_PASS — not source-Lean or physical qualification")


if __name__ == "__main__":
    main()
