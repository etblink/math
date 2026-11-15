# IBI-G1B R3 — RED_UNQUALIFIED: canonical finite epsilon match not closed

Date: 2026-11-15 Pacific.
Strict run [#43700926730](https://github.com/etblink/math/actions/runs/43700926730),
attempt 1, exact tested commit `771ecb6d600014beacfb511a7e0522354105cf34`,
job `132771669169`, completed **FAILURE**.

## Verified execution

- Exact source/consumer/toolchain-pin preflight PASS; pinned Lean 4.34.1,
  Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored.
- **Original G1B source cold build PASS: 9,019 jobs.** All seven named
  source `#print axioms` declarations list only `propext`,
  `Classical.choice`, `Quot.sound`, without `sorryAx`.
- The exact source blob is still
  `b42291fe0aa5f8b22a31bad19b9de5c775372a71`, already
  successful in R2 at run #43699776873.
- Consumer compiled far enough to eliminate the R2
  `OfNat (ColorIndex 2)` instance errors, but did not pass.

## First causal errors (do not confuse with source falsification)

- `diagnostics/BFSSIBIG1BOriginalSignedCrossIndependentConsumer.lean:26:23`:
  `unsolved goals`, reduction of original positive `epsilon3` fixture
  `(match 0, 1, ⟨2, ⋯⟩ with ...)=1`.
- Analogous `:35:24`: `unsolved goals` in negative fixture
  `√2 * (match 0, ⟨2, ⋯⟩, 1 with ...) = -√2`.
- Consumer blob at tested commit:
  `62b2af248719bad32a4f368b325ae36fe8c3f54c`.
  The two arbitrary original-gauge/boson consumers remain part of
  the same compiled file; source/consumer strict GREEN marker did not emit.

[Exact diagnostic artifact #14157041575](https://github.com/etblink/math/actions/runs/43700926730/artifacts/14157041575)
is 5,382 bytes as reported by the upload action.
The action reports ZIP SHA256
`8197542b3622951e8f43b19aa952f2deeee0f9af3ef1a1c8de1ef0354d616e7d`;
this is **not an independently downloaded/rehashed ZIP**.

## Policy disposition

This is the **second consecutive consumer-boundary RED** after R2's
`OfNat` failure, and both concern finite color-index elaboration /
normalization in the same positive/negative sign controls.
Treat as analogous under the two-red stop rule: STOP repeating
minor tactics, review canonical index construction and proof layering.
The source-theorem math is not thereby falsified. G1B remains
RED_UNQUALIFIED until an independently compiled original-source
consumer plus full strict gate qualifies. No new source, workflow,
consumer or original integration edit was made in response to R3;
see architecture-review memo in this same commit.
