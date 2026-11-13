#!/usr/bin/env python3
"""Pinned source 48x48 fermion-field sharp-constant research, NOT Lean proof.

Requires Python 3, NumPy; SymPy optional (adds exact symbolic 12x12 test).
Run from a full etblink/math checkout:
  python3 research/spectral-p2-original-field/tools/audit_source_fermion_sharp_constant.py
  python3 research/spectral-p2-original-field/tools/audit_source_fermion_sharp_constant.py --output /tmp/sharp-receipt.json

This script works on the finite signed-coefficient matrix K0, NOT a
constructed 2^24 Fock-space operator. A strong test of a proposed
source polynomial identity is not its universal Lean proof; the source
field binding, 48x48 singular-value formula and physical-domain
coercivity remain separate formal obligations.
"""
from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import platform
import re

import numpy as np

ROOT = Path(__file__).resolve().parents[3]
KOTLER = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
PINS = {
    KOTLER + "SU2RealGammaProbe.lean":
        "b9b8192055c70f0d001d7982669b9823c55562ed",
    KOTLER + "SU2ColorCrossProbe.lean":
        "209b3808222730ca5e817d83ed32253a67513f7f",
    "contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py":
        "4dcc78016765253e8efe5f9f5697aba4999a6d6d",
    "contributions/bfss-kotler/tools/audit_spectral_source_premises.py":
        "d52cbb008099513399abaf33b11c82a1dc52b665",
}


def require(ok, reason):
    if not ok:
        raise AssertionError(reason)


def load_pin(path, expected):
    data = (ROOT / path).read_bytes()
    blob = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
    require(blob == expected, "Git blob pin drift: " + path + " got " + blob)
    return data.decode("utf-8")


def parse_original_gamma(source):
    parts = source.split("private def sign", 1)
    require(len(parts) == 2, "sign table delimiter missing")
    raw = (parts[0], parts[1].split("private def gammaInt", 1)[0])
    tables = []
    for part in raw:
        entries = re.findall(r"\|\s*(\d+)\s*=>\s*!\[([^\]]*)\]", part, re.S)
        require([int(x) for x, _ in entries] == list(range(9)), "gamma row inventory")
        tables.append(np.array([[int(v) for v in re.findall(r"-?\d+", s)]
                                for _, s in entries], dtype=np.int64))
    perm, sign = tables
    require(perm.shape == sign.shape == (9, 16), "gamma shape")
    gamma = np.zeros((9, 16, 16), dtype=np.int64)
    for k in range(9):
        require(sorted(perm[k].tolist()) == list(range(16)), "permutation")
        require(set(sign[k].tolist()) <= {-1, 1}, "gamma sign range")
        gamma[k, np.arange(16), perm[k]] = sign[k]
        require(np.array_equal(gamma[k], gamma[k].T), "gamma must be symmetric")
    for i, j in itertools.product(range(9), repeat=2):
        target = (2 if i == j else 0) * np.eye(16, dtype=np.int64)
        require(np.array_equal(gamma[i]@gamma[j] + gamma[j]@gamma[i], target),
                "Clifford identity")
    return gamma


def parse_original_epsilon(source):
    section = source.split("def epsilon3", 1)[1].split("/--", 1)[0]
    entries = re.findall(r"\|\s*(\d),\s*(\d),\s*(\d)\s*=>\s*(-?\d+)", section)
    require(len(entries) == 6 and "| _, _, _ => 0" in section, "epsilon inventory")
    eps = np.zeros((3, 3, 3), dtype=np.int64)
    for a, b, c, value in entries:
        eps[int(a), int(b), int(c)] = int(value)
    require(eps[0, 1, 2] == 1 and np.array_equal(eps, -eps.swapaxes(0, 1)),
            "orientation")
    return eps


def build_source_basis(gamma, eps):
    basis = np.zeros((3, 9, 48, 48), dtype=np.int64)
    for d, i, a, c in itertools.product(range(3), range(9), range(3), range(3)):
        basis[d, i, 16*a:16*(a+1), 16*c:16*(c+1)] = eps[d, a, c]*gamma[i]
    flat = basis.reshape(27, 48*48)
    require(np.array_equal(flat@flat.T, 32*np.eye(27, dtype=np.int64)),
            "K0 Gram 32 I must hold exactly")
    return basis


def k0(basis, x):
    require(x.shape == (3, 9), "configuration must be source 3 x 9")
    return np.einsum("di,diab->ab", x, basis, optimize=True)


def signed_field_norm_from_skew(k):
    # Source-theta normalization: theta^2=I/2, K=sqrt(2)*K0.
    # This equality uses a generic CAR canonical-block theorem;
    # the identification with literal source B(X) is a separate obligation.
    return float(np.linalg.svd(math.sqrt(2)*k, compute_uv=False).sum()/4)


