#!/usr/bin/env python3
"""Deterministic, blob-verified import graph for the BFSS Lean subtree.

Run on a full checkout of etblink/math at the branch recorded in the frozen
inventory. Reads every listed source file, checks Git blob hashes and sizes,
cross-checks the 24 independently sampled import sets, and writes a JSON graph.

This is a source-dependency tool, NOT a Lean compilation, theorem acceptance,
axiom audit, qualification or proof of dead code.

  python3 contributions/bfss-kotler/tools/build_import_graph.py --repo-root .
  python3 contributions/bfss-kotler/tools/build_import_graph.py --repo-root . --check
"""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

INVENTORY = Path("contributions/bfss-kotler/BFSS_LEAN_TREE_INVENTORY_2026_11_08.json")
SAMPLE = Path("contributions/bfss-kotler/BFSS_IMPORT_GRAPH_SAMPLE_2026_11_08.json")
OUTPUT = Path("contributions/bfss-kotler/BFSS_IMPORT_GRAPH_FULL_2026_11_08.json")
PREFIX = "OAI.MathematicalPhysics.BFSS"
IMPORT_LINE = re.compile(r"^[ \t]*(?:(?:public|meta)[ \t]+)?import[ \t]+([^\n]+)$", re.MULTILINE)

def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest()

def strip_lean_comments(source: str) -> str:
    """Remove line and nested block comments, preserving newlines."""
    out = []
    i = depth = 0
    line_comment = in_string = escaped = False
    while i < len(source):
        c, d = source[i], source[i:i+2]
        if c == "\n":
            out.append(c)
            line_comment = False
            i += 1
            continue
        if line_comment:
            out.append(" ")
            i += 1
            continue
        if depth:
            if d == "/-":
                depth += 1
                out.extend("  ")
                i += 2
            elif d == "-/":
                depth -= 1
                out.extend("  ")
                i += 2
            else:
                out.append(" ")
                i += 1
            continue
        if in_string:
            out.append(c)
            if escaped:
                escaped = False
            elif c == "\\":
                escaped = True
            elif c == '"':
                in_string = False
            i += 1
            continue
        if d == "--":
            line_comment = True
            out.extend("  ")
            i += 2
        elif d == "/-":
            depth = 1
            out.extend("  ")
            i += 2
        elif c == '"':
            in_string = True
            out.append(c)
            i += 1
        else:
            out.append(c)
            i += 1
    if depth:
        raise ValueError("Unterminated Lean block comment")
    return "".join(out)

def direct_imports(source: str) -> list[str]:
    cleaned = strip_lean_comments(source)
    imports = []
    for match in IMPORT_LINE.finditer(cleaned):
        for token in match.group(1).split():
            if token not in imports:
                imports.append(token)
    return imports

def module_name(path: str) -> str:
    if not path.startswith("lean/") or not path.endswith(".lean"):
        raise ValueError(f"Not a Lean module path: {path}")
    return path[len("lean/"):-len(".lean")].replace("/", ".")

def cycles_of(graph: dict[str, list[str]]) -> list[list[str]]:
    """Tarjan's SCC algorithm on the internal import graph."""
    indices, low, active, stack, groups = {}, {}, set(), [], []
    index = 0
    def visit(v: str) -> None:
        nonlocal index
        indices[v] = low[v] = index
        index += 1
        stack.append(v)
        active.add(v)
        for w in graph[v]:
            if w not in graph:
                continue
            if w not in indices:
                visit(w)
                low[v] = min(low[v], low[w])
            elif w in active:
                low[v] = min(low[v], indices[w])
        if low[v] == indices[v]:
            group = []
            while True:
                w = stack.pop()
                active.remove(w)
                group.append(w)
                if w == v:
                    break
            if len(group) > 1 or v in graph[v]:
                groups.append(sorted(group))
    for v in sorted(graph):
        if v not in indices:
            visit(v)
    return sorted(groups)

