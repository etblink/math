#!/usr/bin/env python3
"""TD-C1A D2 structural observation collection; no proof qualification."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time
from run_bfss_td_c1a_d0_native_boundary import audit

MANIFEST = "research/top-down-symmetry/TD_C1A_D2_STRUCTURAL_MANIFEST.json"
EVIDENCE = "bfss-td-c1a-d2-evidence"
AXIS = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner"
SUPPORT = "diagnostics/BFSSTDC1AD2ExpressionInspector.lean"
CONTROLS = [
    ("variable-control", "diagnostics/BFSSTDC1AD2VariableControl.lean",
     ["FCP.BFSSTDC1AD2.variable_control"]),
    ("direct-axis-control", "diagnostics/BFSSTDC1AD2DirectAxisControl.lean",
     ["FCP.BFSSTDC1AD2.direct_axis_control"]),
]
OBSERVATIONS = [
    ("native-axis-observation", "diagnostics/BFSSTDC1AD2NativeAxisObservation.lean"),
    ("native-evaluation-observation", "diagnostics/BFSSTDC1AD2NativeEvaluationObservation.lean"),
]
EXACT_STOP = "TD_C1A_D2_EXPECTED_STOP_OBSERVATION_ONLY"
REPORT = "TD_C1A_D2_EXPR_REPORT"
CASES = [("inspector", SUPPORT), *[(x[0], x[1]) for x in CONTROLS], *OBSERVATIONS]

def sha_file(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def record(evidence, results, finished=False):
    controls_ok = all(results.get(k, {}).get("status") == "PASS"
                      for k in ("inspector", "core-build", "variable-control",
                                "axis-build", "direct-axis-control"))
    observations_ok = all(results.get(k, {}).get("status") == "OBSERVED_EXPECTED_STOP"
                          for k in ("native-axis-observation", "native-evaluation-observation"))
    verdict = ("STRUCTURAL_REPORTS_CAPTURED_NOT_QUALIFICATION" if controls_ok and observations_ok
               else "D2_INCONCLUSIVE_INSTRUMENTATION_OR_PREREQUISITE")
    data = {"experiment_id": "E-TD-C1A-D2-STRUCTURAL-EXPR-001",
            "qualification": False, "td_c1a": "RED_UNQUALIFIED",
            "proof_retry_attempted": False, "all_vector_assembly_attempted": False,
            "finished": finished, "classification": verdict if finished else "COLLECTING",
            "cases": results}
    (evidence / "outcomes.json").write_text(json.dumps(data, indent=2) + "\n")
    if finished:
        (evidence / "verdict.txt").write_text(verdict + "\nNOT THEOREM QUALIFICATION\n")
        (evidence / "log-sha256.json").write_text(
            json.dumps({p.name: sha_file(p) for p in sorted(evidence.glob("*.log"))}, indent=2) + "\n")
    return data

def execute(root, evidence, results, name, command, seconds, roots=None, observe=False):
    bounded = ["timeout", "--kill-after=10s", str(seconds) + "s", *command]
    log = evidence / (name + ".log")
    started = time.monotonic()
    with log.open("w") as out:
        try:
            rc = subprocess.run(bounded, cwd=root / "lean", stdout=out,
                                stderr=subprocess.STDOUT, timeout=seconds + 20).returncode
        except subprocess.TimeoutExpired:
            rc = 124
    raw = log.read_text(errors="replace")
    reports = [line for line in raw.splitlines() if REPORT in line]
    if observe:
        errors = [line for line in raw.splitlines() if ": error:" in line]
        valid_report = len(reports) == 1 and all(
            flag in reports[0] for flag in ("raw_equal=", "alpha_equiv=", "first_difference="))
        valid_stop = (len(errors) == 1 and EXACT_STOP in errors[0])
        valid = rc != 0 and rc != 124 and valid_report and valid_stop and "sorryAx" not in raw
        status = "OBSERVED_EXPECTED_STOP" if valid else "INCONCLUSIVE"
        reason = "bounded expression reported; deliberately unproved native goal" if valid else (
            "unexpected compiler errors or missing D2 expression/stop marker")
    elif roots is not None:
        passed, reason = audit(raw, roots)
        valid = rc == 0 and passed and len(reports) == 1
        status = "PASS" if valid else "FAIL"
        if len(reports) != 1:
            reason += "; missing/duplicate structural control report"
    else:
        passed, reason = audit(raw, [])
        valid = rc == 0 and passed
        status = "PASS" if valid else "FAIL"
    results[name] = {"status": status, "returncode": rc, "reason": reason,
                     "seconds": round(time.monotonic() - started, 3),
                     "command": bounded, "log": log.name, "sha256": sha_file(log),
                     "report": reports[0].split(REPORT, 1)[1][:1600] if len(reports) == 1 else None}
    record(evidence, results)
    print(name, status, "rc=" + str(rc), flush=True)
    print("\n".join(raw.splitlines()[-12:]), flush=True)
    return valid

def preflight(root, evidence, manifest):
    (evidence / "tested-sha.txt").write_text(
        subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=root, text=True))
    for path, expected in manifest["frozen_blobs"].items():
        actual = subprocess.check_output(
            ["git", "hash-object", "--no-filters", path], cwd=root, text=True).strip()
        if actual != expected:
            raise ValueError("frozen blob mismatch: " + path)
    if (root / "lean/lean-toolchain").read_text().strip() != manifest["lean_toolchain"]:
        raise ValueError("Lean toolchain mismatch")
    packages = json.loads((root / "lean/lake-manifest.json").read_text())["packages"]
    if next(p["rev"] for p in packages if p["name"] == "mathlib") != manifest["mathlib_revision"]:
        raise ValueError("Mathlib revision mismatch")
    got = ["lean/" + path for _, path in CASES]
    if sorted(got) != sorted(manifest["diagnostic_sources"]):
        raise ValueError("diagnostic sources do not match manifest")
    for path in got:
        src = (root / path).read_text()
        if re.search(r"(?m)^\s*(sorry|admit|axiom|unsafe)\b", src):
            raise ValueError("unqualified construct in " + path)
        if re.search(r"(?m)^\s*set_option\s+(maxRecDepth|maxHeartbeats)\b", src):
            raise ValueError("resource override in " + path)
        if "TDC1AOriginalGaugeUnitaryFull48GammaCovariance" in src:
            raise ValueError("failed original full theorem imported in " + path)
        (evidence / Path(path).name).write_text(src)
    for _, path in OBSERVATIONS:
        src = (root / "lean" / path).read_text()
        if "td_c1a_d2_stop" not in src or re.search(r"\b(exact|simpa|change)\b", src.split("td_c1a_d2_compare")[-1]):
            raise ValueError("native observation unexpectedly attempts a proof")
    (evidence / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print("BFSS_TD_C1A_D2_PREFLIGHT_PASS", flush=True)

def collect(root, evidence):
    results = {}
    support_obj = root / "lean/.lake/build/lib/lean/diagnostics/BFSSTDC1AD2ExpressionInspector.olean"
    support_obj.parent.mkdir(parents=True, exist_ok=True)
    support_obj.unlink(missing_ok=True)
    if not execute(root, evidence, results, "inspector",
        ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true",
         "-o", str(support_obj), SUPPORT], 90):
        results.update({k: {"status":"SKIPPED", "reason":"inspector failed"} for k in
                        ("core-build","variable-control","axis-build","direct-axis-control",
                         "native-axis-observation","native-evaluation-observation")})
        return record(evidence, results, True)
    if not execute(root, evidence, results, "core-build",
                   ["lake", "build", "OAI.MathematicalPhysics.BFSS.Core"], 900):
        results.update({k: {"status":"SKIPPED", "reason":"Core failed"} for k in
                        ("variable-control","axis-build","direct-axis-control",
                         "native-axis-observation","native-evaluation-observation")})
        return record(evidence, results, True)
    name, path, roots = CONTROLS[0]
    if not execute(root, evidence, results, name,
            ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", path],
            90, roots):
        results.update({k: {"status":"SKIPPED", "reason":"variable control failed"} for k in
                        ("axis-build","direct-axis-control",
                         "native-axis-observation","native-evaluation-observation")})
        return record(evidence, results, True)
    if not execute(root, evidence, results, "axis-build", ["lake", "build", AXIS], 3000):
        results.update({k: {"status":"SKIPPED", "reason":"axis source failed"} for k in
                        ("direct-axis-control","native-axis-observation","native-evaluation-observation")})
        return record(evidence, results, True)
    name, path, roots = CONTROLS[1]
    if not execute(root, evidence, results, name,
            ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", path],
            90, roots):
        results.update({k: {"status":"SKIPPED", "reason":"direct axis control failed"} for k in
                        ("native-axis-observation","native-evaluation-observation")})
        return record(evidence, results, True)
    for name, path in OBSERVATIONS:
        execute(root, evidence, results, name,
                ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", path],
                90, observe=True)
    return record(evidence, results, True)

def main():
    ap = argparse.ArgumentParser()
    mode = ap.add_mutually_exclusive_group(required=True)
    mode.add_argument("--preflight", action="store_true")
    mode.add_argument("--collect", action="store_true")
    opt = ap.parse_args()
    root = Path(__file__).resolve().parents[1]
    evidence = root / EVIDENCE
    evidence.mkdir(exist_ok=True)
    manifest = json.loads((root / MANIFEST).read_text())
    if opt.preflight:
        preflight(root, evidence, manifest)
    else:
        data = collect(root, evidence)
        print(json.dumps(data, indent=2), flush=True)
        print("BFSS_TD_C1A_D2_COLLECTION_COMPLETE_NOT_QUALIFICATION", flush=True)

if __name__ == "__main__":
    main()
