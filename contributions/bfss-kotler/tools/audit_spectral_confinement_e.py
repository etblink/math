#!/usr/bin/env python3
"""Full-space scalar rotation and linear-tail diagnostics, not a Lean admission.

Python 3 + NumPy. Integer/Fraction calculations only. No arbitrary trial-state
energy is presented as a test of the conditional high-type coercivity theorem.
"""
from __future__ import annotations

import argparse
from fractions import Fraction
import hashlib
import importlib.util
import itertools as it
import json
from pathlib import Path
import platform

import numpy as np


ROOT = Path(__file__).resolve().parents[3]
BASE = "834ee74907dc633fbfd4b9a7a0fb65f36acfc51c"
BFSS = "lean/OAI/MathematicalPhysics/BFSS/"
PINS = {
    "contributions/bfss-kotler/tools/audit_spectral_confinement_c.py":
        "3789af587796975f82f0afc4b71938ec746b7228",
    BFSS+"FormCompactness.lean": "f0264994e3a212011316206f74287aac8e32e99a",
    BFSS+"WeightedCompactness.lean": "368cdf0386dfa39e4be2af08300ef7f8bdf481bb",
    BFSS+"RellichCompactness.lean": "d7641afe2857b7d253d225a510e142e5af1fbc7f",
    BFSS+"FormClosure.lean": "2f82213fed6d6d2c27c188cca941b29334488258",
}


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def pinned_reader():
    pins = {}
    for path, expected in PINS.items():
        data = (ROOT/path).read_bytes()
        blob = hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
        require(blob == expected, f"source pin mismatch: {path}")
        pins[path] = {"git_blob": blob, "sha256": hashlib.sha256(data).hexdigest()}
    source = ROOT/"contributions/bfss-kotler/tools/audit_spectral_confinement_c.py"
    spec = importlib.util.spec_from_file_location("pinned_spectral_c", source)
    c = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(c)
    ab, inherited = c.pinned_reader()
    pins.update(inherited)
    return ab, pins


def det3(a):
    return (int(a[0, 0])*(int(a[1, 1])*int(a[2, 2])-int(a[1, 2])*int(a[2, 1]))
            -int(a[0, 1])*(int(a[1, 0])*int(a[2, 2])-int(a[1, 2])*int(a[2, 0]))
            +int(a[0, 2])*(int(a[1, 0])*int(a[2, 1])-int(a[1, 1])*int(a[2, 0])))


def color_rotation(quaternion):
    a, b, c, d = quaternion
    denominator = a*a+b*b+c*c+d*d
    matrix = np.array([
        [a*a+b*b-c*c-d*d, 2*(b*c-a*d), 2*(b*d+a*c)],
        [2*(b*c+a*d), a*a-b*b+c*c-d*d, 2*(c*d-a*b)],
        [2*(b*d-a*c), 2*(c*d+a*b), a*a-b*b-c*c+d*d],
    ], dtype=np.int64)
    require(np.array_equal(matrix@matrix.T, denominator**2*np.eye(3, dtype=np.int64)),
            "rational color orthogonality")
    require(det3(matrix) == denominator**3, "proper color rotation")
    return matrix, denominator


def potential(x):
    # Original scalar wedge potential, exact in source coefficient coordinates.
    return sum((int(x[a, i])*int(x[b, j])-int(x[a, j])*int(x[b, i]))**2
               for a, b in it.combinations(range(3), 2)
               for i, j in it.combinations(range(9), 2))


