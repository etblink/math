# K1D18V9S — Strict gate 2 namespace failure and source-exact recovery

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Accepted ancestry: V9R, commit `02a4618401ce4ead4f559d0c341122a17492df14`
V9S experiment: `eadade68bcf0f9d2388f0748e32e30fc0766a397`
Gate 1: [#41224354992](https://github.com/etblink/math/actions/runs/41224354992) — red; missing compiled V9R .olean, not a mathematical proof failure.
Gate 1 workflow-only correction: `25c944f5c5717b9905d1556c5a7ca13f4bd79a55`
Gate 2: [#41225406569](https://github.com/etblink/math/actions/runs/41225406569) — red; prerequisite V9R ancestry compiled, V9S Lean module failed at incorrect declaration namespace.

## First actual Lean failures

The pinned `Mathlib/Algebra/Lie/SkewAdjoint.lean` at Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612` declares `skewAdjointMatricesLieSubalgebra` and `mem_skewAdjointMatricesLieSubalgebra` at global namespace scope (within a section, not `namespace Matrix`). The pinned `Mathlib/LinearAlgebra/Matrix/SesquilinearForm.lean` also declares `mem_skewAdjointMatricesSubmodule` globally.

The candidate incorrectly used `Matrix.skewAdjointMatricesLieSubalgebra` and `Matrix.mem_skewAdjointMatricesLieSubalgebra` / `Matrix.mem_skewAdjointMatricesSubmodule`. Thus the compiler reported unknown constants at V9S source lines 35, 39, 41, 53, 57, 59, and two unsolved theorem goals. Both carrier-equality declarations printed `sorryAx`; they are NOT qualified. The generator agreement declaration alone printed only `propext`, `Classical.choice`, `Quot.sound`; the full gate is red regardless.

## Source-preserving corrective experiment

Replace these three wrong qualified identifiers by the exact pinned global names, and update only the V9S source hash/identifier preflight. Keep all theorem names and mathematical expressions, V9R and all earlier accepted source files, 9-index input, original `Source48Label` target, normalizations, Mathlib pin, warning-as-error enforcement, and independent axiom audit unchanged.

Do not claim a proof of the two carrier equalities until fresh compilation and independent declaration-level auditing pass. This is a concrete case of *verify exact library namespace before assuming a plausible API path*.

## Standing exclusions

Neither this namespace correction nor a future successful V9S result proves a continuous group homomorphism `Spin(9) → Spin(48)`, a source-exact covering map, a group Lie algebra differential, or any BFSS physical operator/spectral result. Retain all red compiler evidence. No main, FCP, or mathcommunity upstream changes.
