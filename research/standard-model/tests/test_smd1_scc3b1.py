#!/usr/bin/env python3
"""Independent synthetic adversarial SCC3B1 consumer and SCC0 compatibility audit."""
import sys
import unittest
from fractions import Fraction
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from smd1_scc0 import (
    Distribution, Family, Prediction, Scenario, Status, Verdict, Witness,
    compare_scenarios, compare_families, deterministic,
)
from smd1_scc3b1 import (
    ExactDifference as E, ProtocolIntegrity as I,
    PredictionCompleteness as C, JointLikelihood as J,
    compare_scenarios_v1, compare_families_v1, exact_total_variation,
)

OUTCOMES = ("zero", "one")


def witness(name, group=None, protocol="synthetic-v1", unit="dimensionless",
            outcomes=OUTCOMES):
    return Witness(name, protocol, unit, outcomes, group)


def prediction(w, actual=None, weights=None, provenance="synthetic-test-only"):
    dist = (deterministic(w.outcomes, actual) if weights is None
            else Distribution(tuple((k, Fraction(v)) for k, v in weights)))
    return Prediction(w.observable_id, w.protocol, w.unit, Status.PREDICTED,
                      dist, provenance)


def unavailable(w):
    return Prediction(w.observable_id, w.protocol, w.unit, Status.NOT_PREDICTED,
                      reason="no physical derivation")


def scenario(name, **preds):
    return Scenario(name, preds)


