#!/usr/bin/env python3
"""D2R2 successful-original-source versus native observation-only differential audit.

Workflow green means evidence collection completed, NOT TD-C1A qualification.
Native observation never closes a theorem and must deliberately fail at its stop.
"""
import argparse
import hashlib
import json
import re
import subprocess
import time
from pathlib import Path
from run_bfss_td_c1a_d0_native_boundary import audit

MANIFEST = "research/top-down-symmetry/TD_C1A_D2R2_DIFFERENTIAL_MANIFEST.json"
EVIDENCE = "bfss-td-c1a-d2r2-evidence"
AXIS = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner"
SUPPORT = "diagnostics/BFSSTDC1AD2R2ExpressionInspector.lean"
CONTROLS = [
    ("variable-control", "diagnostics/BFSSTDC1AD2R2VariableControl.lean",
     ["FCP.BFSSTDC1AD2R2.variable_control"]),
    ("direct-axis-control", "diagnostics/BFSSTDC1AD2R2DirectAxisControl.lean",
     ["FCP.BFSSTDC1AD2R2.direct_axis_control"]),
]
NATIVE = [
    ("native-axis-observation", "diagnostics/BFSSTDC1AD2R2NativeAxisObservation.lean"),
    ("native-evaluation-observation", "diagnostics/BFSSTDC1AD2R2NativeEvaluationObservation.lean"),
]
REPORT = "TD_C1A_D2R2_EXPR_REPORT"
STOP = "TD_C1A_D2R2_EXPECTED_STOP_OBSERVATION_ONLY"
CASES = [("inspector",SUPPORT), *[(x[0],x[1]) for x in CONTROLS], *NATIVE]

