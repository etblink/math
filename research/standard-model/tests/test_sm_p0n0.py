#!/usr/bin/env python3
"""Independent SM-P0N0 source-exact physical intake and negative controls."""
import copy
import json
import sys
import tempfile
import unittest
from dataclasses import replace
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve()
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT / "tools"))

from sm_p0n0 import (
    CandidateIntake, CandidateStatus, MassSquaredSpectrum, Ordering,
    FIRST_JUNO_DOI, MASS_SQUARED_UNIT,
    candidate_intakes, intake_checkpoint, load_frozen_first_juno,
    same_delta_after_common_offset, symbolic_delta21,
)

LEDGER = ROOT / "data" / "SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json"


def tampered_ledger(mutator):
    data = json.loads(LEDGER.read_text())
    mutator(data)
    directory = tempfile.TemporaryDirectory()
    path = Path(directory.name) / "SM_D0_tampered.json"
    path.write_text(json.dumps(data))
    return directory, path


class PhysicalIntakeTests(unittest.TestCase):
    def test_01_exact_original_juno_value_and_errors(self):
        obs = load_frozen_first_juno(LEDGER)
        self.assertEqual(obs.value, Fraction(750, 10_000_000))
        self.assertEqual(obs.error_plus, Fraction(12, 10_000_000))
        self.assertEqual(obs.error_minus, obs.error_plus)
        self.assertEqual(obs.unit, MASS_SQUARED_UNIT)

    def test_02_provenance_and_ordering_are_not_optional(self):
        obs = load_frozen_first_juno(LEDGER)
        self.assertEqual(obs.source_url, FIRST_JUNO_DOI)
        self.assertEqual(obs.source_date, "2026-06-10")
        self.assertEqual(obs.analysis_ordering, Ordering.NORMAL)
        self.assertEqual(obs.role, "EMPIRICAL_MEASUREMENT_NOT_MODEL_PREDICTION")

    def test_03_correlation_and_likelihood_unavailable(self):
        obs = load_frozen_first_juno(LEDGER)
        self.assertEqual(obs.cofit_record_id, "juno_sin2theta12_2026")
        self.assertEqual(obs.covariance_status, "NOT_PRESENT_IN_FROZEN_LEDGER")
        self.assertEqual(obs.likelihood_status, "NOT_PRESENT_IN_FROZEN_LEDGER")

    def test_04_invariant_common_offset_over_finite_examples(self):
        for x in (Fraction(-5), Fraction(0), Fraction(1, 2), Fraction(42)):
            for y in (Fraction(-1), Fraction(1, 10), Fraction(33)):
                for c in (Fraction(-100), Fraction(0), Fraction(1, 7), Fraction(100)):
                    self.assertTrue(same_delta_after_common_offset(x, y, c))
                    self.assertEqual(symbolic_delta21(x + c, y + c),
                                     symbolic_delta21(x, y))

    def test_05_distinct_nonnegative_mass_spectra_same_splitting(self):
        p = MassSquaredSpectrum(Fraction(0), Fraction(3, 40_000),
                                Fraction(1, 400), Ordering.NORMAL)
        q = p.shifted(Fraction(1, 1000))
        self.assertNotEqual(p, q)
        self.assertEqual(p.delta21(), q.delta21())
        self.assertEqual(p.delta21(), Fraction(3, 40_000))
        self.assertNotEqual(p.m1_sq, q.m1_sq)

    def test_06_inverted_ordering_common_shift(self):
        p = MassSquaredSpectrum(Fraction(1, 400), Fraction(1, 400) + Fraction(3, 40_000),
                                Fraction(0), Ordering.INVERTED)
        q = p.shifted(Fraction(1, 1000))
        self.assertEqual(p.delta21(), q.delta21())
        self.assertEqual(q.ordering, Ordering.INVERTED)

    def test_07_no_absolute_mass_from_splitting(self):
        p = MassSquaredSpectrum(Fraction(0), Fraction(3, 40_000),
                                Fraction(1, 400), Ordering.NORMAL)
        self.assertNotEqual(p.m1_sq, p.shifted(Fraction(1)).m1_sq)
        self.assertEqual(p.delta21(), p.shifted(Fraction(1)).delta21())

    def test_08_negative_squared_mass_rejected(self):
        with self.assertRaises(ValueError):
            MassSquaredSpectrum(Fraction(-1), Fraction(1), Fraction(2), Ordering.NORMAL)

    def test_09_wrong_unit_and_ordering_rejected(self):
        with self.assertRaises(ValueError):
            MassSquaredSpectrum(Fraction(0), Fraction(1), Fraction(2),
                                Ordering.NORMAL, unit="eV")
        with self.assertRaises(ValueError):
            MassSquaredSpectrum(Fraction(0), Fraction(1), Fraction(2), Ordering.INVERTED)

    def test_10_invalid_solar_order_rejected(self):
        with self.assertRaises(ValueError):
            MassSquaredSpectrum(Fraction(1), Fraction(0), Fraction(2), Ordering.NORMAL)
        with self.assertRaises(ValueError):
            MassSquaredSpectrum(Fraction(0), Fraction(0), Fraction(2), Ordering.NORMAL)

    def test_11_floating_point_as_source_mass_rejected(self):
        with self.assertRaises(TypeError):
            MassSquaredSpectrum(0.0, Fraction(1), Fraction(2), Ordering.NORMAL)
        with self.assertRaises(TypeError):
            symbolic_delta21(0.0, Fraction(1))
        with self.assertRaises(TypeError):
            same_delta_after_common_offset(Fraction(0), Fraction(1), 0.2)

    def test_12_registry_never_fabricates_candidate_predictions(self):
        rows = {x.candidate: x for x in candidate_intakes()}
        self.assertEqual(rows["BFSS"].status, CandidateStatus.MISSING_PHYSICAL_MAP)
        self.assertEqual(rows["NFC-protected-persistence"].status,
                         CandidateStatus.MISSING_PHYSICAL_MAP)
        self.assertEqual(rows["neutrino-extended-SM-fit"].status,
                         CandidateStatus.FIT_INPUT_NOT_PREDICTION)
        self.assertTrue(all(x.model_prediction is None for x in rows.values()))
        self.assertTrue(all(not x.source_derived for x in rows.values()))

    def test_13_cannot_turn_fit_into_qualified_prediction(self):
        example = candidate_intakes()[0]
        with self.assertRaises(ValueError):
            replace(example, source_derived=True)
        with self.assertRaises(ValueError):
            replace(example, model_prediction=Fraction(3, 40_000))

    def test_14_cannot_guess_candidate_status(self):
        with self.assertRaises(TypeError):
            CandidateIntake("invented", "PREDICTED", None, False)

    def test_15_freeze_rejects_changed_empirical_provenance(self):
        def change(x):
            next(r for r in x["constraints"] if r["id"] == "juno_dm2_21_2026"
                 )["source"]["url"] = "https://example.org/unverified"
        tmp, path = tampered_ledger(change)
        try:
            with self.assertRaises(ValueError):
                load_frozen_first_juno(path)
        finally:
            tmp.cleanup()

    def test_16_freeze_rejects_wrong_mass_unit(self):
        def change(x):
            next(r for r in x["constraints"] if r["id"] == "juno_dm2_21_2026"
                 )["value"]["unit"] = "MeV^2"
        tmp, path = tampered_ledger(change)
        try:
            with self.assertRaises(ValueError):
                load_frozen_first_juno(path)
        finally:
            tmp.cleanup()

    def test_17_freeze_rejects_wrong_ordering_and_unrecognized_snapshot(self):
        def change(x):
            x["as_of"] = "2026-11-19"
        tmp, path = tampered_ledger(change)
        try:
            with self.assertRaises(ValueError):
                load_frozen_first_juno(path)
        finally:
            tmp.cleanup()
        def change_order(x):
            next(r for r in x["constraints"] if r["id"] == "juno_dm2_21_2026"
                 )["details"]["analysis_ordering"] = "inverted ordering"
        tmp, path = tampered_ledger(change_order)
        try:
            with self.assertRaises(ValueError):
                load_frozen_first_juno(path)
        finally:
            tmp.cleanup()

    def test_18_cofitted_angle_covariance_warning_cannot_be_deleted(self):
        def change(x):
            next(r for r in x["constraints"] if r["id"] == "juno_sin2theta12_2026"
                 )["details"]["aggregation"] = "independent of squared mass"
        tmp, path = tampered_ledger(change)
        try:
            with self.assertRaises(ValueError):
                load_frozen_first_juno(path)
        finally:
            tmp.cleanup()

    def test_19_checkpoint_counts_zero_predictions_and_no_likelihood(self):
        checkpoint = intake_checkpoint(LEDGER)
        self.assertEqual(checkpoint["model_prediction_count"], 0)
        self.assertEqual(checkpoint["measurement"]["likelihood_status"],
                         "NOT_PRESENT_IN_FROZEN_LEDGER")
        self.assertEqual(checkpoint["experimental_evidence"], "NO_EXPERIMENTAL_INFERENCE")
        self.assertEqual(checkpoint["physical_SM_D1"], "PROSPECTIVE_UNSTAGED")
        self.assertEqual(len(checkpoint["candidate_statuses"]), 4)

    def test_20_candidate_original_not_as_validation(self):
        for row in candidate_intakes():
            self.assertEqual(row.comparison_verdict,
                             "NOT_COMPARABLE_NO_QUALIFIED_PREDICTION")
            self.assertEqual(row.experimental_evidence, "NO_EXPERIMENTAL_INFERENCE")


if __name__ == "__main__":
    unittest.main()
