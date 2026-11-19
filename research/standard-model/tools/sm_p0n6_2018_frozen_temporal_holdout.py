#!/usr/bin/env python3
"""SM-P0N6: verify frozen 2018 paper tables against central 2026 JUNO source.

Pure stdlib; no refit, no RGE simulation, no joint covariance, no chi-square.
Usage: python3 research/standard-model/tools/sm_p0n6_2018_frozen_temporal_holdout.py
"""
import json
import math
from pathlib import Path


def s2deg(a):
    return math.sin(math.radians(a)) ** 2


def check_close(a, b, label):
    assert math.isclose(a, b, abs_tol=2e-13, rel_tol=1e-11), (label, a, b)


def run():
    path = (Path(__file__).resolve().parent.parent / "data"
            / "SM_P0N6_FROZEN_2018_RGE_TEMPORAL_HOLDOUT_2026_11_18.json")
    d = json.loads(path.read_text(encoding="utf-8"))
    flags = d["qualification"]
    assert flags["experimental_likelihood_imported"] is False
    assert flags["experiment_significance_calculated"] is False
    assert flags["model_excluded"] is False
    assert flags["formal_lean_CI_run"] is False
    roles = d["observation_roles"]
    assert roles["initial_2018_solar_used_in_fit"] is True
    assert roles["sept2026_JUNO_207d_used_to_construct_historical_benchmark"] is False
    assert roles["claim_2018_parameter_free_solar_prediction"] is False
    obs = d["empirical_target"]
    assert obs["version"] == "arXiv:2609.37895v1"
    assert obs["prior_data_overlap"] is True
    assert obs["sin2_theta12"] == 0.3036
    assert obs["delta_m2_21_eV2"] == 7.388e-5
    groups = d["historical_benchmarks"]
    out = []
    for group_name, items in groups.items():
        assert len(items) == 4, group_name
        for item in items:
            assert item["published"] < "2026-09-29"
            assert item["source_fit_included_solar_angle"] is True
            assert item["source_fit_included_solar_split"] is True
            pred_s2 = s2deg(item["theta12_deg"])
            check_close(pred_s2, item["derived_sin2theta12"], item["case"])
            if group_name.startswith("geib"):
                assert item["m2_meV"] > 0
                pred_delta = (item["m2_meV"] * 1e-3) ** 2
                check_close(pred_delta, item["derived_delta_m2_21_eV2"],
                            item["case"] + " mass-squared")
            else:
                pred_delta = item["delta_m2_21_eV2"]
            out.append({
                "source": group_name,
                "case": item["case"],
                "frozen_theta12_deg": item["theta12_deg"],
                "frozen_sin2theta12": pred_s2,
                "frozen_minus_juno_sin2theta12": pred_s2 - obs["sin2_theta12"],
                "frozen_delta21_eV2": pred_delta,
                "frozen_minus_juno_delta21_eV2": pred_delta - obs["delta_m2_21_eV2"],
            })
    assert len(out) == 8
    assert all(x["frozen_minus_juno_sin2theta12"] > 0 for x in out)
    assert any(x["frozen_minus_juno_delta21_eV2"] < 0 for x in out)
    assert any(x["frozen_minus_juno_delta21_eV2"] > 0 for x in out)
    print(json.dumps({
        "status": "SOURCE_BOUND_OUT_OF_TIME_SCREEN_NO_SIGNIFICANCE",
        "fit_input_leakage": "SOLAR_INCLUDED_IN_HISTORICAL_2018_FITS",
        "new_2026_data_used_for_reoptimization": False,
        "model_wide_exclusion": False,
        "rows": out,
    }, indent=2))


if __name__ == "__main__":
    run()
