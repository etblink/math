#!/usr/bin/env python3
"""Adversarial cache-integrity tests; fixture bytes are NOT Lean proof evidence."""
import copy
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

import qualify_fcp_dd_ai_cache as cache


class CacheIntegrityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.stage = Path(self.temp.name)
        self.m = cache.load_manifest()
        self.env = {"test": "environment"}
        for name in cache.object_names(self.m):
            p = self.stage / "objects" / name
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(b"structural-test-fixture")
        self.receipt = {"schema": self.m["schema"], "source_tested_sha": self.m["source_tested_sha"],
                        "source_run_id": self.m["source_run_id"], "environment": self.env,
                        "seed_sha": "a" * 40, "seed_run_id": "123",
                        "objects": cache.inventory(self.stage / "objects", self.m)}
        self.write_receipt()

    def write_receipt(self):
        (self.stage / "receipt.json").write_text(json.dumps(self.receipt))

    def verify(self):
        return cache.verify_bundle(self.stage, self.m, self.env)

    def first_object(self):
        return self.stage / "objects" / cache.object_names(self.m)[0]

    def test_complete_consistent_bundle(self):
        self.assertEqual(self.verify(), self.receipt)

    def test_same_size_byte_corruption(self):
        p = self.first_object()
        p.write_bytes(b"X" + p.read_bytes()[1:])
        with self.assertRaisesRegex(ValueError, "digest mismatch"):
            self.verify()

    def test_missing_object(self):
        self.first_object().unlink()
        with self.assertRaisesRegex(ValueError, "missing or extraneous"):
            self.verify()

    def test_extra_candidate_object(self):
        (self.first_object().parent / "UnacceptedCandidate.olean").write_bytes(b"extra")
        with self.assertRaisesRegex(ValueError, "missing or extraneous"):
            self.verify()

    def test_empty_object(self):
        self.first_object().write_bytes(b"")
        with self.assertRaisesRegex(ValueError, "empty cached object"):
            self.verify()

    def test_symlink_object(self):
        p = self.first_object()
        outside = self.stage.parent / (self.stage.name + "-outside")
        outside.write_bytes(p.read_bytes())
        self.addCleanup(outside.unlink)
        p.unlink()
        p.symlink_to(outside)
        with self.assertRaisesRegex(ValueError, "linked cache entry"):
            self.verify()

    def test_wrong_dependency_environment(self):
        self.receipt["environment"] = {"test": "other-environment"}
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, "environment mismatch"):
            self.verify()

    def test_wrong_accepted_provenance(self):
        self.receipt["source_tested_sha"] = "b" * 40
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, "wrong accepted provenance"):
            self.verify()

    def test_oversize_bundle(self):
        self.m["max_bytes"] = 1
        with self.assertRaisesRegex(ValueError, "128 MiB bound"):
            self.verify()

    def test_wrong_source_pin(self):
        m = copy.deepcopy(self.m)
        m["sources"][0]["blob"] = "0" * 40
        with self.assertRaisesRegex(ValueError, "changed pin"):
            cache.check_sources(m)

    def test_duplicate_missing_and_unauthorized_reports(self):
        expected = {"FCP.a": ["propext"], "FCP.b": []}
        good = "'FCP.a' depends on axioms: [propext]\n'FCP.b' does not depend on any axioms\n"
        cache.check_reports(good, expected)
        for text in (good.splitlines()[0], good + good, good.replace("FCP.b", "FCP.a"),
                     good.replace("propext", "sorryAx"), good.replace("propext", "unapproved"),
                     good + "X.lean:1:2: warning: unexpected\n"):
            with self.subTest(text=text), self.assertRaises(ValueError):
                cache.check_reports(text, expected)


class PackageDirectoryTests(unittest.TestCase):
    def test_all_42_locked_names_resolve_uniquely(self):
        lock = json.loads((cache.LEAN / "lake-manifest.json").read_text())
        pairs = cache.package_directories(lock)
        self.assertEqual(len(pairs), 42)
        self.assertEqual(len({name for _, name in pairs}), 42)
        mapping = {package["name"]: name for package, name in pairs}
        self.assertEqual(mapping["«doc-gen4»"], "doc-gen4")
        self.assertEqual(mapping["«formal-schemes»"], "formal-schemes")
        self.assertEqual(mapping["mathlib"], "mathlib")
        self.assertEqual(mapping["LeanSearchClient"], "LeanSearchClient")

    def test_bad_names_and_layouts_fail_before_git(self):
        for name in ("../outside", "/absolute", "a/b", "a.b", "«doc-gen4", "doc-gen4»", "««x»»"):
            lock = {"packagesDir": ".lake/packages", "packages": [
                {"name": name, "type": "git", "subDir": None}]}
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "package name"):
                cache.package_directories(lock)
        for mutation in ({"type": "path"}, {"subDir": "nested"}):
            package = {"name": "x", "type": "git", "subDir": None, **mutation}
            with self.subTest(mutation=mutation), self.assertRaisesRegex(ValueError, "layout"):
                cache.package_directories({"packagesDir": ".lake/packages", "packages": [package]})

    def test_alias_collision_rejected(self):
        packages = [{"name": name, "type": "git", "subDir": None}
                    for name in ("«doc-gen4»", "doc-gen4")]
        with self.assertRaisesRegex(ValueError, "duplicate package directory"):
            cache.package_directories({"packagesDir": ".lake/packages", "packages": packages})

    def test_real_git_revisions_and_missing_dependency(self):
        with tempfile.TemporaryDirectory() as td:
            packages_dir = Path(td)
            packages = []
            for manifest_name, dirname in (("«doc-gen4»", "doc-gen4"), ("mathlib", "mathlib")):
                path = packages_dir / dirname
                subprocess.run(["git", "init", "-q", str(path)], check=True)
                subprocess.run(["git", "-C", str(path), "-c", "user.name=Cache Test",
                                "-c", "user.email=cache-test@example.invalid", "-c", "commit.gpgsign=false",
                                "commit", "-q", "--allow-empty", "-m", "local dependency fixture"], check=True)
                rev = subprocess.check_output(["git", "-C", str(path), "rev-parse", "HEAD"], text=True).strip()
                packages.append({"name": manifest_name, "rev": rev, "type": "git", "subDir": None})
            lock = {"packagesDir": ".lake/packages", "packages": packages}
            cache.check_dependency_revisions(lock, packages_dir)
            bad = copy.deepcopy(lock)
            bad["packages"][0]["rev"] = "0" * 40
            with self.assertRaisesRegex(ValueError, "dependency revision"):
                cache.check_dependency_revisions(bad, packages_dir)
            shutil.rmtree(packages_dir / "doc-gen4")
            with self.assertRaisesRegex(ValueError, "missing dependency repository"):
                cache.check_dependency_revisions(lock, packages_dir)


if __name__ == "__main__":
    unittest.main()
