#!/usr/bin/env python3
"""Independent SM-D1-SCC0 consumer: synthetic and exact arithmetic fixtures.

The comparator is a *methodology* check, not a validated empirical result.
Original qualified SM-Y0 and SM-D0 artifacts are separately preserved.
"""
import sys
import unittest
from fractions import Fraction
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from smd1_scc0 import (
    Distribution, Family, Prediction, Scenario, Status, Verdict, Witness,
    compare_families, compare_scenarios, deterministic,
    minimal_separating_families, smy0_counterfactual,
)


OUTCOMES = ("zero", "nonzero")


def witness(name, group=None, protocol="synthetic-v1", unit="dimensionless"):
    return Witness(name, protocol, unit, OUTCOMES, group)


def prediction(w, result):
    return Prediction(w.observable_id, w.protocol, w.unit, Status.PREDICTED,
                      deterministic(w.outcomes, result), "synthetic-test-only")


def scenario(name, **predictions):
    return Scenario(name, predictions)


def family(name, *scenarios):
    return Family(name, tuple(scenarios))


class SMDSCC0IndependentTests(unittest.TestCase):
    def test_equal_marginals_not_theory_identity(self):
        w = witness("toy")
        a, b = scenario("a", toy=prediction(w, "zero")), scenario("b", toy=prediction(w, "zero"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.SAME_MARGINALS)

    def test_one_witness_separates_exactly(self):
        w = witness("toy")
        a, b = scenario("a", toy=prediction(w, "zero")), scenario("b", toy=prediction(w, "nonzero"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.SEPARATED)

    def test_missing_prediction_is_not_equality(self):
        w = witness("toy")
        a = scenario("a", toy=prediction(w, "zero"))
        b = scenario("b", toy=Prediction("toy", w.protocol, w.unit, Status.NOT_PREDICTED,
                                         reason="no derivation"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.UNKNOWN)

    def test_missing_physical_map_is_not_success(self):
        w = witness("toy")
        a = scenario("a", toy=prediction(w, "zero"))
        b = scenario("b", toy=Prediction("toy", w.protocol, w.unit,
                                         Status.MISSING_PHYSICAL_MAP,
                                         reason="4D observable map absent"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.UNKNOWN)

    def test_omitted_observable_cannot_be_inferred(self):
        w = witness("toy")
        self.assertEqual(compare_scenarios(scenario("a"), scenario("b"), (w,)), Verdict.UNKNOWN)

    def test_wrong_proton_decay_channel_rejected(self):
        w = witness("p_to_e_pi0", protocol="proton-two-body")
        wrong = Prediction(w.observable_id, "proton-three-body", w.unit, Status.PREDICTED,
                           deterministic(OUTCOMES, "zero"), "synthetic-test-only")
        a, b = scenario("a", p_to_e_pi0=prediction(w, "zero")), scenario("b", p_to_e_pi0=wrong)
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.INVALID)

    def test_unit_substitution_rejected(self):
        w = witness("mass", unit="GeV")
        wrong = Prediction("mass", w.protocol, "MeV", Status.PREDICTED,
                           deterministic(OUTCOMES, "zero"), "synthetic-test-only")
        a, b = scenario("a", mass=prediction(w, "zero")), scenario("b", mass=wrong)
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.INVALID)

    def test_outcome_substitution_rejected(self):
        w = witness("test")
        wrong = Prediction("test", w.protocol, w.unit, Status.PREDICTED,
                           deterministic(("pass", "fail"), "pass"), "synthetic-test-only")
        self.assertEqual(compare_scenarios(scenario("a", test=prediction(w, "zero")),
                                           scenario("b", test=wrong), (w,)), Verdict.INVALID)

    def test_duplicate_observable_rejected(self):
        w = witness("test")
        with self.assertRaises(ValueError):
            compare_scenarios(scenario("a"), scenario("b"), (w, w))

    def test_empty_witness_set_rejected(self):
        with self.assertRaises(ValueError):
            compare_scenarios(scenario("a"), scenario("b"), ())

    def test_unproven_prediction_rejected(self):
        with self.assertRaises(ValueError):
            Prediction("test", "p", "u", Status.PREDICTED,
                       deterministic(OUTCOMES, "zero"), provenance="")

    def test_unnormalized_distribution_rejected(self):
        with self.assertRaises(ValueError):
            Distribution((("a", Fraction(1, 2)), ("b", Fraction(1, 3))))

    def test_negative_weight_rejected(self):
        with self.assertRaises(ValueError):
            Distribution((("a", Fraction(2)), ("b", Fraction(-1))))

    def test_duplicate_outcome_rejected(self):
        with self.assertRaises(ValueError):
            Distribution((("a", Fraction(1)), ("a", Fraction(0))))

    def test_wrong_scenario_key_rejected(self):
        w = witness("original")
        with self.assertRaises(ValueError):
            scenario("invalid", altered=prediction(w, "zero"))

    def test_correlated_juno_marginals_cannot_form_joint(self):
        w1 = witness("juno_sin2theta12_2026", group="JUNO-first-59-days")
        w2 = witness("juno_dm2_21_2026", group="JUNO-first-59-days")
        a = scenario("a", **{w.observable_id: prediction(w, "zero") for w in (w1, w2)})
        b = scenario("b", **{w.observable_id: prediction(w, "nonzero") for w in (w1, w2)})
        self.assertEqual(compare_scenarios(a, b, (w1, w2)), Verdict.JOINT_REQUIRED)
        self.assertEqual(compare_scenarios(a, b, (w1,)), Verdict.SEPARATED)

    def test_explicit_joint_witness_is_distinct_from_two_marginals(self):
        w = Witness("synthetic_joint_JUNO", "synthetic-joint-protocol", "categorical",
                    ("00", "01", "10", "11"))
        a = scenario("a", synthetic_joint_JUNO=Prediction(
            w.observable_id, w.protocol, w.unit, Status.PREDICTED,
            deterministic(w.outcomes, "00"), "synthetic-joint-test-only"))
        b = scenario("b", synthetic_joint_JUNO=Prediction(
            w.observable_id, w.protocol, w.unit, Status.PREDICTED,
            deterministic(w.outcomes, "11"), "synthetic-joint-test-only"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.SEPARATED)

    def test_distinct_model_scenario_not_uniform_family_separation(self):
        w = witness("toy")
        a = family("A", scenario("a0", toy=prediction(w, "zero")),
                   scenario("a1", toy=prediction(w, "nonzero")))
        b = family("B", scenario("b0", toy=prediction(w, "nonzero")))
        self.assertEqual(compare_families(a, b, (w,)), Verdict.OVERLAP)
        self.assertEqual(minimal_separating_families(a, b, (w,)), ())

    def test_uniformly_separated_finite_families(self):
        w = witness("toy")
        a = family("A", scenario("a0", toy=prediction(w, "zero")))
        b = family("B", scenario("b0", toy=prediction(w, "nonzero")),
                   scenario("b1", toy=prediction(w, "nonzero")))
        self.assertEqual(compare_families(a, b, (w,)), Verdict.UNIFORMLY_SEPARATED)

    def test_minimal_family_nonunique(self):
        x, y = witness("x"), witness("y")
        a = family("A", scenario("a", x=prediction(x, "zero"), y=prediction(y, "zero")))
        b = family("B", scenario("b", x=prediction(x, "nonzero"),
                                 y=prediction(y, "nonzero")))
        self.assertEqual(minimal_separating_families(a, b, (x, y)), (("x",), ("y",)))

    def test_minimal_family_requires_two_complementary_witnesses(self):
        x, y = witness("x"), witness("y")
        a = family("A", scenario("a1", x=prediction(x, "zero"), y=prediction(y, "zero")),
                   scenario("a2", x=prediction(x, "nonzero"), y=prediction(y, "nonzero")))
        b = family("B", scenario("b", x=prediction(x, "zero"), y=prediction(y, "nonzero")))
        self.assertEqual(minimal_separating_families(a, b, (x, y)), (("x", "y"),))

    def test_smy0_charge_counterfactual_independently_recomputed(self):
        baseline, changed = smy0_counterfactual()
        self.assertEqual(baseline, (Fraction(0),) * 4)
        self.assertEqual(changed[:2], (-Fraction(1, 3), -Fraction(1, 2)))
        w1 = witness("SU3sqU1", protocol="SMY0-coefficient", unit="rational")
        w2 = witness("SU2sqU1", protocol="SMY0-coefficient", unit="rational")
        def encode(ws, values, label):
            return scenario(label, **{
                w.observable_id: Prediction(
                    w.observable_id, w.protocol, w.unit, Status.PREDICTED,
                    deterministic(w.outcomes, "zero" if value == 0 else "nonzero"),
                    "SM-Y0 assumed-one-family rational coefficients only")
                for w, value in zip(ws, values)
            })
        a = family("canonical", encode((w1, w2), baseline, "base"))
        b = family("Q-hypercharge-zero", encode((w1, w2), changed, "changed"))
        self.assertEqual(compare_families(a, b, (w1, w2)), Verdict.UNIFORMLY_SEPARATED)
        self.assertEqual(minimal_separating_families(a, b, (w1, w2)),
                         (("SU3sqU1",), ("SU2sqU1",)))

    def test_oscillation_splitting_cannot_fix_absolute_baseline(self):
        # Synthetic mass-squared spectra; NOT observed neutrino masses.
        low = (Fraction(0), Fraction(3))
        shifted = (Fraction(9), Fraction(12))
        self.assertEqual(low[1] - low[0], shifted[1] - shifted[0])
        w_osc = witness("synthetic_dm2")
        w_abs = witness("synthetic_m1sq")
        a = scenario("a", synthetic_dm2=prediction(w_osc, "zero"),
                     synthetic_m1sq=prediction(w_abs, "zero"))
        b = scenario("b", synthetic_dm2=prediction(w_osc, "zero"),
                     synthetic_m1sq=prediction(w_abs, "nonzero"))
        self.assertEqual(compare_scenarios(a, b, (w_osc,)), Verdict.SAME_MARGINALS)
        self.assertEqual(compare_scenarios(a, b, (w_abs,)), Verdict.SEPARATED)

    def test_marginal_order_irrelevant(self):
        w = witness("toy")
        d = Distribution((("nonzero", Fraction(0)), ("zero", Fraction(1))))
        a = scenario("a", toy=prediction(w, "zero"))
        b = scenario("b", toy=Prediction("toy", w.protocol, w.unit,
                                         Status.PREDICTED, d, "synthetic-only"))
        self.assertEqual(compare_scenarios(a, b, (w,)), Verdict.SAME_MARGINALS)


if __name__ == "__main__":
    unittest.main()
