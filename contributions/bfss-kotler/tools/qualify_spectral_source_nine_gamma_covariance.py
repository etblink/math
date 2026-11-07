#!/usr/bin/env python3
"""Source-pinned P1-gamma gate; cold original closure, strict candidate and consumer."""
import argparse
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

SPEC = importlib.util.spec_from_file_location(
    "spectral_environment", Path(__file__).with_name("qualify_spectral_linear_moment.py"))
base = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(base)
REPO, LEAN, BUILD = base.REPO, base.LEAN, base.BUILD
require, git, digest, uncomment, imports = (base.require, base.git, base.digest,
                                         base.uncomment, base.imports)
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_MANIFEST_V1.json"
SOURCE = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineGammaCovariance"
ROOTS = ["FCP.BFSSSourceNineGammaCovariance." + n for n in [
    "source9GammaCliffordAlgHom_vector_conjugation",
    "source9GammaUnits_global_covariance",
    "source9GammaSpecialOrthogonal_global_covariance",
    "source9GammaSpecialOrthogonal_intertwines",
    "source9GammaSpecialOrthogonal_inverse_covariance",
    "source9GammaUnitPair_intertwines"]]


def check_reports(text, roots, marker):
    require("sorryAx" not in text, "recovery axiom")
    require(not re.search(r"(?i)\b(?:warning|error)(?:\([^)]*\))?:", text), "Lean diagnostic")
    reports = re.findall(r"(?:^|: )'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|"
                         r"does not depend on any axioms)", text, re.M)
    require([name for name, _ in reports] == roots, "missing/duplicate/foreign axiom reports")
    actual = {name: sorted(a.strip() for a in axioms.split(",") if a.strip())
              for name, axioms in reports}
    require(all(set(a) <= base.ALLOWED for a in actual.values()), "unexpected axioms")
    require(text.splitlines().count(marker) == 1, "completion marker missing/duplicate")
    return actual


def preflight():
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-spectral-source-nine-gamma-covariance-v1", "schema")
    require(len(m["originals"]) == 92 and len(m["candidates"]) == 2, "compilation inventory")
    builds = m["originals"] + m["candidates"]
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
            require(parent == "Mathlib" or parent.startswith("Mathlib.") or parent in seen,
                    "unbuilt dependency: " + parent)
        seen.add(e["module"])
        code = uncomment((REPO / e["path"]).read_text())
        require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe)\b", code),
                "forbidden proof token: " + e["path"])
    reachable = set()

    def visit(module):
        if module == "Mathlib" or module.startswith("Mathlib.") or module in reachable:
            return
        require(module in seen, "unlisted dependency")
        reachable.add(module)
        for parent in imports(LEAN / (module.replace(".", "/") + ".lean")):
            visit(parent)

    visit(SOURCE)
    require(reachable == {e["module"] for e in m["originals"] + m["candidates"][:1]},
            "exact imported closure mismatch")
    require(imports(REPO / m["candidates"][0]["path"]) == [
        "OAI.MathematicalPhysics.BFSS.Contrib.Kotler."
        "SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation"], "source imports")
    require(imports(REPO / m["candidates"][1]["path"]) == [SOURCE], "consumer imports")
    for e in m["candidates"]:
        code = uncomment((REPO / e["path"]).read_text())
        require(e["roots"] == ROOTS and
                re.findall(r"(?m)^#print axioms (\S+)$", code) == ROOTS, "root inventory")
        require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                [("autoImplicit", "false")], "strict source options")
        require(not re.search(r"(?m)^\s*(?:local\s+)?instance\b|attribute\s+\[instance\]|"
                              r"\bSource48Label\b|\blinter\.", code), "carrier/instance change")
    source = uncomment((REPO / m["candidates"][0]["path"]).read_text())
    require(re.findall(r"(?m)^(?:noncomputable def|theorem) (\S+)\s", source) ==
            [n.rsplit(".", 1)[1] for n in ROOTS], "declaration inventory")
    audit = uncomment((REPO / m["candidates"][1]["path"]).read_text())
    require(len(re.findall(r"(?m)^example\b", audit)) == 8, "consumer inventory")
    require((LEAN / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.34.1",
            "toolchain pin")
    return m


def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": git("rev-parse", "HEAD"), "status": "INCOMPLETE", "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    builds = m["originals"] + m["candidates"]
    for e in builds + m["controls"]:
        dest = evidence / "inputs" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], dest)
    shutil.copyfile(MANIFEST, evidence / MANIFEST.name)
    try:
        receipt["packages"] = base.environment()
        compiler, env, receipt["compiler_environment"] = base.compiler_environment(evidence)
        for e in builds:
            stem = BUILD / e["module"].replace(".", "/")
            for ext in (".olean", ".ilean", ".olean.private", ".olean.server"):
                Path(str(stem) + ext).unlink(missing_ok=True)
        for index, e in enumerate(builds):
            candidate = e in m["candidates"]
            obj = BUILD / (e["module"].replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            logfile = evidence / (f"{index:02d}-" + e["module"].rsplit(".", 1)[-1] + ".log")
            command = [compiler]
            if candidate:
                command += ["-DautoImplicit=false", "-DwarningAsError=true"]
            command += ["-o", str(obj), str(REPO / e["path"])]
            print("Compiling " + e["module"], flush=True)
            start = time.monotonic()
            with logfile.open("w") as out:
                result = subprocess.run(command, cwd=LEAN, env=env, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=600)
            text = logfile.read_text()
            entry = {"module": e["module"], "returncode": result.returncode,
                     "seconds": round(time.monotonic() - start, 3), "log": logfile.name,
                     "log_sha256": digest(logfile)}
            receipt["builds"].append(entry)
            if candidate or result.returncode != 0:
                print(text, flush=True)
            require(result.returncode == 0 and obj.is_file(), "compilation failed: " + e["module"])
            require("sorryAx" not in text and not re.search(r"(?i)\b(?:sorry|error):", text),
                    "recovery/error output")
            entry["object_sha256"] = digest(obj)
            if candidate:
                entry["axioms"] = check_reports(text, e["roots"], e["marker"])
            else:
                entry["warnings"] = [line for line in text.splitlines() if "warning" in line.lower()]
        preflight()
        receipt["status"] = "PASS"
    finally:
        (evidence / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_GATE_PASS", flush=True)


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
        print("SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_PREFLIGHT_PASS")
