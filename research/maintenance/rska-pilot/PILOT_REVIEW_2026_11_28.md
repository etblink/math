# RSKA pilot — replay and stop decision, November 28 2026

Tested exact candidate `a25120c65c18391b537b9e40d36ffdb41373e800`. Canonical main unchanged at `2e0bcc98de5514498cb6f03727a355e8f504260d`. [Independent virtual replay receipt](virtual-replay-results.json) records all three actual script executions and exact input identities. 35 distinct files (41 repeated-inclusive checks), 3/3 check commands and 16/16 existing adversarial controls passed. Git blob SHA-1 recomputed on raw base64-decoded repository bytes in a separate JS implementation, with standard SHA-1 and Git empty-blob self-tests. Script bodies reused, not manually reimplemented; Node module imports, fs, hashing, path and process interfaces adapted for virtual replay. Actual Node ESM/Buffer/filesystem execution remains unverified because native checkout DNS failed. No Lean source, CI, original atlas or historical receipts changed.

## Scientific assessment

The pilot's first genuine marginal benefit is recovering five qualified source declaration names absent from V7 inside the existing IBI bundle, and retrieving them without deleting or duplicating the parent. The recovered typed source SO3 hom is a legitimate candidate donor for color rotation reconstruction, but the original coordinate adapter remains open; existing exact source Euler factorization remains available. No dependency reduction or faster physical proof has been independently demonstrated. V7 already supplied both second-objective and cross-track dependency queries. The 77 vs 75 comparison reflects two curated routes, not proof length or runtime. Keep the proposed compact-flow route conditional and the prior 52-row raw witness obligation intact. The current lookup is split between pilot.mjs and refine.mjs, which is a usability limitation, not grounds for immediately adding another layer.

## Stopping rule and release disposition

| Criterion | Result |
|---|---|
| Preservation of original atlas and historical statuses | PASS |
| Alternate-route, negative-context and refinement checks | PASS (virtual replay) |
| Cross-track portability | PASS, existing V7 knowledge |
| Previously unindexed qualified result recovery | PASS, scoped manual review |
| Native checkout execution | OPEN (DNS blocker) |
| Scientific workflow improvement beyond retrieval | NOT YET MEASURED |
| Owner acceptance for merge | NOT REQUESTED |

Retain isolated branch, no merge. Stop adding schema, files or experiments for the sake of architecture. When working from an actual checkout, run these commands read-only, with no Actions dispatch:

```sh
node research/maintenance/rska-pilot/pilot.mjs check
node research/maintenance/rska-pilot/discover.mjs SO3 check
node research/maintenance/rska-pilot/refine.mjs check
````

Use a bounded real research decision to compare against V7 + existing notes; if no measurable improvement, retain pilot as methodological evidence rather than integrate. No mathematical experiments or Lean gates during maintenance freeze. Keep priority on source-bound fidelity and truth-first scientific investigation.
