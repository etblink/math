#!/usr/bin/env python3
"""HARDY-G5 D0: calibrated collection, never strict G5 qualification."""
from pathlib import Path
import argparse, hashlib, json, re, shutil, subprocess, sys

ROOT=Path(__file__).resolve().parents[1]
LEAN=ROOT/"lean"
MANIFEST=ROOT/"research/spectral-p2-original-field/P3_AUX_HARDY_G5_D0_MANIFEST.json"
OUT=ROOT/"bfss-aux-hardy-g5-d0-evidence"
ALLOWED={"propext","Classical.choice","Quot.sound"}
DEPWARN=re.compile(r"^warning: [a-zA-Z0-9_-]+: repository '[^']*/lean/\.lake/packages/[a-zA-Z0-9_-]+' has local changes$")
REPORT=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
STOP="TD_C1A_D2R2_EXPECTED_STOP_OBSERVATION_ONLY"
EXPR="TD_C1A_D2R2_EXPR_REPORT"
def git(*args):
    return subprocess.check_output(["git",*args],cwd=ROOT,text=True).strip()
def dump(name,data):
    (OUT/name).write_text(json.dumps(data,sort_keys=True,indent=2)+"\n")
def blob(path):
    return git("hash-object","--no-filters",path)
def preflight():
    OUT.mkdir(exist_ok=True)
    m=json.loads(MANIFEST.read_text())
    assert m["strict_G5_qualification"] is False
    assert m["baseline"]=="f51357761243008201f97d9e0ef0cbefa87d0b06"
    assert subprocess.run(["git","merge-base","--is-ancestor",m["baseline"],"HEAD"],cwd=ROOT).returncode==0
    assert len(m["cases"])==8
    assert (LEAN/"lean-toolchain").read_text().strip()=="leanprover/lean4:v4.34.1"
    packages=json.loads((LEAN/"lake-manifest.json").read_text())["packages"]
    assert next(x["rev"] for x in packages if x["name"]=="mathlib")=="d13f23b723b8a846827a245b89c10fc7d3f11612"
    for p,sha in m["pins"].items():
        assert (ROOT/p).is_file(),p
        assert blob(p)==sha,("candidate/frozen file drift",p,blob(p),sha)
    baseline={}
    for line in git("ls-tree","-r",m["baseline"],"--","lean/OAI").splitlines():
        match=re.fullmatch(r"\d+ blob ([0-9a-f]{40})\t(.+)",line)
        if match: baseline[match[2]]=match[1]
    exceptions={m["strict_source"],m["strict_helper"]}
    stack=[c["path"] for c in m["cases"]]+[m["strict_consumer"],m["inspector"]]
    seen={}
    while stack:
        p=stack.pop()
        if p in seen: continue
        assert p in m["pins"] or p.startswith("lean/OAI/"),("unreviewed diagnostic import",p)
        assert (ROOT/p).is_file(),("missing source",p)
        sha=blob(p)
        if p.startswith("lean/OAI/") and p not in exceptions:
            assert baseline.get(p)==sha,("reviewed original source drift",p)
        if p in m["pins"]: assert m["pins"][p]==sha
        seen[p]=sha
        code=(ROOT/p).read_text()
        for names in re.findall(r"(?m)^(?:public )?import[ \t]+([^\n]+)",code):
            for name in names.split("--",1)[0].split():
                if name=="OAI" or name.startswith(("OAI.","diagnostics.")):
                    stack.append("lean/"+name.replace(".","/")+".lean")
    for c in m["cases"]:
        code=(ROOT/c["path"]).read_text()
        assert "set_option autoImplicit false" in code
        assert not re.search(r"(?m)^\s*(?:sorry|admit|axiom|unsafe)\b",code)
        assert "maxHeartbeats" not in code and "maxRecDepth" not in code
        assert re.findall(r"(?m)^#print axioms (\S+)$",code)==c["roots"]
        if c["mode"]=="observation":
            assert "td_c1a_d2r2_compare hw" in code and "td_c1a_d2r2_stop" in code
            assert "have hw := nativeThetaZeroSum" in code
        assert c["mode"] in {"required","join","observation"}
    receipt={"classification":"PREFLIGHT_NOT_LEAN_QUALIFICATION","tested_sha":git("rev-parse","HEAD"),
      "strict_G5_qualification":False,"source_closure":dict(sorted(seen.items())),
      "original_OAI_paths":sum(p.startswith("lean/OAI/") for p in seen)}
    dump("pin-manifest.json",receipt)
    for key in ("workflow","driver"):
        shutil.copyfile(ROOT/m[key],OUT/Path(m[key]).name)
    shutil.copyfile(MANIFEST,OUT/MANIFEST.name)
    print("BFSS_G5_D0_PREFLIGHT_PASS",receipt["original_OAI_paths"],flush=True)
    return m