def h2_norm_prediction(x):
    s1, s2, s3 = np.linalg.svd(x, compute_uv=False)
    S = np.array([[0, s3, s2], [s3, 0, s1], [s2, s1, 0]], dtype=float)
    return float(8*math.sqrt(2)*np.linalg.eigvalsh(S)[-1])


def determinant3(m):
    a, b, c = map(int, m[0])
    d, e, f = map(int, m[1])
    g, h, i = map(int, m[2])
    return a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g)


def test_source_polynomial(basis):
    rng = np.random.default_rng(20261112)
    cases = {
        "rank1": np.diag([1, 0, 0]).astype(np.int64),
        "rank2": np.diag([2, 1, 0]).astype(np.int64),
        "rank3": np.diag([5, 4, 3]).astype(np.int64),
        "oblique": np.array([[1, 2, 0], [0, 1, 1], [2, 0, 1]], dtype=np.int64),
    }
    for j in range(12):
        cases["random_%02d" % j] = rng.integers(-2, 3, size=(3, 9), dtype=np.int64)
    tested = []
    eye = np.eye(48, dtype=np.int64)
    for name, sample in cases.items():
        x = np.pad(sample, ((0, 0), (0, 6))) if sample.shape == (3, 3) else sample
        M = k0(basis, x)
        p = int(np.sum(x*x))
        d = determinant3(x@x.T)
        M2 = M@M
        M4 = M2@M2
        M6 = M4@M2
        residual = M6 + 2*p*M4 + p*p*M2 + 4*d*eye
        require(np.array_equal(residual, np.zeros_like(M)),
                "source polynomial counterexample in " + name)
        tested.append({"name": name, "P": p, "D": d, "max_abs_integer_residual": 0})
    return tested


def test_optional_symbolic_block(eps):
    try:
        import sympy as sp
    except ImportError:
        return {"status": "SKIPPED_INSTALL_SYMPY_FOR_SYMBOLIC_CHECK"}
    a, b, c = sp.symbols("a b c", real=True)
    tau = sp.Symbol("tau")
    I2 = sp.eye(2)
    Z = sp.diag(1, -1)
    X = sp.Matrix([[0, 1], [1, 0]])
    J = sp.Matrix([[0, -1], [1, 0]])
    gs = [sp.kronecker_product(Z, I2), sp.kronecker_product(X, I2),
          sp.kronecker_product(J, J)]
    require(all(g*g == sp.eye(4) for g in gs), "reduced Cl3 square")
    require(all(gs[i]*gs[j]+gs[j]*gs[i] ==
                (2 if i == j else 0)*sp.eye(4)
                for i, j in itertools.product(range(3), repeat=2)),
            "reduced Cl3 anticommutation")
    e = [sp.Matrix(3, 3, lambda i, j: int(eps[d, i, j])) for d in range(3)]
    A = sum((z*sp.kronecker_product(e[k], gs[k])
             for k, z in enumerate((a, b, c))), sp.zeros(12))
    p = a*a+b*b+c*c
    d = a*a*b*b*c*c
    poly = A**6 + 2*p*A**4 + p**2*A**2 + 4*d*sp.eye(12)
    require(poly == sp.zeros(12), "12x12 exact source-symmetry model polynomial")
    target = (tau**6 + 2*p*tau**4 + p**2*tau**2 + 4*d)**2
    require(sp.expand(A.charpoly(tau).as_expr()-target) == 0, "symbolic charpoly")
    return {"status": "EXACT_SYMBOLIC_PASS_REDUCED_12_BY_12",
            "charpoly": "(tau^6+2P*tau^4+P^2*tau^2+4D)^2",
            "mathematical_caveat": "general 48x48 source reduction still requires proof"}


