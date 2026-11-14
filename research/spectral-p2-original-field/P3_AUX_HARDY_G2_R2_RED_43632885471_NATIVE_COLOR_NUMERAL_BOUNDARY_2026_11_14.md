# HARDY-G2 R2 red checkpoint — native color-zero numeral boundary

Date: 2026-11-14 Pacific. RED_UNQUALIFIED.

Strict [#43632885471](https://github.com/etblink/math/actions/runs/43632885471), attempt1, job #132563163808, tested `874343debfc492be5c872ae1908c565a31548d68`: verified run/job failure. Preflight/toolchain PASS; cold source+G4J build PASS (9070 jobs); fresh warning-as-error source PASS. Full independent native consumer REACHED and FAILED.

## Exact causal boundary

Consumer 50:68/74, 56:68/74, 75:68/74: failed to synthesize OfNat (ColorIndex 2) 0. The source defines ColorIndex N := Fin(colorDim N), colorDim N := N^2-1. The three affected controls use a bare zero both as the color component of an actual Boson basis coordinate and as its color argument. Explicit construction of the value0 element of Fin3 avoids that implicit numeral instance boundary. This is the assistant's concrete consumer-index construction error.

All five strict source reports and ten imported consumer reports have only propext/Classical.choice/Quot.sound; no sorryAx. The imported reports do not certify a consumer that failed elaboration. R1's deprecated rewrite no longer fails: it is fixed in R2. These are different failure layers, not repeated Clifford/proof failures.

| Binding | Value |
| --- | --- |
| Source blob | 952890f8056c2b115d69a03c08c39762210c1a0b |
| Consumer blob | f53612702cbf1b69c5ced0463baf17bb15dbf209 |
| Workflow blob | 1e0123c3dd8cffd70936c14fede2d2c6ab35f0bd |
| Reviewed OAI baseline | 3645cdc05202abefd0b5a9533a4daa1ca45fdf6d |
| Manifest pins / SHA-256 | 148 / 5e669e79841765fc6300123284da3b0557d408f43f7e4b65b870b807f6887358 |
| Artifact ID / bytes | 14128854349 / 17210 |
| Artifact ZIP SHA-256 | sha256:038b126acf03cef55581f025f301c931e72fc6843d3da78218a574ba21cca5ae |

API digest matches upload log; ZIP not independently downloaded/rehashed. Administrative #43632885406 GREEN, separate. Lean4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.

## Bounded next action and stop rule

R3 will keep source bytes fixed and isolate one private typed color-zero definition at the beginning of the consumer using the literal Fin constructor/value0 and closed 0<3 bound. Substitute it in exactly six color positions, retaining actual basis vectors, plane orientations and all eleven example conclusions. Workflow changes only expected consumer hash and the exact basis-string checks to match the same explicit color value. No relaxed strict policy. If this same color boundary fails again, use a minimal Core-only index/basis diagnostic rather than another full-gate permutation. Preserve R1 and R2 independently.
