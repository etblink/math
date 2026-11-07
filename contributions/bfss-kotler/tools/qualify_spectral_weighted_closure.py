#!/usr/bin/env python3
"""Cold weighted-closure gate, reusing frozen accepted analysis utilities."""
import argparse
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

SPEC = importlib.util.spec_from_file_location(
    "accepted_core_moment", Path(__file__).with_name("qualify_spectral_core_linear_moment.py"))
accepted = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(accepted)
runtime = accepted.accepted
REPO, LEAN, BUILD = accepted.REPO, accepted.LEAN, accepted.BUILD
require, git, digest, uncomment, imports = (accepted.require, accepted.git,
                                         accepted.digest, accepted.uncomment, accepted.imports)
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_SPECTRAL_WEIGHTED_CLOSURE_MANIFEST_V1.json"
ROOTS = ["OAI.BFSSSliceSobolev.weightedClosure_linear_totallyBounded",
         "OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded"]


# The accepted generic report validator takes each manifest's exact root list.
check_reports = accepted.check_reports


def preflight():
    # Use the accepted gate unchanged, without modifying its module globals.
    accepted.preflight()
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-spectral-weighted-closure-v1", "schema mismatch")
    require(len(m["originals"]) == 59 and len(m["accepted"]) == 4 and len(m["candidates"]) == 2,
            "changed compilation inventory")
    builds = m["originals"] + m["accepted"] + m["candidates"]
    entries = builds + m["controls"]
    require(len({e["path"] for e in entries}) == len(entries), "duplicate input")
    for e in entries:
        p = REPO / e["path"]
        require(git("hash-object", str(p)) == e["blob"] and digest(p) == e["sha256"],
                "changed input pin: " + e["path"])
    seen = set()
    for e in builds:
        require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean", "source path")
        require(e["module"] not in seen, "duplicate module")
        for parent in imports(REPO / e["path"]):
            require(parent == "Mathlib" or parent in seen, "unbuilt dependency: " + parent)
        seen.add(e["module"])
        code = uncomment((REPO / e["path"]).read_text())
        require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe)\b", code),
                "forbidden proof token: " + e["path"])
        require(re.findall(r"(?m)^#print axioms (\S+)$", code) == e["roots"], "root reports")
        if e in m["accepted"] + m["candidates"]:
            require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                    [("autoImplicit", "false")], "strict source options")
    reachable = set()

    def visit(module):
        if module == "Mathlib" or module in reachable:
            return
        require(module in seen, "unlisted dependency")
        reachable.add(module)
        for parent in imports(LEAN / (module.replace(".", "/") + ".lean")):
            visit(parent)

    for module in imports(REPO / m["candidates"][0]["path"]):
        visit(module)
    require(reachable == {e["module"] for e in m["originals"] + m["accepted"][::2]},
            "exact imported closure mismatch")
    require(imports(REPO / m["candidates"][0]["path"]) == [
        "OAI.MathematicalPhysics.BFSS.FormCompactness",
        "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralCoreLinearMomentCompactness"],
        "candidate source imports")
    require(imports(REPO / m["candidates"][1]["path"]) == [m["candidates"][0]["module"]],
            "consumer imports")
    source = uncomment((REPO / m["candidates"][0]["path"]).read_text())
    require(re.findall(r"(?m)^theorem (\S+) ", source) ==
            [name.rsplit(".", 1)[1] for name in ROOTS], "new declaration inventory")
    require(all(e["roots"] == ROOTS for e in m["candidates"]), "candidate root inventory")
    audit = uncomment((REPO / m["candidates"][1]["path"]).read_text())
    require(len(re.findall(r"(?m)^example\b", audit)) == 6, "consumer inventory")
    return m


def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": git("rev-parse", "HEAD"), "status": "INCOMPLETE", "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    builds = m["originals"] + m["accepted"] + m["candidates"]
    for e in builds + m["controls"]:
        dest = evidence / "inputs" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], dest)
    shutil.copyfile(MANIFEST, evidence / MANIFEST.name)
    try:
        receipt["packages"] = runtime.environment()
        compiler, env, receipt["compiler_environment"] = runtime.compiler_environment(evidence)
        for e in builds:
            stem = BUILD / e["module"].replace(".", "/")
            for ext in (".olean", ".ilean", ".olean.private", ".olean.server"):
                Path(str(stem) + ext).unlink(missing_ok=True)
        for index, e in enumerate(builds):
            strict = bool(e["roots"])
            obj = BUILD / (e["module"].replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            logfile = evidence / (f"{index:02d}-" + e["module"].rsplit(".", 1)[-1] + ".log")
            command = [compiler]
            if strict:
                command += ["-DautoImplicit=false", "-DwarningAsError=true"]
            command += ["-o", str(obj), str(REPO / e["path"])]
            print("Compiling " + e["module"], flush=True)
            start = time.monotonic()
            with logfile.open("w") as out:
                result = subprocess.run(command, cwd=LEAN, env=env, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=300)
            text = logfile.read_text()
            entry = {"module": e["module"], "returncode": result.returncode,
                     "seconds": round(time.monotonic() - start, 3), "log": logfile.name,
                     "log_sha256": digest(logfile)}
            receipt["builds"].append(entry)
            if strict or result.returncode != 0:
                print(text, flush=True)
            require(result.returncode == 0 and obj.is_file(), "compilation failed: " + e["module"])
            require("sorryAx" not in text and not re.search(r"(?i)\b(?:sorry|error):", text),
                    "recovery/error output")
            entry["object_sha256"] = digest(obj)
            if strict:
                entry["axioms"] = check_reports(text, e["roots"], e["marker"])
            else:
                entry["warnings"] = [line for line in text.splitlines() if "warning" in line.lower()]
        preflight()
        receipt["status"] = "PASS"
    finally:
        (evidence / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("SPECTRAL_WEIGHTED_CLOSURE_GATE_PASS", flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["preflight", "run"])
    parser.add_argument("--evidence", type=Path)
    args = parser.parse_args()
    manifest = preflight()
    if args.command == "run":
        require(args.evidence is not None, "evidence path required")
        run(manifest, args.evidence.resolve())
    else:
        print("SPECTRAL_WEIGHTED_CLOSURE_PREFLIGHT_PASS")
