#!/usr/bin/env python3
"""Read-only, source-verified OP2 predecessor closure across a pinned BFSS snapshot.

Boundary: recursively follow imports under the original OperatorDependencies
namespace only. Other imported modules are reported as explicit, unresolved
boundaries. Not a Lean build, axiom check, qualification or full-repo graph.

Run on an ordinary checkout with network/GitHub token:
  python3 contributions/bfss-kotler/tools/h2_op2_ancestry.py --output /tmp/op2.json --emit-nodes
  python3 contributions/bfss-kotler/tools/h2_op2_ancestry.py --check-snapshot contributions/bfss-kotler/BFSS_H2_OP2_PINNED_ANCESTRY_V1.json
"""
from __future__ import annotations
import argparse
import base64
import hashlib
import json
import os
from pathlib import Path
import sys
from urllib.parse import quote
from urllib.request import Request, urlopen

from build_import_graph import direct_imports, git_blob_sha

REPO = "etblink/math"
PINNED = "fa00aa36e770ca516f57b41f5b02229a5033d50f"
ACTIVE_BASELINE = "f0f4d5aa9bf992b87f01f5cc9cfb3dcc7f745c4a"
PREFIX = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies."
ROOT = PREFIX + "SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe"
DIRECTORY = "lean/" + PREFIX[:-1].replace(".", "/")
MAX_NODES = 120
HEADERS = {"Accept": "application/vnd.github+json",
           "User-Agent": "bfss-h2-op2-source-ancestry-v1",
           "X-GitHub-Api-Version": "2022-11-28"}
if os.environ.get("GITHUB_TOKEN"):
    HEADERS["Authorization"] = "Bearer " + os.environ["GITHUB_TOKEN"]

def read_api(path: str, ref: str):
    query = quote(path, safe="/")
    url = f"https://api.github.com/repos/{REPO}/contents/{query}?ref={ref}"
    with urlopen(Request(url, headers=HEADERS), timeout=30) as response:
        return json.load(response)

def entry(module: str, depth: int) -> dict:
    assert module.startswith(PREFIX), module
    path = "lean/" + module.replace(".", "/") + ".lean"
    raw = read_api(path, PINNED)
    if not isinstance(raw, dict) or raw.get("type") != "file":
        raise ValueError(f"Expected source file: {module}")
    blob = base64.b64decode(raw["content"])
    sha = git_blob_sha(blob)
    if sha != raw["sha"]:
        raise ValueError(f"Git blob identity mismatch: {module}")
    try:
        content = blob.decode("utf-8-sig")
    except UnicodeDecodeError as e:
        raise ValueError(f"Cannot parse UTF-8 source: {module}") from e
    imports = direct_imports(content)
    return {"module": module, "path": path, "snapshot_blob_sha": sha,
            "bytes": len(blob), "depth": depth, "direct_imports": imports,
            "inside_prefix": sorted(i for i in imports if i.startswith(PREFIX)),
            "outside_prefix": sorted(i for i in imports if not i.startswith(PREFIX)),
            "current_baseline": "UNCLASSIFIED", "qualification": "NOT_CHECKED"}

def collect() -> dict:
    active_directory = read_api(DIRECTORY, ACTIVE_BASELINE)
    if not isinstance(active_directory, list):
        raise ValueError("Active OperatorDependencies directory is not listable")
    active = {f["name"]: f["sha"] for f in active_directory if f.get("type") == "file"
              and f["name"].endswith(".lean")}
    visited, frontier = {}, [(ROOT, 0)]
    while frontier:
        module, depth = frontier.pop(0)
        if module in visited:
            continue
        if len(visited) >= MAX_NODES:
            raise ValueError(f"STOP: ancestry exceeds {MAX_NODES} nodes; no partial PASS")
        record = entry(module, depth)
        filename = record["path"].rsplit("/", 1)[-1]
        existing = active.get(filename)
        record["current_baseline"] = (
            "ABSENT_AT_ACTIVE_BASELINE" if existing is None else
            "PRESENT_SAME_BLOB" if existing == record["snapshot_blob_sha"] else
            "PRESENT_DIFFERENT_BLOB"
        )
        if existing:
            record["current_baseline_blob_sha"] = existing
        visited[module] = record
        for dep in record["inside_prefix"]:
            if dep not in visited:
                frontier.append((dep, depth + 1))
    modules = [visited[n] for n in sorted(visited)]
    all_internal = {x["module"] for x in modules}
    for x in modules:
        if not set(x["inside_prefix"]).issubset(all_internal):
            raise ValueError(f"Missing transitive dependency at {x['module']}")
    boundary = sorted({dep for x in modules for dep in x["outside_prefix"]})
    statuses = sorted({x["current_baseline"] for x in modules})
    counts = {k: sum(x["current_baseline"] == k for x in modules) for k in statuses}
    return {
        "schema": "bfss-h2-op2-pinned-ancestry/v1",
        "repository": REPO,
        "snapshot_commit": PINNED,
        "active_comparison_commit": ACTIVE_BASELINE,
        "root": ROOT,
        "scope": "Exact transitive import closure within OperatorDependencies prefix only",
        "excluded": "Other OAI imports, Mathlib, proof qualification and CI",
        "graph_complete_within_prefix": True,
        "source_blobs_verified": True,
        "module_count": len(modules),
        "internal_import_edges": sum(len(x["inside_prefix"]) for x in modules),
        "outside_prefix_import_edges": sum(len(x["outside_prefix"]) for x in modules),
        "outside_prefix_imports": boundary,
        "active_comparison_counts": counts,
        "modules": modules
    }

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output", type=Path)
    ap.add_argument("--check-snapshot", type=Path)
    ap.add_argument("--emit-nodes", action="store_true")
    args = ap.parse_args()
    try:
        result = collect()
        payload = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
        digest = hashlib.sha256(payload.encode()).hexdigest()
        if args.check_snapshot:
            old = args.check_snapshot.read_text(encoding="utf-8")
            if old != payload:
                raise ValueError("STOP: frozen H2 ancestor snapshot mismatches source-faithful replay")
        if args.output:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(payload, encoding="utf-8")
        print("H2_SOURCE_VERIFIED_PASS "
              + json.dumps({k: v for k, v in result.items()
                            if k in ("snapshot_commit", "active_comparison_commit",
                                     "module_count", "internal_import_edges",
                                     "outside_prefix_import_edges",
                                     "active_comparison_counts")}, sort_keys=True))
        print("H2_SHA256 " + digest)
        print("H2_BOUNDARY_JSON " + json.dumps(result["outside_prefix_imports"]))
        if args.emit_nodes:
            for node in result["modules"]:
                print("H2_NODE_JSON " + json.dumps(node, sort_keys=True))
        return 0
    except (OSError, ValueError, KeyError, AssertionError) as e:
        print("H2 STOP: " + str(e), file=sys.stderr)
        return 1

if __name__ == "__main__":
    raise SystemExit(main())
