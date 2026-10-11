#!/usr/bin/env python3
"""Generate a source-faithful, pinned BFSS SU(2) contribution candidate.

No results are certified by this script. It copies the complete import
closure of four FCP-qualified roots, rewrites local Lean import paths,
and records provenance, exclusions and basic static hazards. The output
must be compiled independently against the fork before acceptance.
"""
from __future__ import annotations
import argparse
import hashlib
from pathlib import Path
import re
from collections import Counter

FCP_SHA = "b60baa806dab3f0b296229a78f70e07b787544ab"
DOI = "https://doi.org/10.5281/zenodo.23291242"
DEST = Path("lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler")
DOC = Path("contributions/bfss-kotler/PORT_MANIFEST.md")
PREFIX = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler."
DIRS = ("openai-math-su2-concrete-potential", "openai-math-su2-physical-domain")
ROOTS = (
    "SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe",
    "SU2BFSSPhysicalDomainS3K1ExactPhysicalGaugePreservationProbe",
    "SU2BFSSPhysicalDomainS3L2SourceGammaTwoSpatialCovarianceProbe",
    "SU2BFSSPhysicalDomainS3L3ASourcePositionDerivativeCommutatorProbe",
)
KNOWN_UNQUALIFIED = {
    "SU2BFSSPhysicalDomainS3L3BSourceOperatorHeisenbergProbe",
}
IMPORT = re.compile(r"(?m)^import[ \t]+([^\n]+)$")
UNSOUND = re.compile(r"(?m)^\s*(?:axiom\s|sorry\b|admit\b)")


def sha256(s: str) -> str:
    return hashlib.sha256(s.encode()).hexdigest()


