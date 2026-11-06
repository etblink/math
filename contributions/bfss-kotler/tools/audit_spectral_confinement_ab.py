#!/usr/bin/env python3
"""Pinned, independent finite-matrix diagnostics; NOT a Lean or spectral gate.

Run from any directory with Python 3 and NumPy:
  python contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py
Use --output PATH to retain the deterministic JSON receipt.
No network, Lean build, full 2^24 Fock matrix, or cache is used.
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
BASE = "c288e2827e6eb9970398217502fe6528813db6bd"
BFSS = "lean/OAI/MathematicalPhysics/BFSS/"
KOTLER = BFSS + "Contrib/Kotler/"
PAPER = ("preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-"
         "October-5-2026/build/positive-eigenvalues-relative-su2-bfss.tex")
PINS = {
    PAPER: "12c5fffb5f90b48856f60fb0e93c18e2490c5f1b",
    BFSS + "Core.lean": "9882359ced78b0a3bd7e2f057974bd0a031b3e60",
    BFSS + "GaugeCore.lean": "e4990dadf1d8bde849e351467282ab3f14989c3b",
    KOTLER + "SU2RealGammaProbe.lean": "b9b8192055c70f0d001d7982669b9823c55562ed",
    KOTLER + "SU2ColorCrossProbe.lean": "209b3808222730ca5e817d83ed32253a67513f7f",
    KOTLER + "SU2PairedThetaLabelCrosswalkProbe.lean":
        "f3a2b41f902a20f6fe237ecce18dd7e869e9c45e",
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def pin_sources() -> dict:
    result = {}
    for path, expected in PINS.items():
        data = (ROOT / path).read_bytes()
        blob = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        require(blob == expected, f"source pin mismatch: {path}")
        result[path] = {"git_blob": blob, "sha256": hashlib.sha256(data).hexdigest()}
    return result


def source_gamma() -> np.ndarray:
    source = (ROOT / (KOTLER + "SU2RealGammaProbe.lean")).read_text()
    parts = source.split("private def sign", 1)
    require(len(parts) == 2, "missing literal sign table")
    tables = []
    for part in (parts[0], parts[1].split("private def gammaInt", 1)[0]):
        rows = re.findall(r"\|\s*(\d+)\s*=>\s*!\[(.*?)\]", part, re.S)
        require([int(i) for i, _ in rows] == list(range(9)), "gamma row inventory")
        table = np.array([[int(n) for n in re.findall(r"-?\d+", row)]
                          for _, row in rows], dtype=np.int64)
        require(table.shape == (9, 16), "gamma table dimensions")
        tables.append(table)
    perm, sign = tables
    gamma = np.zeros((9, 16, 16), dtype=np.int64)
    for i in range(9):
        require(sorted(perm[i].tolist()) == list(range(16)), "gamma permutation")
        require(set(sign[i].tolist()) <= {-1, 1}, "gamma signs")
        gamma[i, np.arange(16), perm[i]] = sign[i]
        require(np.array_equal(gamma[i], gamma[i].T), "gamma symmetry")
    for i, j in itertools.product(range(9), repeat=2):
        target = 2 * np.eye(16, dtype=np.int64) if i == j else np.zeros((16, 16), dtype=np.int64)
        require(np.array_equal(gamma[i] @ gamma[j] + gamma[j] @ gamma[i], target),
                "integer Clifford identity")
    return gamma


def epsilon(a: int, b: int, c: int) -> int:
    if len({a, b, c}) != 3:
        return 0
    return 1 if (a, b, c) in {(0, 1, 2), (1, 2, 0), (2, 0, 1)} else -1


def coefficient_checks(gamma: np.ndarray) -> np.ndarray:
    # K = sqrt(2) K0. Diagnostic ordering is color-major (a, alpha).
    basis = np.zeros((3, 9, 48, 48), dtype=np.int64)
    for d, i, a, c in itertools.product(range(3), range(9), range(3), range(3)):
        basis[d, i, 16*a:16*(a+1), 16*c:16*(c+1)] = epsilon(d, a, c) * gamma[i]
    flat = basis.reshape(27, 48, 48)
    require(np.array_equal(flat.transpose(0, 2, 1), -flat), "K0 skewness")
    gram = flat.reshape(27, -1) @ flat.reshape(27, -1).T
    require(np.array_equal(gram, 32 * np.eye(27, dtype=np.int64)), "exact HS Gram")

    # Paper's pre-contraction multiplication remainder / (i sqrt(2)),
    # multiplied by 16. Preserve theta^a_beta theta^c_delta order throughout.
    for d, ell, a, c in itertools.product(range(3), range(9), range(3), range(3)):
        actual = np.zeros((16, 16), dtype=np.int64)
        for j in range(9):
            for k in range(j + 1, 9):
                gamma_jk = gamma[j] @ gamma[k]
                if ell == k:
                    actual -= epsilon(c, a, d) * gamma[j] @ gamma_jk
                if ell == j:
                    actual -= epsilon(c, d, a) * gamma[k] @ gamma_jk
        expected = 8 * epsilon(d, a, c) * gamma[ell]
        require(np.array_equal(actual, expected), "ordered multiplication coefficient")
    return basis


def skew_norm(k: np.ndarray) -> float:
    # All 48 singular values: ||B|| = (1/4) sum(singular values(K)).
    return float(np.linalg.svd(k, compute_uv=False).sum() / 4)


def matrix_diagnostics(basis: np.ndarray) -> dict:
    cases = {}
    for name, diagonal in [("zero", [0, 0, 0]), ("rank_one", [1, 0, 0]),
                           ("rank_two_equal", [1, 1, 0]), ("rank_three_equal", [1, 1, 1]),
                           ("anisotropic", [7, 3, 1]), ("near_valley", [100, 1, 0])]:
        x = np.zeros((3, 9), dtype=np.int64)
        x[np.arange(3), np.arange(3)] = diagonal
        cases[name] = x
    cases["oblique_rank_one"] = np.outer([1, 2, -3], [1, -2, 3, 0, 1, 0, -1, 2, 1])
    rng = np.random.default_rng(20261106)
    for n in range(64):
        cases[f"integer_{n:02}"] = rng.integers(-5, 6, size=(3, 9))
    rows, max_h2_error = [], 0.0
    # q maps color-major source labels to the actual paired order 2(3j+a)+r.
    q = np.array([2 * (3 * (alpha // 2) + a) + alpha % 2
                  for a in range(3) for alpha in range(16)])
    require(sorted(q.tolist()) == list(range(48)), "paired-label bijection")
    for name, x in cases.items():
        k0 = np.einsum("di,diab->ab", x, basis)
        r2 = int(np.sum(x*x))
        require(int(np.sum(k0*k0)) == 32*r2, "exact sample HS norm")
        paired = np.empty_like(k0)
        paired[np.ix_(q, q)] = k0
        require(np.array_equal(paired[np.ix_(q, q)], k0), "paired permutation roundtrip")
        k = math.sqrt(2) * k0
        bnorm = skew_norm(k)
        require(bnorm <= 8*math.sqrt(3*r2) + 1e-9, "conservative norm bound")
        require(abs(skew_norm(math.sqrt(2)*paired) - bnorm) < 1e-9, "label-invariant norm")
        s1, s2, s3 = np.linalg.svd(x, compute_uv=False)
        s = np.array([[0, s3, s2], [s3, 0, s1], [s2, s1, 0]])
        h2 = 8*math.sqrt(2)*float(np.linalg.eigvalsh(s)[-1])
        max_h2_error = max(max_h2_error, abs(bnorm-h2))
        # H2 remains optional numerical evidence, with no role in H1.
        rows.append({"name": name, "radius_squared": r2, "norm_B": bnorm,
                     "norm_B_over_radius": bnorm/math.sqrt(r2) if r2 else 0.0})
    require(abs(rows[1]["norm_B"] - 8*math.sqrt(2)) < 1e-10, "rank-one scale")
    require(2*rows[1]["norm_B"] > 8*math.sqrt(3), "wrong CAR normalization must fail")
    return {"case_count": len(rows), "cases": rows,
            "optional_H2_max_absolute_discrepancy": max_h2_error,
            "wrong_CAR_factor_two_detected_on_rank_one": True}


def small_car_fixture() -> dict:
    # Six-generator, eight-dimensional fixture tests the coefficient convention;
    # it is explicitly NOT a replacement for the 48-generator physical model.
    eye = np.eye(2, dtype=complex)
    pauli = [np.array([[0, 1], [1, 0]], complex),
             np.array([[0, -1j], [1j, 0]], complex)]
    z = np.diag([1, -1]).astype(complex)
    clifford = []
    for mode in range(3):
        for p in pauli:
            word = np.array([[1]], dtype=complex)
            for j in range(3):
                word = np.kron(word, z if j < mode else p if j == mode else eye)
            clifford.append(word)
    for i, j in itertools.product(range(6), repeat=2):
        require(np.array_equal(clifford[i] @ clifford[j] + clifford[j] @ clifford[i],
                               (2 if i == j else 0)*np.eye(8)), "fixture CAR")
    rng = np.random.default_rng(2406)
    errors = []
    for _ in range(12):
        a = rng.integers(-3, 4, size=(6, 6))
        k = a-a.T
        # theta=c/sqrt(2), B=(i/2) sum K theta theta = (i/4) sum K c c.
        b4 = sum(1j*k[i, j]*(clifford[i] @ clifford[j])
                 for i, j in itertools.product(range(6), repeat=2))
        require(np.array_equal(b4, b4.conj().T), "fixture Hermiticity")
        actual = float(np.max(np.abs(np.linalg.eigvalsh(b4)))) / 4
        expected = float(np.linalg.svd(k, compute_uv=False).sum()) / 4
        errors.append(abs(actual-expected))
    require(max(errors) < 1e-10, "canonical-block norm coefficient")
    return {"generators": 6, "dimension": 8, "skew_matrices": 12,
            "max_absolute_norm_discrepancy": max(errors),
            "scope": "coefficient fixture only; no full physical Fock matrix constructed"}


def sphere_diagnostics() -> dict:
    # Probability measure dphi dz/(4pi), midpoint quadrature; not a proof.
    nz, nphi = 320, 512
    z = -1+(np.arange(nz)+0.5)*2/nz
    phi = (np.arange(nphi)+0.5)*2*math.pi/nphi
    v = np.stack(np.broadcast_arrays(np.sqrt(1-z[:, None]**2)*np.cos(phi),
                                     np.sqrt(1-z[:, None]**2)*np.sin(phi),
                                     z[:, None]), axis=-1)
    rows = []
    for name, singular in [("zero", [0, 0, 0]), ("rank_one", [0, 0, 1]),
                           ("rank_two_equal", [1, 1, 0]), ("rank_three_equal", [1, 1, 1]),
                           ("anisotropic", [7, 3, 1]), ("near_valley", [100, 1, 0])]:
        singular = np.array(singular, dtype=float)
        radius = float(np.linalg.norm(singular))
        values = np.linalg.norm(v*singular, axis=-1)
        average = float(values.mean())
        require(average + 1e-4*max(radius, 1) >= radius/2, "sphere diagnostic bound")
        rows.append({"name": name, "quadrature_average": average,
                     "average_over_radius": average/radius if radius else 0.0})
    require(abs(rows[1]["average_over_radius"] - 0.5) < 1e-12, "sharp rank-one fixture")
    require(abs(rows[3]["average_over_radius"] - 1/math.sqrt(3)) < 1e-12,
            "isotropic fixture")
    # Uniform density on the rank-one orbit X=u e1^T: ||X||=1,
    # E_u |v.u|=1/2. This defeats the tempting replacement 1/sqrt(3).
    require(0.5 < 1/math.sqrt(3), "adversarial Jensen-direction fixture")
    return {"measure": "normalized sphere probability; dphi dz/(4pi)",
            "grid": [nz, nphi], "cases": rows,
            "isotropic_covariance_does_not_imply_Jensen_lower_bound": True}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    pins = pin_sources()
    gamma = source_gamma()
    basis = coefficient_checks(gamma)
    receipt = {
        "status": "DIAGNOSTICS_PASS_NOT_FORMAL_ACCEPTANCE",
        "pinned_source_commit": BASE,
        "python": platform.python_version(), "numpy": np.__version__,
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "source_pins": pins,
        "exact_integer_checks": {"gamma_Clifford_matrix_equalities": 81,
                                 "gamma_symmetry_equalities": 9,
                                 "ordered_cross_term_coefficient_blocks": 243,
                                 "HS_Gram_matrix_entries": 729,
                                 "K0_HS_squared": "32 ||X||_F^2",
                                 "K_HS_squared": "64 ||X||_F^2"},
        "matrix_diagnostics": matrix_diagnostics(basis),
        "CAR_coefficient_fixture": small_car_fixture(),
        "sphere_diagnostics": sphere_diagnostics(),
        "candidate_margin": {"beta": "49/100", "m": 11,
                             "kinetic_remainder": "1/100",
                             "linear_coefficient": "14 - 8 sqrt(3)",
                             "approximate_linear_coefficient": 14-8*math.sqrt(3)},
        "nonclaims": ["no Lean compilation or new accepted roots",
                      "no original closed-operator/form identification",
                      "no Spin(9)/Spin(8) oscillator exclusion or nonempty sector proof",
                      "no confinement or spectral existence acceptance"],
    }
    output = json.dumps(receipt, indent=2, sort_keys=True, allow_nan=False)+"\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(output)
    else:
        print(output, end="")


if __name__ == "__main__":
    main()