def scalar_rotation_checks(ab):
    rotations = [color_rotation(q) for q in [(1, 0, 0, 0), (1, 2, 3, 4),
                                            (2, -1, 0, 3), (1, 1, 0, 0)]]
    spatial = []
    for plane in [(0, 1), (2, 5), (6, 8)]:
        r = 5*np.eye(9, dtype=np.int64)
        i, j = plane
        r[i, i], r[i, j], r[j, i], r[j, j] = 3, 4, -4, 3
        require(np.array_equal(r@r.T, 25*np.eye(9, dtype=np.int64)), "spatial orthogonality")
        spatial.append(r)
    rng = np.random.default_rng(2026110605)
    xs = [np.zeros((3, 9), dtype=np.int64)]
    for rank in (1, 2, 3):
        x = np.zeros((3, 9), dtype=np.int64)
        for a in range(rank):
            x[a, a] = 1
        xs.append(x)
    xs.extend(rng.integers(-3, 4, size=(3, 9)) for _ in range(16))
    for x in xs:
        gram = x@x.T
        trace = int(np.trace(gram))
        require(2*potential(x) == trace**2-int(np.trace(gram@gram)), "trace/minor potential identity")
        for o, denominator in rotations:
            y = o@x
            require(int(np.sum(y*y)) == denominator**2*int(np.sum(x*x)), "Frobenius invariance")
            require(potential(y) == denominator**4*potential(x), "color scalar-potential invariance")
            # v=O^T e1, so e1^T O X=v^T X. No density invariance is assumed.
            directional = np.array([sum(int(o[0, a])*int(x[a, i]) for a in range(3))
                                    for i in range(9)], dtype=np.int64)
            require(np.array_equal(y[0], directional), "rotated one-color direction")
        for r in spatial:
            require(potential(x@r.T) == 5**4*potential(x), "spatial scalar-potential invariance")
    # Color-major diagnostic coordinates -> the literal (space,color) coordinate packing.
    packing = np.array([3*i+a for a in range(3) for i in range(9)])
    for o, denominator in rotations:
        color = np.kron(o, np.eye(9, dtype=np.int64))
        require(np.array_equal(color@color.T, denominator**2*np.eye(27, dtype=np.int64)),
                "27-dimensional kinetic isometry")
        for r in spatial:
            space = np.kron(np.eye(3, dtype=np.int64), r)
            require(np.array_equal(color@space, space@color), "color/spatial pullbacks commute")
            cp, sp = np.empty_like(color), np.empty_like(space)
            cp[np.ix_(packing, packing)], sp[np.ix_(packing, packing)] = color, space
            require(np.array_equal(cp@sp, sp@cp), "literal space/color coordinate commutation")
    # A bosonic-only color rotation does NOT leave the full fermionic term fixed.
    basis = ab.coefficient_checks(ab.source_gamma())
    require(not np.array_equal(basis[0, 8], basis[1, 8]), "reject full-q invariance shortcut")
    return {"configurations": len(xs), "color_rotations": len(rotations),
            "spatial_rotations": len(spatial), "color_potential_checks": len(xs)*len(rotations),
            "spatial_potential_checks": len(xs)*len(spatial),
            "tensor_commutators_before_and_after_coordinate_transport": len(rotations)*len(spatial),
            "bosonic_only_rotation_of_full_q_was_not_assumed": True,
            "fermionic_coefficient_noninvariance_fixture": True}


def constants_and_tails():
    beta, root_beta, m = Fraction(49, 100), Fraction(7, 10), 11
    require(root_beta**2 == beta, "exact kinetic allocation")
    oscillator = 2*root_beta*(m+9)
    averaged = oscillator/2
    a = Fraction(1, 2)-beta
    require(oscillator == 28 and averaged == 14 and a == Fraction(1, 100), "H1 coefficients")
    c_squared = 192  # (8 sqrt(3))^2
    require(14**2 > c_squared, "positive exact margin")
    lower_margin = Fraction(1, 7)
    require((averaged-lower_margin)**2 > c_squared, "margin strictly exceeds one-seventh")
    radii = [7, 70, 700, 7000]
    tails = [{"form_energy_upper_bound": 1, "radius": r,
              "tail_mass_upper_bound": str(Fraction(7, r))} for r in radii]
    require(Fraction(7, 700) == Fraction(1, 10)**2, "L2 tail norm conversion")
    return {"beta": str(beta), "oscillator_coefficient": str(oscillator),
            "averaged_scalar_coefficient": str(averaged), "gradient_coefficient": str(a),
            "radial_coefficient": "14-8sqrt(3)", "strict_rational_lower_bound": "1/7",
            "rational_certificate": {"left_numerator": 9409, "right_numerator": 9408,
                                     "common_denominator": 49},
            "unit_energy_tail_bounds": tails,
            "epsilon_norm_example": "R=700 gives tail L2 norm <=1/10 for q<=1"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    ab, pins = pinned_reader()
    result = {
        "status": "SCALAR_ROTATION_AND_LINEAR_TAIL_DIAGNOSTICS_PASS_NOT_SOURCE_ACCEPTANCE",
        "baseline_commit": BASE, "python": platform.python_version(), "numpy": np.__version__,
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), "source_pins": pins,
        "scalar_rotation_checks": scalar_rotation_checks(ab),
        "constants_and_tails": constants_and_tails(),
        "noninvariant_measure_fixture": {"I_e1": 1, "I_e2": 0, "J": 1,
                                         "sphere_average_I": "1/2",
                                         "scope": "atomic measure fixture; not a high-type BFSS wavefunction"},
        "moment_signature_countercheck": {"controlled_weight_squared": "r",
                                           "existing_direct_instantiation_requires": "c r^2 <= r for all r",
                                           "failure": "any c>0 fails at r>1/c",
                                           "smooth_bump_sequence": "H1 bound fixed, first moment <=m1+1, second moment=m2+R",
                                           "scope": "Sobolev/moment fixture only; not a BFSS escape state"},
        "conditional_result": "q >= T/100 + (14-8sqrt(3))J on the full-space high-type smooth core",
        "remaining_source_obligations": ["actual full Spin(9) Fock/spatial action and low-level exclusion",
                                          "exact original smooth-core kinetic/potential/B identity",
                                          "physical sector form-core/reduction and exact closed-source Hamiltonian binding",
                                          "fresh Lean source/consumer and axiom qualification"],
        "no_moving_frame_estimate_claimed": True,
        "no_new_Lean_roots": True,
    }
    encoded = json.dumps(result, indent=2, sort_keys=True)+"\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded)
    else:
        print(encoded, end="")


if __name__ == "__main__":
    main()
