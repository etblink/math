# IBI-G0B1 source columns/triple R1 — RED_UNQUALIFIED on consumer noncomputability

Date: 2026-11-15 Pacific.
[Strict run #43707787822](https://github.com/etblink/math/actions/runs/43707787822)
at immutable tested commit `5cf4d2ed987c866ff3d2b81dc07371636d9581fb`;
attempt 1, job `132792519227`, conclusion FAILURE.

## Verified scope of passes

- Source/consumer/blob pin and theorem-contract preflight passed; pinned Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored.
- Original-source cold build **passed 9,021 jobs**, including the three prospective source theorems `sourceColumn_apply`, `sourceColorLieTriple_conjugate`, `sourceCrossTriple_conjugate`.
- Fresh source axiom audit compiled and printed only `propext`, `Classical.choice`, `Quot.sound` for all three named declarations, no `sorryAx`. This is a *source pass*, not the full strict gate green.

## First causal RED

`diagnostics/BFSSIBIG0B1SourceColumnsTripleIndependentConsumer.lean:21:15`:
`error(lean.dependsOnNoncomputable): failed to compile definition, consider marking it as 'noncomputable' because it depends on 'pairedAlgebraData', which is 'noncomputable'`.

The consumer defines `private abbrev M : AlgebraData 2 := pairedAlgebraData` outside a `noncomputable section`. The source module already has `noncomputable section`. This is a Lean declaration-mode mismatch in the independently compiled consumer, not a counterexample to source mathematics. The independent consumer did not pass.

Evidence artifact: [#14159438687](https://github.com/etblink/math/actions/runs/43707787822/artifacts/14159438687) (5,419 bytes; GitHub-reported ZIP SHA-256 `d9dbf719e078c6a92b01ae0aab9c79f154dd60ce684b2461907a3e09c50bacce`, not independently rehashed).

Exact source blob `7022f0759fd761791132857e8c07bf8b442d9c43`; failed consumer blob `8d03cae2dce474afaf6712d7aa4bb710d59dd82a`; workflow blob `779b3b732918dcbaf2e3fd9d5944958bd58cb5b8`.

## Disposition

R1 remains **RED_UNQUALIFIED**. Preserve exact historical bytes, errors and artifact. A single bounded consumer-only declaration-mode repair is justified. Do not alter source theorem/proofs, import pins, allowed axioms, independent mathematical tests, strict CI commands or resource limits. Do not assert native det +1, G0C, G2, physical states or new ontology.