class IndependentSCC3B1Tests(unittest.TestCase):
    def test_known_positive_not_erased_by_missing_other_witness(self):
        x, y = witness("x"), witness("y")
        a = scenario("A", x=prediction(x, "zero"), y=prediction(y, "zero"))
        b = scenario("B", x=prediction(x, "one"), y=unavailable(y))
        self.assertEqual(compare_scenarios(a, b, (x, y)), Verdict.UNKNOWN)
        result = compare_scenarios_v1(a, b, (x, y))
        self.assertEqual(result.exact, E.WITNESS_PRESENT)
        self.assertEqual(result.positive_witnesses, ("x",))
        self.assertEqual(result.unavailable, ("y",))
        self.assertEqual(result.completeness, C.PARTIAL)
        self.assertFalse(result.complete_typed_comparison)

    def test_known_positive_survives_declared_dependence_without_likelihood(self):
        x, y = witness("x", "shared"), witness("y", "shared")
        a = scenario("A", x=prediction(x, "zero"), y=prediction(y, "zero"))
        b = scenario("B", x=prediction(x, "one"), y=prediction(y, "one"))
        self.assertEqual(compare_scenarios(a, b, (x, y)), Verdict.JOINT_REQUIRED)
        result = compare_scenarios_v1(a, b, (x, y))
        self.assertEqual(result.exact, E.WITNESS_PRESENT)
        self.assertEqual(result.joint, J.REQUIRES_EXPLICIT_JOINT)
        self.assertEqual(result.experimental_evidence, "NO_EXPERIMENTAL_INFERENCE")

    def test_missing_without_positive_is_undetermined(self):
        x, y = witness("x"), witness("y")
        a = scenario("A", x=prediction(x, "zero"), y=prediction(y, "zero"))
        b = scenario("B", x=prediction(x, "zero"))
        result = compare_scenarios_v1(a, b, (x, y))
        self.assertEqual(result.exact, E.UNDETERMINED)
        self.assertEqual(result.completeness, C.PARTIAL)

    def test_complete_equal_marginals_are_only_relative_equality(self):
        x = witness("x")
        a = scenario("A", x=prediction(x, "zero"))
        b = scenario("B", x=prediction(x, "zero"))
        result = compare_scenarios_v1(a, b, (x,))
        self.assertEqual(compare_scenarios(a, b, (x,)), Verdict.SAME_MARGINALS)
        self.assertEqual(result.exact, E.COMPLETE_AGREEMENT)
        self.assertTrue(result.complete_typed_comparison)

    def test_two_joints_with_identical_marginals_can_differ(self):
        x = witness("x", "shared")
        y = witness("y", "shared")
        half = (("zero", Fraction(1, 2)), ("one", Fraction(1, 2)))
        a = scenario("A", x=prediction(x, weights=half),
                     y=prediction(y, weights=half))
        b = scenario("B", x=prediction(x, weights=half),
                     y=prediction(y, weights=half))
        marginal = compare_scenarios_v1(a, b, (x, y))
        self.assertEqual(marginal.exact, E.COMPLETE_AGREEMENT)
        self.assertEqual(marginal.joint, J.REQUIRES_EXPLICIT_JOINT)
        joint = witness("xy_joint", outcomes=("00", "01", "10", "11"))
        joint_a = prediction(joint, weights=(("00", Fraction(1, 2)),
                                          ("01", Fraction(0)),
                                          ("10", Fraction(0)),
                                          ("11", Fraction(1, 2))))
        joint_b = prediction(joint, weights=(("00", Fraction(0)),
                                          ("01", Fraction(1, 2)),
                                          ("10", Fraction(1, 2)),
                                          ("11", Fraction(0))))
        result = compare_scenarios_v1(
            scenario("A_joint", xy_joint=joint_a),
            scenario("B_joint", xy_joint=joint_b), (joint,))
        self.assertEqual(result.exact, E.WITNESS_PRESENT)
        self.assertEqual(result.valid_marginal_tv, (("xy_joint", Fraction(1)),))

    def test_invalid_unit_does_not_count_as_witness(self):
        x = witness("x", unit="GeV")
        wrong = witness("x", unit="MeV")
        a = scenario("A", x=prediction(x, "zero"))
        b = scenario("B", x=prediction(wrong, "one"))
        result = compare_scenarios_v1(a, b, (x,))
        self.assertEqual(result.integrity, I.INVALID)
        self.assertEqual(result.invalid, ("x",))
        self.assertEqual(result.exact, E.UNDETERMINED)

    def test_invalid_unrelated_witness_does_not_erase_local_difference(self):
        x, y = witness("x"), witness("y", unit="GeV")
        wrong_y = witness("y", unit="MeV")
        a = scenario("A", x=prediction(x, "zero"), y=prediction(y, "zero"))
        b = scenario("B", x=prediction(x, "one"), y=prediction(wrong_y, "one"))
        result = compare_scenarios_v1(a, b, (x, y))
        self.assertEqual(compare_scenarios(a, b, (x, y)), Verdict.INVALID)
        self.assertEqual(result.exact, E.WITNESS_PRESENT)
        self.assertEqual(result.integrity, I.INVALID)
        self.assertFalse(result.complete_typed_comparison)

    def test_finite_scenarios_all_pairs_require_known_witness(self):
        x, y = witness("x"), witness("y")
        a = Family("A", (scenario("a0", x=prediction(x, "one"),
                                 y=prediction(y, "zero")),
                         scenario("a1", x=prediction(x, "zero"),
                                 y=prediction(y, "one"))))
        b = Family("B", (scenario("b", x=prediction(x, "zero"),
                                y=prediction(y, "zero")),))
        old = compare_families(a, b, (x, y))
        self.assertEqual(old, Verdict.UNIFORMLY_SEPARATED)
        fresh = compare_families_v1(a, b, (x, y))
        self.assertTrue(fresh.fully_typed_and_complete)
        self.assertTrue(fresh.uniformly_exact_separated)
        self.assertEqual([p[2].positive_witnesses for p in fresh.pairs],
                         [("x",), ("y",)])

    def test_incomplete_pair_blocks_full_family_certificate(self):
        x = witness("x")
        a = Family("A", (scenario("a0", x=prediction(x, "one")),
                         scenario("a1")))
        b = Family("B", (scenario("b", x=prediction(x, "zero")),))
        fresh = compare_families_v1(a, b, (x,))
        self.assertFalse(fresh.fully_typed_and_complete)
        self.assertFalse(fresh.uniformly_exact_separated)
        self.assertEqual([v[2].exact for v in fresh.pairs],
                         [E.WITNESS_PRESENT, E.UNDETERMINED])

    def test_invalid_outcomes_rejected_as_protocol_error(self):
        x = witness("x")
        wrong = witness("x", outcomes=("pass", "fail"))
        a = scenario("A", x=prediction(x, "zero"))
        b = scenario("B", x=prediction(wrong, "pass"))
        result = compare_scenarios_v1(a, b, (x,))
        self.assertEqual(result.integrity, I.INVALID)
        self.assertEqual(result.exact, E.UNDETERMINED)

    def test_valid_marginal_order_independent_and_half_tv(self):
        x = witness("x")
        a = scenario("A", x=prediction(x, weights=(("zero", Fraction(1)), ("one", Fraction(0)))))
        b = scenario("B", x=prediction(x, weights=(("one", Fraction(1, 2)),
                                                  ("zero", Fraction(1, 2)))))
        result = compare_scenarios_v1(a, b, (x,))
        self.assertEqual(result.exact, E.WITNESS_PRESENT)
        self.assertEqual(result.valid_marginal_tv, (("x", Fraction(1, 2)),))

    def test_tv_exact_mathematical_bounds(self):
        a = {"a": Fraction(1), "b": Fraction(0)}
        b = {"a": Fraction(0), "b": Fraction(1)}
        self.assertEqual(exact_total_variation(a, b, ("a", "b")), Fraction(1))
        self.assertEqual(exact_total_variation(a, a, ("a", "b")), Fraction(0))

    def test_duplicated_and_empty_observables_are_invalid_input(self):
        x = witness("x")
        a, b = scenario("A"), scenario("B")
        with self.assertRaises(ValueError):
            compare_scenarios_v1(a, b, ())
        with self.assertRaises(ValueError):
            compare_scenarios_v1(a, b, (x, x))

    def test_constructor_rejects_unvalidated_probability(self):
        with self.assertRaises(ValueError):
            Distribution((("zero", Fraction(1, 2)), ("one", Fraction(1, 3))))
        with self.assertRaises(ValueError):
            Distribution((("zero", Fraction(2)), ("one", Fraction(-1))))

    def test_missing_physical_map_remains_explicit_unavailable(self):
        x = witness("x")
        missing = Prediction("x", x.protocol, x.unit, Status.MISSING_PHYSICAL_MAP,
                             reason="no derivation of measurement map")
        a = scenario("A", x=prediction(x, "zero"))
        b = scenario("B", x=missing)
        result = compare_scenarios_v1(a, b, (x,))
        self.assertEqual(result.exact, E.UNDETERMINED)
        self.assertEqual(result.unavailable, ("x",))
        self.assertEqual(result.experimental_evidence, "NO_EXPERIMENTAL_INFERENCE")


if __name__ == "__main__":
    unittest.main()
