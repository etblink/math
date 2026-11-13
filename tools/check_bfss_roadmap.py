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
    scientific = s.get("scientific_method", {})
    require(scientific.get("protocol") == "research/methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md" and
            scientific.get("registry") == "research/methodology/BFSS_EXPERIMENT_REGISTRY.json",
            "research-method protocol/registry absent from active checkpoint")
    experiment = json.loads((ROOT / scientific["registry"]).read_text(encoding="utf-8"))
    require(experiment.get("schema_version") == 1 and experiment.get("protocol") == scientific["protocol"],
            "research method registry schema/link drift")
    require((ROOT / scientific["protocol"]).is_file(), "scientific method protocol missing")
    require("eight stages" in (ROOT / scientific["protocol"]).read_text(encoding="utf-8").lower(),
            "eight-stage research protocol removed")
    entries = experiment.get("entries", [])
    require(entries and all(isinstance(x, dict) for x in entries), "experimental registry empty")
    require(len({x["id"] for x in entries}) == len(entries), "duplicate experiment identifiers")
    required = {"observation","question","background","hypothesis","falsifiers","experiment","analysis_plan","conclusion_rule","communication"}
    for item in entries:
        require(item["status"] in experiment["allowed_statuses"], "unregistered experiment status")
        require(required <= set(item["stages"]), "missing scientific-method stages in " + item["id"])
        require(item.get("qualified_physical_claim") is False or item["status"] == "LEAN_QUALIFIED",
                "physical claim elevated from a non-Lean experiment")
    require(scientific["first_test_id"] in [x["id"] for x in entries],
            "active research test not indexed")
    alignment = s.get("monograph_alignment")
    require(isinstance(alignment, dict), "Edition 0.7 monograph review not recorded")
    require(alignment.get("status") == "REVIEWED_NOT_MERGED", "monograph merge/qualification status needs review")
    require(alignment.get("exact_commit") == "b603f4c1715e15f5f92c69d7fb071992dbaa9f40",
            "monograph source changed without an explicit fresh review")
    require(alignment.get("original_math_baseline") ==
            "d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5",
            "monograph historical proof baseline drift")
    require(alignment.get("atlas_records") == 38 and
            alignment.get("new_mathematical_qualification") is False and
            alignment.get("monograph_fast_forward_authorized") is False,
            "monograph review must not promote evidence or merge")
    require(s.get("next_planned", {}).get("gate") == "P3-D5B4A" or
            s.get("milestone") != "M1",
            "D5-B4A plan changed without milestone review")
    roadmap = ROADMAP_PATH.read_text(encoding="utf-8")
    require(STATE_PATH.name in roadmap, "roadmap not linked to live checkpoint")
    require("research/methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md" in roadmap and "research/methodology/BFSS_EXPERIMENT_REGISTRY.json" in roadmap,
            "scientific-method protocol not discoverable from active roadmap")
    require("b603f4c1715e15f5f92c69d7fb071992dbaa9f40" in roadmap and
            "Monograph S1" in roadmap and "Alternative independent spectral" in roadmap,
            "pinned monograph dependency/alternate-route crosswalk missing")
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
