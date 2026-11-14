#!/usr/bin/env python3
"""TD-C1A D0 diagnostic collection. Exit success never qualifies a theorem."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time

MANIFEST = "research/top-down-symmetry/TD_C1A_D0_NATIVE_BOUNDARY_MANIFEST.json"
PREFIX = "FCP.BFSSTDC1AD0."
HELPER = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AD0NativeCarrierEvaluationInterface"
GENERIC = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4FockOperatorEvaluationInterface"
AXIS = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
DEPENDENCY_WARNING = re.compile(
    r"^warning: [a-zA-Z0-9_-]+: repository '[^']*/lean/\.lake/packages/[a-zA-Z0-9_-]+' has local changes$")
CASES = [
    ("metadata", "diagnostics/BFSSTDC1AD0Metadata.lean", [], False),
    ("variable-cast", "diagnostics/BFSSTDC1AD0VariableCast.lean", ["variable_cast"], False),
    ("generic-variable-lift", "diagnostics/BFSSTDC1AD0GenericVariableLift.lean", ["generic_variable_lift"], False),
    ("generic-variable-evaluation", "diagnostics/BFSSTDC1AD0GenericVariableEvaluation.lean", ["generic_variable_evaluation"], False),
    ("native-helper", HELPER.replace(".", "/") + ".lean",
     ["FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface.native_operator_of_pointwise",
      "FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface.native_pointwise_of_operator"], True),
    ("direct-axis", "diagnostics/BFSSTDC1AD0DirectAxis.lean", ["direct_axis"], False),
    ("actual-cast", "diagnostics/BFSSTDC1AD0ActualCast.lean", ["actual_cast"], False),
    ("native-axis-lift", "diagnostics/BFSSTDC1AD0NativeAxisLift.lean", ["native_axis_lift"], False),
    ("native-conditional-evaluation", "diagnostics/BFSSTDC1AD0NativeConditionalEvaluation.lean", ["native_conditional_evaluation"], False),
    ("generic-conditional-evaluation", "diagnostics/BFSSTDC1AD0GenericConditionalEvaluation.lean", ["generic_conditional_evaluation"], False),
]

def audit(text, roots, metadata=False):
    if "error:" in text or "sorryAx" in text:
        return False, "compiler error or unqualified axiom in log"
    warnings = [line for line in text.splitlines()
                if "warning:" in line and not DEPENDENCY_WARNING.fullmatch(line)]
    if warnings:
        return False, "unapproved warning: " + repr(warnings)
    reports = re.findall(
        r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)", text)
    expected = [r if r.startswith("FCP.") else PREFIX + r for r in roots]
    if [r for r, _ in reports] != expected:
        return False, "root report mismatch: " + repr(reports)
    for root, axioms in reports:
        if not {a.strip() for a in axioms.split(",") if a.strip()} <= ALLOWED:
            return False, "unexpected axioms for " + root
    if metadata and "D0_METADATA_COMPLETE" not in text:
        return False, "metadata completion marker missing"
    return True, "named roots and standard axioms checked" if roots else "metadata completed"

def classify(results):
    passed = lambda key: results.get(key, {}).get("status") == "PASS"
    if not passed("variable-cast"):
        return "PRIMITIVE_NATIVE_COERCION_OBSTRUCTED"
    if not passed("native-helper"):
        return "FIXED_NATIVE_CARRIER_HELPER_OBSTRUCTED"
    if not passed("axis-build"):
        return "FROZEN_AXIS_BUILD_OBSTRUCTED"
    if not passed("direct-axis"):
        return "DIRECT_SOURCE_AXIS_CONSUMER_OBSTRUCTED"
    if not passed("actual-cast"):
        return "ACTUAL_G4E_SUBSTITUTION_OBSTRUCTED"
    if not passed("native-axis-lift") or not passed("native-conditional-evaluation"):
        return "NATIVE_DATA_JOIN_OBSTRUCTED"
    return "NATIVE_LEAVES_FEASIBLE_ALL_VECTOR_AND_STRICT_CONSUMER_PENDING"

def save(evidence, results, finished=False):
    document = {
        "experiment_id": "E-TD-C1A-D0-NATIVE-BOUNDARY-001",
        "qualification": False, "td_c1a_status": "RED_UNQUALIFIED",
        "collection_finished": finished, "cases": results,
        "classification": classify(results) if finished else "COLLECTING",
        "generic_specialization_differential": (
            results.get("native-helper", {}).get("status") == "PASS" and any(
                results.get(k, {}).get("status") == "FAIL" for k in
                ["generic-variable-lift", "generic-variable-evaluation"])),
        "scope": "Conditional evaluation assumes its operator identity; no all-vector proof or independent strict consumer is attempted.",
    }
    (evidence / "outcomes.json").write_text(json.dumps(document, indent=2) + "\n")
    if finished:
        (evidence / "verdict.txt").write_text(document["classification"] +
            "\nDIAGNOSTIC COLLECTION ONLY. TD-C1A REMAINS RED_UNQUALIFIED.\n")
        digest = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                  for p in sorted(evidence.glob("*.log"))}
        (evidence / "log-sha256.json").write_text(json.dumps(digest, indent=2) + "\n")
    return document

def execute(root, evidence, results, name, command, limit, roots=None, metadata=False):
    log = evidence / (name + ".log")
    started = time.monotonic()
    bounded = ["timeout", "--kill-after=10s", str(limit) + "s", *command]
    with log.open("w") as output:
        try:
            proc = subprocess.run(bounded, cwd=root / "lean", stdout=output,
                                  stderr=subprocess.STDOUT, timeout=limit + 20)
            rc = proc.returncode
        except subprocess.TimeoutExpired:
            rc = 124
    text = log.read_text()
    valid, reason = (True, "dependency compilation completed") if roots is None else audit(text, roots, metadata)
    status = "PASS" if rc == 0 and valid else "FAIL"
    results[name] = {"status": status, "returncode": rc, "audit": reason,
                     "seconds": round(time.monotonic() - started, 3),
                     "command": bounded, "log": log.name,
                     "sha256": hashlib.sha256(log.read_bytes()).hexdigest()}
    save(evidence, results)
    print(name, status, "rc=" + str(rc), flush=True)
    # Full logs remain in the artifact; show only the final bounded tail in Actions.
    print("\n".join(text.splitlines()[-14:]), flush=True)
    return status == "PASS"

def preflight(root, evidence, manifest):
    (evidence / "tested-sha.txt").write_text(
        subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=root, text=True))
    for path, expected in manifest["frozen_blobs"].items():
        actual = subprocess.check_output(
            ["git", "hash-object", "--no-filters", path], cwd=root, text=True).strip()
        if actual != expected:
            raise ValueError("blob mismatch: " + path)
    if (root / "lean/lean-toolchain").read_text().strip() != "leanprover/lean4:v4.34.1":
        raise ValueError("Lean pin mismatch")
    packages = json.loads((root / "lean/lake-manifest.json").read_text())["packages"]
    if next(p["rev"] for p in packages if p["name"] == "mathlib") != manifest["mathlib_revision"]:
        raise ValueError("Mathlib pin mismatch")
    paths = ["lean/" + case[1] for case in CASES]
    if sorted(paths) != sorted(manifest["diagnostic_sources"]):
        raise ValueError("case/source manifest mismatch")
    for path in paths:
        src = (root / path).read_text()
        if re.search(r"(?m)^\s*(sorry|admit|axiom|unsafe)\b", src):
            raise ValueError("unqualified construct in " + path)
        if re.search(r"(?m)^\s*set_option\s+(maxRecDepth|maxHeartbeats)\b", src):
            raise ValueError("resource limit override in " + path)
        if re.search(r"(?m)^import .*TDC1AOriginalGaugeUnitaryFull48GammaCovariance$", src):
            raise ValueError("failed composite imported by " + path)
        (evidence / Path(path).name).write_text(src)
    (evidence / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print("BFSS_TD_C1A_D0_PREFLIGHT_PASS", flush=True)

def collect(root, evidence):
    results = {}
    # Compile the unchanged generic bridge and audit it before any original Core build.
    generic_path = GENERIC.replace(".", "/")
    obj = root / "lean/.lake/build/lib/lean" / (generic_path + ".olean")
    obj.parent.mkdir(parents=True, exist_ok=True)
    obj.unlink(missing_ok=True)
    generic_roots = ["FCP.BFSSTDC1AR4FockOperatorEvaluationInterface." + name
                     for name in ["operator_of_pointwise", "pointwise_of_operator"]]
    if not execute(root, evidence, results, "frozen-generic",
                   ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true",
                    "-o", str(obj), generic_path + ".lean"], 90, generic_roots):
        raise RuntimeError("frozen generic prerequisite failed; no native collection")
    if not execute(root, evidence, results, "core-build",
                   ["lake", "build", "OAI.MathematicalPhysics.BFSS.Core"], 900):
        raise RuntimeError("frozen Core prerequisite failed; no native collection")
    for name, path, roots, emit in CASES[:5]:
        command = ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true"]
        if emit:
            obj = root / "lean/.lake/build/lib/lean" / (HELPER.replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            obj.unlink(missing_ok=True)
            command += ["-o", str(obj)]
        ok = execute(root, evidence, results, name, command + [path], 90, roots, name == "metadata")
        if emit and not ok:
            obj.unlink(missing_ok=True)
    proceed = all(results[k]["status"] == "PASS" for k in ["variable-cast", "native-helper"])
    if proceed:
        proceed = execute(root, evidence, results, "axis-build", ["lake", "build", AXIS], 3000)
    else:
        results["axis-build"] = {"status": "SKIPPED", "reason": "early native control failed"}
    for name, path, roots, _ in CASES[5:]:
        if proceed:
            execute(root, evidence, results, name,
                    ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", path],
                    90, roots)
        else:
            results[name] = {"status": "SKIPPED", "reason": "native control or axis prerequisite failed"}
    document = save(evidence, results, finished=True)
    print(json.dumps(document, indent=2), flush=True)
    # This success reports diagnostic collection only. Failed cases remain explicit in outcomes.
    print("BFSS_TD_C1A_D0_COLLECTION_COMPLETE_NOT_QUALIFICATION", flush=True)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    if args.preflight == args.collect:
        parser.error("choose exactly one mode")
    root = Path(__file__).resolve().parents[1]
    evidence = root / "bfss-td-c1a-d0-evidence"
    evidence.mkdir(exist_ok=True)
    manifest = json.loads((root / MANIFEST).read_text())
    if args.preflight:
        preflight(root, evidence, manifest)
    else:
        collect(root, evidence)

if __name__ == "__main__":
    main()
