#!/usr/bin/env python3
"""BFSS D2R1 original-Fock instrument-only microgate; no native theorem."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time
from run_bfss_td_c1a_d0_native_boundary import audit

MANIFEST="research/top-down-symmetry/TD_C1A_D2R1_INSTRUMENT_MICROGATE_MANIFEST.json"
EVIDENCE="bfss-td-c1a-d2r1-evidence"
INSPECTOR="diagnostics/BFSSTDC1AD2R1ExpressionInspector.lean"
CONTROL="diagnostics/BFSSTDC1AD2R1VariableControl.lean"
ROOT="FCP.BFSSTDC1AD2R1.variable_control"
MARKER="TD_C1A_D2R1_EXPR_REPORT"

def digest(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()

def save(evidence, results, finished=False):
    passed=all(results.get(k,{}).get("status")=="PASS" for k in
               ("inspector","core-build","variable-control"))
    verdict=("INSTRUMENTATION_CONTROL_PASS_NOT_NATIVE_QUALIFICATION" if passed
             else "D2R1_INCONCLUSIVE_INSTRUMENTATION")
    document={"experiment_id":"E-TD-C1A-D2R1-INSTRUMENT-001",
              "qualification":False,"td_c1a":"RED_UNQUALIFIED",
              "native_join_attempted":False,"original_axis_build_attempted":False,
              "finished":finished,"classification":verdict if finished else "COLLECTING",
              "cases":results}
    (evidence/"outcomes.json").write_text(json.dumps(document,indent=2)+"\n")
    if finished:
        (evidence/"verdict.txt").write_text(verdict+"\nNO NATIVE THEOREM QUALIFICATION\n")
        (evidence/"log-sha256.json").write_text(json.dumps(
            {p.name:digest(p) for p in sorted(evidence.glob("*.log"))},indent=2)+"\n")
    return document

def execute(root,evidence,results,name,command,limit,axiom_root=None):
    args=["timeout","--kill-after=10s",str(limit)+"s",*command]
    log=evidence/(name+".log")
    start=time.monotonic()
    with log.open("w") as out:
        try:
            rc=subprocess.run(args,cwd=root/"lean",stdout=out,stderr=subprocess.STDOUT,
                              timeout=limit+20).returncode
        except subprocess.TimeoutExpired:
            rc=124
    raw=log.read_text(errors="replace")
    okay,reason=audit(raw,[axiom_root] if axiom_root else [])
    matches=[line for line in raw.splitlines() if MARKER in line]
    if axiom_root:
        report_ok=len(matches)==1 and all(
            marker in matches[0] for marker in
            ("raw_equal=","raw_alpha=","outer_metadata_equal=",
             "outer_metadata_alpha=","witness_mvars=false","goal_mvars=false","first_difference="))
        okay=okay and report_ok
        if not report_ok:
            reason+="; report missing/ambiguous/unresolved"
    status="PASS" if rc==0 and okay else "FAIL"
    results[name]={"status":status,"returncode":rc,"reason":reason,
                   "seconds":round(time.monotonic()-start,3),"log":log.name,
                   "sha256":digest(log),"command":args,
                   "report":matches[0].split(MARKER,1)[1][:1500] if len(matches)==1 else None}
    save(evidence,results)
    print(name,status,"rc="+str(rc),flush=True)
    print("\n".join(raw.splitlines()[-12:]),flush=True)
    return status=="PASS"

def preflight(root,evidence,manifest):
    (evidence/"tested-sha.txt").write_text(subprocess.check_output(
        ["git","rev-parse","HEAD"],cwd=root,text=True))
    if (root/"lean/lean-toolchain").read_text().strip()!="leanprover/lean4:v4.34.1":
        raise ValueError("Lean pin drift")
    packages=json.loads((root/"lean/lake-manifest.json").read_text())["packages"]
    mathlib=next(p["rev"] for p in packages if p["name"]=="mathlib")
    if mathlib!=manifest["mathlib_revision"]:
        raise ValueError("Mathlib pin drift")
    for path,expected in manifest["frozen_blobs"].items():
        actual=subprocess.check_output(["git","hash-object","--no-filters",path],
                                       cwd=root,text=True).strip()
        if actual!=expected:
            raise ValueError("frozen blob mismatch: "+path)
    for path in ("lean/"+INSPECTOR,"lean/"+CONTROL):
        source=(root/path).read_text()
        if re.search(r"^\s*(sorry|admit|axiom|unsafe)\b",source,re.MULTILINE):
            raise ValueError("unqualified code in "+path)
        if re.search(r"^\s*set_option\s+(maxRecDepth|maxHeartbeats)\b",source,re.MULTILINE):
            raise ValueError("resource increase in "+path)
        if "TDC1AOriginalGaugeUnitaryFull48GammaCovariance" in source:
            raise ValueError("unqualified original full theorem imported")
        (evidence/Path(path).name).write_text(source)
    if (root/("lean/"+CONTROL)).read_text().count("set_option linter.unusedTactic false")!=1:
        raise ValueError("diagnostic-only unused tactic linter control drift")
    (evidence/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    print("BFSS_TD_C1A_D2R1_PREFLIGHT_PASS",flush=True)

def collect(root,evidence):
    results={}
    obj=root/"lean/.lake/build/lib/lean/diagnostics/BFSSTDC1AD2R1ExpressionInspector.olean"
    obj.parent.mkdir(parents=True,exist_ok=True)
    obj.unlink(missing_ok=True)
    if not execute(root,evidence,results,"inspector",["lake","env","lean",
            "-DautoImplicit=false","-DwarningAsError=true","-o",str(obj),INSPECTOR],90):
        results["core-build"]={"status":"SKIPPED","reason":"inspector failed"}
        results["variable-control"]={"status":"SKIPPED","reason":"inspector failed"}
        return save(evidence,results,True)
    if not execute(root,evidence,results,"core-build",["lake","build",
            "OAI.MathematicalPhysics.BFSS.Core"],900):
        results["variable-control"]={"status":"SKIPPED","reason":"Core failed"}
        return save(evidence,results,True)
    execute(root,evidence,results,"variable-control",["lake","env","lean",
            "-DautoImplicit=false","-DwarningAsError=true",CONTROL],90,ROOT)
    return save(evidence,results,True)

def main():
    parser=argparse.ArgumentParser()
    mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--preflight",action="store_true")
    mode.add_argument("--collect",action="store_true")
    opts=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    evidence=root/EVIDENCE
    evidence.mkdir(exist_ok=True)
    manifest=json.loads((root/MANIFEST).read_text())
    if opts.preflight:
        preflight(root,evidence,manifest)
    else:
        print(json.dumps(collect(root,evidence),indent=2),flush=True)
        print("BFSS_TD_C1A_D2R1_COLLECTION_COMPLETE_NOT_QUALIFICATION",flush=True)

if __name__=="__main__":
    main()
