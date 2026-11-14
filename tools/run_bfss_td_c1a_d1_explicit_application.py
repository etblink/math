#!/usr/bin/env python3
"""D1 explicit application diagnostic; collection success is not qualification."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time
from run_bfss_td_c1a_d0_native_boundary import audit

MANIFEST = "research/top-down-symmetry/TD_C1A_D1_APPLICATION_MANIFEST.json"
GENERIC = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4FockOperatorEvaluationInterface"
NATIVE = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AD0NativeCarrierEvaluationInterface"
AXIS = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner"
CASES = [
    ("variable-control", "diagnostics/BFSSTDC1AD1VariableApplicationControl.lean",
     ["FCP.BFSSTDC1AD1.variable_explicit_lift", "FCP.BFSSTDC1AD1.variable_explicit_evaluation"]),
    ("explicit-axis-lift", "diagnostics/BFSSTDC1AD1ExplicitAxisLift.lean",
     ["FCP.BFSSTDC1AD1.explicit_axis_lift"]),
    ("explicit-conditional-evaluation", "diagnostics/BFSSTDC1AD1ExplicitConditionalEvaluation.lean",
     ["FCP.BFSSTDC1AD1.explicit_conditional_evaluation"]),
]

def save(evidence, results, finished=False):
    classification = "COLLECTING"
    if finished:
        if all(results.get(case[0], {}).get("status") == "PASS" for case in CASES):
            classification = "EXPLICIT_NATIVE_LEAVES_FEASIBLE_NOT_ALL_VECTOR_QUALIFICATION"
        elif results.get("variable-control", {}).get("status") != "PASS":
            classification = "EXPLICIT_REWRITE_CONTROL_OBSTRUCTED"
        else:
            classification = "EXPLICIT_NATIVE_JOIN_OBSTRUCTED"
    document = {"experiment_id": "E-TD-C1A-D1-APPLICATION-NORMALIZATION-001",
                "qualification": False, "td_c1a_status": "RED_UNQUALIFIED",
                "collection_finished": finished, "classification": classification,
                "conditional_evaluation_assumes_operator_identity": True, "cases": results}
    (evidence / "outcomes.json").write_text(json.dumps(document, indent=2) + "\n")
    if finished:
        (evidence / "verdict.txt").write_text(classification +
            "\nDIAGNOSTIC ONLY; TD-C1A REMAINS RED_UNQUALIFIED.\n")
        hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                  for p in sorted(evidence.glob("*.log"))}
        (evidence / "log-sha256.json").write_text(json.dumps(hashes, indent=2) + "\n")
    return document

def execute(root, evidence, results, name, command, limit, roots=None):
    log = evidence / (name + ".log")
    bounded = ["timeout", "--kill-after=10s", str(limit) + "s", *command]
    started = time.monotonic()
    with log.open("w") as output:
        try:
            rc = subprocess.run(bounded, cwd=root / "lean", stdout=output,
                                stderr=subprocess.STDOUT, timeout=limit + 20).returncode
        except subprocess.TimeoutExpired:
            rc = 124
    text = log.read_text()
    ok, reason = (True, "dependency build completed") if roots is None else audit(text, roots)
    results[name] = {"status": "PASS" if rc == 0 and ok else "FAIL",
                     "returncode": rc, "audit": reason, "command": bounded,
                     "seconds": round(time.monotonic() - started, 3),
                     "log": log.name, "sha256": hashlib.sha256(log.read_bytes()).hexdigest()}
    save(evidence, results)
    print(name, results[name]["status"], "rc=" + str(rc), flush=True)
    print("\n".join(text.splitlines()[-18:]), flush=True)
    return results[name]["status"] == "PASS"

def compile_helper(root, evidence, results, name, module, roots):
    path = module.replace(".", "/")
    obj = root / "lean/.lake/build/lib/lean" / (path + ".olean")
    obj.parent.mkdir(parents=True, exist_ok=True)
    obj.unlink(missing_ok=True)
    ok = execute(root, evidence, results, name,
                 ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true",
                  "-o", str(obj), path + ".lean"], 90, roots)
    if not ok:
        obj.unlink(missing_ok=True)
        raise RuntimeError("frozen helper prerequisite failed: " + name)

def preflight(root, evidence, manifest):
    (evidence / "tested-sha.txt").write_text(
        subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=root, text=True))
    for path, expected in manifest["frozen_blobs"].items():
        actual = subprocess.check_output(
            ["git", "hash-object", "--no-filters", path], cwd=root, text=True).strip()
        if actual != expected:
            raise ValueError("source pin mismatch: " + path)
    if (root / "lean/lean-toolchain").read_text().strip() != "leanprover/lean4:v4.34.1":
        raise ValueError("Lean toolchain mismatch")
    packages = json.loads((root / "lean/lake-manifest.json").read_text())["packages"]
    if next(p["rev"] for p in packages if p["name"] == "mathlib") != manifest["mathlib_revision"]:
        raise ValueError("Mathlib mismatch")
    paths = ["lean/" + case[1] for case in CASES]
    if sorted(paths) != sorted(manifest["diagnostic_sources"]):
        raise ValueError("case manifest mismatch")
    for path in paths:
        src = (root / path).read_text()
        if re.search(r"(?m)^\s*(sorry|admit|axiom|unsafe)\b", src):
            raise ValueError("unqualified construct: " + path)
        if re.search(r"(?m)^\s*set_option\s+(maxRecDepth|maxHeartbeats)\b", src):
            raise ValueError("resource override: " + path)
        if re.search(r"(?m)^import .*TDC1AOriginalGaugeUnitaryFull48GammaCovariance$", src):
            raise ValueError("failed composite import")
        (evidence / Path(path).name).write_text(src)
    (evidence / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print("BFSS_TD_C1A_D1_PREFLIGHT_PASS", flush=True)

def collect(root, evidence):
    results = {}
    compile_helper(root, evidence, results, "frozen-generic", GENERIC,
        ["FCP.BFSSTDC1AR4FockOperatorEvaluationInterface." + name
         for name in ["operator_of_pointwise", "pointwise_of_operator"]])
    if not execute(root, evidence, results, "core-build",
                   ["lake", "build", "OAI.MathematicalPhysics.BFSS.Core"], 900):
        raise RuntimeError("original Core build failed")
    compile_helper(root, evidence, results, "frozen-native-helper", NATIVE,
        ["FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface." + name
         for name in ["native_operator_of_pointwise", "native_pointwise_of_operator"]])
    case = CASES[0]
    execute(root, evidence, results, case[0],
            ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", case[1]],
            90, case[2])
    axis_ok = execute(root, evidence, results, "axis-build", ["lake", "build", AXIS], 3000)
    for name, path, roots in CASES[1:]:
        if axis_ok:
            execute(root, evidence, results, name,
                    ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", path],
                    90, roots)
        else:
            results[name] = {"status": "SKIPPED", "reason": "frozen axis build failed"}
    print(json.dumps(save(evidence, results, finished=True), indent=2), flush=True)
    print("BFSS_TD_C1A_D1_COLLECTION_COMPLETE_NOT_QUALIFICATION", flush=True)

def main():
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--preflight", action="store_true")
    mode.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    evidence = root / "bfss-td-c1a-d1-evidence"
    evidence.mkdir(exist_ok=True)
    manifest = json.loads((root / MANIFEST).read_text())
    if args.preflight:
        preflight(root, evidence, manifest)
    else:
        collect(root, evidence)

if __name__ == "__main__":
    main()
