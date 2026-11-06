#!/usr/bin/env python3
"""Pinned frozen-valley/central-sign diagnostics; not a global escape exclusion.

Python 3 + NumPy. Exact integer/rational character and occupation arithmetic.
No full Fock matrices, Lean compilation, new group lift, or spectrum acceptance.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from fractions import Fraction
import hashlib
import importlib.util
import itertools as it
import json
from math import comb
from pathlib import Path
import platform

import numpy as np


ROOT = Path(__file__).resolve().parents[3]
BASE = "dd2cbe02ea96c1e301dcb4de3d50efaba792102d"
KOTLER = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
PINS = {
    "contributions/bfss-kotler/tools/audit_spectral_confinement_c.py":
        "3789af587796975f82f0afc4b71938ec746b7228",
    KOTLER + "SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.lean":
        "353978608b978b00d0e36deb1c1a47c32641ea59",
    KOTLER + "SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity.lean":
        "db887aa6e495eb2a74c2e826018ffb5453158806",
    KOTLER + "SU2BFSSPhysicalDomainS1V52K1D18V7ZOriginalSpinQuotientNativeEuclideanDetOneEquivProbe.lean":
        "371a7406509091917b523828613be415857b9965",
    KOTLER + "SU2BFSSSource48FockCliffordUniversalLiftProbe.lean":
        "f057756e42d30c8069a9c934001cf75c1e2d1ed2",
}


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def pinned_readers():
    pins = {}
    for path, expected in PINS.items():
        data = (ROOT/path).read_bytes()
        blob = hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
        require(blob == expected, f"source pin mismatch: {path}")
        pins[path] = {"git_blob": blob, "sha256": hashlib.sha256(data).hexdigest()}
    path = ROOT/"contributions/bfss-kotler/tools/audit_spectral_confinement_c.py"
    spec = importlib.util.spec_from_file_location("pinned_spectral_c", path)
    c = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(c)
    ab, inherited_pins = c.pinned_reader()
    pins.update(inherited_pins)
    return ab, c, pins


def chirality_weights(gamma, c):
    eye, zero = np.eye(16, dtype=np.int64), np.zeros((16, 16), dtype=np.int64)
    g9 = gamma[8]
    require(np.array_equal(g9, np.diag(np.diag(g9))), "source gamma9 is diagonal")
    require(list(np.diag(g9)).count(1) == list(np.diag(g9)).count(-1) == 8,
            "eight positive and eight negative massive modes")
    for i, j in it.combinations(range(8), 2):
        generator = gamma[i]@gamma[j]
        require(np.array_equal(g9@generator, generator@g9), "Spin(8) preserves chirality")
    rows = []
    for signs in it.product((-1, 1), repeat=4):
        p = (eye, zero)
        for j, sign in enumerate(signs):
            p = c.gaussian_mul(p, (eye, -sign*(gamma[2*j]@gamma[2*j+1])))
        numerator = int(np.trace(g9@p[0]))
        require(numerator in (-16, 16) and np.trace(g9@p[1]) == 0, "chirality trace")
        chi = numerator//16
        require(np.array_equal(g9@p[0], chi*p[0]) and
                np.array_equal(g9@p[1], chi*p[1]), "exact chirality eigenprojector")
        rows.append({"twice_spinor_weight": signs, "gamma9_eigenvalue": chi,
                     "twice_quasiparticle_weight": tuple(-chi*s for s in signs)})
    for chi in (-1, 1):
        selected = [r for r in rows if r["gamma9_eigenvalue"] == chi]
        require(len(selected) == 8, "half-spin multiplicity")
        require(all(sum(r["twice_spinor_weight"][j] for r in selected) == 0 for j in range(4)),
                "filled negative-chirality ground has zero Cartan weight")
    return rows


def spectator_character(c):
    char = {(4, 0, 0, 0): 1}  # doubled Fock weights, one color only
    for signs in it.product((-1, 1), repeat=3):
        w = (1,)+signs
        result = defaultdict(int, char)
        for weight, count in char.items():
            result[tuple(weight[j]-w[j] for j in range(4))] += count
        char = dict(result)
    require(sum(char.values()) == 256, "spectator dimension")
    require(max(w[0] for w in char) == 4, "spectator first-coordinate bound two")
    weyl = c.signed_permutations(even_only=True)
    require(len(weyl) == 192, "D4 Weyl group order")
    rho = (6, 4, 2, 0)
    components = []
    for mu in sorted(char, reverse=True):
        if not mu[0] >= mu[1] >= mu[2] >= abs(mu[3]):
            continue
        count = 0
        for perm, signs, sign in weyl:
            wr = c.action(rho, perm, signs)
            count += sign*char.get(tuple(mu[j]+rho[j]-wr[j] for j in range(4)), 0)
        require(count >= 0, "spectator D4 multiplicity")
        if not count:
            continue
        x = tuple(Fraction(mu[j]+rho[j], 2) for j in range(4))
        r = tuple(Fraction(a, 2) for a in rho)
        dim = Fraction(1)
        for i in range(4):
            for j in range(i+1, 4):
                dim *= (x[i]-x[j])/(r[i]-r[j]) * (x[i]+x[j])/(r[i]+r[j])
        require(dim.denominator == 1, "spectator D4 dimension")
        components.append({"twice_highest_weight": mu, "multiplicity": count,
                           "dimension": int(dim)})
    require(sum(row["multiplicity"]*row["dimension"] for row in components) == 256,
            "spectator D4 dimension sum")
    require(len(components) == 9, "spectator D4 component count")
    numerator = {tuple(w[i]+rho[i] for i in range(4)): n for w, n in char.items()}
    for i, j in it.combinations(range(4), 2):
        for sign in (-1, 1):
            root = [0]*4
            root[i], root[j] = 2, 2*sign
            result = defaultdict(int, numerator)
            for w, n in numerator.items():
                result[tuple(w[k]-root[k] for k in range(4))] -= n
            numerator = {w: n for w, n in result.items() if n}
    reconstructed = defaultdict(int)
    for component in components:
        top = tuple(component["twice_highest_weight"][i]+rho[i] for i in range(4))
        for perm, signs, sign in weyl:
            reconstructed[c.action(top, perm, signs)] += sign*component["multiplicity"]
    require(numerator == {w: n for w, n in reconstructed.items() if n},
            "complete spectator D4 Weyl-numerator identity")
    return {"dimension": 256, "first_coordinate_bound": 2,
            "weight_support": len(char), "D4_components": components,
            "exact_D4_Weyl_numerator_reconstruction": True}


def massive_character(rows):
    char = {(0, 0, 0, 0, 0): 1}  # excitation count + doubled Spin(8) weight
    energies = {0: 1}  # B0/(sqrt(2)r), before shifting by its ground energy
    for row in rows:
        w = row["twice_quasiparticle_weight"]
        updated = defaultdict(int, char)
        for key, count in char.items():
            updated[(key[0]+1,)+tuple(key[j+1]+w[j] for j in range(4))] += count
        char = dict(updated)
        updated_e = defaultdict(int, energies)
        for e, count in energies.items():
            updated_e[e+row["gamma9_eigenvalue"]] += count
        energies = dict(updated_e)
    require(sum(char.values()) == sum(energies.values()) == 2**16, "massive Fock dimension")
    require(min(energies) == -8 and energies[-8] == 1, "unique massive fermion ground")
    report = []
    for k in range(17):
        weights = {key[1:]: n for key, n in char.items() if key[0] == k}
        require(sum(weights.values()) == comb(16, k) == energies[k-8], "massive energy degeneracy")
        twice_max = max(w[0] for w in weights)
        require(twice_max == min(k, 16-k), "massive fixed-excitation weight bound")
        max_first = Fraction(twice_max, 2)
        # Necessary weight condition for lambda_2=18, using spectator first weight <=2.
        needed = Fraction(18)-2-max_first
        min_n = max(0, -(-needed.numerator//needed.denominator))
        report.append({"fermion_excitations": k, "fermion_energy_in_sqrt2_r_units": k-8,
                       "degeneracy": comb(16, k), "max_first_weight": str(max_first),
                       "minimum_boson_level_allowed_by_weight_bounds": min_n,
                       "minimum_fast_energy_quantum_allowed_by_bounds": min_n+k})
    require(min(row["minimum_fast_energy_quantum_allowed_by_bounds"] for row in report) == 16,
            "frozen high-sector excitation cost")
    return {"massive_ground_energy_in_sqrt2_r_units": -8,
            "massive_ground_multiplicity": 1, "ground_occupied_modes": 8,
            "ground_residual_SO2_charge": 0, "rows": report,
            "minimum_fast_quantum_for_candidate_by_weight_bounds": 16}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    ab, c, pins = pinned_readers()
    gamma = ab.source_gamma()
    basis = ab.coefficient_checks(gamma)
    k0 = basis[2, 8]  # X^3=r e9, K=sqrt(2) r K0
    expected_square = np.diag([-1]*32+[0]*16)
    require(np.array_equal(k0@k0, expected_square), "rank-one K0 square")
    rows = chirality_weights(gamma, c)
    spectator = spectator_character(c)
    massive = massive_character(rows)
    desired, scalar_conjugation = -np.eye(48, dtype=np.int64), np.eye(48, dtype=np.int64)
    discrepancy = int(np.sum((desired-scalar_conjugation)**2))
    require(discrepancy == 192, "central-action incompatibility")
    result = {
        "status": "FROZEN_VALLEY_DIAGNOSTICS_PASS_GLOBAL_ESCAPE_QUESTION_OPEN",
        "baseline_commit": BASE, "python": platform.python_version(), "numpy": np.__version__,
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "source_pins": pins,
        "central_shortcut": {"source_negative_central_label_action": "-I48",
                             "unital_Cl9_to_Cl48_scalar_image": "-1",
                             "target_Spin48_vector_action_of_scalar_minus_one": "+I48",
                             "matrix_discrepancy_HS_squared": discrepancy,
                             "verdict": "unital whole-Clifford-map shortcut rejected; group lift not refuted"},
        "gamma9_chirality_weights": rows,
        "exact_Spin8_chirality_commutators": 28,
        "spectator_ground_channel": spectator, "massive_fermions": massive,
        "fast_hamiltonian": {"boson_dimensions": 16, "boson_ground_in_sqrt2_r_units": 8,
                             "combined_energy": "sqrt(2) r (n+k)",
                             "zero_fast_channel_dimension": 256,
                             "zero_fast_channel_max_first_weight": 2,
                             "candidate_lambda": [24, 18, 0, 0],
                             "ordinary_zero_fast_channel_has_no_candidate_type": True,
                             "frozen_candidate_bound": "H_fast >= 16 sqrt(2) r"},
        "annular_necessary_condition": {"hypotheses": "normalized state, R<=r<=2R, q<=E, original form identity",
                                        "distance": "delta=distance_F(X,rank<=1)",
                                        "bound": "integral delta^2 rho <= 3E/R^2+6C/R; C=8sqrt(3)"},
        "nonclaims": ["no original-source global lift or new Lean roots",
                      "no exhaustive fixed-sector escape exclusion",
                      "no uniform moving-frame/gauge/IMS error estimate",
                      "no global lambda_2>2 confinement theorem or compactness/spectral acceptance"],
    }
    encoded = json.dumps(result, indent=2, sort_keys=True)+"\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded)
    else:
        print(encoded, end="")


if __name__ == "__main__":
    main()
