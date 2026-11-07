#!/usr/bin/env python3
"""Exploratory fixed-axis Cartan test. A pass does not qualify the BFSS source gate."""
import argparse
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

SPEC = importlib.util.spec_from_file_location(
    "source_nine_reports", Path(__file__).with_name("qualify_spectral_source_nine_gamma_covariance.py"))
q = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(q)
REPO, LEAN, BUILD = q.REPO, q.LEAN, q.BUILD
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_MANIFEST_V1.json"
SOURCE = "diagnostics.BFSSAxisCartanSupportDiagnostic"
ROOTS = ["FCP.BFSSAxisCartanSupportDiagnostic." + n for n in
         ["reflections_generate_fixing_aux", "reflections_generate_fixing_nine"]]


def preflight():
    m = json.loads(MANIFEST.read_text())
    q.require(m["schema"] == "bfss-axis-cartan-support-diagnostic-v1", "schema")
    q.require(m["baseline"] == "f8b58b96a2b30334348347d2e5dbb7d7649675fb", "baseline")
    q.require(len(m["candidates"]) == 2 and len(m["controls"]) == 31, "input count")
    entries = m["candidates"] + m["controls"]
    q.require(len({e["path"] for e in entries}) == len(entries), "duplicate input")
    for e in entries:
        p = REPO / e["path"]
        q.require(q.git("hash-object", str(p)) == e["blob"] and q.digest(p) == e["sha256"],
                  "changed input: " + e["path"])
    for index, e in enumerate(m["candidates"]):
        q.require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean", "module path")
        q.require(e["module"] == [SOURCE, SOURCE + "Consumer"][index], "module inventory")
        q.require(q.imports(REPO / e["path"]) ==
                  (["Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional",
                    "Mathlib.Analysis.InnerProductSpace.PiL2"]
                   if index == 0 else [SOURCE]), "exact diagnostic imports")
        code = q.uncomment((REPO / e["path"]).read_text())
        q.require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe|instance)\b|"
                                r"\blinter\.|attribute\s+\[instance\]", code), "forbidden token")
        q.require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                  [("autoImplicit", "false")], "proof options")
        q.require(e["roots"] == ROOTS and
                  re.findall(r"(?m)^#print axioms (\S+)$", code) == ROOTS, "root inventory")
        q.require(code.count('"' + e["marker"] + '"') == 1, "marker inventory")
        if index == 0:
            q.require(re.findall(r"(?m)^theorem (\S+)\s", code) ==
                      [x.rsplit(".", 1)[1] for x in ROOTS], "source declarations")
        else:
            q.require(len(re.findall(r"(?m)^example\b", code)) == 6, "consumer count")
    q.require((LEAN / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.34.1",
              "compiler pin")
    return m


def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": q.git("rev-parse", "HEAD"), "status": "INCOMPLETE",
               "scope": "exploratory Mathlib-only Cartan lemma; zero BFSS source acceptance",
               "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    for e in m["candidates"] + m["controls"]:
        target = evidence / "inputs" / e["path"]
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], target)
    shutil.copyfile(MANIFEST, evidence / MANIFEST.name)
    try:
        receipt["packages"] = q.base.environment()
        compiler, env, receipt["compiler_environment"] = q.base.compiler_environment(evidence)
        for e in m["candidates"]:
            stem = BUILD / e["module"].replace(".", "/")
            for ext in (".olean", ".ilean", ".olean.private", ".olean.server"):
                Path(str(stem) + ext).unlink(missing_ok=True)
        for index, e in enumerate(m["candidates"]):
            obj = BUILD / (e["module"].replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            log = evidence / f"{index:02d}-compiler.log"
            command = [compiler, "-DautoImplicit=false", "-DwarningAsError=true",
                       "-o", str(obj), str(REPO / e["path"])]
            print("Compiling " + e["module"], flush=True)
            start = time.monotonic()
            with log.open("w") as out:
                result = subprocess.run(command, cwd=LEAN, env=env, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=600)
            text = log.read_text()
            print(text, flush=True)
            entry = {"module": e["module"], "returncode": result.returncode,
                     "seconds": round(time.monotonic() - start, 3), "log": log.name,
                     "log_sha256": q.digest(log)}
            receipt["builds"].append(entry)
            q.require(result.returncode == 0 and obj.is_file(), "diagnostic compilation failed")
            entry["object_sha256"] = q.digest(obj)
            entry["axioms"] = q.check_reports(text, ROOTS, e["marker"])
        preflight()
        receipt["status"] = "DIAGNOSTIC_PASS"
    finally:
        (evidence / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_PASS", flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["preflight", "run"])
    parser.add_argument("--evidence", type=Path)
    args = parser.parse_args()
    manifest = preflight()
    if args.command == "run":
        q.require(args.evidence is not None, "evidence path required")
        run(manifest, args.evidence.resolve())
    else:
        print("BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_PREFLIGHT_PASS")
