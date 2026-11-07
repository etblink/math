#!/usr/bin/env python3
"""Fail-closed controls for the new gate's exact root/report boundary."""
import importlib.util
from pathlib import Path
import unittest

SPEC = importlib.util.spec_from_file_location(
    "core_gate", Path(__file__).with_name("qualify_spectral_core_linear_moment.py"))
gate = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(gate)


class ReportTests(unittest.TestCase):
    def setUp(self):
        self.marker = "SPECTRAL_CORE_LINEAR_MOMENT_AUDIT_OK"
        self.valid = "\n".join("'" + root + "' depends on axioms: "
                               "[propext, Classical.choice, Quot.sound]" for root in gate.ROOTS)
        self.valid += "\n" + self.marker + "\n"

    def check(self, text):
        return gate.check_reports(text, gate.ROOTS, self.marker)

    def test_exact_roots_pass(self):
        self.assertEqual(set(self.check(self.valid)), set(gate.ROOTS))

    def test_compiler_diagnostics_fail_even_with_marker(self):
        for diagnostic in ["file.lean:1:2: warning: unused", "file.lean:58:61: error: "
                           "(deterministic) timeout at whnf, maximum number of heartbeats reached"]:
            with self.subTest(diagnostic=diagnostic), self.assertRaises(ValueError):
                self.check(diagnostic + "\n" + self.valid)

    def test_foreign_missing_and_duplicate_roots_fail(self):
        for text in [self.valid.replace(gate.ROOTS[0], "Wrong.root"),
                     "\n".join(self.valid.splitlines()[1:]), self.valid + self.valid]:
            with self.subTest(text=text), self.assertRaises(ValueError):
                self.check(text)

    def test_unexpected_and_recovery_axioms_fail(self):
        for axiom in ["ExtraAxiom", "sorryAx"]:
            with self.subTest(axiom=axiom), self.assertRaises(ValueError):
                self.check(self.valid.replace("propext", axiom))

    def test_missing_and_duplicate_markers_fail(self):
        for text in [self.valid.replace(self.marker, ""), self.valid + self.marker + "\n"]:
            with self.subTest(text=text), self.assertRaises(ValueError):
                self.check(text)


if __name__ == "__main__":
    unittest.main()
