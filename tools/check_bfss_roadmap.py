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
    gate_rx = re.compile(r"P3-(?:D5[A-Z][0-9]*[A-Z]?|M[23][A-Z][0-9]*(?:[A-Z][0-9]*)?)")
    require(gate_rx.fullmatch(q.get("gate", "")) is not None, "qualified gate ID malformed")
    require(gate_rx.fullmatch(a.get("gate", "")) is not None, "active gate ID malformed")
    require(q["verdict"] == "GREEN", "last qualified verdict not GREEN")
    require(a["status"] in {"PENDING_STRICT_CI", "RED_UNQUALIFIED", "GREEN_QUALIFIED", "BLOCKED"},
            "invalid active status")
    for entry, key in [(q, "tested_sha"), (a, "candidate_sha")]:
        require(re.fullmatch(r"[0-9a-f]{40}", entry.get(key, "")) is not None, "invalid exact SHA")
        if entry is a and entry["status"] == "PENDING_STRICT_CI" and entry.get("run_id") is None:
            # A two-commit staged push has no GitHub run ID until the new ref is published.
            # Record the *source ancestor* SHA first, then reconcile run ID on the next
            # checkpoint-only commit; do not invent a workflow result.
            pass
        else:
            require(isinstance(entry.get("run_id"), int) and entry["run_id"] > 0,
                    "missing or invalid run ID")
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
    if s["milestone"] == "M1":
        expected_next = {"P3-D5B3": "P3-D5B4A", "P3-D5B4A": "P3-D5B4B"}.get(q["gate"])
        require(expected_next is not None and s.get("next_planned", {}).get("gate") == expected_next,
                "M1 accepted-gate to next-gate sequence drift")
    if s["milestone"] == "M2" and q["gate"] == "P3-D5B4B":
        require(s.get("next_planned", {}).get("gate") == "P3-M2A" and
                s.get("stage_transition", {}).get("status") in {"M1_DELIVERABLE_QUALIFIED_M2_GATE_NOT_STAGED", "M1_DELIVERABLE_QUALIFIED_M2_GATE_STAGED_UNQUALIFIED"},
                "M2 transition requires B4B exact accepted receipt and first HS-fiber gate review")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2A":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B1" and
                s.get("stage_transition", {}).get("status") in {"M1_COMPLETE_M2A_ACCEPTED_M2B1_UNSTAGED", "M1_COMPLETE_M2A_ACCEPTED_M2B1_STAGED_UNQUALIFIED"},
                "M2A strict qualification requires scoped M2B1 handoff; no premature M3 or spectrum")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B1":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2A" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_ACCEPTED_M2B2A_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_ACCEPTED_M2B2A_STAGED_UNQUALIFIED"},
                "M2B1 strict qualification requires a scoped unstaged M2B2A research handoff")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2A":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B0" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_ACCEPTED_M2B2B0_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_ACCEPTED_M2B2B0_STAGED_UNQUALIFIED"},
                "M2B2A accepted requires source original operator-L2 M2B2B handoff, no M3 promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B0":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B1" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_ACCEPTED_B1_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_ACCEPTED_B1_STAGED_UNQUALIFIED"},
                "B0 qualified requires source operator-valued Lp B1 handoff; no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B1":
        require(s.get("next_planned", {}).get("gate") == "P3-M2B2B2" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_ACCEPTED_B2_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_ACCEPTED_B2_STAGED_UNQUALIFIED"},
                "B1 qualified requires bounded original operator Lp B2 equivalence handoff, no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2B2B2":
        require(s.get("next_planned", {}).get("gate") == "P3-M2C0" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_ACCEPTED_M2C0_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_ACCEPTED_M2C0_STAGED_UNQUALIFIED"},
                "B2 accepted requires bounded operator-to-Fock Lp columns M2C0 handoff, no physical promotion")
    if s["milestone"] == "M2" and q["gate"] == "P3-M2C0":
        require(s.get("next_planned", {}).get("gate") == "P3-M2C1" and
                s.get("stage_transition", {}).get("status") in {
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_M2C0_ACCEPTED_M2C1_UNSTAGED",
                    "M1_COMPLETE_M2A_M2B1_M2B2A_B0_B1_B2_M2C0_ACCEPTED_M2C1_STAGED_UNQUALIFIED"},
                "M2C0 qualified requires explicit original operator Lp vs Fock column norm-bound M2C1 handoff")
    if s["milestone"] == "M3" and q["gate"] == "P3-M2C1":
        require(s["next_planned"]["gate"] == "P3-M3G0" and
                s["next_planned"]["status"] == "RESEARCH_DESIGN_NOT_STAGED" and
                s["stage_transition"]["status"] == "M2_SCOPE_COMPLETE_M3G0_RESEARCH_UNSTAGED",
                "M2C1 qualified requires M3-G0 source gauge research-only handoff")
        review = s.get("priority_review", {})
        require(review.get("status") == "M2_SCOPED_MATH_COMPLETE_M3_RESEARCH_ONLY" and
                (ROOT / review.get("review", "__missing__")).is_file() and
                (ROOT / review.get("acceptance", "__missing__")).is_file(),
                "M2 closure and M3 prioritized reuse receipts absent")
    if a["status"] == "GREEN_QUALIFIED":
        require(a["gate"] == q["gate"] and a["run_id"] == q["run_id"] and
                a["manifest_pins"] == q["manifest_pins"] and
                a.get("workflow_tested_head_sha") == q["tested_sha"],
                "green active checkpoint does not match last qualified exact run")
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
    # Advisory HEAD^→HEAD drift check for both active spectral gate families.
    # Permit edits to exactly the currently declared source, not to a qualified
    # ancestor or unrelated P3D5/P3M2 source. Do NOT parse a gate from the
    # module stem: P3M2B1Original... would ambiguously swallow the "O".
    # Strict source blob pins/CI, not this check, establish proof authority.
    try:
        changes = subprocess.check_output(
            ["git", "diff", "--name-only", "HEAD^", "HEAD"],
            cwd=ROOT, text=True).splitlines()
    except subprocess.CalledProcessError as exc:
        raise AssertionError("cannot inspect source drift from HEAD^: " + str(exc)) from exc
    source_dir = "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
    for filename in changes:
        if not filename.startswith(source_dir):
            continue
        stem = Path(filename).stem
        if stem.startswith(("P3D5", "P3M2", "P3M3")) and filename.endswith(".lean"):
            require(filename == a["source"],
                    "P3 spectral source changed outside active source root: " +
                    filename + " (active " + a["source"] + ")")
    print("BFSS_ROADMAP_CHECK_PASS", "milestone", s["milestone"],
          "accepted", q["gate"], "active", a["gate"], a["status"])


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, KeyError, TypeError, ValueError, OSError) as exc:
        print("BFSS_ROADMAP_CHECK_FAIL:", exc, file=sys.stderr)
        sys.exit(1)
