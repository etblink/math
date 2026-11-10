#!/usr/bin/env python3
"""Candidate-neutral exact-arithmetic feasibility checks for SM/GUT global structure.

Status: EXPLORATORY / reproducible finite arithmetic, NOT a Lean theorem,
not a source-derived physical-realization bridge and not empirical evidence.
No external dependencies, no source imports, no repository writes.
All fermions are left-handed Weyl fields; hypercharge is Y, with n = 6Y.
"""

from dataclasses import dataclass
from fractions import Fraction
from math import comb

@dataclass(frozen=True)
class Field:
    name: str
    color_triality: int  # 0 singlet, 1 triplet, 2 antitriplet
    weak_parity: int     # 0 singlet, 1 doublet
    hypercharge: Fraction
    color_dim: int
    weak_dim: int
    color_cubic_sign: int  # +1 for triplet, -1 for antitriplet, 0 singlet

FIELDS = (
    Field("Q", 1, 1, Fraction(1, 6), 3, 2, 1),
    Field("u^c", 2, 0, Fraction(-2, 3), 3, 1, -1),
    Field("d^c", 2, 0, Fraction(1, 3), 3, 1, -1),
    Field("L", 0, 1, Fraction(-1, 2), 1, 2, 0),
    Field("e^c", 0, 0, Fraction(1), 1, 1, 0),
    Field("nu^c", 0, 0, Fraction(0), 1, 1, 0),
)
HIGGS = Field("H", 0, 1, Fraction(1, 2), 1, 2, 0)

def charge_number(field: Field) -> int:
    n = 6 * field.hypercharge
    assert n.denominator == 1, (field.name, n)
    return int(n)

def z6_residue(field: Field) -> int:
    return (2 * field.color_triality + 3 * field.weak_parity + charge_number(field)) % 6

def anomaly_coefficients(fields=FIELDS):
    return {
        "SU3_cubic": sum(f.weak_dim * f.color_cubic_sign for f in fields),
        "SU3_squared_U1": sum(
            Fraction(f.weak_dim, 2) * f.hypercharge
            for f in fields if f.color_dim == 3
        ),
        "SU2_squared_U1": sum(
            Fraction(f.color_dim, 2) * f.hypercharge
            for f in fields if f.weak_dim == 2
        ),
        "U1_cubic": sum(
            f.color_dim * f.weak_dim * f.hypercharge ** 3 for f in fields
        ),
        "gravity_squared_U1": sum(
            f.color_dim * f.weak_dim * f.hypercharge for f in fields
        ),
        "SU2_global_doublet_parity": (
            sum(f.color_dim for f in fields if f.weak_dim == 2) % 2
        ),
    }

def main():
    print("SM field | t | weak parity | n=6Y | Z6 residue")
    for f in FIELDS + (HIGGS,):
        n = charge_number(f)
        print(f"{f.name:5} | {f.color_triality} | {f.weak_parity} | {n:+3} | {z6_residue(f)}")
        assert z6_residue(f) == 0, f.name

    anomalies = anomaly_coefficients()
    print("\nOne generation + sterile nu^c, exact anomaly coefficients:")
    for name, value in anomalies.items():
        print(f"  {name} = {value}")
        assert value == 0, name

    print("\nSpin(10) chiral-spinor exterior powers of C^5:")
    even = [(k, comb(5, k)) for k in (0, 2, 4)]
    odd = [(k, comb(5, k)) for k in (1, 3, 5)]
    print(f"  even: {even} -> {sum(dim for _, dim in even)}")
    print(f"  odd: {odd} -> {sum(dim for _, dim in odd)}")
    assert even == [(0, 1), (2, 10), (4, 5)]
    assert sum(dim for _, dim in even) == 16
    assert sum(dim for _, dim in odd) == 16

    # Negative controls: Z6 compatibility is necessary for this global
    # quotient representation, but neither selects the SM uniquely nor
    # forces chiral matter.
    arbitrary_singlet = Field("non-SM singlet Y=1/6", 0, 0, Fraction(1, 6), 1, 1, 0)
    assert z6_residue(arbitrary_singlet) == 1
    exotic = Field("vectorlike extra 3", 1, 0, Fraction(-1, 3), 3, 1, 1)
    exotic_bar = Field("vectorlike extra 3bar", 2, 0, Fraction(1, 3), 3, 1, -1)
    assert z6_residue(exotic) == z6_residue(exotic_bar) == 0
    assert all(v == 0 for v in anomaly_coefficients((exotic, exotic_bar)).values())
    print("\nNegative controls:")
    print("  non-SM singlet Y=1/6: Z6 residue 1 (excluded under full quotient)")
    print("  additional vectorlike triplet + antitriplet: Z6 residues 0 and 0; anomalies 0")
    print("  therefore global quotient compatibility + anomalies do NOT uniquely force SM matter.")
    print("\nEXACT_ARITHMETIC_CHECK_PASS — NOT PHYSICAL_UNIFICATION_PROOF")

if __name__ == "__main__":
    main()
