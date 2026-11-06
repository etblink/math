#!/usr/bin/env python3
"""Cold, source-pinned analysis gate; never restores BFSS proof objects."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

REPO = Path(__file__).resolve().parents[3]
LEAN = REPO / "lean"
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_SPECTRAL_LINEAR_MOMENT_MANIFEST_V1.json"
BUILD = LEAN / ".lake/build/lib/lean"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
ROOTS = ["OAI.BFSSRellich.compactLp_bump_error_linear",
         "OAI.BFSSRellich.linear_moment_tight_compactness"]


def require(condition, message):
    if not condition:
        raise ValueError(message)


def git(*args):
    return subprocess.check_output(["git", "-C", str(REPO), *args], text=True).strip()


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def uncomment(text):
    """Remove nested Lean block comments and line comments, preserving newlines."""
    out, i, depth = [], 0, 0
    while i < len(text):
        if text.startswith("/-", i):
            depth += 1
            out.append("  ")
            i += 2
        elif depth and text.startswith("-/", i):
            depth -= 1
            out.append("  ")
            i += 2
        elif not depth and text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end == -1 else end
        else:
            out.append(text[i] if not depth or text[i] == "\n" else " ")
            i += 1
    require(depth == 0, "unclosed Lean comment")
    return "".join(out)


def imports(path):
    return re.findall(r"(?m)^import\s+(\S+)\s*$", uncomment(path.read_text()))


def preflight():
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-spectral-linear-moment-v1", "schema mismatch")
    require(len(m["parents"]) == 33, "changed parent count")
    entries = m["parents"] + m["candidates"] + m["controls"]
    require(len({e["path"] for e in entries}) == len(entries), "duplicate pins")
    for e in entries:
        p = REPO / e["path"]
        require(git("hash-object", str(p)) == e["blob"] and digest(p) == e["sha256"],
                "changed source/control pin: " + e["path"])
    seen = set()
    for e in m["parents"]:
        require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean",
                "parent path mismatch")
        for module in imports(REPO / e["path"]):
            require(module == "Mathlib" or module in seen, "unbuilt dependency: " + module)
        require(e["module"] not in seen, "duplicate parent")
        seen.add(e["module"])
    reachable = set()

    def visit(module):
        if module == "Mathlib" or module in reachable:
            return
        require(module in seen, "unlisted dependency")
        reachable.add(module)
        for parent in imports(LEAN / (module.replace(".", "/") + ".lean")):
            visit(parent)

    visit("OAI.MathematicalPhysics.BFSS.WeightedCompactness")
    require(reachable == seen, "closure mismatch")
    require(len(m["candidates"]) == 2, "candidate count")
    require(imports(REPO / m["candidates"][0]["path"]) ==
            ["OAI.MathematicalPhysics.BFSS.WeightedCompactness"], "source imports")
    require(imports(REPO / m["candidates"][1]["path"]) ==
            [m["candidates"][0]["module"]], "consumer imports")
    for e in m["parents"] + m["candidates"]:
        code = uncomment((REPO / e["path"]).read_text())
        require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe)\b", code),
                "forbidden proof token: " + e["path"])
        if e in m["candidates"]:
            require(re.findall(r"(?m)^#print axioms (\S+)$", code) == ROOTS,
                    "printed roots mismatch")
            require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                    [("autoImplicit", "false")], "candidate option change")
    source = uncomment((REPO / m["candidates"][0]["path"]).read_text())
    require(re.findall(r"(?m)^(?:lemma|theorem) (\S+) ", source) ==
            [r.rsplit(".", 1)[1] for r in ROOTS], "declaration inventory")
    audit = uncomment((REPO / m["candidates"][1]["path"]).read_text())
    require(len(re.findall(r"(?m)^example\b", audit)) == 6, "consumer inventory")
    require((LEAN / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.34.1",
            "toolchain pin")
    return m


def check_reports(text, marker):
    require("sorryAx" not in text, "recovery axiom")
    require(not re.search(r"(?i)\b(?:warning|error)(?:\([^)]*\))?:", text),
            "candidate Lean diagnostic")
    reports = re.findall(r"(?:^|: )'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|"
                         r"does not depend on any axioms)", text, re.M)
    require([name for name, _ in reports] == ROOTS, "missing/duplicate axiom reports")
    actual = {name: sorted(a.strip() for a in axioms.split(",") if a.strip())
              for name, axioms in reports}
    require(all(set(a) <= ALLOWED for a in actual.values()), "unexpected axioms")
    require(text.splitlines().count(marker) == 1, "completion marker missing/duplicate")
    return actual


def environment():
    require(subprocess.check_output(["lean", "--version"], cwd=LEAN, text=True)
            .startswith("Lean (version 4.34.1,"), "compiler version")
    lock = json.loads((LEAN / "lake-manifest.json").read_text())
    require(lock["packagesDir"] == ".lake/packages", "dependency directory")
    packages = {}
    for p in lock["packages"]:
        name = p["name"]
        if name.startswith("«") and name.endswith("»"):
            name = name[1:-1]
        require(re.fullmatch(r"[A-Za-z0-9_-]+", name) and p["type"] == "git"
                and p.get("subDir") is None, "unsupported dependency layout")
        require(name not in packages, "duplicate dependency")
        actual = git("-C", str(LEAN / ".lake/packages" / name), "rev-parse", "HEAD")
        require(actual == p["rev"], "dependency revision: " + name)
        packages[name] = actual
    require(packages["mathlib"] == "d13f23b723b8a846827a245b89c10fc7d3f11612",
            "Mathlib pin")
    require((LEAN / ".lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean").is_file(),
            "missing Mathlib object")
    return packages


def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": git("rev-parse", "HEAD"), "status": "INCOMPLETE",
               "packages": {}, "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    for e in m["parents"] + m["candidates"] + m["controls"]:
        dest = evidence / "inputs" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], dest)
    shutil.copyfile(MANIFEST, evidence / MANIFEST.name)
    try:
        receipt["packages"] = environment()
        # Remove every controlled proof object before rebuilding any parent.
        for e in m["parents"] + m["candidates"]:
            stem = BUILD / e["module"].replace(".", "/")
            for ext in (".olean", ".ilean", ".olean.private", ".olean.server"):
                Path(str(stem) + ext).unlink(missing_ok=True)
        for index, e in enumerate(m["parents"] + m["candidates"]):
            candidate = e in m["candidates"]
            obj = BUILD / (e["module"].replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            logfile = evidence / (f"{index:02d}-" + e["module"].rsplit(".", 1)[-1] + ".log")
            command = ["lake", "env", "lean"]
            if candidate:
                command += ["-DautoImplicit=false", "-DwarningAsError=true"]
            command += ["-o", str(obj), str(REPO / e["path"])]
            print("Compiling " + e["module"], flush=True)
            start = time.monotonic()
            with logfile.open("w") as out:
                result = subprocess.run(command, cwd=LEAN, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=300)
            text = logfile.read_text()
            entry = {"module": e["module"], "returncode": result.returncode,
                     "seconds": round(time.monotonic() - start, 3), "log": logfile.name}
            receipt["builds"].append(entry)
            if result.returncode != 0:
                print(text, flush=True)
            require(result.returncode == 0 and obj.is_file(), "compilation failed: " + e["module"])
            require("sorryAx" not in text and not re.search(r"(?i)\b(?:sorry|error):", text),
                    "parent recovery/error")
            entry["object_sha256"] = digest(obj)
            entry["log_sha256"] = digest(logfile)
            if candidate:
                entry["axioms"] = check_reports(text, e["marker"])
                print(text, flush=True)
            else:
                entry["warnings"] = [s for s in text.splitlines() if "warning" in s.lower()]
        preflight()  # Environment setup/build may not rewrite pinned sources or locks.
        receipt["status"] = "PASS"
    finally:
        (evidence / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("SPECTRAL_LINEAR_MOMENT_GATE_PASS", flush=True)


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
        print("SPECTRAL_LINEAR_MOMENT_PREFLIGHT_PASS")
