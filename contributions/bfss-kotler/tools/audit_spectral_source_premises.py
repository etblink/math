#!/usr/bin/env python3
"""Exact finite source-coefficient audit, not a Lean or spectral gate.

Uses the actual pinned gamma/Pauli tables and reconstructs the massless
deformed matrix, column convention, derivative and ordered remainder.
The separate operator snapshot must already be present as Git objects;
this script performs no network access, checkout, import or publication.
"""
import argparse
from fractions import Fraction
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import platform
import re
import subprocess

import numpy as np

ROOT = Path(__file__).resolve().parents[3]
BASE = "d4dea721fbc4ff7a8d49ae823fe025c299fd5782"
READER_REF = "fa00aa36e770ca516f57b41f5b02229a5033d50f"
BFSS = "lean/OAI/MathematicalPhysics/BFSS/"
LOCAL_PINS = {
    BFSS + "Core.lean": "9882359ced78b0a3bd7e2f057974bd0a031b3e60",
    BFSS + "CliffordSymbols.lean": "cc01379653404c4ede3d551fd8d823e079543b21",
    BFSS + "Kinetic.lean": "14045947b1860b28cbbd82c3f2b40967e795d5a8",
    BFSS + "PotentialBasis.lean": "bc9b526284166efcba5a8e296adc79ba88e6764d",
    BFSS + "MixedEnergy.lean": "cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e",
    BFSS + "DeformedCharge.lean": "c27c913c44090100f0c714e3eb34e25205f4d2d3",
    BFSS + "ColorMatrices.lean": "1c1c2a838c48c0aea2a1c1640da5d412f22e3f0c",
    BFSS + "Contrib/Kotler/SU2ColorCrossProbe.lean": "209b3808222730ca5e817d83ed32253a67513f7f",
    BFSS + "Contrib/Kotler/SU2RealGammaProbe.lean": "b9b8192055c70f0d001d7982669b9823c55562ed",
    "contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py":
        "4dcc78016765253e8efe5f9f5697aba4999a6d6d",
}
READER_PINS = {
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9ASourceChargeCoefficientCrosswalkProbe.lean": "72b09cd22398480b5ebd34e786449017ea910099",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9BSourcePairAndChargeReductionProbe.lean": "22d0066f24233fdb1f1f30eba8d869ed99641f07",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9COrderedPairCoefficientProbe.lean": "78b943de0a4dafcdcb0c9700cdfc62fbed62d35e",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean": "fe14e7e7c69e4575f53df38ac6a0b386a69cefc7",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSFullAlgebraDataProbe.lean": "de8242615e4b2959e2dfa57cf0c6fdf43896acb7",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean": "152204ef15a6569534e0503824a697cb9ae8e4ce",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean": "e20c76fb22bc09d16dbcd8657333227cb34ed1ea",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD1RestrictedSourceGraphProbe.lean": "01c33519d617209ac589eb4cdc71db400778e8ec",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2B27NormalizedHamiltonianSelfAdjointProbe.lean": "ca83bc85b788c510721f607401024c5f6676fdc0",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe.lean": "031acfec5aabe8f099592c7d2de35f18f961a770",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/CLAIMS.md": "e448d291f10a5a7cc91ec0fbc1f5b2ecc13219ee"
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def blob(data):
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()


def pin_sources():
    local, readers = {}, {}
    for path, expected in LOCAL_PINS.items():
        data = (ROOT / path).read_bytes()
        require(blob(data) == expected, "changed local pin: " + path)
        local[path] = {"blob": expected, "sha256": hashlib.sha256(data).hexdigest()}
        if path.startswith(BFSS):
            actual = subprocess.check_output(
                ["git", "-C", str(ROOT), "rev-parse", READER_REF + ":" + path], text=True).strip()
            require(actual == expected, "original source differs across snapshots: " + path)
    require(len(READER_PINS) == 11, "reader inventory")
    for path, expected in READER_PINS.items():
        data = subprocess.check_output(["git", "-C", str(ROOT), "show", READER_REF + ":" + path])
        require(blob(data) == expected, "changed reader pin: " + path)
        readers[path] = {"blob": expected, "sha256": hashlib.sha256(data).hexdigest()}
    return local, readers


def source_epsilon():
    text = (ROOT / (BFSS + "Contrib/Kotler/SU2ColorCrossProbe.lean")).read_text()
    section = text.split("def epsilon3", 1)[1].split("/--", 1)[0]
    rows = re.findall(r"\|\s*(\d),\s*(\d),\s*(\d)\s*=>\s*(-?\d+)", section)
    require(len(rows) == 6 and "| _, _, _ => 0" in section, "epsilon source table")
    epsilon = np.zeros((3, 3, 3), dtype=np.int64)
    for a, b, c, value in rows:
        epsilon[int(a), int(b), int(c)] = int(value)
    require(epsilon[0, 1, 2] == 1 and np.array_equal(epsilon, -epsilon.swapaxes(0, 1)),
            "epsilon orientation/skewness")
    return epsilon


def coefficient_audit():
    spec = importlib.util.spec_from_file_location(
        "pinned_gamma_reader", Path(__file__).with_name("audit_spectral_confinement_ab.py"))
    ab = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(ab)
    gamma, epsilon = ab.source_gamma(), source_epsilon()
    pair = {(i, j): gamma[i] @ gamma[j] for i in range(9) for j in range(i + 1, 9)}
    gamma_two = {}
    for i, j in itertools.product(range(9), repeat=2):
        twice = gamma[i] @ gamma[j] - gamma[j] @ gamma[i]
        require(np.all(twice % 2 == 0), "integral gammaTwo")
        gamma_two[i, j] = twice // 2

    # Variable u=9*a+i is the named coordinate x_i^a. Each entry stores
    # the coefficient of x_u*x_v in the ACTUAL deformedPotentialMatrix/sqrt(2).
    # Its row/column indices are beta/alpha, exactly as in PotentialBasis.
    quadratic = {}
    for u in range(27):
        a, i = divmod(u, 9)
        for v in range(u, 27):
            b, j = divmod(v, 9)
            source = np.zeros((3, 16, 16), dtype=np.int64)
            ordered_twice = np.zeros_like(source)
            for c in range(3):
                if i < j:
                    source[c] -= epsilon[c, a, b] * pair[i, j]
                elif j < i:
                    source[c] -= epsilon[c, b, a] * pair[j, i]
                ordered_twice[c] = (epsilon[c, a, b] * gamma_two[i, j] +
                                    epsilon[c, b, a] * gamma_two[j, i])
            require(np.array_equal(2 * source.transpose(0, 2, 1), ordered_twice),
                    "quadratic matrix-column/ordered-charge coefficient")
            require(np.array_equal(source.transpose(0, 2, 1), -source),
                    "massless source matrix skewness")
            quadratic[u, v] = source

    raw = np.zeros((27, 48, 48), dtype=np.int64)
    wrong_column = np.zeros_like(raw)
    target = np.zeros_like(raw)
    for w in range(27):
        d, ell = divmod(w, 9)
        for u in range(27):
            a, i = divmod(u, 9)
            derivative = quadratic[min(u, w), max(u, w)] * (2 if u == w else 1)
            for c in range(3):
                # Sum alpha in kineticSymbol(alpha,i,a) times the derivative
                # of the beta-alpha COLUMN of the source potential matrix.
                raw[w, 16*a:16*(a+1), 16*c:16*(c+1)] += gamma[i].T @ derivative[c].T
                wrong_column[w, 16*a:16*(a+1), 16*c:16*(c+1)] += gamma[i].T @ derivative[c]
        for a, c in itertools.product(range(3), repeat=2):
            target[w, 16*a:16*(a+1), 16*c:16*(c+1)] = epsilon[d, a, c] * gamma[ell]
    require(np.array_equal(raw, -8 * target), "source ordered fermion-field contraction")
    require(Fraction(-1, 16) * -8 == Fraction(1, 2), "original 1/16 and kinetic -i")
    require(np.array_equal(target.transpose(0, 2, 1), -target), "K0 basis skewness")
    gram = target.reshape(27, -1) @ target.reshape(27, -1).T
    require(np.array_equal(gram, 32 * np.eye(27, dtype=np.int64)), "K0 Hilbert-Schmidt Gram")

    # These are rejected representations, not counterexamples to the true bound.
    require(not np.array_equal(-raw, -8 * target), "negative controls must distinguish a sign")
    require(np.array_equal(wrong_column, -raw) and not np.array_equal(wrong_column, -8 * target),
            "wrong potential column must be rejected")
    require(not np.array_equal(2 * raw, -8 * target), "negative controls must distinguish scaling")
    require(Fraction(-1, 8) * -8 != Fraction(1, 2), "wrong remainder normalization rejected")
    return {
        "gamma_Clifford_equalities": 81,
        "quadratic_coordinate_monomials_exhausted": len(quadratic),
        "quadratic_color_matrix_equalities": 3 * len(quadratic),
        "linear_coordinate_coefficient_matrices": 27,
        "ordered_spin_color_blocks": 243,
        "K0_Gram_entries": 729,
        "source_raw_integer_remainder": "H(X) = -8 K0(X)",
        "source_field_prefactor": "(-i sqrt(2)/16) H = (i sqrt(2)/2) K0",
        "K_definition": "K = sqrt(2) K0; B = (i/2) sum_pq K_pq theta_p theta_q",
        "K_HS_squared": "64 norm(X)^2",
        "ordered_label_meaning": "p=(beta,a), q=(delta,c); theta_beta^a theta_delta^c",
        "coefficient_tensor_sha256": hashlib.sha256(raw.astype("<i8").tobytes()).hexdigest(),
        "controls_rejected": ["omitted negative massless-matrix sign",
                              "row substituted for source beta-alpha column",
                              "ordered-pair 1/2 omitted", "1/16 remainder scaling doubled"],
        "control_error_classes": "two sign errors and two factor-two errors",
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    local, readers = pin_sources()
    result = {
        "status": "EXACT_FINITE_SOURCE_DIAGNOSTICS_PASS_NOT_LEAN_ACCEPTANCE",
        "audit_parent": BASE, "reader_snapshot": READER_REF,
        "python": platform.python_version(), "numpy": np.__version__,
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "local_source_pins": local, "reader_pins": readers,
        "same_original_sources_across_snapshots": 9,
        "exact_coefficient_checks": coefficient_audit(),
        "nonclaims": ["no Lean translation or new accepted roots",
                      "no fresh qualification of the separate operator snapshot",
                      "no formal source-field operator norm bound",
                      "no global physical Spin(9) action or reducing-sector theorem",
                      "no closed-form physical Hamiltonian identification or spectral existence"],
    }
    text = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text)
    else:
        print(text, end="")


if __name__ == "__main__":
    main()