def parse_imports(text: str) -> list[str]:
    result = []
    for m in IMPORT.finditer(text):
        result.extend(m.group(1).split("--", 1)[0].split())
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, required=True)
    args = parser.parse_args()
    source = args.source.resolve()
    paths = [p for d in DIRS for p in (source / "experiments" / d).glob("*.lean")]
    modules: dict[str, tuple[Path, str]] = {}
    for path in sorted(paths):
        if path.stem in modules:
            raise RuntimeError(f"Duplicate module name: {path.stem}")
        modules[path.stem] = (path, path.read_text(encoding="utf-8"))
    if len(modules) < 100:
        raise RuntimeError(f"Incomplete FCP checkout: only {len(modules)} Lean files")
    if any(name not in modules for name in ROOTS):
        raise RuntimeError(f"Missing required roots: {set(ROOTS) - set(modules)}")

    all_deps = {k: parse_imports(s) for k, (_, s) in modules.items()}
    missing = {k: [v for v in vals if v.startswith("SU2") and v not in modules]
               for k, vals in all_deps.items()}
    missing = {k: vals for k, vals in missing.items() if vals}
    if missing:
        raise RuntimeError(f"Missing BFSS experiment imports: {missing}")

    selected = set(ROOTS)
    while True:
        expanded = selected | {d for name in selected for d in all_deps[name] if d in modules}
        if expanded == selected:
            break
        selected = expanded
    overlap = sorted(selected & KNOWN_UNQUALIFIED)
    if overlap:
        raise RuntimeError(f"An unqualified experiment is an accepted-root dependency: {overlap}")

    DEST.mkdir(parents=True, exist_ok=True)
    expected = {f"{x}.lean" for x in selected}
    for stale in DEST.glob("SU2*.lean"):
        if stale.name not in expected:
            stale.unlink()

    manifest = [
        "# Kotler BFSS SU(2) upstream port — staging inventory",
        "",
        "**Status: PORTED / NOT YET INDEPENDENTLY LEAN-QUALIFIED.**",
        "",
        f"- Original researcher and formalization contributor: Evan T. Kotler",
        f"- Independent research record: {DOI}",
        f"- FCP source commit: \\u0060{FCP_SHA}\\u0060".replace("\\u0060", "`"),
        "- Upstream repository: openai/math, Apache-2.0",
        "- Copyright in the contributed formalization retained by its author; source definitions credited to OpenAI.",
        "- All source files have original proof statements and tactics preserved except import-path rewriting.",
        f"- Discovered BFSS Lean modules: {len(modules)}",
        f"- Selected import-closed modules: {len(selected)}",
        f"- Other modules not included: {len(modules) - len(selected)}",
        "",
        "## Qualified FCP source roots (NOT qualification of this upstream port)",
    ]
    for name in ROOTS:
        manifest.append(f"- \\u0060{name}\\u0060".replace("\\u0060", "`"))
    manifest += [
        "",
        "The original source roots previously passed pinned FCP Lean gate(s).",
        "The import-renamed upstream copies must be independently compiled and axiom-audited.",
        "No statement of a full Hamiltonian rotational symmetry, a global Spin(9) action, or positive eigenvalues is claimed.",
        "",
        "## Included modules and source hashes",
        "",
        "| Module | FCP source SHA-256 | Lines |",
        "|---|---|---:|",
    ]
    for name in sorted(selected):
        path, original = modules[name]
        def replace(m: re.Match[str]) -> str:
            words = m.group(1).split("--", 1)
            rewritten = " ".join(PREFIX + x if x in selected else x for x in words[0].split())
            comment = "--" + words[1] if len(words) == 2 else ""
            return "import " + rewritten + ((" " + comment) if comment else "")
        adapted = IMPORT.sub(replace, original)
        if name == "SU2BFSSPhysicalDomainS3L3BSourceOperatorHeisenbergProbe":
            raise RuntimeError("Rejected S3L3B attempted transfer")
        notice = (
            "/-!\n"
            "Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).\n"
            f"Research DOI: {DOI}\n"
            f"FCP source: {FCP_SHA}, experiments/{path.parent.name}/{path.name}\n"
            "Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.\n"
            "Build status: integrated candidate; upstream port NOT YET independently verified.\n"
            "OpenAI retains credit for the original BFSS definitions on which this work builds.\n"
            "-/\n"
        )
        target = DEST / f"{name}.lean"
        target.write_text(adapted + "\n" + notice, encoding="utf-8")
        manifest.append(f"| \\u0060{name}\\u0060 | \\u0060{sha256(original)}\\u0060 | {len(original.splitlines())} |".replace("\\u0060", "`"))

    manifest += ["", "## Excluded source modules (not in the requested dependency closure)", ""]
    for name in sorted(set(modules) - selected):
        marker = " — explicitly unqualified" if name in KNOWN_UNQUALIFIED else ""
        manifest.append(f"- \\u0060{name}\\u0060{marker}".replace("\\u0060", "`"))
    hazards = {name: str(modules[name][0]) for name in selected if UNSOUND.search(modules[name][1])}
    manifest += ["", "## Static proof hazards", "", f"Modules with leading axiom/sorry/admit tokens (must adjudicate): {len(hazards)}", ""]
    for name in sorted(hazards):
        manifest.append(f"- \\u0060{name}\\u0060".replace("\\u0060", "`"))
    manifest += ["", "## Next gate", "",
                 "Topologically compile all selected original-source Lean modules using the fork's pinned",
                 "Lean 4.34.1 / Mathlib revision, audit \\u0060#print axioms\\u0060 for all",
                 "new public theorem declarations and compare against existing FCP gates.".replace("\\u0060", "`"),
                 "Do not open a PR against openai/math or merge this staging branch without separate authorization.",
                 ""]
    DOC.parent.mkdir(parents=True, exist_ok=True)
    DOC.write_text("\n".join(manifest), encoding="utf-8")
    print(f"BFSS_PORT_STAGED selected={len(selected)} total={len(modules)} excluded={len(modules)-len(selected)} hazards={len(hazards)}")
    print(f"PORT_MANIFEST={DOC}")


if __name__ == "__main__":
    main()
