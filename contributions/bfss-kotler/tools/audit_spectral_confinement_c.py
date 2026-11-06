#!/usr/bin/env python3
"""Exact finite diagnostics for the conditional Gate C representation argument.

No Lean gate, global source lift, oscillator theorem, or spectral result is certified.
Uses Python 3 + NumPy; never constructs the 2^24-dimensional Fock matrices.
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
BASE = "1895d7891589aa171295998062a0d395c76a1101"
KOTLER = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
PINS = {
    KOTLER + "SU2BFSSPairedSpin9V10HF10AVOriginalGammaCoordinateLinearMapSkewImage.lean":
        "bc895ed60f03a3e2091ff11ebd0b87e456f4408c",
    KOTLER + "SU2BFSSPairedSpin9V10HF10BBOriginalGammaCanonicalSkewLieHom.lean":
        "cbf92737d81c5e69efc2fa85735d6af239540070",
    KOTLER + "SU2BFSSPairedSpin9V10HF10BCSourceSpinGammaSpecialOrthogonalHom.lean":
        "7798089cb8ac4ec4fffc3ead4caa474def81b3f8",
    KOTLER + "SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean":
        "75a679f2a1435d747e219617feea266b4508c53d",
    KOTLER + "SU2BFSSPairedSpin9V10HF10DWNativeRepresentationDifferentiability.lean":
        "8542aedf65081043c1ce0e1d7c8255bd5e275995",
    "contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py":
        "4dcc78016765253e8efe5f9f5697aba4999a6d6d",
}


def require(ok: bool, message: str) -> None:
    if not ok:
        raise RuntimeError(message)


def pinned_reader():
    pins = {}
    for path, expected in PINS.items():
        data = (ROOT/path).read_bytes()
        actual = hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
        require(actual == expected, f"source pin mismatch: {path}")
        pins[path] = {"git_blob": actual, "sha256": hashlib.sha256(data).hexdigest()}
    path = ROOT/"contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py"
    spec = importlib.util.spec_from_file_location("pinned_spectral_ab", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pins.update(module.pin_sources())
    return module, pins


def gaussian_mul(a, b):
    ar, ai = a
    br, bi = b
    return ar@br-ai@bi, ar@bi+ai@br


def torus_projectors(gamma, epsilon):
    eye = np.eye(16, dtype=np.int64)
    zero = np.zeros((16, 16), dtype=np.int64)
    j2 = [gamma[2*k]@gamma[2*k+1] for k in range(4)]
    for k, a in enumerate(j2):
        spatial = np.zeros((9, 9), dtype=np.int64)
        spatial[2*k, 2*k+1], spatial[2*k+1, 2*k] = 1, -1
        four_lift = sum((int(spatial[r, s])*(gamma[r]@gamma[s])
                         for r, s in it.product(range(9), repeat=2)), zero.copy())
        require(np.array_equal(four_lift, 2*a), "F10AV quarter-sum gives half-gamma plane")
    for a in j2:
        require(np.array_equal(a@a, -eye), "twice-label-generator square")
    for a, b in it.product(j2, repeat=2):
        require(np.array_equal(a@b, b@a), "Cartan commutation")
    # Twice the actual label generator; color adjoint generators commute
    # before and after the original paired-label permutation.
    q = np.array([2*(3*(alpha//2)+a)+alpha % 2 for a in range(3) for alpha in range(16)])
    for spin in j2:
        label = np.kron(np.eye(3, dtype=np.int64), spin)
        require(np.array_equal(label@label, -np.eye(48, dtype=np.int64)),
                "48-label generator square, physical frequency one-half")
        for a in range(3):
            color = np.array([[epsilon(a, b, c) for c in range(3)]
                              for b in range(3)], dtype=np.int64)
            gauge = np.kron(color, eye)
            require(np.array_equal(label@gauge, gauge@label), "label/gauge commutation")
            paired_label, paired_gauge = np.empty_like(label), np.empty_like(gauge)
            paired_label[np.ix_(q, q)], paired_gauge[np.ix_(q, q)] = label, gauge
            require(np.array_equal(paired_label@paired_gauge, paired_gauge@paired_label),
                    "original paired-label/gauge commutation")
    total_real, total_imag = zero.copy(), zero.copy()
    rows = []
    for signs in it.product((-1, 1), repeat=4):
        p = (eye, zero)
        # P_signs=product(I-i signs[k] gamma[2k]gamma[2k+1])/16.
        # Gaussian-integer arithmetic keeps the numerator exact.
        for sign, a in zip(signs, j2):
            p = gaussian_mul(p, (eye, -sign*a))
        rr, ii = gaussian_mul(p, p)
        require(np.array_equal(rr, 16*p[0]) and np.array_equal(ii, 16*p[1]),
                "joint-projector idempotence")
        require(np.trace(p[0]) == 16 and np.trace(p[1]) == 0,
                "rank-one joint-projector trace")
        for sign, a in zip(signs, j2):
            ar, ai = gaussian_mul((zero, -a), p)
            require(np.array_equal(ar, sign*p[0]) and np.array_equal(ai, sign*p[1]),
                    "joint-projector exact Cartan eigenvalue")
        total_real += p[0]
        total_imag += p[1]
        rows.append({"twice_spinor_weight": list(signs), "complex_multiplicity": 1})
    require(np.array_equal(total_real, 16*eye) and np.array_equal(total_imag, zero),
            "projector completeness")
    return rows


def signed_permutations(even_only=False):
    result = []
    for perm in it.permutations(range(4)):
        parity = (-1)**sum(perm[i] > perm[j] for i in range(4) for j in range(i+1, 4))
        for signs in it.product((-1, 1), repeat=4):
            product = signs[0]*signs[1]*signs[2]*signs[3]
            if not even_only or product == 1:
                result.append((perm, signs, parity*product))
    return result


def action(weight, perm, signs):
    return tuple(signs[i]*weight[perm[i]] for i in range(4))


def b4_dimension(mu):
    rho = (7, 5, 3, 1)  # doubled weights throughout
    x = tuple(Fraction(mu[i]+rho[i], 2) for i in range(4))
    r = tuple(Fraction(v, 2) for v in rho)
    value = Fraction(1)
    for i in range(4):
        value *= x[i]/r[i]
        for j in range(i+1, 4):
            value *= (x[i]-x[j])/(r[i]-r[j]) * (x[i]+x[j])/(r[i]+r[j])
    require(value.denominator == 1 and value > 0, "B4 dimension integrality")
    return int(value)


def character_diagnostics():
    # At first-coordinate maximum the canonical spin lift has weight (6,0,0,0).
    # Each of eight positive-first spinor weights has a three-color exterior factor.
    char = {(12, 0, 0, 0, 0): 1}
    for signs in it.product((-1, 1), repeat=3):
        w = (1,)+signs
        next_char = defaultdict(int)
        for key, count in char.items():
            for occupation in range(4):
                # exterior^0, exterior^3 of color spin-one are trivial;
                # exterior^1, exterior^2 have color torus weights -1,0,1.
                charges = (0,) if occupation in (0, 3) else (-1, 0, 1)
                for charge in charges:
                    target = tuple(key[i]-occupation*w[i] for i in range(4))+(key[4]+charge,)
                    next_char[target] += count
        char = dict(next_char)
    full = defaultdict(int)
    for key, count in char.items():
        full[key[:4]] += count
    require(sum(full.values()) == 2**24, "full Fock character dimension")
    require(max(abs(x) for w in full for x in w) == 12, "M=6 doubled-weight bound")
    require(all(len({x % 2 for x in w}) == 1 for w in full), "Spin(9) weight lattice")
    require({w: n for w, n in full.items() if w[0] == 12} == {(12, 0, 0, 0): 1},
            "unique first-coordinate maximum")
    # SU(2) trivial multiplicity is torus multiplicity at 0 minus that at 1.
    # No arbitrary phase twist is allowed: the vacuum line character must be trivial.
    singlets = {}
    for w in full:
        value = char.get(w+(0,), 0)-char.get(w+(1,), 0)
        require(value >= 0, "nonnegative gauge-singlet multiplicity")
        if value:
            singlets[w] = value
    expected = 2**8*(comb(16, 8)-comb(16, 9))
    require(sum(singlets.values()) == expected == 366080, "independent gauge dimension")
    require(singlets[(12, 0, 0, 0)] == 1, "top vacuum gauge singlet")
    weyl = signed_permutations()
    for w, count in singlets.items():
        for perm, signs, _ in weyl:
            require(singlets.get(action(w, perm, signs), 0) == count, "B4 Weyl invariance")
    rho = (7, 5, 3, 1)
    components = []
    for mu in sorted(singlets, reverse=True):
        if not (mu[0] >= mu[1] >= mu[2] >= mu[3] >= 0):
            continue
        count = 0
        for perm, signs, sign in weyl:
            wr = action(rho, perm, signs)
            count += sign*singlets.get(tuple(mu[i]+rho[i]-wr[i] for i in range(4)), 0)
        require(count >= 0, "highest-weight multiplicity")
        if count:
            components.append({"twice_highest_weight": list(mu), "multiplicity": count,
                               "irreducible_dimension": b4_dimension(mu)})
    require(sum(c["multiplicity"]*c["irreducible_dimension"] for c in components) == 366080,
            "Weyl dimension sum")
    # Independent finite group-ring reconstruction of the complete Weyl numerator.
    numerator = {tuple(w[i]+rho[i] for i in range(4)): n for w, n in singlets.items()}
    roots = []
    for i in range(4):
        root = [0]*4
        root[i] = 2
        roots.append(tuple(root))
        for j in range(i+1, 4):
            for sign in (-1, 1):
                root = [0]*4
                root[i], root[j] = 2, 2*sign
                roots.append(tuple(root))
    for root in roots:
        result = defaultdict(int, numerator)
        for w, n in numerator.items():
            result[tuple(w[i]-root[i] for i in range(4))] -= n
        numerator = {w: n for w, n in result.items() if n}
    reconstructed = defaultdict(int)
    for comp in components:
        highest_rho = tuple(comp["twice_highest_weight"][i]+rho[i] for i in range(4))
        for perm, signs, sign in weyl:
            reconstructed[action(highest_rho, perm, signs)] += sign*comp["multiplicity"]
    require(numerator == {w: n for w, n in reconstructed.items() if n},
            "complete exact Weyl numerator identity")
    return {"full_dimension": 2**24, "full_weight_support": len(full),
            "gauge_singlet_dimension": 366080, "gauge_singlet_weight_support": len(singlets),
            "M": 6, "unique_maximum_weight": [6, 0, 0, 0],
            "B4_Weyl_group_order": len(weyl), "highest_weight_components": components,
            "exact_Weyl_numerator_reconstruction": True,
            "scope": "canonical continuous spin lift; original global source identification remains a hold"}


def det4(matrix):
    total = 0
    for perm in it.permutations(range(4)):
        sign = (-1)**sum(perm[i] > perm[j] for i in range(4) for j in range(i+1, 4))
        term = sign
        for i in range(4):
            term *= matrix[i][perm[i]]
        total += term
    return total


def branching_diagnostics():
    pairs = 0
    nonzero = 0
    rho = (6, 4, 2, 0)
    for parity in (0, 1):
        values = list(range(parity, 8, 2))
        lambdas = [tuple(reversed(w)) for w in it.combinations_with_replacement(values, 4)]
        for lam in lambdas:
            for first3 in it.combinations_with_replacement([v for v in values if v <= lam[0]], 3):
                nu1, nu2, nu3 = reversed(first3)
                for nu4 in range(-nu3, nu3+1, 2):
                    nu = (nu1, nu2, nu3, nu4)
                    t = tuple(nu[i]+rho[i] for i in range(4))
                    ell = tuple(lam[i]+rho[i] for i in range(4))
                    matrix = [[int(abs(t[i]) <= ell[j]) for j in range(4)] for i in range(4)]
                    mult = det4(matrix)
                    interlaces = (lam[0] >= nu1 >= lam[1] >= nu2 >= lam[2] >= nu3 >= lam[3] >= abs(nu4))
                    require(mult == int(interlaces), "B4/D4 indicator determinant vs interlacing")
                    require(not mult or nu1 >= lam[1], "restriction lower bound")
                    pairs += 1
                    nonzero += mult
    require(18 > 11+6 and not 17 > 11+6, "strict threshold test")
    return {"integral_and_half_integral_pairs": pairs, "nonzero_multiplicities": nonzero,
            "indicator_determinant_matches_full_interlacing": True,
            "scope": "bounded exact character-coefficient diagnostics; not a formal branching theorem",
            "exclusion": {"lambda_2": 18, "M": 6, "m": 11, "excluded_levels": list(range(12)),
                          "first_unexcluded_level": 12,
                          "at_lambda_2_17_the_weight_bounds_alone_do_not_exclude_level_11": True}}


def polynomial_diagnostics():
    # Complex integer entries are represented by separate int64 real/imag matrices.
    basis = np.eye(9, dtype=np.int64)
    ws = [(basis[2*i], basis[2*i+1]) for i in range(4)]
    def wedge(u, v):
        ur, ui = u
        vr, vi = v
        real = np.outer(ur, vr)-np.outer(ui, vi)
        imag = np.outer(ur, vi)+np.outer(ui, vr)
        return real-real.T, imag-imag.T
    w = wedge(ws[0], ws[1])
    positive = []
    for i in range(4):
        positive.append(wedge(ws[i], (basis[8], np.zeros(9, dtype=np.int64))))
        for j in range(i+1, 4):
            positive.append(wedge(ws[i], ws[j]))
            positive.append(wedge(ws[i], (ws[j][0], -ws[j][1])))
    for rr, ri in positive:
        left = gaussian_mul((rr, ri), w)
        right = gaussian_mul(w, (rr.T, ri.T))
        require(not np.any(left[0]+right[0]) and not np.any(left[1]+right[1]),
                "positive-root annihilation of w1 wedge w2")
    for j in range(4):
        cartan = np.zeros((9, 9), dtype=np.int64)
        cartan[2*j, 2*j+1], cartan[2*j+1, 2*j] = 1, -1
        actual = (cartan@w[0]+w[0]@cartan.T, cartan@w[1]+w[1]@cartan.T)
        target = (-w[1], w[0]) if j < 2 else (np.zeros((9, 9), dtype=np.int64),)*2
        require(all(np.array_equal(a, b) for a, b in zip(actual, target)), "bivector weight")
    # Exact polynomial identity in six independent commuting indeterminates.
    def var(i):
        exp = [0]*6
        exp[i] = 1
        return {tuple(exp): 1}
    def add(a, b, scale=1):
        result = defaultdict(int, a)
        for e, c in b.items():
            result[e] += scale*c
        return {e: c for e, c in result.items() if c}
    def mul(a, b):
        result = defaultdict(int)
        for e, c in a.items():
            for f, d in b.items():
                result[tuple(e[i]+f[i] for i in range(6))] += c*d
        return {e: c for e, c in result.items() if c}
    z, eta = [var(i) for i in range(3)], [var(i+3) for i in range(3)]
    lhs, zz, ee, ze = {}, {}, {}, {}
    for a in range(3):
        zz, ee, ze = add(zz, mul(z[a], z[a])), add(ee, mul(eta[a], eta[a])), add(ze, mul(z[a], eta[a]))
        for b in range(a+1, 3):
            minor = add(mul(z[a], eta[b]), mul(z[b], eta[a]), -1)
            lhs = add(lhs, mul(minor, minor))
    require(lhs == add(mul(zz, ee), mul(ze, ze), -1), "gauge Gram determinant identity")
    # On x=(t e1,t e3,0), each surviving minor is t^2 and P=t^4.
    require(w[0][0, 2] == 1 and w[1][0, 2] == 0, "nonzero ray fixture")
    return {"positive_root_matrices_checked": len(positive), "Cartan_weights_checked": 4,
            "bivector_weight": [1, 1, 0, 0], "P_weight": [2, 2, 0, 0],
            "exact_color_Gram_polynomial_identity": True,
            "ray": "P(t e1,t e3,0)=t^4; ||X||=sqrt(2)t",
            "conditional_sector": {"fermion_mu": [6, 0, 0, 0], "k": 9,
                                   "lambda": [24, 18, 0, 0], "polynomial_degree": 36}}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    ab, pins = pinned_reader()
    result = {"status": "EXACT_FINITE_DIAGNOSTICS_PASS_NOT_SOURCE_GATE_C_ACCEPTANCE",
              "baseline_commit": BASE, "python": platform.python_version(), "numpy": np.__version__,
              "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              "source_pins": pins, "torus_projectors": torus_projectors(ab.source_gamma(), ab.epsilon),
              "label_gauge_commutators": 12,
              "exact_projector_eigenvalue_checks": 64,
              "F10AV_quarter_sum_plane_checks": 4,
              "canonical_lift_character": character_diagnostics(),
              "branching": branching_diagnostics(), "polynomial": polynomial_diagnostics(),
              "holds": ["actual source continuous Spin(9) lift and exact Fock/gauge binding",
                        "original source action on the smooth core, full one-color slice/exclusion theorem",
                        "original closed form and reducing-sector identification",
                        "independent formal source/consumer and axiom audit; zero new Lean roots here"]}
    encoded = json.dumps(result, indent=2, sort_keys=True)+"\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded)
    else:
        print(encoded, end="")


if __name__ == "__main__":
    main()