def execute(label,command,timeout):
    try:
        p=subprocess.run(command,cwd=LEAN,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=timeout)
        rc,log=p.returncode,p.stdout
    except subprocess.TimeoutExpired as exc:
        rc=124
        log=exc.stdout or ""
        if isinstance(log,bytes): log=log.decode(errors="replace")
        log+="\nDIAGNOSTIC_TIMEOUT\n"
    (OUT/(label+".log")).write_text(log)
    return rc,log
def warnings(log):
    return [line for line in log.splitlines() if "warning:" in line and not DEPWARN.fullmatch(line)]
def proof_audit(rc,log,roots):
    reports=REPORT.findall(log)
    return (rc==0 and not any(x in log for x in ("error:","sorryAx","unknownIdentifier"))
      and not warnings(log) and [n for n,_ in reports]==roots
      and all({x.strip() for x in raw.split(",") if x.strip()}<=ALLOWED for _,raw in reports))
def observation_audit(rc,log):
    errors=[line for line in log.splitlines() if "error:" in line]
    return (rc not in (0,124) and len(errors)==1 and STOP in errors[0]
      and log.count(EXPR)==1 and not warnings(log)
      and "sorryAx" not in log and "unknownIdentifier" not in log)
def fresh(c):
    src=Path(c["path"]).relative_to("lean")
    obj=Path(".lake/build/lib/lean")/src.with_suffix(".olean")
    (LEAN/obj).parent.mkdir(parents=True,exist_ok=True)
    cmd=["lake","env","lean","-DautoImplicit=false","-DwarningAsError=true","-o",str(obj),str(src)]
    return execute(c["label"],cmd,120)
def collect():
    m=preflight()
    rows=[]
    summary={"classification":"DIAGNOSTIC_COLLECTION_NOT_STRICT_QUALIFICATION",
      "strict_G5_qualification":False,"tested_sha":git("rev-parse","HEAD"),"cases":rows}
    def save(): dump("case-summary.json",summary)
    def stage(label,targets):
        rc,log=execute(label,["lake","build",*targets],3600)
        ok=rc==0 and not warnings(log) and not any(x in log for x in ("error:","sorryAx","unknownIdentifier"))
        dump(label+"-status.json",{"returncode":rc,"pass":ok,"strict_G5_qualification":False})
        assert ok,("dependency/calibration stage failed",label)
    def case(c):
        rc,log=fresh(c)
        if c["mode"]=="observation":
            ok=observation_audit(rc,log)
            status="OBSERVED_STOP_UNQUALIFIED" if ok else "OBSERVATION_FAILED"
        else:
            ok=proof_audit(rc,log,c["roots"])
            status="PASS" if ok else ("TIMEOUT_INCONCLUSIVE" if rc==124 else "FAIL_UNQUALIFIED")
        row={"case":c["label"],"mode":c["mode"],"status":status,
          "returncode":rc,"strict_G5_qualification":False,"roots":c["roots"]}
        rows.append(row);save()
        print("BFSS_G5_D0_CASE",c["label"],status,flush=True)
        if c["mode"] in {"required","observation"}:
            assert ok,("calibration/observation failed; dependent stages halted",c["label"])
    stage("mathlib-build",["Mathlib"])
    inspector={"label":"inspector","path":m["inspector"],"roots":[],"mode":"required"}
    case(inspector)
    case(m["cases"][0])
    stage("core-build",["OAI.MathematicalPhysics.BFSS.Core"])
    case(m["cases"][1])
    stage("native-build",[
      "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG5OriginalPotentialTauCAR",
      "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe"])
    for c in m["cases"][2:]: case(c)
    summary["collection_completed"]=True
    summary["native_join_outcomes"]={x["case"]:x["status"] for x in rows if x["mode"]=="join"}
    save()
    print("BFSS_G5_D0_COLLECTION_COMPLETE_STRICT_G5_UNQUALIFIED",flush=True)
if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--preflight",action="store_true")
    parser.add_argument("--collect",action="store_true")
    args=parser.parse_args()
    assert args.preflight != args.collect,"select one mode"
    try:
        if args.preflight: preflight()
        else: collect()
    except Exception as exc:
        OUT.mkdir(exist_ok=True)
        dump("collection-failure.json",{"error":str(exc),"strict_G5_qualification":False})
        raise
