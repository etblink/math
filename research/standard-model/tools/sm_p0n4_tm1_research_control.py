#!/usr/bin/env python3
"""SM-P0N4 independent finite arithmetic and counterfactual consumer.

Run: python3 research/standard-model/tools/sm_p0n4_tm1_research_control.py
Uses Python standard library only. Verifies conditional algebraic identities
against source-pinned published CENTRAL inputs. NO experiment likelihood,
no CI qualification, no physical theory or statistical model verdict.
"""
import cmath
import json
import math
from pathlib import Path


def dot(u, v):
    return sum(x * y for x, y in zip(u, v))


def solar_from_dayabay_amplitude(amplitude):
    assert 0 < amplitude < 1
    s13_sq = (1 - math.sqrt(1 - amplitude)) / 2
    assert s13_sq < 0.5  # reactor small-angle branch
    return s13_sq, (1 - 3 * s13_sq) / (3 * (1 - s13_sq))


def assert_tm1_kernel(n):
    a = (0, 1, 1)
    b = (1, n, n - 2)
    q = (2, -1, 1)
    assert abs(dot(a, q)) <= 1e-12
    assert abs(dot(b, q)) <= 1e-12
    for ma, mb, phase in ((1, 0.11, 2 * math.pi / 3),
                          (0.002, 0.004, -1.3),
                          (4.5, 7.25, 0.7)):
        mat = [[ma * a[i] * a[j] + mb * cmath.exp(1j * phase) * b[i] * b[j]
                for j in range(3)] for i in range(3)]
        product = [dot(row, q) for row in mat]
        assert all(abs(x) < 1e-12 * max(1, abs(ma), abs(mb), abs(n))**2 for x in product)
    return 4/6


def main():
    path = Path(__file__).resolve().parent.parent / "data" / "SM_P0N4_CSD3_TM1_SOLAR_MIXING_SCREEN_2026_11_18.json"
    raw = json.loads(path.read_text(encoding="utf-8"))
    assert raw["quantitative_inference"]["full_joint_likelihood_available"] is False
    assert raw["quantitative_inference"]["exclusion_claimed"] is False
    assert raw["model"]["model_uv_unique_from_this_relation"] is False

    for n in (2.5, 3, 1 + math.sqrt(6), 7.0):
        assert math.isclose(assert_tm1_kernel(n), 2/3)

    # Explicit rank-two counterexample: same two-singlet class, different kernel.
    neg = raw["adversarial_controls"][0]
    qa, qb, qq = neg["a"], neg["b"], neg["q"]
    assert dot(qa, qq) == 0 and dot(qb, qq) == 0
    assert math.isclose(qq[0]**2 / sum(k*k for k in qq), 1/3)
    assert not math.isclose(1/3, 2/3)

    inp = raw["experimental_inputs"]
    amp, delta = inp["reactor"]["central"], inp["reactor"]["quoted_plus_minus"]
    juno = inp["juno_latest"]["central"]
    juno_err = inp["juno_latest"]["quoted_plus_minus"]
    sin13, pred = solar_from_dayabay_amplitude(amp)
    interval = sorted((solar_from_dayabay_amplitude(amp-delta)[1],
                       solar_from_dayabay_amplitude(amp+delta)[1]))
    obs_interval = [juno-juno_err, juno+juno_err]
    obs_ue1 = (1-juno)*(1-sin13)
    # Change only the first-column electron weight via an illustrative charged-lepton rotation.
    phi = math.atan(1/2) - math.acos(math.sqrt(6*obs_ue1)/math.sqrt(5))
    assert math.isclose((2*math.cos(phi)+math.sin(phi))**2/6,obs_ue1,abs_tol=1e-13)
    inferred_s13=(1-3*juno)/(3*(1-juno))
    derived={
        "sin2theta13_from_dayabay_small_angle_branch":sin13,
        "sin2theta12_tm1_given_dayabay":pred,
        "sin2theta12_juno_207d":juno,
        "signed_tm1_minus_juno_207d":pred-juno,
        "central_juno_59d_difference":pred-inp["juno_historical"]["central"],
        "tm1_interval_from_dayabay_quoted_one_parameter_pm":interval,
        "juno_interval_from_quoted_pm":obs_interval,
        "inferred_ue1_abs2_from_juno_dayabay":obs_ue1,
        "source_tm1_ue1_abs2":2/3,
        "central_ue1_abs2_difference":obs_ue1-2/3,
        "sin2theta13_required_by_juno_central_if_strict_tm1":inferred_s13,
        "sin2_2theta13_required_by_juno_central_if_strict_tm1":4*inferred_s13*(1-inferred_s13),
        "charged_lepton_real_12_rotation_degrees_to_match_only_ue1_abs2":phi*180/math.pi
    }
    want=raw["derived_central_arithmetic"]
    for key, value in derived.items():
        target=want[key]
        if isinstance(value,list):
            assert len(value)==len(target)
            assert all(math.isclose(x,y,rel_tol=1e-12,abs_tol=1e-12)
                       for x,y in zip(value,target)), key
        else:
            assert math.isclose(value,target,rel_tol=1e-12,abs_tol=1e-12), key
    assert interval[0] > obs_interval[1] # diagnostics only, not statistical inference
    print(json.dumps({
        "status":"SOURCE_BOUND_CONDITIONAL_ARITHMETIC_ONLY",
        "exclusion":False,
        "joint_likelihood":False,
        "verified":derived
    },indent=2))


if __name__=="__main__":
    main()
