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

## First prospective new-gate outcome: P3-M2B2A (2026-11-13 UTC)

Prospective evidence receipt committed `fa1cb425` before new mathematical source `d4a0e2b4`; **chronology 1/1 PASS**. Mathematical [strict #43361307455](https://github.com/etblink/math/actions/runs/43361307455) passed first attempt, exact 86 pins, 9,198-job cold build, independent original-Fock consumer and three allowed-axiom source declarations: **zero strict mathematical gate reds**, one completed accepted source interface. One separate metadata watchdog [#43361307421](https://github.com/etblink/math/actions/runs/43361307421) was RED for a preventable gate suffix parser limitation, then fixed by one line and [watchdog #43361620222](https://github.com/etblink/math/actions/runs/43361620222) GREEN. Count this administrative RED separately: a prevention opportunity, not a Lean proof red. The run window was 2026-11-13 03:47:48 to 04:09:25 UTC; do not generalize a speedup from one run. Continue measurements for the next two mathematically distinct gates; only then review whether automated gate grammar/preflight is worthwhile.

## Prospective gate #2 / 3 — P3-M2B2B0 (2026-11-13 UTC)

[Strict B0 #43364964618](https://github.com/etblink/math/actions/runs/43364964618) **GREEN first attempt** on source SHA `ba38ecf28450e54b33be72d9a7d67af0b89f23aa`. The [prospective B0 evidence receipt](../spectral-p2-original-field/P3_M2B2B0_PROSPECTIVE_SOURCE_OPERATOR_HS_CONTINUOUS_EQUIV_RECEIPT_2026_11_12.md) was committed `d4eab26d` BEFORE the candidate. Thus **prospective chronology 2/2 PASS**, M2B2A and B0 both strict mathematics GREEN on first attempt; B0 88 pins and 9,199 cold build jobs, 3 source declarations/independent original Fock consumer passed. Roadmap watchdog [#43364964583](https://github.com/etblink/math/actions/runs/43364964583) separately GREEN. The one prior M2B2A gate suffix RED remains a preserved administrative incident, not a B0 math failure. No claim of a cache speedup; continue efficiency measurement on the next mathematically distinct B1 or other future gate, then review automation only against collected evidence.

## Prospective mathematical gate #3/3 — P3-M2B2B1 (2026-11-13 UTC)

The [B1 prospective pre-gate receipt](../spectral-p2-original-field/P3_M2B2B1_PROSPECTIVE_ORIGINAL_OPERATOR_LP_TRANSPORT_RECEIPT_2026_11_12.md) was committed at `b134563d` **before** B1 source `5f2443da`. Strict [#43368580602](https://github.com/etblink/math/actions/runs/43368580602) **GREEN first attempt**, exact 90-pin manifest, 9,200-job cold compilation and six clean source/consumer a.e./inverse laws on original operator-valued L². Roadmap consistency [#43368580415](https://github.com/etblink/math/actions/runs/43368580415) independently GREEN. Across three prospective gates M2B2A, B0, B1: **3/3 correct receipt chronology**, **3/3 first-attempt strict proof GREEN**, no mathematical source or strict preflight RED. One separately preserved administrative gate-ID watchdog RED occurred during M2B2A and was fixed, not a theorem failure. Review of three-gate measurement: existing manual evidence receipts and precise same-SHA workflows have worked; no new generator, cache infrastructure, dashboard or global evidence registry justified by this narrow sample. If the administrative gate-ID grammar fails again, consider only a bounded syntax check. Continue to track actual elapsed CI times and source-semantic leverage; do not infer broad performance gains from three successful trials.

## Additional prospective gate B2 result (2026-11-13 UTC)

[Strict #43371757607](https://github.com/etblink/math/actions/runs/43371757607) GREEN first attempt at `e9588612`, **92 pins and 9,201 cold jobs**, original source consumer and three allowed-axiom checks. Its [prospective receipt](../spectral-p2-original-field/P3_M2B2B2_PROSPECTIVE_SOURCE_OPERATOR_LP_CONTINUOUS_EQUIV_RECEIPT_2026_11_12.md) was committed `c301f7e3` BEFORE theorem source: **four consecutive chronological receipts and four first-try mathematical strict greens** since M2B2A. Preserve M2B2A administrative gate parser RED separately; this sample does not justify more CI cache infrastructure or global registry.

## M2C0 prospectively staged gate outcome (2026-11-13 UTC)

The [prospective M2C0 receipt](../spectral-p2-original-field/P3_M2C0_PROSPECTIVE_SOURCE_OPERATOR_TO_GENUINE_FOCK_LP_COLUMNS_RECEIPT_2026_11_12.md) was committed at `bc58467e` BEFORE source `548d7978`. [M2C0 strict #43375482588](https://github.com/etblink/math/actions/runs/43375482588) first-attempt GREEN: 94 exact pins, cold 9,209 Lean build jobs, independent genuine original-Fock consumer, three clean original source axiom roots. Across M2B2A/B0/B1/B2/M2C0: prospective receipt chronology 5/5 and first-attempt mathematical strict GREEN 5/5; administrative metadata watchdog reds remain preserved separately and this series is not evidence for a new cache or global registry.