def generate(repo_root: Path, inventory: dict, sample: dict) -> dict:
    if inventory.get("complete_bfss_tree") is not True:
        raise ValueError("Inventory is not marked a complete BFSS tree")
    modules = {}
    for entry in inventory["files"]:
        path = entry["path"]
        name = module_name(path)
        if name in modules:
            raise ValueError(f"Duplicate module: {name}")
        file = repo_root / path
        if not file.is_file():
            raise ValueError(f"Missing inventoried Lean file: {path}")
        data = file.read_bytes()
        sha = git_blob_sha(data)
        if sha != entry["blob_sha"] or len(data) != entry["bytes"]:
            raise ValueError(f"Source integrity mismatch for {path}: {sha}, {len(data)} bytes")
        modules[name] = {
            "module": name, "path": path, "blob_sha": sha, "bytes": len(data),
            "imports": direct_imports(data.decode("utf-8-sig")),
            "qualification_status": "UNKNOWN", "axioms_status": "NOT_RUN",
        }
    if len(modules) != inventory["inventory_count"]:
        raise ValueError(f"Module count mismatch: {len(modules)}")
    for old in sample["modules"]:
        name = old["module"]
        if name not in modules or modules[name]["imports"] != old["imports"]:
            raise ValueError(f"Sampled import mismatch: {name}")
    downstream = {m: [] for m in modules}
    missing_bfss = set()
    internal_edges = outside_edges = 0
    for name, item in modules.items():
        inside, outside = [], []
        for dep in item["imports"]:
            if dep in modules:
                inside.append(dep)
                downstream[dep].append(name)
                internal_edges += 1
            else:
                outside.append(dep)
                outside_edges += 1
                if dep == PREFIX or dep.startswith(PREFIX + "."):
                    missing_bfss.add(dep)
        item["internal_imports"] = inside
        item["outside_inventory_imports"] = outside
    for name, item in modules.items():
        item["direct_downstream"] = sorted(downstream[name])
    graph = {m: x["internal_imports"] for m, x in modules.items()}
    ordered = sorted(modules.values(), key=lambda x: x["module"])
    return {
        "schema": "bfss-import-graph-v1",
        "repository": inventory["repository"],
        "baseline_commit": inventory["baseline_commit"],
        "bfss_subtree_sha": inventory["bfss_subtree_sha"],
        "coverage": "All inventoried BFSS Lean modules; direct source imports only",
        "source_integrity": "Every source file checked by exact Git blob SHA-1 and byte size",
        "sample_crosscheck": "PASS",
        "module_count": len(ordered),
        "internal_edge_count": internal_edges,
        "outside_inventory_edge_count": outside_edges,
        "missing_bfss_module_imports": sorted(missing_bfss),
        "cycles": cycles_of(graph),
        "zero_internal_downstream_count": sum(not x["direct_downstream"] for x in ordered),
        "qualification_caveat": "No Lean compilation, axiom audit, independent consumer, workflow qualification, public declaration audit, or dead-code proof performed.",
        "modules": ordered,
    }

def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--repo-root", type=Path, default=Path("."))
    p.add_argument("--inventory", type=Path, default=INVENTORY)
    p.add_argument("--sample", type=Path, default=SAMPLE)
    p.add_argument("--output", type=Path, default=OUTPUT)
    p.add_argument("--check", action="store_true")
    args = p.parse_args()
    root = args.repo_root.resolve()
    try:
        inventory = json.loads((root / args.inventory).read_text(encoding="utf-8"))
        sample = json.loads((root / args.sample).read_text(encoding="utf-8"))
        graph = generate(root, inventory, sample)
        payload = json.dumps(graph, ensure_ascii=False, indent=2) + "\n"
        target = root / args.output
        if args.check:
            if not target.is_file() or target.read_text(encoding="utf-8") != payload:
                raise ValueError(f"Full graph is absent or stale: {target}")
            print(f"MATCH: {graph['module_count']} modules, {graph['internal_edge_count']} internal edges")
        else:
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(payload, encoding="utf-8")
            print(f"WROTE {target}: {graph['module_count']} modules, {graph['internal_edge_count']} internal edges")
    except (OSError, UnicodeError, KeyError, ValueError, json.JSONDecodeError) as e:
        print(f"ERROR: {e}", file=sys.stderr)
        return 1
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
