#!/usr/bin/env python3
"""Strict independent owner qualification of K1D3/K1D4 scalar compositions.

Requires the separately qualified 22-module ancestor closure to have been
compiled in the pinned Lake workspace. Never updates acceptance status.
"""
import argparse
import hashlib
import json
import pathlib
import re
import subprocess
import sys
import time

THIS = pathlib.Path(__file__).resolve()
REPO = THIS.parents[3]
LEAN = REPO / "lean"
sys.path.insert(0, str(THIS.parent))
from qualify_fcp_sync import code_only

PREFIX = "OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
FILES = [
    ("SU2BFSSPhysicalDomainS1V52K1D3OriginalExteriorScalarCommonCoordinateKernel",
     "04c477227d2a535e01abe0e01ea1ae57ff116321",
     "FCP.BFSSS1V52K1D3.originalExteriorScalar_of_all_coordinateContractions_zero"),
    ("SU2BFSSPhysicalDomainS1V52K1D4OriginalSpin48ExteriorScalarKernel",
     "271865855ec72fc428fe29aa005392273fad165f",
     "FCP.BFSSS1V52K1D4.originalSourceSpin48_trivialAction_exterior_scalar"),
]
PINS = {
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D2F2OriginalPBWAllContractionsNoOccupiedLabelsProbe.lean":
        "eada39fbd5891865e9662a610cf10deb584834da",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D2E5OriginalPBWEmptySupportScalarProbe.lean":
        "31f171b108b06c995824cdb84ad70f26f1060b10",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D1OriginalPolarCoordinateExteriorContractionProbe.lean":
        "7e91352f3d3134b54bbc4e26e0caf702c36f2fa0",
    "contributions/bfss-kotler/tools/qualify_fcp_sync.py":
        "f0986e5748c383e4f4f6c5993114d195269326f9",
    "contributions/bfss-kotler/FCP_SYNC_MANIFEST_2026_10_27.json":
        "601e77f885683eabff4fec3b5dc78a043c62f21e",
}
ALLOWED_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}


def blob_of(p):
    return subprocess.check_output(
        ["git", "-C", str(REPO), "hash-object", str(REPO / p)], text=True
    ).strip()


def run():
    ap = argparse.ArgumentParser()
    ap.add_argument("--log-dir", required=True, type=pathlib.Path)
    args = ap.parse_args()
    logs = args.log_dir.resolve()
    logs.mkdir(parents=True, exist_ok=True)

    assert (LEAN / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.34.1"
    manifest = json.loads((LEAN / "lake-manifest.json").read_text())
    expected_ml = "d13f23b723b8a846827a245b89c10fc7d3f11612"
    assert next(x["rev"] for x in manifest["packages"] if x["name"] == "mathlib") == expected_ml
    assert subprocess.check_output(
        ["git", "-C", str(LEAN / ".lake/packages/mathlib"), "rev-parse", "HEAD"],
        text=True,
    ).strip() == expected_ml
    version = subprocess.check_output(["lake", "env", "lean", "--version"], cwd=LEAN, text=True)
    assert "version 4.34.1," in version, version

    for p, sha in PINS.items():
        assert blob_of(p) == sha, (p, blob_of(p), sha)
    roots = []
    for name, sha, declaration in FILES:
        rel = pathlib.Path(PREFIX + name + ".lean")
        src = LEAN / rel
        assert blob_of("lean/" + str(rel)) == sha, name
        body = code_only(src.read_text())
        assert not re.search(r"\b(?:sorry|admit|sorryAx|axiom)\b", body), name
        declared = re.findall(r"(?m)^#print axioms (\S+)", src.read_text())
        assert declared == [declaration.rsplit(".", 1)[1]], (name, declared)
        assert re.search(r"(?m)^namespace\s+" + re.escape(declaration.rsplit(".", 1)[0]) + r"\s*$",
                         src.read_text()), name
        roots.append(declaration)

    results = []
    out = LEAN / ".lake/build/lib/lean"
    for name, sha, declaration in FILES:
        rel = pathlib.Path(PREFIX + name + ".lean")
        dst = (out / rel).with_suffix(".olean")
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.unlink(missing_ok=True)
        started = time.monotonic()
        result = subprocess.run(
            ["lake", "env", "lean", "-DwarningAsError=true", "-o", str(dst), str(rel)],
            cwd=LEAN, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=900
        )
        (logs / (name + ".log")).write_text(result.stdout)
        reports = re.findall(
            r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^]]*)\]|does not depend on any axioms)",
            result.stdout
        )
        valid = (result.returncode == 0 and dst.is_file() and dst.stat().st_size > 0
                 and [n for n, _ in reports] == [declaration]
                 and "sorryAx" not in result.stdout
                 and not re.search(r"\.lean:\d+:\d+:\s*(?:warning|error):", result.stdout)
                 and all({a.strip() for a in ax.split(",") if a.strip()} <= ALLOWED_AXIOMS
                         for _, ax in reports))
        results.append({
            "module": name, "source_blob": sha, "declaration": declaration,
            "exit_code": result.returncode, "strict_pass": bool(valid),
            "reported_axioms": [a.strip() for a in reports[0][1].split(",") if a.strip()]
                if reports else None,
            "olean_sha256": hashlib.file_digest(dst.open("rb"), "sha256").hexdigest()
                if valid else None,
            "seconds": round(time.monotonic() - started, 3),
        })
        (logs / "results.json").write_text(json.dumps(results, indent=2) + "\n")
        print(("PASS" if valid else "FAIL") + " " + name, flush=True)
        if not valid:
            print(result.stdout)
            return 1

    rootcheck = logs / "NewRootTypes.lean"
    rootcheck.write_text(
        "".join("import " + PREFIX.replace("/", ".") + name + "\n" for name, _, _ in FILES)
        + "\n" + "".join("#check @" + root + "\n" for root in roots)
    )
    check = subprocess.run(
        ["lake", "env", "lean", "-DwarningAsError=true", str(rootcheck)],
        cwd=LEAN, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=900
    )
    (logs / "root-types.log").write_text(check.stdout)
    assert check.returncode == 0, check.stdout
    assert not re.search(r"\.lean:\d+:\d+:\s*(?:warning|error):", check.stdout), check.stdout
    print("FCP_K1D3_SOURCE_SCALAR_COMPOSITION_STRICT_PASS modules=2 roots=2")
    return 0


if __name__ == "__main__":
    sys.exit(run())
