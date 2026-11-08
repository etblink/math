#!/usr/bin/env python3
"""H2 deterministic workflow source index for future-session retrieval.

Records names, Git source hashes and literal source-path references for all
workflow YAML files in the checkout. It is intentionally NOT a workflow-status
oracle, YAML trigger parser, qualification audit, or authorization to delete.

  python3 contributions/bfss-kotler/tools/h2_workflow_index.py --output /tmp/workflows.json --emit-rows
  python3 contributions/bfss-kotler/tools/h2_workflow_index.py --check-snapshot contributions/bfss-kotler/BFSS_H2_WORKFLOW_SOURCE_INDEX_V1.json
"""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

from build_import_graph import git_blob_sha

ROOT = Path(__file__).resolve().parents[3]
WORKFLOWS = ROOT / ".github/workflows"
REFERENCE = re.compile(r"(?<![A-Za-z0-9_])(?:lean/[A-Za-z0-9_./-]+[.]lean|contributions/bfss-kotler/[A-Za-z0-9_./-]+[.](?:json|md|py))")

def collect() -> dict:
    filenames = sorted(p for p in WORKFLOWS.iterdir() if p.is_file() and p.suffix in (".yml", ".yaml"))
    if not filenames:
        raise ValueError("STOP: no workflow files in checkout")
    records = []
    for p in filenames:
        data = p.read_bytes()
        body = data.decode("utf-8-sig")
        mentions = sorted(set(REFERENCE.findall(body)))
        # A generated index may name its own output before that file exists.
        missing = [ref for ref in mentions if ref != "contributions/bfss-kotler/BFSS_H2_WORKFLOW_SOURCE_INDEX_V1.json"
                   and not (ROOT / ref).is_file()]
        records.append({
            "path": p.relative_to(ROOT).as_posix(),
            "git_blob_sha": git_blob_sha(data),
            "bytes": len(data),
            "family_from_filename": "bfss" if p.name.startswith("bfss-") else "other",
            "textual_source_mentions": mentions,
            "mentions_missing_on_checkout": missing,
            "has_literal_workflow_dispatch": "workflow_dispatch:" in body,
            "has_literal_push": bool(re.search(r"(?m)^\s*push\s*:", body)),
            "lifecycle_status": "PRESENT_UNASSESSED"
        })
    n = len(records)
    return {
        "schema": "bfss-h2-workflow-source-index/v1",
        "source": ".github/workflows at the exact CI checkout; Git hashes are the durable identity",
        "caveats": ["Lexical mentions are not a YAML dependency or trigger parse.",
                    "Missing literal paths can be historical, branch-scoped or intentionally generated; they do not imply garbage.",
                    "PRESENT_UNASSESSED is not evidence of active or inactive CI, acceptance or retirement safety."],
        "workflow_count": n,
        "bfss_named_count": sum(x["family_from_filename"] == "bfss" for x in records),
        "other_named_count": sum(x["family_from_filename"] == "other" for x in records),
        "with_missing_textual_refs_count": sum(bool(x["mentions_missing_on_checkout"]) for x in records),
        "workflow_records": records
    }

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output", type=Path)
    ap.add_argument("--check-snapshot", type=Path)
    ap.add_argument("--emit-rows", action="store_true")
    args = ap.parse_args()
    try:
        result = collect()
        payload = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
        digest = hashlib.sha256(payload.encode()).hexdigest()
        if args.check_snapshot and args.check_snapshot.read_text(encoding="utf-8") != payload:
            raise ValueError("STOP: H2 workflow index differs from exact checkout")
        if args.output:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(payload, encoding="utf-8")
        print("H2_WORKFLOW_SOURCE_PASS " + json.dumps(
            {k: v for k, v in result.items() if k.endswith("_count")}, sort_keys=True))
        print("H2_WORKFLOW_INDEX_SHA256 " + digest)
        if args.emit_rows:
            for item in result["workflow_records"]:
                print("H2_WORKFLOW_ROW " + json.dumps(item, sort_keys=True))
        return 0
    except (OSError, UnicodeError, ValueError) as e:
        print("H2 WORKFLOW STOP: " + str(e), file=sys.stderr)
        return 1

if __name__ == "__main__":
    raise SystemExit(main())
