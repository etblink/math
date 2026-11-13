# BFSS P3 operating efficiency — bounded read-only audit and improvement experiment
**Date:** 2026-11-12 Pacific / 2026-11-13 UTC
**Status:** PROCESS CONTROL ONLY; no new theorem, run qualification, cache adoption, workflow deletion or changes to original source.
**Canonical:** [live checkpoint](../../BFSS_GATE_STATE.json) and [active roadmap](../../BFSS_ACTIVE_ROADMAP.md). Only an actual source-exact strict-green receipt qualifies Lean declarations.

## Observed inefficiency, not conjectural physics
1. Current `.github/workflows/` branch directory contains **425 files**; the frozen H2 workflow index records **337** at its earlier snapshot. These are two **different dates** and neither count implies unused or safe-to-delete workflows.
2. The curated H1 pilot has **16** records, and the Project Lead November 10 reuse map has **21** records; these are incomplete dated retrieval layers. Existing `historical_gate_lookup.py`, H1, H2, 420-module import graph and red/green notes provide discovery without needing a new registry or tool service.
3. [M2A R1 #43349181533](https://github.com/etblink/math/actions/runs/43349181533) was a duplicate-key workflow pin transformation failure (81 textual source entries, 79 actual keys): no Lean test reached. [R2 #43349543790](https://github.com/etblink/math/actions/runs/43349543790) passed 81 pins but failed on opaque `def`-carrier typeclass inference. [R3 #43351955062](https://github.com/etblink/math/actions/runs/43351955062) qualified after a one-token transparent `abbrev` repair. Classify infra red and theorem red separately.
4. The standing pre-gate protocol (adopted 2026-11-12) requires the receipt **before** first source staging. M2B1 was staged without a fully labeled evidence matrix; the separate retrospective receipt repairs the ledger, not the timing.
5. The existing `tools/check_bfss_roadmap.py` source drift guard covered `P3D5` only. This change makes the exact active source path check cover **both `P3D5` and `P3M2`**, and changes the watcher trigger accordingly. A valid active source edit is allowed; a same-commit historical/other gate source change fails advisory CI. This checks only `HEAD^`→`HEAD` and is **not** an independent check of actual Lean CI success or complete Git ancestry.

## Minimal improvements in this commit
- Record a clearly marked **retrospective** M2B1 donor/source/falsifier matrix linked from the existing blueprint.
- Strengthen the existing roadmap watcher, not add a new workflow: fail closed if `git diff HEAD^ HEAD` cannot be inspected, and reject `P3D5*.lean` or `P3M2*.lean` edits except for the source path explicitly declared in active checkpoint. Guard only direct source modules under `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`.
- Do **not** change M2B1 proof/consumer, exact 83 accepted/new pins, original `Fermion 2`/operator norms, current strict workflow, cache keys, frozen monograph or `main`.

## Measurements: the next three NEW mathematical gates
Track prospectively, without creating another global registry:
| Measure | Counting rule | Pass / escalation criterion |
|---|---|---|
| Pre-gate chronology | Receipt with type-level source matrix has Git commit preceding first new theorem commit | 3/3; note any miss transparently |
| Preventable red | Preflight YAML/bash/Python syntactic or duplicate pin key failures | Aim 0 across next 3 gates; each unexpected red triggers targeted local validation |
| Red-to-diagnosis | First causal layer identified from exact run logs before touching source/consumer | 100% of reds; after two similar reds stop tactic cycling |
| Semantic leverage | New genuinely missing source-typed interface discharged / total strict attempts; no count for duplicate alias proof | Report the ratio, **not** optimize green count alone |
| Cost | Each gate's exact run attempt, time and dominant step; same source scope and pins for paired cache trials | Use observed elapsed time only; no extrapolated speedup |

**Automation decision after three gates:** evaluate a small deterministic manifest/syntax preflight *only if* recurrent procedural failures persist; do not introduce a workflow generator now. The [Pre-Gate Evidence Receipt protocol](../../contributions/bfss-kotler/BFSS_PRE_GATE_EVIDENCE_RECEIPT_PROTOCOL_2026_11_12.md) explicitly favors procedure-before-infrastructure.

## Cache evidence and deferral
The existing accepted 175-module DD/AI same-branch cold/warm pilot reported **18m21s versus 10m47s** (one comparison, 41.2% decrease) with sealed source/module object hashes, imported-root audits and fresh candidate/consumer compilation. This is **not** a measurement for current M2 ancestry. Do not reuse the old DD/AI cache key or install a warm cache into the running M2B1 gate. Any future M2 pilot needs exact closure inventory, same-branch cold seed, sealed SHA-256 manifest, fresh new theorem and consumer checks, and a controlled warm comparison. A cache hit never constitutes a newly proved theorem.

## STOP / governance
- Leave [M2B1 strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031) immutable at tested SHA `f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6`. At audit start, manifest and pinned toolchain succeeded; cold source build was in progress. Its later conclusion requires independent check.
- No `main` write; no bulk deletion/move, reset, history rewrite, unqualified proof promotion, new toolchain pin, mathematical weakening or added axioms.
- This note is not a substitute for the source consumer, axiom audit and strict CI receipt.

## Post-audit strict milestone observation (2026-11-13 UTC)

While the documentation and M2 source-drift guard were being completed, [M2B1 strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031) completed **GREEN** at original source SHA `f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6` (83 unique pinned files, 9,185 cold jobs, source/independent original Boson 2/Fermion 2 consumer, seven axiom-clean declarations; artifact `14007023123`). [Dedicated acceptance receipt](research/spectral-p2-original-field/P3_M2B1_GREEN_43356859031_ACCEPTANCE_AND_M2B2A_PRE_GATE_2026_11_12.md) is the source-exact authority. The process-only drift-checker commit `f85563e6a8cb5c1b78b2bf8a108c6bd1bac62073` also passed its distinct [roadmap consistency run #43359056602](https://github.com/etblink/math/actions/runs/43359056602). Neither process check nor cache history is a substitute for the original M2B1 strict run.

The next-three-new-gate measurement begins with M2B2A and subsequent independently defined mathematical source gates, not retroactively with M2B1. Require their prospective pre-gate receipts and track avoidable syntax/manifest reds, actual CI elapsed cost and source-semantic leverage.
