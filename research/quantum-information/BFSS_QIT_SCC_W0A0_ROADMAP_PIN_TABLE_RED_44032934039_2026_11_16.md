# BFSS W0A0 R1 — roadmap-consistency formatting RED, source proofs untouched

Date: 2026-11-16 Pacific. Exact tested commit `8e3a80382d285be8154db7e2190770eed625210b`.

## Observed and bounded cause

- [Run #44032934039](https://github.com/etblink/math/actions/runs/44032934039): RED in `Check project-lead roadmap and active gate`, before any Lean qualification.
- Complete log primary error: `BFSS_ROADMAP_CHECK_FAIL: strict workflow pin table missing or ambiguous`.
- The canonical `tools/check_bfss_m4_checkpoint.py` parses a one-line `pins={...}` Python literal (or a restricted `base=` multiline form). Our new strict workflow had a valid Python multiline `pins = { ... }` dictionary that its own preflight accepts, but the separate roadmap checker rejects its *syntax*.
- Concurrent mathematical [W0A0 run #44032934242](https://github.com/etblink/math/actions/runs/44032934242) passed its exact donor and source/consumer preflight before reaching pinned Lean restoration; this is **not** a proof GREEN.

## Repair with no proof-architecture change

Convert the exact existing 10-path static Git blob pin dictionary into one physical-line `pins={...}` syntax. Do not change any pin key or Git SHA, source theorem, consumer theorem, stopped QTC1 / CT1 evidence, accepted donor, toolchain or permitted-axiom audit.

Old strict workflow Git blob: `01ba2faeac74b051b6615f0632f34a2952b39c35`.
Replacement strict workflow Git blob: `079b8e484e52898ca33717e3bf9af893011a6208`.
Unmodified original W0A0 source Git blob: `81b5df7e7dd009a5f03f561ac80d55d17aafdea4`.
Unmodified independent consumer Git blob: `c58f6d3e49bbcb4b7d2c88a08f57f7e07b61ce63`.

Re-run both strict and roadmap consistency on the new exact tested commit. Preserve the first failed roadmap run as negative process evidence; do not call W0A0 qualified before cold source, consumer, approved-axiom checks, and provider-original artifact preservation. Last mathematical acceptance remains QTC1G0 run #44024718712. This is not a refutation of W0A0 or of witness completeness.
