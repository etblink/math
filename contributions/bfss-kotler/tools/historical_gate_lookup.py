#!/usr/bin/env python3
"""Read-only historical BFSS gate note and source lookup.

Searches ALL local Markdown notes (not only the curated H1 registry).
Optionally includes Lean files and an independently checked-out FCP notes path.
Results report what a document CLAIMS, not newly verified qualifications.

Examples:
  python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "Fock bivector adjoint" --include-lean
  python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "subtype coercion" --limit 12
  python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "gamma bracket" --notes-dir ../Foundational-Convergence-Program/handoffs
  python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --self-test
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import re
import sys
import tempfile

REPO_ROOT = Path(__file__).resolve().parents[3]
NOTES_ROOT = Path(__file__).resolve().parents[1]
F1_SOURCE_ROOT = REPO_ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler"
RUN_RE = re.compile(r"github[.]com/etblink/(?:math|Foundational-Convergence-Program)/actions/runs/([0-9]+)")
COMMIT_RE = re.compile(r"(?<![a-f0-9])[a-f0-9]{40}(?![a-f0-9])")
SOURCE_RE = re.compile(r"lean/[A-Za-z0-9_./-]+[.]lean")
DECL_SOURCE_RE = re.compile(r"\b(?:SU2|FCP|BFSS)[A-Za-z0-9_]+[.]lean\b")
STATUS_RE = re.compile(r"(?im)^\s*\*{0,2}(?:status|disposition|scientific status)(?::\*{0,2}|\*{0,2}:)\s*(.+)$")
QUERY_RE = re.compile(r"[A-Za-z0-9_]+")
MAX_BYTES = 512_000

def query_words(value: str) -> list[str]:
    return list(dict.fromkeys(w.lower() for w in QUERY_RE.findall(value) if w.strip()))

def display_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return str(path.resolve())

def scan_one(path: Path, words: list[str], require_all: bool) -> dict | None:
    if path.stat().st_size > MAX_BYTES:
        return None
    source = path.read_text(encoding="utf-8-sig", errors="replace")
    filename = path.name.lower()
    title = next((line[2:].strip() for line in source.splitlines()
                  if line.startswith("# ")), path.stem)
    headings = "\n".join(line for line in source.splitlines()
                         if line.startswith("#"))
    full = source.lower()
    matched = [w for w in words if w in full or w in filename]
    if not matched or (require_all and len(matched) != len(words)):
        return None
    score = sum((16 if w in filename else 0)
                + (7 if w in headings.lower() else 0)
                + (2 if w in full else 0) for w in matched)
    if len(matched) == len(words):
        score += 8
    lines = source.splitlines()
    # A useful context line, not a claim that the hit is qualified.
    ranked = sorted(enumerate(lines), key=lambda row: (
        -sum(w in row[1].lower() for w in words), row[0]))
    snippet = next((line.strip()[:320] for _, line in ranked
                    if line.strip() and any(w in line.lower() for w in matched)), "")
    status = STATUS_RE.search(source[:3500])
    runs = list(dict.fromkeys(RUN_RE.findall(source)))
    commits = list(dict.fromkeys(COMMIT_RE.findall(source)))
    files = list(dict.fromkeys(SOURCE_RE.findall(source) +
                               DECL_SOURCE_RE.findall(source)))
    return {
        "path": display_path(path),
        "title": title[:200],
        "file_kind": "Lean source" if path.suffix == ".lean" else "historical note",
        "score": score,
        "matched_terms": matched,
        "reported_status_unverified": status.group(1).strip()[:180] if status else None,
        "run_ids_mentioned": runs[:12],
        "commit_hashes_mentioned": commits[:8],
        "lean_sources_mentioned": files[:12],
        "excerpt": snippet
    }

def search(roots: list[Path], words: list[str], limit: int,
           require_all: bool, include_lean: bool) -> tuple[list[dict], int]:
    files: set[Path] = set()
    for root in roots:
        if not root.exists():
            raise ValueError(f"Notes/source path does not exist: {root}")
        if root.is_file():
            candidates = [root]
        else:
            candidates = list(root.rglob("*.md"))
            if include_lean:
                candidates.extend(root.rglob("*.lean"))
        for path in candidates:
            if path.is_file() and ".git" not in path.parts:
                files.add(path.resolve())
    hits = []
    for file in sorted(files):
        hit = scan_one(file, words, require_all)
        if hit is not None:
            hits.append(hit)
    hits.sort(key=lambda x: (-x["score"], x["path"]))
    return hits[:limit], len(files)

def self_test() -> None:
    with tempfile.TemporaryDirectory() as d:
        base = Path(d)
        (base / "ACCEPTED_FOCK_BIVECTOR.md").write_text(
            "# Original Fock bivector adjoint accepted\n"
            "**Disposition:** ACCEPTED_EXACT_LOCAL_ONLY\n"
            "Run https://github.com/etblink/math/actions/runs/12345; "
            "tested 0123456789abcdef0123456789abcdef01234567. "
            "lean/OAI/Example.lean\n", encoding="utf-8")
        (base / "RED_BIVECTOR.md").write_text(
            "# Failed bivector adjoint simplification\n"
            "**Status:** RED\nThe simp tactic left a coercion goal.\n",
            encoding="utf-8")
        (base / "UNRELATED.md").write_text(
            "# Unrelated theorem\nNo matching source here.\n", encoding="utf-8")
        hits, scanned = search([base], ["bivector", "adjoint"], 20, True, False)
        assert scanned == 3 and len(hits) == 2, (scanned, hits)
        assert hits[0]["run_ids_mentioned"] == ["12345"], hits[0]
        assert hits[0]["reported_status_unverified"] == "ACCEPTED_EXACT_LOCAL_ONLY"
        assert hits[1]["reported_status_unverified"] == "RED"
        assert len(hits[0]["commit_hashes_mentioned"][0]) == 40
        assert "lean/OAI/Example.lean" in hits[0]["lean_sources_mentioned"]
        print("HISTORICAL_LOOKUP_SELF_TEST_PASS: 3 files, 2 hits, provenance extraction")

def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--query", help="Search terms, compared case-insensitively")
    p.add_argument("--notes-dir", action="append", type=Path,
                   help="Search this directory; repeat to include FCP or other checkouts")
    p.add_argument("--include-lean", action="store_true",
                   help="Include Lean sources as well as historical Markdown notes")
    p.add_argument("--require-all", action="store_true",
                   help="Require every query term to appear")
    p.add_argument("--limit", type=int, default=12)
    p.add_argument("--json", action="store_true", help="Emit stable JSON")
    p.add_argument("--self-test", action="store_true")
    args = p.parse_args()
    try:
        if args.self_test:
            self_test()
            return 0
        if not args.query:
            p.error("--query is required unless --self-test is set")
        if not 1 <= args.limit <= 100:
            raise ValueError("--limit must be between 1 and 100")
        words = query_words(args.query)
        if not words:
            raise ValueError("The search query contains no tokens")
        roots = args.notes_dir or [NOTES_ROOT]
        if args.include_lean and args.notes_dir is None:
            roots = roots + [F1_SOURCE_ROOT]
        hits, scanned = search(roots, words, args.limit,
                               args.require_all, args.include_lean)
        report = {
            "query": args.query,
            "searched_paths": [str(x) for x in roots],
            "files_scanned": scanned,
            "returned": len(hits),
            "status_warning": "Textual/document evidence only; verify the exact source and CI run before accepting a theorem.",
            "results": hits
        }
        if args.json:
            print(json.dumps(report, indent=2))
        else:
            print(f"HISTORICAL SEARCH: {scanned} files scanned, {len(hits)} matches returned")
            for item in hits:
                print(f"\n[{item['score']}] {item['title']}\n  {item['path']}")
                if item["reported_status_unverified"]:
                    print(f"  REPORTS: {item['reported_status_unverified']}")
                if item["run_ids_mentioned"]:
                    print("  RUNS MENTIONED: " + ", ".join(item["run_ids_mentioned"]))
                if item["lean_sources_mentioned"]:
                    print("  SOURCES MENTIONED: " + ", ".join(item["lean_sources_mentioned"][:5]))
                print(f"  MATCH: {item['excerpt']}")
            print("\nVerify exact tested commits, source blobs, consumers and CI before scientific promotion.")
        return 0
    except (OSError, ValueError, AssertionError) as exc:
        print(f"HISTORICAL LOOKUP STOP: {exc}", file=sys.stderr)
        return 1

if __name__ == "__main__":
    raise SystemExit(main())
