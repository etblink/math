#!/usr/bin/env python3
"""Owner cache pilot: seal freshly qualified K1D17 ancestry, or audit its exact cache.

Never promote acceptance. A cache hit is an imported-object audit, NOT source recompilation.
An invalid restored cache fails closed; a cache miss takes the existing cold strict route.
"""
import argparse
import hashlib
import importlib
import json
import os
import pathlib
import re
import subprocess
import sys
import tempfile

HERE = pathlib.Path(__file__).resolve()
REPO = HERE.parents[3]
LEAN = REPO / "lean"
sys.path.insert(0, str(HERE.parent))
from qualify_fcp_sync import code_only

EXPECTED_LEAN = "leanprover/lean4:v4.34.1"
EXPECTED_MATHLIB = "d13f23b723b8a846827a245b89c10fc7d3f11612"
ACCEPTED_SOURCE_SHA = "389ecdcc5a325905d656a36fb961fa949ab03f67"
BRANCH = "research/fcp-k1d17-ancestor-cache-pilot-20261028"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
CACHE = LEAN / ".lake/build/lib/lean/OAI"
RECEIPT = CACHE / ".fcp-k1d17-accepted-roots-cache-v1.json"


def blob(path):
    return subprocess.check_output(
        ["git", "-C", str(REPO), "hash-object", str(REPO / path)], text=True
    ).strip()


def digest(path):
    with path.open("rb") as file:
        return hashlib.file_digest(file, "sha256").hexdigest()


def exact_source(path, sha):
    assert blob(path) == sha, ("source has changed", path, blob(path), sha)
    if path.endswith(".lean"):
        assert not re.search(
            r"\b(?:sorry|admit|sorryAx|axiom)\b",
            code_only((REPO / path).read_text()),
        ), ("unproved source declaration", path)


def environment():
    assert (LEAN / "lean-toolchain").read_text().strip() == EXPECTED_LEAN
    lock = json.loads((LEAN / "lake-manifest.json").read_text())
    assert next(p["rev"] for p in lock["packages"] if p["name"] == "mathlib") == EXPECTED_MATHLIB
    assert subprocess.check_output(
        ["git", "-C", str(LEAN / ".lake/packages/mathlib"), "rev-parse", "HEAD"],
        text=True,
    ).strip() == EXPECTED_MATHLIB
    version = subprocess.check_output(
        ["lake", "env", "lean", "--version"], cwd=LEAN, text=True
    )
    assert "version 4.34.1," in version
    assert os.environ.get("GITHUB_REF_NAME", BRANCH) == BRANCH
    return version.strip()


def source_closure():
    manifest_path = "contributions/bfss-kotler/FCP_SYNC_MANIFEST_2026_10_27.json"
    exact_source(manifest_path, "601e77f885683eabff4fec3b5dc78a043c62f21e")
    exact_source(
        "contributions/bfss-kotler/tools/qualify_fcp_sync.py",
        "f0986e5748c383e4f4f6c5993114d195269326f9",
    )
    manifest = json.loads((REPO / manifest_path).read_text())
    assert manifest["lean_toolchain"] == EXPECTED_LEAN
    assert manifest["mathlib_sha"] == EXPECTED_MATHLIB
    for row in manifest["preserved_owner_modules"]:
        exact_source(row["path"], row["git_blob"])
    selected = {r["source_module"]: r for r in manifest["selected_modules"]}
    order = [name for name in manifest["topological_build_order"] if name in selected]
    assert len(order) == 22
    entries = []
    for name in order:
        r = selected[name]
        path = r["destination_path"]
        exact_source(path, r["destination_blob"])
        entries.append({
            "path": path, "blob": r["destination_blob"],
            "module": r["destination_module"], "roots": r["declaration_roots"],
        })

    parent = importlib.import_module("qualify_fcp_k1d3")
    exact_source("contributions/bfss-kotler/tools/qualify_fcp_k1d3.py",
                 "281a07aeb0a4137a9106930da18f4c6f4cd84035")
    for path, sha in parent.PINS.items():
        exact_source(path, sha)
    for name, sha, root in parent.FILES:
        path = "lean/" + parent.PREFIX + name + ".lean"
        exact_source(path, sha)
        entries.append({
            "path": path, "blob": sha,
            "module": "OAI.MathematicalPhysics.BFSS.Contrib.Kotler." + name,
            "roots": [root],
        })

    for n in range(5, 18):
        path = f"contributions/bfss-kotler/tools/qualify_fcp_k1d{n}.py"
        qualifier = importlib.import_module(f"qualify_fcp_k1d{n}")
        # Exact verifier identities chained from the qualified final K1D17 script.
        if n == 17:
            exact_source(path, "b33dc482e60ad8e188645969aac27da534df4c1c")
        for pinned_path, sha in qualifier.SOURCE_PINS.items():
            exact_source(pinned_path, sha)
        leanpath = "lean/" + str(qualifier.REL)
        exact_source(leanpath, qualifier.BLOB)
        entries.append({
            "path": leanpath, "blob": qualifier.BLOB,
            "module": str(qualifier.REL.with_suffix("")).replace("/", "."),
            "roots": qualifier.ROOTS,
        })
    roots = [root for e in entries for root in e["roots"]]
    assert len(entries) == 37, len(entries)
    assert len(roots) == 81 and len(set(roots)) == 81, len(roots)
    return entries