def test_numerical_norm(basis):
    old = 8*math.sqrt(3)
    candidate = 16*math.sqrt(2/3)
    cases = {
        "rank_one": np.diag([1., 0., 0.]),
        "rank_two_equal": np.diag([1., 1., 0.])/math.sqrt(2),
        "rank_three_equal": np.diag([1., 1., 1.])/math.sqrt(3),
        "anisotropic": np.diag([7., 3., 1.])/math.sqrt(59),
        "near_valley": np.diag([100., 1., 0.])/math.sqrt(10001),
        "oblique": np.array([[1, 1, 1], [0, 1, 1], [1, 0, 2]], dtype=float),
    }
    rng = np.random.default_rng(20261112)
    samples = {}
    for name, three in cases.items():
        x = np.pad(three, ((0, 0), (0, 6)))
        actual = signed_field_norm_from_skew(k0(basis, x))/np.linalg.norm(x)
        expected = h2_norm_prediction(x)/np.linalg.norm(x)
        require(abs(actual-expected) <= 3e-10, "H2 mismatch "+name)
        require(actual <= candidate+3e-10, "sharp candidate upper bound "+name)
        samples[name] = {"norm_over_r": actual, "h2_over_r": expected}
    require(abs(samples["rank_three_equal"]["norm_over_r"]-candidate) < 1e-10,
            "isotropic source sharpness")
    require(abs(samples["rank_one"]["norm_over_r"]-8*math.sqrt(2)) < 1e-10,
            "rank-one source norm")
    max_discrepancy = 0.
    best_random_ratio = 0.
    for j in range(200):
        x = rng.normal(size=(3, 9))
        ratio = signed_field_norm_from_skew(k0(basis, x))/np.linalg.norm(x)
        h2 = h2_norm_prediction(x)/np.linalg.norm(x)
        max_discrepancy = max(max_discrepancy, abs(ratio-h2))
        best_random_ratio = max(best_random_ratio, ratio)
        require(abs(ratio-h2) <= 3e-10, "random H2 mismatch "+str(j))
        require(ratio <= candidate+3e-10, "random sharp bound "+str(j))
    near_valley = {}
    for e in (0., 0.001, 0.01, 0.1, 0.25, 0.5, 1.):
        x = np.pad(np.diag([1., e, e]), ((0, 0), (0, 6)))
        value = signed_field_norm_from_skew(k0(basis, x))/np.linalg.norm(x)
        near_valley[str(e)] = value
    return {"source_cases": samples, "random_count": 200,
            "max_random_formula_error": max_discrepancy,
            "max_random_norm_over_radius": best_random_ratio,
            "near_valley_ratio_by_epsilon": near_valley,
            "conservative_C": old, "conditional_sharp_C": candidate,
            "improvement_percent": 100*(1-candidate/old),
            "sharp_saturated_by_equal_singular_values": True,
            "rank_one_ratio": 8*math.sqrt(2)}


def sensitivity():
    old = 8*math.sqrt(3)
    sharp = 16*math.sqrt(2/3)
    rows = []
    for m in range(7, 14):
        rows.append({
            "m": m, "beta_min_old": (old/(m+9))**2,
            "beta_min_sharp_conditional": (sharp/(m+9))**2,
            "old_margin_beta_0_49": math.sqrt(.49)*(m+9)-old,
            "sharp_margin_beta_0_49": math.sqrt(.49)*(m+9)-sharp,
            "conditional_vector_threshold": "lambda_2>"+str(m+6),
            "conditional_operator_threshold": "lambda_2>"+str(m+12),
        })
    return {
        "rows": rows,
        "m11_beta_0_45_conditional_margin": math.sqrt(.45)*20-sharp,
        "m11_beta_0_45_gradient_reserve": .5-.45,
        "m10_beta_0_49_conditional_margin": math.sqrt(.49)*19-sharp,
        "note": "All estimates are conditional on the real source field, physical sector and sliced oscillator proof."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=None)
    args = parser.parse_args()
    source = {p: load_pin(p, b) for p, b in PINS.items()}
    gs = parse_original_gamma(source[KOTLER+"SU2RealGammaProbe.lean"])
    eps = parse_original_epsilon(source[KOTLER+"SU2ColorCrossProbe.lean"])
    basis = build_source_basis(gs, eps)
    result = {
        "status": "EXACT_INTEGER_NUMERICAL_AND_OPTIONAL_SYMBOLIC_RESEARCH_ONLY_NOT_LEAN",
        "python": platform.python_version(), "numpy": np.__version__,
        "pins": PINS,
        "source_clifford_and_K0_HS_gram": "EXACT_INTEGER_PASS",
        "source_48x48_polynomial_samples": test_source_polynomial(basis),
        "reduced_symbolic_model": test_optional_symbolic_block(eps),
        "norm_diagnostics": test_numerical_norm(basis),
        "coercivity_sensitivity": sensitivity(),
        "conditional_research_target": (
            "B(X) source norm <= 16 sqrt(2/3) ||X||; "
            "requires a general source 48x48 spectral reduction and exact original field binding"),
        "not_qualified": ["source original field signed CAR equality in Lean",
                           "universal 48x48 source spectral identity in Lean",
                           "physical Spin9 reducing action/branching",
                           "physical gauge-sliced oscillator exclusion",
                           "coercivity on original Hamiltonian closed form",
                           "physical spectrum or mass gap"]
    }
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2, sort_keys=True)+"\n")
    print("BFSS_SHARP_FERMION_COEFFICIENT_RESEARCH_PASS_NOT_LEAN")
    print("candidate C=", result["norm_diagnostics"]["conditional_sharp_C"],
          "rank1 C=", result["norm_diagnostics"]["rank_one_ratio"])
    print("m10 beta .49 margin=", result["coercivity_sensitivity"]["m10_beta_0_49_conditional_margin"])
    print("source and conditional proof obligations remain OPEN")


if __name__ == "__main__":
    main()
