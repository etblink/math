#!/usr/bin/env python3
"""Exact-diff recovery guards, including unapproved proof and option edits."""
import importlib.util
import json
from pathlib import Path
import unittest

SPEC = importlib.util.spec_from_file_location(
    "massless_gate", Path(__file__).with_name("qualify_spectral_massless_source.py"))
gate = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(gate)


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        self.entries = json.loads(gate.MANIFEST.read_text())["recovered"]

    def test_all_four_round_trips(self):
        for e in self.entries:
            with self.subTest(path=e["path"]):
                self.assertTrue(gate.original_bytes(e, (gate.REPO / e["path"]).read_text()))

    def test_changed_proof_body_is_rejected(self):
        e = self.entries[0]
        text = (gate.REPO / e["path"]).read_text()
        changed = text.replace("  simp [deformedPotentialMatrix", "  simp only [deformedPotentialMatrix", 1)
        self.assertNotEqual(changed, text)
        with self.assertRaisesRegex(ValueError, "unapproved statement/proof edit"):
            gate.original_bytes(e, changed)

    def test_changed_option_is_rejected(self):
        e = self.entries[0]
        text = (gate.REPO / e["path"]).read_text().replace("autoImplicit false", "autoImplicit true", 1)
        with self.assertRaises(ValueError):
            gate.original_bytes(e, text)

    def test_changed_import_is_rejected(self):
        e = self.entries[0]
        text = (gate.REPO / e["path"]).read_text().replace(e["target_import"], "import Mathlib", 1)
        with self.assertRaises(ValueError):
            gate.original_bytes(e, text)

    def test_extra_trailing_command_is_rejected(self):
        e = self.entries[0]
        with self.assertRaises(ValueError):
            gate.original_bytes(e, (gate.REPO / e["path"]).read_text() + "set_option maxHeartbeats 0\n")

    def test_unrecorded_private_print_is_rejected(self):
        e = self.entries[-1]
        text = (gate.REPO / e["path"]).read_text().replace(
            e["private_print_anchor"], e["removed_private_print"] + e["private_print_anchor"], 1)
        with self.assertRaises(ValueError):
            gate.original_bytes(e, text)


if __name__ == "__main__":
    unittest.main()