def output_path(entry):
    return LEAN / ".lake/build/lib/lean" / pathlib.Path(entry["path"][5:]).with_suffix(".olean")


def audit_roots(entries, logdir):
    logdir.mkdir(parents=True, exist_ok=True)
    roots = [r for e in entries for r in e["roots"]]
    with tempfile.TemporaryDirectory() as td:
        script = pathlib.Path(td) / "K1D17CachedAncestryRootAudit.lean"
        script.write_text(
            "\n".join("import " + e["module"] for e in entries) +
            "\n\n" + "\n".join("#print axioms " + r for r in roots) +
            "\n\n" + "\n".join("#check @" + r for r in roots) + "\n"
        )
        run = subprocess.run(
            ["lake", "env", "lean", "-DwarningAsError=true", str(script)],
            cwd=LEAN, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            timeout=900,
        )
    (logdir / "cached-ancestor-root-audit.log").write_text(run.stdout)
    assert run.returncode == 0, run.stdout[-4000:]
    assert "sorryAx" not in run.stdout
    assert not re.search(r"\.lean:\d+:\d+:\s*(?:warning|error):", run.stdout)
    reports = re.findall(
        r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^]]*)\]|does not depend on any axioms)",
        run.stdout,
    )
    assert [name for name, _ in reports] == roots, (
        "cached ancestor root names/order mismatch",
        [n for n, _ in reports],
    )
    report = []
    for name, ax in reports:
        axioms = [a.strip() for a in ax.split(",") if a.strip()]
        assert set(axioms) <= ALLOWED, (name, axioms)
        report.append({"name": name, "axioms": axioms})
    return report


def assert_cold_receipts():
    evidence = pathlib.Path(os.environ["RUNNER_TEMP"])
    for folder, n in [("ancestry", 22), ("parent", 2)]:
        p = evidence / f"bfss-cache-pilot-{folder}-evidence/results.json"
        rows = json.loads(p.read_text())
        assert len(rows) == n and all(x["strict_pass"] for x in rows), str(p)
    for n in range(5, 18):
        folder = "new" if n == 17 else f"k1d{n}"
        p = evidence / f"bfss-cache-pilot-{folder}-evidence/results.json"
        row = json.loads(p.read_text())
        assert row["strict_pass"] is True and row["exit_code"] == 0, str(p)
        assert len(row["roots"]) == (4 if n == 11 else 3 if n in (13, 14, 16, 17) else 2)
    print("FCP_CACHE_PILOT_COLD_STRICT_RECEIPTS_PASS modules=37 roots=81", flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("mode", choices=("seal", "verify"))
    parser.add_argument("--log-dir", type=pathlib.Path, required=True)
    args = parser.parse_args()
    version = environment()
    entries = source_closure()
    for entry in entries:
        obj = output_path(entry)
        assert obj.is_file() and obj.stat().st_size > 0, ("missing qualified olean", str(obj))
        entry["olean_sha256"] = digest(obj)

    if args.mode == "seal":
        assert_cold_receipts()
        report = audit_roots(entries, args.log_dir)
        assert not RECEIPT.exists(), "refuse to overwrite an existing cached receipt"
        RECEIPT.parent.mkdir(parents=True, exist_ok=True)
        receipt = {
            "schema": "fcp-k1d17-accepted-ancestor-cache-v1",
            "source_tested_sha": ACCEPTED_SOURCE_SHA,
            "source_lineage": "source-exact-k1d17-owner-strict-accepted",
            "lean": version,
            "mathlib": EXPECTED_MATHLIB,
            "runner_os": os.environ.get("RUNNER_OS"),
            "runner_arch": os.environ.get("RUNNER_ARCH"),
            "branch": BRANCH,
            "seed_run_id": os.environ.get("GITHUB_RUN_ID"),
            "entries": entries,
            "root_axioms": report,
        }
        RECEIPT.write_text(json.dumps(receipt, indent=2) + "\n")
        (args.log_dir / "cached-ancestor-receipt.json").write_text(
            json.dumps(receipt, indent=2) + "\n"
        )
        print("FCP_CACHE_PILOT_COLD_SEAL_PASS modules=37 roots=81", flush=True)
    else:
        receipt = json.loads(RECEIPT.read_text())
        assert receipt["schema"] == "fcp-k1d17-accepted-ancestor-cache-v1"
        assert receipt["source_tested_sha"] == ACCEPTED_SOURCE_SHA
        assert receipt["mathlib"] == EXPECTED_MATHLIB and receipt["lean"] == version
        assert receipt["runner_os"] == os.environ.get("RUNNER_OS")
        assert receipt["runner_arch"] == os.environ.get("RUNNER_ARCH")
        assert receipt["branch"] == BRANCH
        assert receipt["entries"] == entries, "source or object hashes changed"
        report = audit_roots(entries, args.log_dir)
        assert receipt["root_axioms"] == report, "cached axiom report changed"
        (args.log_dir / "cached-ancestor-receipt.json").write_text(
            json.dumps(receipt, indent=2) + "\n"
        )
        print("FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81", flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print("FCP_CACHE_PILOT_FAIL_CLOSED", repr(exc), file=sys.stderr, flush=True)
        raise