def digest(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()

def record(out, results, finished=False):
    controls = all(results.get(k,{}).get("status")=="PASS" for k in
                   ("inspector","core-build","variable-control","axis-build","direct-axis-control"))
    observations = all(results.get(k,{}).get("status")=="OBSERVED_STOP_UNQUALIFIED"
                       for k in ("native-axis-observation","native-evaluation-observation"))
    classification = ("STRUCTURAL_FINGERPRINTS_CAPTURED_NOT_THEOREM_QUALIFICATION"
                      if controls and observations else
                      "D2R2_INCONCLUSIVE_CONTROL_OR_OBSERVATION")
    data = {"experiment_id":"E-TD-C1A-D2R2-DIFFERENTIAL-001",
            "qualification":False,"td_c1a":"RED_UNQUALIFIED",
            "native_proof_attempted":False,"original_all_vector_theorem_attempted":False,
            "collection_complete":finished,
            "classification":classification if finished else "COLLECTING",
            "cases":results}
    (out/"outcomes.json").write_text(json.dumps(data,indent=2)+"\n")
    if finished:
        (out/"verdict.txt").write_text(classification+"\nNOT BFSS TD-C1A THEOREM QUALIFICATION\n")
        (out/"log-sha256.json").write_text(json.dumps(
            {p.name:digest(p) for p in sorted(out.glob("*.log"))},indent=2)+"\n")
    return data

def execute(root,out,results,name,command,seconds,roots=None,observe=False):
    args=["timeout","--kill-after=10s",str(seconds)+"s",*command]
    log=out/(name+".log")
    started=time.monotonic()
    with log.open("w") as fp:
        try:
            rc=subprocess.run(args,cwd=root/"lean",stdout=fp,
                              stderr=subprocess.STDOUT,timeout=seconds+20).returncode
        except subprocess.TimeoutExpired:
            rc=124
    raw=log.read_text(errors="replace")
    reports=[line for line in raw.splitlines() if REPORT in line]
    report_ok=(len(reports)==1 and all(x in reports[0] for x in
       ("raw_equal=","raw_alpha=","outer_metadata_equal=",
        "outer_metadata_alpha=","witness_mvars=false","goal_mvars=false",
        "first_difference=","root_witness=","root_goal=")))
    if observe:
        errors=[s for s in raw.splitlines() if ": error:" in s]
        marker_ok=len(errors)==1 and STOP in errors[0]
        valid=(rc not in (0,124) and report_ok and marker_ok and "sorryAx" not in raw)
        status="OBSERVED_STOP_UNQUALIFIED" if valid else "INCONCLUSIVE"
        reason=("one bounded report and deliberate diagnostic stop; not a theorem"
                if valid else "unexpected native observation errors/axioms or incomplete report")
    else:
        valid_audit,reason=audit(raw, roots if roots is not None else [])
        valid=(rc==0 and valid_audit and (report_ok if roots is not None else True))
        status="PASS" if valid else "FAIL"
        if roots is not None and not report_ok:
            reason+="; expected exactly one fully-typed fingerprint report"
    results[name]={"status":status,"returncode":rc,"reason":reason,
                   "seconds":round(time.monotonic()-started,3),
                   "command":args,"log":log.name,"sha256":digest(log),
                   "report":reports[0].split(REPORT,1)[1][:1600] if len(reports)==1 else None}
    record(out,results)
    print(name,status,"rc="+str(rc),flush=True)
    print("\n".join(raw.splitlines()[-12:]),flush=True)
    return valid

def preflight(root,out,manifest):
    (out/"tested-sha.txt").write_text(subprocess.check_output(
        ["git","rev-parse","HEAD"],cwd=root,text=True))
    if (root/"lean/lean-toolchain").read_text().strip()!="leanprover/lean4:v4.34.1":
        raise ValueError("Lean toolchain mismatch")
    packages=json.loads((root/"lean/lake-manifest.json").read_text())["packages"]
    if next(p["rev"] for p in packages if p["name"]=="mathlib")!=manifest["mathlib_revision"]:
        raise ValueError("Mathlib revision mismatch")
    for path,expected in manifest["frozen_blobs"].items():
        actual=subprocess.check_output(["git","hash-object","--no-filters",path],
                                       cwd=root,text=True).strip()
        if actual!=expected:
            raise ValueError("source pin mismatch: "+path)
    actual_sources=sorted("lean/"+p for _,p in CASES)
    if actual_sources!=sorted(manifest["diagnostic_sources"]):
        raise ValueError("diagnostic source set drift")
    for path in actual_sources:
        text=(root/path).read_text()
        if re.search(r"^\s*(sorry|admit|axiom|unsafe)\b",text,re.MULTILINE):
            raise ValueError("unqualified construct in "+path)
        if re.search(r"^\s*set_option\s+(maxRecDepth|maxHeartbeats)\b",text,re.MULTILINE):
            raise ValueError("uncontrolled resource override in "+path)
        if "TDC1AOriginalGaugeUnitaryFull48GammaCovariance" in text:
            raise ValueError("unqualified full original covariance imported")
        (out/Path(path).name).write_text(text)
    for _,p in NATIVE:
        src=(root/"lean"/p).read_text()
        if "td_c1a_d2r2_stop" not in src or re.search(
          r"\b(exact|simpa|change|isDefEq|whnf)\b",
          src.split("td_c1a_d2r2_compare")[-1]):
            raise ValueError("native expression observation attempts forbidden tactic")
    (out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    print("BFSS_TD_C1A_D2R2_PREFLIGHT_PASS",flush=True)

def collect(root,out):
    results={}
    obj=root/"lean/.lake/build/lib/lean/diagnostics/BFSSTDC1AD2R2ExpressionInspector.olean"
    obj.parent.mkdir(parents=True,exist_ok=True)
    obj.unlink(missing_ok=True)
    if not execute(root,out,results,"inspector",
       ["lake","env","lean","-DautoImplicit=false","-DwarningAsError=true",
        "-o",str(obj),SUPPORT],90):
        for name in ("core-build","variable-control","axis-build","direct-axis-control",
                     "native-axis-observation","native-evaluation-observation"):
            results[name]={"status":"SKIPPED","reason":"inspector failed"}
        return record(out,results,True)
    if not execute(root,out,results,"core-build",
      ["lake","build","OAI.MathematicalPhysics.BFSS.Core"],900):
        for name in ("variable-control","axis-build","direct-axis-control",
                     "native-axis-observation","native-evaluation-observation"):
            results[name]={"status":"SKIPPED","reason":"Core failed"}
        return record(out,results,True)
    name,path,roots=CONTROLS[0]
    if not execute(root,out,results,name,["lake","env","lean",
        "-DautoImplicit=false","-DwarningAsError=true",path],90,roots):
        for n in ("axis-build","direct-axis-control","native-axis-observation",
                  "native-evaluation-observation"):
            results[n]={"status":"SKIPPED","reason":"variable positive control failed"}
        return record(out,results,True)
    if not execute(root,out,results,"axis-build",["lake","build",AXIS],3000):
        for n in ("direct-axis-control","native-axis-observation","native-evaluation-observation"):
            results[n]={"status":"SKIPPED","reason":"frozen source-axis build failed"}
        return record(out,results,True)
    name,path,roots=CONTROLS[1]
    if not execute(root,out,results,name,["lake","env","lean",
        "-DautoImplicit=false","-DwarningAsError=true",path],90,roots):
        for n in ("native-axis-observation","native-evaluation-observation"):
            results[n]={"status":"SKIPPED","reason":"literal source-axis positive control failed"}
        return record(out,results,True)
    for name,path in NATIVE:
        execute(root,out,results,name,["lake","env","lean",
             "-DautoImplicit=false","-DwarningAsError=true",path],90,observe=True)
    return record(out,results,True)

def main():
    parser=argparse.ArgumentParser()
    group=parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--preflight",action="store_true")
    group.add_argument("--collect",action="store_true")
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    out=root/EVIDENCE
    out.mkdir(exist_ok=True)
    manifest=json.loads((root/MANIFEST).read_text())
    if args.preflight:
        preflight(root,out,manifest)
    else:
        doc=collect(root,out)
        print(json.dumps(doc,indent=2),flush=True)
        print("BFSS_TD_C1A_D2R2_COLLECTION_COMPLETE_NOT_QUALIFICATION",flush=True)

if __name__=="__main__":
    main()
