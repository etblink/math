#!/usr/bin/env python3
"""Regression controls for the observed Lake/compiler diagnostic boundary."""
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

SPEC = importlib.util.spec_from_file_location(
    "linear_gate", Path(__file__).with_name("qualify_spectral_linear_moment.py"))
gate = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(gate)
FIXTURE = gate.REPO / ("contributions/bfss-kotler/evidence/spectral-confinement-2026-11-06/"
                       "linear-moment-42312000477-source-log.txt")


class EvidenceBoundaryTests(unittest.TestCase):
    def setUp(self):
        self.raw = FIXTURE.read_text()
        self.compiler = self.raw[self.raw.index("'OAI.BFSSRellich."):]
        self.marker = "SPECTRAL_LINEAR_MOMENT_SOURCE_OK"

    def test_observed_compiler_output_passes(self):
        reports = gate.check_reports(self.compiler, self.marker)
        self.assertEqual(set(reports), set(gate.ROOTS))
        self.assertTrue(all(set(v) == gate.ALLOWED for v in reports.values()))

    def test_mixed_lake_output_still_fails(self):
        with self.assertRaisesRegex(ValueError, "candidate Lean diagnostic"):
            gate.check_reports(self.raw, self.marker)

    def test_real_compiler_warnings_remain_fatal(self):
        for diagnostic in ("file.lean:1:2: warning: unused variable",
                           "file.lean:1:2: error: failed proof",
                           "warning: arbitrary compiler warning"):
            with self.subTest(diagnostic=diagnostic), self.assertRaises(ValueError):
                gate.check_reports(self.compiler + diagnostic + "\n", self.marker)

    def test_axiom_and_completion_failures_remain_fatal(self):
        for bad in (self.compiler.replace("propext", "sorryAx"),
                    self.compiler.replace("propext", "ExtraAxiom"),
                    self.compiler.replace(gate.ROOTS[0], "Wrong.root"),
                    self.compiler + self.marker + "\n",
                    self.compiler.replace(self.marker, "")):
            with self.subTest(text=bad), self.assertRaises(ValueError):
                gate.check_reports(bad, self.marker)

    def resolve(self, resultcode=0, missing_path=False, wrong_version=False):
        with tempfile.TemporaryDirectory() as directory:
            evidence = Path(directory)
            compiler = evidence / "lean"
            compiler.write_bytes(b"compiler fixture, never executed")
            selected = {"PATH": str(evidence), "LEAN_PATH": str(gate.BUILD)}
            if missing_path:
                del selected["LEAN_PATH"]

            def lake(command, **kwargs):
                self.assertEqual(command[:2], ["lake", "env"])
                kwargs["stderr"].write("warning: dependency has local changes\n")
                return subprocess.CompletedProcess(command, resultcode, json.dumps(selected))

            version = "Lean (version " + ("4.33.0" if wrong_version else "4.34.1") + ", fixture)\n"
            with patch.object(gate.subprocess, "run", side_effect=lake) as probe, \
                    patch.object(gate.subprocess, "check_output", return_value=version), \
                    patch.object(gate.shutil, "which", return_value=str(compiler)):
                actual, env, provenance = gate.compiler_environment(evidence)
            self.assertEqual(actual, str(compiler))
            self.assertEqual(env["LEAN_PATH"], str(gate.BUILD))
            self.assertEqual(provenance["lake_log_sha256"], gate.digest(evidence / "lake-environment.log"))
            self.assertEqual(probe.call_count, 1)
            self.assertNotIn("PATH", provenance)

    def test_lake_stderr_is_separate_from_compiler_environment(self):
        self.resolve()

    def test_failed_environment_resolution_is_fatal(self):
        with self.assertRaisesRegex(ValueError, "Lake environment resolution failed"):
            self.resolve(resultcode=1)

    def test_missing_search_path_is_fatal(self):
        with self.assertRaisesRegex(ValueError, "missing compiler/search path"):
            self.resolve(missing_path=True)

    def test_wrong_resolved_compiler_version_is_fatal(self):
        with self.assertRaisesRegex(ValueError, "resolved compiler version"):
            self.resolve(wrong_version=True)


if __name__ == "__main__":
    unittest.main()
