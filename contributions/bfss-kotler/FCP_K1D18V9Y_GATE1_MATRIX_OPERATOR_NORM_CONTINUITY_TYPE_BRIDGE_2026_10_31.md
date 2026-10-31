# K1D18V9Y — gate 1 red: scoped matrix norm and explicit continuity type bridge

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Original V9Y tested commit: `f546d1ab1ae5352268c240c72097a3190ffa0168`
Original V9Y source hash: `d5dc8389a906b08f499367468fcf7d8e7aa8b2fe`
Original V9Y workflow hash: `85059f9758a1648e43c32bd0d5a71a08966a5d03`
Prior accepted V9X commit: `ee1d6ae171ab85b54a79f911258edac316944f1f`
Red evidence: [Run #41237464871](https://github.com/etblink/math/actions/runs/41237464871), exact job `124644139103`, **FAILED**, original red remains preserved.

## Exact observed failure

- The original run passed all exact source/ancestry hash preflight, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and compilation of accepted V9X ancestors.
- Fresh V9Y compilation under `-DwarningAsError=true` failed at line 19: `unknown namespace 'Norms.Operator'`.
- The next error, at line 34, was a stuck `TopologicalSpace ?m.40` typeclass metavariable in the matrix exponential continuity proof, where the result of `NormedSpace.exp_continuous` and its scalar-continuity precomposition were both left for Lean to infer.
- The failed declarations consequently printed `sorryAx` and the independent four-declaration audit was skipped. This does **not** qualify V9Y or refute continuity.

## Source-exact corrective hypothesis

The pinned Mathlib file `Mathlib/Analysis/Matrix/Normed.lean` at the pinned Mathlib revision defines the norm scope **inside the `Matrix` namespace**. Its documentation explicitly names `open scoped Matrix.Norms.Operator`; the original source accidentally used `open scoped Norms.Operator`. Correct that single namespace without changing the mathematical or source-label carrier.

Strengthen only the first continuity proof's type elaboration: first establish
`hscalar : Continuous (fun t : ℝ => t • X)` via `continuous_id.smul continuous_const`, then use `(NormedSpace.exp_continuous : Continuous (exp : Matrix Source48Label Source48Label ℝ → Matrix Source48Label Source48Label ℝ)).comp hscalar`. This pins both input and output types to the exact original 48 Fock-paired label matrix and provides the normed-algebra instance a fully specified target, rather than increasing Lean elaboration limits.

Freeze all four theorem statements, later subtype-continuity proofs, accepted V9X ancestry, the original 48-label indexing, Lean/Mathlib versions, warning-as-error settings, declaration-level exact allowed axioms, and independent audit. Update only the source hash and corrected scope-token assertion in the strict workflow.

## Acceptance and limits

This is a bounded *hypothesis*, not a qualified proof until a new strict run passes full source + independent axiom gates with no `sorryAx`. Even accepted V9Y continuity of individual original orthogonal flows would not prove determinant-one orientation, a global continuous `Spin(9)→SO(48)` homomorphism, a `Spin(48)` lift or covering, or any BFSS spectral claim.

Keep this red result and the earlier accepted/failed gate provenance; do not edit main, frozen FCP, or mathcommunity upstream.
