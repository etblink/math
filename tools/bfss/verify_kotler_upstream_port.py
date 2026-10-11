#!/usr/bin/env python3
"""Independently audit and compile the staged Kotler BFSS import closure.

This script does not confer scientific acceptance on a port until a pinned
Lean run succeeds. It compiles only the required upstream OAI modules and
all transferred FCP Lean modules in dependency order, instead of building
the entire OpenAI math monorepo.
"""
from __future__ import annotations
import argparse
from collections import defaultdict
from pathlib import Path
import re
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parents[2]
LEAN = HERE / "lean"
MODROOT = Path("OAI/MathematicalPhysics/BFSS/Contrib/Kotler")
ROOTS = [
    "SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe",
    "SU2BFSSPhysicalDomainS3K1ExactPhysicalGaugePreservationProbe",
    "SU2BFSSPhysicalDomainS3L2SourceGammaTwoSpatialCovarianceProbe",
    "SU2BFSSPhysicalDomainS3L3ASourcePositionDerivativeCommutatorProbe",
]
PREFIX = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler."
IMPORTS = re.compile(r"(?m)^import[ \t]+([^\n]+)$")
AXIOMS = re.compile(r"'([^']+)' depends on axioms: \[([^\]]*)\]")
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}


def deps(text: str) -> list[str]:
    result = []
    for match in IMPORTS.finditer(text):
        result.extend(match.group(1).split("--", 1)[0].split())
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compile", action="store_true")
    parser.add_argument("--timeout-per-module", type=int, default=240)
    args = parser.parse_args()
    contributed = {p.relative_to(LEAN).with_suffix("").as_posix().replace("/", "."): p
                   for p in (LEAN / MODROOT).glob("*.lean")}
    if len(contributed) < 100:
        raise RuntimeError(f"Staging incomplete: {len(contributed)} contributed files")
    requested = set(contributed)
    source = dict(contributed)
    source["OAI.MathematicalPhysics.BFSS.SpinPlaneCovariance"] = (
        LEAN / "OAI/MathematicalPhysics/BFSS/SpinPlaneCovariance.lean")
    todo = list(source)
    edges: dict[str, list[str]] = {}
    missing = defaultdict(set)
    while todo:
        name = todo.pop()
        if name in edges:
            continue
        path = source[name]
        if not path.is_file():
            raise RuntimeError(f"Missing source for {name}: {path}")
        contents = path.read_text(encoding="utf-8")
        edges[name] = []
        for module in deps(contents):
            if module.startswith(PREFIX) and module not in contributed:
                missing[name].add(module)
                continue
            upstream = LEAN / (module.replace(".", "/") + ".lean")
            if module in source:
                edges[name].append(module)
            elif module.startswith("OAI.") and upstream.is_file():
                source[module] = upstream
                edges[name].append(module)
                todo.append(module)
            elif module.startswith("OAI.") and not upstream.is_file():
                missing[name].add(module)
    if missing:
        raise RuntimeError(f"Unresolved source imports: {dict(missing)}")

    ordering: list[str] = []
    marks: dict[str, int] = {}
    def visit(name: str) -> None:
        if marks.get(name) == 2:
            return
        if marks.get(name) == 1:
            raise RuntimeError(f"Import dependency cycle at {name}")
        marks[name] = 1
        for dep in edges[name]:
            visit(dep)
        marks[name] = 2
        ordering.append(name)

    for name in sorted(source):
        visit(name)
    for name in ROOTS:
        if PREFIX + name not in contributed:
            raise RuntimeError(f"Missing verified FCP root candidate: {name}")
    if PREFIX + "SU2BFSSPhysicalDomainS3L3BSourceOperatorHeisenbergProbe" in source:
        raise RuntimeError("Unqualified S3L3B is in the contribution")

    num_upstream = len(source) - len(contributed) - 1
    print(f"BFSS_PORT_IMPORT_GRAPH_PASS copied={len(contributed)} "
          f"upstream_required={num_upstream} total_compile={len(ordering)}",
          flush=True)
    if not args.compile:
        return

    logs = HERE / "contributions/bfss-kotler/verification-logs"
    logs.mkdir(parents=True, exist_ok=True)
    n_axiom = 0
    start = time.monotonic()
    for idx, name in enumerate(ordering, 1):
        path = source[name]
        relative = path.relative_to(LEAN)
        dest = LEAN / ".lake/build/lib/lean" / relative.with_suffix(".olean")
        dest.parent.mkdir(parents=True, exist_ok=True)
        cmd = ["lake", "env", "lean", "-o", str(dest.relative_to(LEAN)), str(relative)]
        print(f"BFSS_COMPILE_START {idx}/{len(ordering)} {name}", flush=True)
        try:
            run = subprocess.run(cmd, cwd=LEAN, text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, timeout=args.timeout_per_module)
        except subprocess.TimeoutExpired as exc:
            print(f"BFSS_COMPILE_TIMEOUT {name} after {args.timeout_per_module}s", flush=True)
            raise SystemExit(3) from exc
        out = run.stdout
        (logs / f"{idx:03d}-{name.replace('.', '_')}.log").write_text(out, encoding="utf-8")
        if run.returncode or not dest.exists():
            print(f"BFSS_COMPILE_FAILED {name} code={run.returncode}\n{out[-8000:]}", flush=True)
            raise SystemExit(4)
        if "sorryAx" in out or "error:" in out:
            print(f"BFSS_AX_IOM_FAILURE {name}\n{out[-6000:]}", flush=True)
            raise SystemExit(5)
        for declaration, line in AXIOMS.findall(out):
            axioms = {v.strip() for v in line.split(",") if v.strip()}
            n_axiom += 1
            if not axioms <= ALLOWED:
                print(f"BFSS_EXTRA_AXIOMS {name} {declaration} {sorted(axioms)}", flush=True)
                raise SystemExit(6)
        print(f"BFSS_COMPILE_OK {idx}/{len(ordering)} {name}", flush=True)
    elapsed = int(time.monotonic() - start)
    print(f"KOTLER_BFSS_CONSOLIDATED_PINNED_PASS modules={len(ordering)} "
          f"contributed={len(contributed)} axiom_reports={n_axiom} elapsed_sec={elapsed}",
          flush=True)


if __name__ == "__main__":
    main()
