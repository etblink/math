#!/usr/bin/env python3
"""Cold original-source massless charge/form recovery and composition gate."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

SPEC = importlib.util.spec_from_file_location(
    "accepted_core_utilities", Path(__file__).with_name("qualify_spectral_core_linear_moment.py"))
utilities = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(utilities)
runtime = utilities.accepted
REPO, LEAN, BUILD = runtime.REPO, runtime.LEAN, runtime.BUILD
require, git, digest, uncomment, imports = (runtime.require, runtime.git, runtime.digest,
                                         runtime.uncomment, runtime.imports)
check_reports = utilities.check_reports
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_SPECTRAL_MASSLESS_SOURCE_MANIFEST_V1.json"
ROOT = "OAI.BFSSQuantum.AlgebraData.massless_coreForm_energy"
ORIGIN = "fa00aa36e770ca516f57b41f5b02229a5033d50f"
ORIGINAL_BLOBS = {
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9ASourceChargeCoefficientCrosswalkProbe.lean": "72b09cd22398480b5ebd34e786449017ea910099",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9BSourcePairAndChargeReductionProbe.lean": "22d0066f24233fdb1f1f30eba8d869ed99641f07",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9COrderedPairCoefficientProbe.lean": "78b943de0a4dafcdcb0c9700cdfc62fbed62d35e",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean": "fe14e7e7c69e4575f53df38ac6a0b386a69cefc7"
}


def original_bytes(entry, text):
    """Invert only the enumerated recovery edits; pin the entire original file."""
    prefix = entry["target_import"] + "\n\n" + entry["recovery_note"]
    suffix = entry["audit_suffix"]
    require(text.startswith(prefix) and text.count(entry["recovery_note"]) == 1,
            "recovery prefix mismatch")
    require(text.endswith(suffix), "recovery suffix mismatch")
    restored = entry["origin_import"] + "\n\n" + text[len(prefix):-len(suffix)]
    if entry["removed_private_print"]:
        require(entry["removed_private_print"] not in restored and
                restored.count(entry["private_print_anchor"]) == 1, "private print mapping")
        restored = restored.replace(entry["private_print_anchor"],
                                    entry["removed_private_print"] + entry["private_print_anchor"], 1)
    data = restored.encode()
    actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
    require(actual == entry["origin_blob"] and
            hashlib.sha256(data).hexdigest() == entry["origin_sha256"],
            "original source mismatch: unapproved statement/proof edit")
    return data


def preflight():
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-spectral-massless-source-v1", "schema mismatch")
    require(len(m["originals"]) == 15 and len(m["recovered"]) == 4 and len(m["candidates"]) == 2,
            "compilation inventory")
    builds = m["originals"] + m["recovered"] + m["candidates"]
    entries = builds + m["controls"]
    require(len({e["path"] for e in entries}) == len(entries), "duplicate input")
    for e in entries:
        p = REPO / e["path"]
        require(git("hash-object", str(p)) == e["blob"] and digest(p) == e["sha256"],
                "changed input pin: " + e["path"])
    seen = set()
    for e in builds:
        require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean", "module path")
        require(e["module"] not in seen, "duplicate module")
        for module in imports(REPO / e["path"]):
            require(module == "Mathlib" or module in seen, "unbuilt dependency: " + module)
        seen.add(e["module"])
        code = uncomment((REPO / e["path"]).read_text())
        require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe)\b", code),
                "forbidden proof token: " + e["path"])
        require(re.findall(r"(?m)^#print axioms (\S+)$", code) == e["print_names"], "print inventory")
        if e["roots"]:
            require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                    [("autoImplicit", "false")], "source option change")
    for e in m["recovered"]:
        require(e["origin_ref"] == ORIGIN and
                ORIGINAL_BLOBS.get(e["path"]) == e["origin_blob"], "recovery snapshot/blob")
        original_bytes(e, (REPO / e["path"]).read_text())
    roots = [r for e in m["recovered"] for r in e["roots"]] + [ROOT]
    require(len(roots) == len(set(roots)) == 17, "public root inventory")
    require(m["candidates"][0]["roots"] == [ROOT] and m["candidates"][1]["roots"] == roots,
            "composition/consumer roots")
    require(m["candidates"][0]["print_names"] == [ROOT] and
            m["candidates"][1]["print_names"] == roots, "consumer print names")
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
    require(reachable == {e["module"] for e in m["originals"] + m["recovered"]},
            "exact imported closure")
    require(imports(REPO / m["candidates"][0]["path"]) == [m["recovered"][-1]["module"]] and
            imports(REPO / m["candidates"][1]["path"]) == [m["candidates"][0]["module"]],
            "composition/consumer imports")
    code = uncomment((REPO / m["candidates"][0]["path"]).read_text())
    require(re.findall(r"(?m)^theorem (\S+) ", code) == ["massless_coreForm_energy"],
            "composition declarations")
    audit = uncomment((REPO / m["candidates"][1]["path"]).read_text())
    require(len(re.findall(r"(?m)^example\b", audit)) == 10, "consumer example inventory")
    return m

def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": git("rev-parse", "HEAD"), "status": "INCOMPLETE", "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    builds = m["originals"] + m["recovered"] + m["candidates"]
    for e in builds + m["controls"]:
        dest = evidence / "inputs" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], dest)
    for e in m["recovered"]:
        dest = evidence / "original-readers" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(original_bytes(e, (REPO / e["path"]).read_text()))
    receipt["exact_original_recovery_files"] = 4
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
    print("SPECTRAL_MASSLESS_SOURCE_GATE_PASS", flush=True)


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
        print("SPECTRAL_MASSLESS_SOURCE_PREFLIGHT_PASS")
