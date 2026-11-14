#!/usr/bin/env python3
"""Exact finite controls for a prospective projection-fixedness contract.

This reproduces an explicitly derived counterexample; it is not a BFSS
source theorem, a new physical observation, or Lean qualification.
All arithmetic uses Python integers, with real matrices viewed over C.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

def eye(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]

def diag(entries):
    return [[entries[i] if i == j else 0 for j in range(len(entries))]
            for i in range(len(entries))]

def mul(a, b):
    assert len(a[0]) == len(b)
    return [[sum(a[i][k] * b[k][j] for k in range(len(b)))
             for j in range(len(b[0]))] for i in range(len(a))]

def star(a):
    # Every entry is an integer, so conjugate transpose is transpose.
    return [list(row) for row in zip(*a)]

def swap_first_two(n):
    s = eye(n)
    s[0], s[1] = s[1], s[0]
    return s

def conjugate(s, a):
    return mul(mul(s, a), star(s))

def weak_counterexample(name, u, p):
    n = len(p)
    s = swap_first_two(n)
    q = conjugate(s, p)
    observed = {
        "gauge_unitary": mul(star(u), u) == eye(n),
        "gauge_generator_involution": mul(u, u) == eye(n),
        "automorphism_implementer_unitary": mul(star(s), s) == eye(n),
        "automorphism_fixes_gauge_generator": conjugate(s, u) == u,
        "P_self_adjoint": star(p) == p,
        "P_idempotent": mul(p, p) == p,
        "P_has_gauge_fixed_output": mul(u, p) == p,
        "alpha_P_equals_P": q == p,
        "witness_T_has_gauge_fixed_output": mul(u, q) == q,
        "P_absorbs_witness_T": mul(p, q) == q,
    }
    assert all(observed[k] for k in [
        "gauge_unitary", "gauge_generator_involution",
        "automorphism_implementer_unitary", "automorphism_fixes_gauge_generator",
        "P_self_adjoint", "P_idempotent", "P_has_gauge_fixed_output",
        "witness_T_has_gauge_fixed_output"])
    assert not observed["alpha_P_equals_P"]
    assert not observed["P_absorbs_witness_T"]
    return {"name": name, "U": u, "P": p, "swap": s,
            "alpha_P_and_absorption_witness_T": q,
            "P_times_witness_T": mul(p, q), "observed": observed}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    weak = [
        weak_counterexample("trivial_SU2_representation_on_C2",
                            eye(2), diag([1, 0])),
        weak_counterexample("nontrivial_C2_group_representation_on_C3",
                            diag([1, 1, -1]), diag([1, 0, 0])),
    ]
    u, p, s = diag([1, 1, -1]), diag([1, 1, 0]), swap_first_two(3)
    assert conjugate(s, u) == u
    assert conjugate(s, p) == p
    assert p != eye(3) and p != diag([0, 0, 0])
    # Independent coordinate characterization: the fixed vectors of U are
    # exactly those with third coordinate zero, and P is identity there.
    fixed_coordinates = [i for i in range(3) if u[i][i] == 1]
    projection_coordinates = [i for i in range(3) if p[i][i] == 1]
    assert fixed_coordinates == projection_coordinates == [0, 1]
    result = {
        "classification": "EXACT_FINITE_ALGEBRAIC_CONTROLS_NOT_LEAN_QUALIFIED",
        "protocol": "E-TD-C1B-PROJ-CONTRACT-001",
        "arithmetic": "Python integers; conjugate transpose equals transpose",
        "weak_contract": "alpha fixes U; P*=P; P^2=P; U P=P",
        "weak_contract_verdict": "FALSIFIED_BY_EXPLICIT_COUNTEREXAMPLE",
        "missing_premise": "P projects onto the entire common fixed space, equivalently here the required universal left absorption",
        "counterexamples": weak,
        "positive_control": {
            "U": u, "P": p, "swap": s,
            "fixed_coordinates": fixed_coordinates,
            "projection_coordinates": projection_coordinates,
            "alpha_P_equals_P": conjugate(s, p) == p,
            "nonidentity_automorphism": s != eye(3),
            "nonzero_proper_projection": True,
        },
        "scope": "Refutes only the weakened generic contract. Original OP0/OP2b canonical range theorem supplies the missing premise. No accepted BFSS result is refuted.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print("PROJECTION_CONTRACT_EXACT_NEGATIVE_AND_POSITIVE_CONTROLS_PASS")

if __name__ == "__main__":
    main()
