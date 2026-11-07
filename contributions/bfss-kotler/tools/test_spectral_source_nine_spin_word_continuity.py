#!/usr/bin/env python3
"""Adversarial output checks for the strict original PBW Spin word continuity acceptance boundary."""
import unittest
import qualify_spectral_source_nine_spin_word_continuity as q


class Reports(unittest.TestCase):
    roots = ["Test.first", "Test.second"]
    marker = "TEST_COMPLETE"
    good = ("'Test.first' depends on axioms: [propext, Classical.choice, Quot.sound]\n"
            "'Test.second' does not depend on any axioms\nTEST_COMPLETE\n")

    def reject(self, text):
        with self.assertRaises(ValueError):
            q.check_reports(text, self.roots, self.marker)

    def test_valid(self):
        self.assertEqual(q.check_reports(self.good, self.roots, self.marker)["Test.second"], [])

    def test_missing_root(self):
        self.reject(self.good.replace("'Test.second' does not depend on any axioms\n", ""))

    def test_duplicate_root(self):
        self.reject(self.good + "'Test.second' does not depend on any axioms\n")

    def test_foreign_root(self):
        self.reject(self.good.replace("Test.second", "Test.substitute"))

    def test_recovery_axiom(self):
        self.reject(self.good.replace("propext", "sorryAx"))

    def test_unauthorized_axiom(self):
        self.reject(self.good.replace("propext", "Unproved.confinement"))

    def test_warning_even_with_all_reports(self):
        self.reject(self.good + "candidate.lean:5:2: warning: diagnostic\n")

    def test_error_even_with_all_reports(self):
        self.reject(self.good + "candidate.lean:5:2: error: failed\n")

    def test_incomplete_marker(self):
        self.reject(self.good.replace("TEST_COMPLETE", "TEST_INCOMPLETE"))

    def test_duplicate_marker(self):
        self.reject(self.good + "TEST_COMPLETE\n")


class PBWSetup(unittest.TestCase):
    def reject(self, code):
        with self.assertRaises(ValueError):
            q.check_local_pbw_setup(code, True)

    def test_exact_local_values(self):
        self.assertIsNone(q.check_local_pbw_setup(q.PBW_LOCAL_ATTRIBUTE + "\n", True))
        self.assertIsNone(q.check_local_pbw_setup("", False))

    def test_missing_setup(self):
        self.reject("")

    def test_duplicate_setup(self):
        self.reject((q.PBW_LOCAL_ATTRIBUTE + "\n") * 2)

    def test_foreign_norm(self):
        self.reject(q.PBW_LOCAL_ATTRIBUTE.replace("source9PBWNormedAddCommGroup", "ReplacementNorm"))

    def test_global_registration(self):
        self.reject(q.PBW_LOCAL_ATTRIBUTE.replace("[local instance]", "[instance]"))

    def test_extra_instance(self):
        self.reject(q.PBW_LOCAL_ATTRIBUTE + "\nlocal instance extra : NewTopology := substitute\n")


if __name__ == "__main__":
    unittest.main()
