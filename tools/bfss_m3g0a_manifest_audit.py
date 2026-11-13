#!/usr/bin/env python3
"""BFSS P3-M3G0A immutable-base import-closure inventory; audit only, no Lean."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASELINE = "c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5"
M2_WORKFLOW = ".github/workflows/bfss-p3-m2c1-original-operator-lp-column-norm-strict.yml"
GAUGE = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe.lean"
SOURCE = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0AOriginalFockGaugeColumnTransport.lean"
CONSUMER = "lean/diagnostics/BFSSP3M3G0AOriginalFockGaugeColumnTransportIndependentConsumer.lean"
GAUGE6 = {
  "SU2BFSSPhysicalDomainL6G7UActualSourceFullL2GaugeContractionProbe.lean":"8903dfae1caf144ec63e32d05e7cf1001d75e029",
  "SU2BFSSPhysicalDomainL6G7VActualSourceFullL2PhysicalFixedSpaceProbe.lean":"cd7f1dd791daa930f5fa5a0016c607abc40903cd",
  "SU2BFSSPhysicalDomainL6G7WActualSourceFullL2GaugeIsometryProbe.lean":"26cebbbd7c13dde06347637245ee53abfa9e3ed9",
  "SU2BFSSPhysicalDomainL6G7XOriginalSourceFullL2FermionRepresentationProbe.lean":"f5028f9cbbdca4a51470b05c6c2f98d56e900c7b",
  "SU2BFSSPhysicalDomainL6G7YActualSourceFullL2CombinedGaugeGroupLawProbe.lean":"a402183a963f4c334da93c32257941e1b92a0e62",
  "SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe.lean":"7f42aab817da8061aa76b251e4e2ba7c3b8379ed",
}

def git(*args):
    return subprocess.check_output(["git", *args],cwd=ROOT,text=True).strip()

def main():
    assert git("cat-file","-t",BASELINE)=="commit", "immutable baseline is missing"
    # The baseline is the accepted administrative checkpoint for this prospective audit.
    assert subprocess.run(["git","merge-base","--is-ancestor",BASELINE,"HEAD"],cwd=ROOT).returncode==0
    root_workflow=(ROOT/M2_WORKFLOW).read_text()
    old_pins=dict(re.findall(r'"(lean/[^"]+\.lean)":"([0-9a-f]{40})"',root_workflow))
    assert len(old_pins)==96, ("M2C1 source manifest must have 96 distinct pins",len(old_pins))
    for path,blob in old_pins.items():
        assert git("hash-object","--no-filters",path)==blob, ("M2 prior green drift",path)
    source_contents=(ROOT/SOURCE).read_text()
    consumer_contents=(ROOT/CONSUMER).read_text()
    assert "Mathlib.Analysis.Normed.Lp.PiLp" in source_contents
    assert "actualOriginalFullL2GaugeUnitaryHom" in source_contents
    assert "Boson 2" in consumer_contents and "Fermion 2" in consumer_contents
    assert git("hash-object","--no-filters",SOURCE)=="cc40839076eb980dab54f57af9c95b9d9e33da2c", "prospective source changed"
    assert git("hash-object","--no-filters",CONSUMER)=="b66dcf427baf572a44de3bd72566857803accbea", "prospective consumer changed"
    # Immutable baseline tree is the closed-form reference pin for all OAI imports,
    # including those outside the Kotler subtree and not present in the 96 M2 pins.
    baseline_paths={}
    for line in git("ls-tree","-r",BASELINE,"--","lean/OAI","lean/diagnostics").splitlines():
        if not line: continue
        m=re.fullmatch(r"\d+ blob ([0-9a-f]{40})\t(.+)",line)
        if m: baseline_paths[m.group(2)]=m.group(1)
    source_roots=[GAUGE,SOURCE,CONSUMER]
    visited={}
    pending=list(source_roots)
    edges={}
    while pending:
        path=pending.pop()
        if path in visited: continue
        f=ROOT/path
        assert f.is_file(), ("missing source import",path)
        now=git("hash-object","--no-filters",path)
        old=baseline_paths.get(path)
        assert old==now, ("module differs from immutable baseline",path,old,now)
        visited[path]=now
        direct=[]
        for mod in re.findall(r"(?m)^import\s+([^\s]+)\s*$",f.read_text()):
            if mod=="OAI" or mod.startswith("OAI."):
                dep="lean/"+mod.replace(".","/")+".lean"
                assert (ROOT/dep).is_file(), ("unresolved OAI import",path,mod)
                direct.append(dep)
                pending.append(dep)
        edges[path]=sorted(set(direct))
    gauge_closure=set()
    stack=[GAUGE]
    while stack:
        p=stack.pop()
        if p in gauge_closure: continue
        gauge_closure.add(p);stack.extend(edges[p])
    # Union is deduplicated by PATH; hashes must never disagree at overlap.
    combined=dict(old_pins)
    for path,blob in visited.items():
        if path in combined: assert combined[path]==blob, ("conflicting overlapping pin",path)
        combined[path]=blob
    for n,expected in GAUGE6.items():
        path="lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/"+n
        assert path in gauge_closure, ("missing gauge chain member",path)
        assert visited[path]==expected, ("source qualification drift",path,visited[path])
    assert git("show",BASELINE+":lean/lean-toolchain").strip()=="leanprover/lean4:v4.34.1"
    lm=json.loads((ROOT/"lean/lake-manifest.json").read_text())["packages"]
    assert next(x["rev"] for x in lm if x["name"]=="mathlib")=="d13f23b723b8a846827a245b89c10fc7d3f11612"
    report={
      "status":"P3_M3G0A_PROSPECTIVE_MANIFEST_AUDIT_ONLY_NOT_MATH_QUALIFIED",
      "baseline":BASELINE, "tested_head":git("rev-parse","HEAD"),
      "m2_accepted_exact_pins":len(old_pins),
      "gauge_z_transitive_OAI_modules":len(gauge_closure),
      "all_M3_root_transitive_OAI_modules":len(visited),
      "m2_overlap_with_gauge":len(set(old_pins)&gauge_closure),
      "m2_overlap_with_all_M3":len(set(old_pins)&set(visited)),
      "unique_deduplicated_exact_pins":len(combined),
      "pins":dict(sorted(combined.items())),
      "root_sources":source_roots,
      "excluded_external_package_dependencies":"mathlib and other Lake packages governed by exact package manifest",
      "mathematical_qualification":False,
    }
    d=ROOT/"bfss-m3g0a-manifest-audit"
    d.mkdir(exist_ok=True)
    (d/"pin-manifest.json").write_text(json.dumps(report,sort_keys=True,indent=2)+"\n")
    print("BFSS_P3_M3G0A_MANIFEST_AUDIT_PASS",
          "gauge_closure",len(gauge_closure),
          "m2_overlap",len(set(old_pins)&gauge_closure),
          "distinct_total",len(combined))
    print("BFSS_P3_M3G0A_MANIFEST_SHA256",hashlib.sha256((d/"pin-manifest.json").read_bytes()).hexdigest())

if __name__=="__main__":
    main()
