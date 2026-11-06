#!/usr/bin/env python3
"""Bounded accepted-object cache; never qualifies a candidate or changes a proof.

Only the 175 legacy-module .oleans in the frozen DD/AI closure are reusable.
Every hit is checked before installation, then freshly imported/audited. A miss
uses the existing Lake build. A malformed hit fails closed, without installation.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

REPO = Path(__file__).resolve().parents[3]
LEAN = REPO / "lean"
MANIFEST = REPO / "contributions/bfss-kotler/FCP_DD_AI_CACHE_MANIFEST_V1.json"
STAGE = LEAN / ".lake/bfss-dd-ai-cache-v1"
BUILD = LEAN / ".lake/build/lib/lean"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
MATHLIB = "d13f23b723b8a846827a245b89c10fc7d3f11612"


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def git(*args):
    return subprocess.check_output(["git", "-C", str(REPO), *args], text=True).strip()


def package_directories(lock):
    """Mirror Lake's Name.toString (escape := false) for this frozen flat-name lock.

    Manifest JSON may escape a simple Lean name as «doc-gen4», whereas Lake's
    PackageEntry.dirName is doc-gen4. Reject unsupported name/layout forms;
    never probe alternative directories or skip a dependency.
    """
    require(lock["packagesDir"] == ".lake/packages", "unsupported packages directory")
    result = []
    for package in lock["packages"]:
        require(package["type"] == "git" and package.get("subDir") is None,
                "unsupported dependency layout")
        name = package["name"]
        if name.startswith("«") and name.endswith("»"):
            name = name[1:-1]
        require(bool(re.fullmatch(r"[A-Za-z0-9_-]+", name)), "unsupported package name")
        result.append((package, name))
    require(len({name for _, name in result}) == len(result), "duplicate package directory")
    return result


def check_dependency_revisions(lock, packages_dir):
    for package, dirname in package_directories(lock):
        path = packages_dir / dirname
        require((path / ".git").exists(), "missing dependency repository: " + dirname)
        actual = subprocess.check_output(
            ["git", "-C", str(path), "rev-parse", "HEAD"], text=True).strip()
        require(actual == package["rev"], "dependency revision: " + package["name"])


def load_manifest():
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-dd-ai-accepted-ancestry-v1", "bad schema")
    require(m["module_count"] == len(m["sources"]) == 175, "bad closure count")
    roots = [r for e in m["sources"] for r in e["roots"]]
    require(m["root_count"] == len(roots) == len({r["name"] for r in roots}) == 666,
            "bad root inventory")
    require(m["max_bytes"] == 128 * 1024 * 1024, "changed size bound")
    require(len({e["module"] for e in m["sources"]}) == 175, "duplicate module")
    require(all(set(r["axioms"]) <= ALLOWED for r in roots), "bad baseline axioms")
    return m


def check_sources(m):
    for path, expected in list(m["controls"].items()) + [
        (e["path"], e["blob"]) for e in m["sources"]
    ]:
        require(git("hash-object", str(REPO / path)) == expected, "changed pin: " + path)
    # Reject unsupported dependency names/layouts before expensive setup/build.
    package_directories(json.loads((LEAN / "lake-manifest.json").read_text()))
    modules = {e["module"] for e in m["sources"]}
    reachable = set()
    imports = {}
    for e in m["sources"]:
        require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean",
                "invalid source path")
        s = (REPO / e["path"]).read_text()
        require(not re.search(r"(?m)^module\s*$", s), "module-system source needs new design")
        printed = re.findall(r"(?m)^#print axioms (\S+)", s)
        require(len(printed) == len(e["roots"]), "changed printed-root count")
        require(all(r["name"] == short or r["name"].endswith("." + short)
                    for short, r in zip(printed, e["roots"])), "changed root names")
        imports[e["module"]] = [i for i in re.findall(r"(?m)^import\s+(\S+)", s)
                                 if i.startswith("OAI.")]
        require(set(imports[e["module"]]) <= modules, "missing transitive source")
    def visit(mod):
        if mod not in reachable:
            reachable.add(mod)
            for imp in imports[mod]:
                visit(imp)
    for target in m["targets"]:
        visit(target)
    require(reachable == modules, "extraneous or missing closure member")


def environment(m):
    require(os.environ["GITHUB_REPOSITORY"] == "etblink/math", "wrong repository")
    require(os.environ["GITHUB_REF_NAME"] == m["branch"], "wrong branch")
    require(os.environ["GITHUB_EVENT_NAME"] in ("push", "workflow_dispatch"), "untrusted event")
    require(os.environ["RUNNER_OS"] == "Linux" and os.environ["RUNNER_ARCH"] == "X64",
            "unqualified runner platform")
    version = subprocess.check_output(["lake", "env", "lean", "--version"],
                                      cwd=LEAN, text=True).strip()
    require("version 4.34.1," in version, "wrong compiler")
    lock = json.loads((LEAN / "lake-manifest.json").read_text())
    check_dependency_revisions(lock, LEAN / lock["packagesDir"])
    require(next(p["rev"] for p in lock["packages"] if p["name"] == "mathlib") == MATHLIB,
            "wrong Mathlib")
    return {"lean": version, "runner_os": os.environ["RUNNER_OS"],
            "runner_arch": os.environ["RUNNER_ARCH"], "branch": m["branch"],
            "manifest_sha256": sha256(MANIFEST), "verifier_sha256": sha256(Path(__file__))}


def object_names(m):
    return sorted(e["module"].replace(".", "/") + ".olean" for e in m["sources"])


def inventory(folder, m):
    require(folder.is_dir() and not folder.is_symlink(), "missing/linked object directory")
    files = []
    for path in folder.rglob("*"):
        require(not path.is_symlink(), "linked cache entry")
        if path.is_file():
            files.append(path.relative_to(folder).as_posix())
        else:
            require(path.is_dir(), "special cache entry")
    require(sorted(files) == object_names(m), "missing or extraneous cached object")
    total = sum((folder / name).stat().st_size for name in files)
    require(0 < total <= m["max_bytes"], "cache exceeds 128 MiB bound")
    result = {}
    for name in sorted(files):
        path = folder / name
        require(path.stat().st_size > 0, "empty cached object")
        result[name] = {"bytes": path.stat().st_size, "sha256": sha256(path)}
    return result


def verify_bundle(stage, m, env):
    require(stage.is_dir() and not stage.is_symlink(), "missing/linked cache")
    require({p.name for p in stage.iterdir()} == {"objects", "receipt.json"}, "bad cache entries")
    receipt_path = stage / "receipt.json"
    require(not receipt_path.is_symlink() and receipt_path.stat().st_size < 1024 * 1024,
            "bad receipt")
    r = json.loads(receipt_path.read_text())
    require(r["schema"] == m["schema"] and r["source_tested_sha"] == m["source_tested_sha"]
            and r["source_run_id"] == m["source_run_id"], "wrong accepted provenance")
    require(r["environment"] == env, "cache environment mismatch")
    require(bool(re.fullmatch(r"[0-9a-f]{40}", r["seed_sha"]))
            and str(r["seed_run_id"]).isdigit(), "missing cold provenance")
    actual = inventory(stage / "objects", m)
    require(actual == r["objects"], "cached object digest mismatch")
    return r


def check_reports(text, expected):
    require("sorryAx" not in text, "recovery axiom")
    require(not re.search(r"\.lean:\d+:\d+:\s*(?:warning|error)(?:\([^)]*\))?:", text),
            "Lean diagnostic")
    reports = re.findall(r"(?:^|: )'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|"
                         r"does not depend on any axioms)", text, re.M)
    require(len(reports) == len(expected), "missing/duplicate axiom reports")
    actual = {name: sorted(a.strip() for a in axs.split(",") if a.strip())
              for name, axs in reports}
    require(actual == expected, "changed root names or axioms")


def run_audit(script, logfile):
    command = ["lake", "env", "lean", "-DautoImplicit=false", "-DwarningAsError=true", str(script)]
    with logfile.open("w") as stream:
        result = subprocess.run(command, cwd=LEAN, stdout=stream, stderr=subprocess.STDOUT,
                                timeout=600)
    if result.returncode != 0:
        # Preserve the full file and expose the causal Lean diagnostic in the job log.
        print(logfile.read_text(), file=sys.stderr, flush=True)
    require(result.returncode == 0, "fresh audit failed: " + str(logfile))
    return logfile.read_text()


def root_audit_commands(name):
    parts = name.split(".")
    if name.startswith("_private."):
        require(any(part.isdecimal() for part in parts), "missing private numeric component")
        expr = "Lean.Name.anonymous"
        for part in parts:
            if re.fullmatch(r"0|[1-9][0-9]*", part):
                expr = "Lean.Name.num (" + expr + ") " + part
            else:
                require(bool(re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", part)),
                        "unsupported private name component")
                expr = "Lean.Name.str (" + expr + ") " + json.dumps(part)
        # Numeric Name components are not ordinary identifier source tokens.
        # mkIdent retains the exact structured Name; both original strict commands
        # then elaborate against that same constant, without an alias or admission.
        return ("run_cmd do\n  let rootName : Lean.Name := " + expr +
                "\n  let rootId := Lean.mkIdent rootName\n" +
                "  Lean.Elab.Command.elabCommand (← `(#check @$rootId))\n" +
                "  Lean.Elab.Command.elabCommand (← `(#print axioms $rootId))")
    require(all(part.isidentifier() for part in parts), "unsupported public name")
    return "#check @" + name + "\n#print axioms " + name


def write_import_audit(entries, script):
    script.write_text("\n".join("import " + e["module"] for e in entries) + "\n" +
                      "\n".join(root_audit_commands(r["name"])
                                for e in entries for r in e["roots"]) + "\n")


def audit(m, logdir):
    roots = [r for e in m["sources"] for r in e["roots"]]
    expected = {r["name"]: sorted(r["axioms"]) for r in roots}
    script = logdir / "accepted-ancestor-import-audit.lean"
    write_import_audit(m["sources"], script)
    check_reports(run_audit(script, logdir / "accepted-ancestor-import-audit.log"), expected)
    dd = LEAN / "diagnostics/FCP_K1D18V10HF10DDIndependentAudit.lean"
    text = run_audit(dd, logdir / "accepted-dd-independent-audit.log")
    dd_roots = next(e["roots"] for e in m["sources"] if e["module"] == m["targets"][0])
    check_reports(text, {r["name"]: sorted(r["axioms"]) for r in dd_roots})
    print("DD_AI_CACHE_FRESH_IMPORT_AUDIT_PASS modules=175 roots=666", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("check", "environment", "install", "seal"))
    parser.add_argument("--log-dir", type=Path)
    args = parser.parse_args()
    m = load_manifest()
    check_sources(m)
    print("DD_AI_CACHE_SOURCE_CLOSURE_PASS modules=175 roots=666", flush=True)
    if args.mode == "check":
        return
    env = environment(m)
    print("DD_AI_CACHE_ENVIRONMENT_PASS dependencies=42", flush=True)
    if args.mode == "environment":
        return
    logdir = args.log_dir.resolve()
    logdir.mkdir(parents=True, exist_ok=True)
    if args.mode == "install":
        receipt = verify_bundle(STAGE, m, env)  # Check all bytes before any install/import.
        require(not (BUILD / "OAI").exists(), "destination OAI tree must be empty")
        shutil.copytree(STAGE / "objects" / "OAI", BUILD / "OAI")
        audit(m, logdir)
        print("DD_AI_CACHE_WARM_REVALIDATION_PASS", flush=True)
    else:
        require(not STAGE.exists(), "refuse to reseal an existing bundle")
        expected = {r["name"]: sorted(r["axioms"])
                    for e in m["sources"] for r in e["roots"]}
        check_reports((logdir / "ancestry-build.log").read_text(), expected)
        audit(m, logdir)
        total = sum((BUILD / name).stat().st_size for name in object_names(m))
        require(0 < total <= m["max_bytes"], "built objects exceed 128 MiB bound")
        for name in object_names(m):
            src, dst = BUILD / name, STAGE / "objects" / name
            require(src.is_file() and src.stat().st_size > 0, "missing built ancestor: " + name)
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dst)
        receipt = {"schema": m["schema"], "source_tested_sha": m["source_tested_sha"],
                   "source_run_id": m["source_run_id"], "environment": env,
                   "seed_sha": git("rev-parse", "HEAD"), "seed_run_id": os.environ["GITHUB_RUN_ID"],
                   "objects": inventory(STAGE / "objects", m)}
        (STAGE / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
        verify_bundle(STAGE, m, env)
        print("DD_AI_CACHE_COLD_SEAL_PASS", flush=True)
    (logdir / "ancestor-cache-receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("DD_AI_CACHE_BYTES", sum(v["bytes"] for v in receipt["objects"].values()), flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print("DD_AI_CACHE_FAIL_CLOSED", repr(exc), file=sys.stderr, flush=True)
        raise
