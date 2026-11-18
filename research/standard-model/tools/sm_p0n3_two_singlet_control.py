#!/usr/bin/env python3
"""SM-P0N3 central-input conditional arithmetic, not a seesaw/JUNO prediction.

Usage: python3 research/standard-model/tools/sm_p0n3_two_singlet_control.py
Pure Python standard library; fails if named expected outputs drift.
No experimental likelihood, parameter fit, or model validation is implemented.
"""
import json
import math
from pathlib import Path


def compute(raw):
    p = raw["numerical_control"]["inputs"]
    d21 = p["juno_207d_delta_m2_21_ev2"]
    dno = p["juno_207d_delta_m2_31_no_ev2"]
    dio = p["juno_207d_delta_m2_31_io_ev2"]
    s12 = p["juno_207d_sin2_theta12"]
    amplitude13 = p["dayabay_2023_sin2_2theta13"]
    assert d21 > 0 and dno > 0 and dio < 0
    assert 0 < s12 < 1 and 0 < amplitude13 < 1
    # Select the small-angle branch for theta13. Do NOT pretend this is
    # a model prediction; its input is measured by Daya Bay.
    s13 = (1.0 - math.sqrt(1.0 - amplitude13)) / 2.0
    c13 = 1.0 - s13
    w = [(1 - s12) * c13, s12 * c13, s13]
    assert math.isclose(sum(w), 1.0, abs_tol=1e-14)
    scenarios = {
        "NO": [0.0, math.sqrt(d21), math.sqrt(dno)],
        "IO": [math.sqrt(-dio), math.sqrt(-dio + d21), 0.0],
    }
    result = {}
    for label, masses in scenarios.items():
        assert masses.count(0.0) == 1
        mbeta = math.sqrt(sum(weight * mass**2 for weight, mass in zip(w, masses)))
        majorana_terms = [weight * mass for weight, mass in zip(w, masses)]
        # One light mass is exactly zero in this narrowly restricted tree-level model.
        # Vary the relative Majorana phase of the other two terms freely.
        mbb_min = max(0.0, 2.0 * max(majorana_terms) - sum(majorana_terms))
        result[label] = {
            "masses_ev": masses,
            "sigma_ev": sum(masses),
            "m_beta_ev": mbeta,
            "m_betabeta_light_only_min_ev": mbb_min,
            "m_betabeta_light_only_max_ev": sum(majorana_terms),
        }
    return s13, result


def main():
    path = Path(__file__).resolve().parent.parent / "data" / "SM_P0N3_TWO_SINGLET_CONDITIONAL_CONTROL_2026_11_18.json"
    raw = json.loads(path.read_text(encoding="utf-8"))
    assert raw["numerical_control"]["joint_likelihood"] == "NOT_IMPORTED"
    assert raw["model"]["source_derived_delta_m2_21"] is False
    assert raw["model"]["qualifies_as_unique_two_singlet_uv_signature"] is False
    theta13, computed = compute(raw)
    assert math.isclose(theta13, raw["numerical_control"]["derived_electron_sin2_theta13"], abs_tol=2e-14)
    expected = raw["numerical_control"]["expected"]
    for label in ("NO", "IO"):
        for key, want in expected[label].items():
            got = computed[label][key]
            if isinstance(want, list):
                assert len(want) == len(got)
                for g, w in zip(got, want):
                    assert math.isclose(g, w, rel_tol=1e-11, abs_tol=2e-14), (label, key, g, w)
            else:
                assert math.isclose(got, want, rel_tol=1e-11, abs_tol=2e-14), (label, key, got, want)
    assert computed["NO"]["sigma_ev"] < computed["IO"]["sigma_ev"]
    print(json.dumps({
        "control_status": "LOCAL_ARITHMETIC_PASS_NOT_PHYSICS_QUALIFICATION",
        "input_role": "OBSERVED_PARAMETER_CONDITIONAL",
        "joint_likelihood": "NOT_IMPORTED",
        "derived_electron_sin2_theta13": theta13,
        "central_scenarios": computed,
    }, indent=2))


if __name__ == "__main__":
    main()
