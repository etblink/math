#!/usr/bin/env python3
"""BFSS operational checkpoint consistency. No Lean, no external dependencies.

Advisory check only: does not verify actual CI run conclusions, physical
theorems, or protect a branch ref.
"""
from __future__ import annotations

import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
STATE_PATH = ROOT / "BFSS_GATE_STATE.json"
ROADMAP_PATH = ROOT / "BFSS_ACTIVE_ROADMAP.md"
CANONICAL_BRANCH = "integration/bfss-unified-research-20261108"
EXPECTED_MATHLIB = "d13f23b723b8a846827a245b89c10fc7d3f11612"


def require(ok, msg):
    if not ok:
        raise AssertionError(msg)


def main():
    s = json.loads(STATE_PATH.read_text(encoding="utf-8"))
    require(s.get("schema_version") == 1, "schema mismatch")
    require(s.get("purpose") == "canonical_live_checkpoint_not_proof_receipt", "checkpoint/proof conflation")
    require(s.get("branch") == CANONICAL_BRANCH, "unreviewed branch migration")
    require(s.get("roadmap") == ROADMAP_PATH.name, "canonical roadmap moved")
    require(re.fullmatch("M[1-8]", s.get("milestone", "")) is not None, "milestone must be M1-M8")
    q, a = s["last_qualified"], s["active"]
    gate_rx = re.compile(r"P3-D5[A-Z][0-9]*[A-Z]?")
    require(gate_rx.fullmatch(q.get("gate", "")) is not None, "qualified gate ID malformed")
    require(gate_rx.fullmatch(a.get("gate", "")) is not None, "active gate ID malformed")
    require(q["verdict"] == "GREEN", "last qualified verdict not GREEN")
    require(a["status"] in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED", "BLOCKED"},
            "invalid active status")
    for entry, key in [(q, "tested_sha"), (a, "candidate_sha")]:
        require(re.fullmatch(r"[0-9a-f]{40}", entry.get(key, "")) is not None, "invalid exact SHA")
        require(isinstance(entry.get("run_id"), int) and entry["run_id"] > 0, "missing run ID")
        require(entry.get("manifest_pins", 0) >= 1, "missing verified source manifest count")
        for k in ("source", "consumer"):
            path = Path(entry[k])
            require(not path.is_absolute() and ".." not in path.parts and (ROOT/path).is_file(),
                    "missing or unsafe " + k + ": " + str(path))
    require(a["manifest_pins"] >= q["manifest_pins"], "pin count regression")
    require(Path(a["source"]).stem.startswith(a["gate"].replace("-", "")),
            "active gate/source mismatch")
    require(s.get("if_green") and s.get("if_red"), "decision alternatives missing")
    require(s["toolchain"] == {"lean": "4.34.1", "mathlib": EXPECTED_MATHLIB},
            "pinned toolchain changed without roadmap review")
    require(s.get("exploratory") == "NOT_PROMOTED", "exploratory physics promoted silently")
    roadmap = ROADMAP_PATH.read_text(encoding="utf-8")
    require(STATE_PATH.name in roadmap, "roadmap not linked to live checkpoint")
    for name in ("README.md", "AGENTS.md"):
        require(ROADMAP_PATH.name in (ROOT/name).read_text(encoding="utf-8"),
                name + " must point to canonical roadmap")
    # Narrow drift check: new P3-D5 source modifications must correspond to
    # the declared active gate. Broader future tracks still require review.
    try:
        changes = subprocess.check_output(
            ["git", "diff", "--name-only", "HEAD^", "HEAD"],
            cwd=ROOT, text=True).splitlines()
    except subprocess.CalledProcessError:
        changes = []
    for filename in changes:
        if not filename.startswith("lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"):
            continue
        m = re.match(r"P3D5([A-Z][0-9]+[A-Z]?)", Path(filename).stem)
        if m:
            proposed = "P3-D5" + m.group(1)
            require(proposed == a["gate"],
                    "source gate " + proposed + " is missing from live active checkpoint " + a["gate"])
    print("BFSS_ROADMAP_CHECK_PASS", "milestone", s["milestone"],
          "accepted", q["gate"], "active", a["gate"], a["status"])


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, KeyError, TypeError, ValueError, OSError) as exc:
        print("BFSS_ROADMAP_CHECK_FAIL:", exc, file=sys.stderr)
        sys.exit(1)
