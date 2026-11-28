# Workflow and checker compatibility — bounded maintenance audit

Baseline `9ad0590b255a56420b5276064c51329256939693`, 2026-11-28 Pacific. No new mathematical experiment, Lean build, CI dispatch or workflow reactivation. [Machine-readable receipt](WORKFLOW_CHECKER_COMPATIBILITY_001.json).

## Results

| Checked scope | Exact Git blob matches | Archived workflow pin occurrences |
|---|---:|---:|
| CSQ-F2 historical preflight dictionary | 137/137 | 38 |
| G16 D1B0 frozen donor + source/consumer pins | 11/11 | 2 |
| 27 accepted anchors + blocked M4 active contract, three pins each | 84/84 | 28 |
| Historical pre-M4 checkpoint | 1/1 | 0 |

232 matched pin occurrences (232 distinct resolved path/blob pairs); 68 resolve to preserved archival workflow paths rather than their former executable locations. The archive has 864 entries; the main .github tree contains zero executable workflow files. All 21 relative Markdown file-link occurrences in the current roadmap resolve by pinned tree lookup. Historical absolute URLs and archived relative links are not newly certified; no exhaustive audit of all 864 workflow bodies or full historical checker execution.

## Why not restore the old watchdog?

[Historical watchdog](../../archive/ci-workflows/2026-11-28/bfss-roadmap-watch.yml) is bound to the frozen integration branch and calls the [legacy checker](../../tools/check_bfss_roadmap.py), which delegates schema-2 state to check_bfss_m4_checkpoint.py. The schema-2 checker reads old live workflow paths, requires the old live roadmap marker, and checks source changes against the single active M4 contract using HEAD^..HEAD. It will not validate the consolidated state unchanged. This is a deliberate architectural/operational mismatch, not evidence of a mathematical regression. Do not alter the 2.19 MB historical state or 5,268-line historical checker to make it pass superficially. Do not restore its executable workflow just to satisfy pathname tests.

The selected proof workflows also contain exact old-path workflow pins. Historical pin comparison is possible using a deterministic prefix mapping `.github/workflows/` -> `archive/ci-workflows/2026-11-28/` **only for historical provenance**. This audit compares Git tree blob identities, not independently rehashing or executing their full preflight code. The current branch M4 W0C2B2 remains BLOCKED. CSQ-F2 and D1B0 historical scopes unchanged.

## Minimal return-to-research CI contract

1. Keep archival workflows, historical checkers and registry immutable. Reuse source and exact receipts through the atlas/RSKA overlay; do not make old accepted work depend on a newly green infrastructure check.
2. For future candidate preflight use a small current, reviewed, explicit contract: canonical branch, exact candidate SHA, source/consumer roots and blob IDs, toolchain/Mathlib pins, explicit archived donor workflow locations, preflight failure boundaries and original evidence policy. Read-only static validation first. No automatic qualification from file identity.
3. After maintenance is explicitly released, introduce only a manual-dispatch workflow for the first justified gate. It must enforce canonical main/ref and exact approved checkout, least privilege, pinned actions and toolchain, strict source and independent consumer, required exact axiom reports, positive sentinel, first-causal RED preservation and original artifact archival. No push, pull-request or schedule triggers, and no old historical ref dispatch.
4. No general CI restoration or fresh full source build merely to satisfy maintenance. Native Node checkout checks remain outstanding; optional local check when network/checkout available. Full historical checker compatibility is not a scientific prerequisite for adopting the new scoped contract.

Next: review current contributor/agent instructions for stale branch mandates and finish live navigation reconciliation; then issue explicit release-readiness assessment and narrow candidate contract. Freeze remains until explicitly lifted. Do not launch a gate or resume raw witness computation during maintenance.
