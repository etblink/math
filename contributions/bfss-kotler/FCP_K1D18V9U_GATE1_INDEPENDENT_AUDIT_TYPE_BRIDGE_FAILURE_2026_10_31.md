# K1D18V9U — gate 1 failure classification and audit-only correction

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Initial V9U test commit: `ddce86f7ee9acbe0fed4652ecae919c28cf47090`
Original unchanged V9U Lean source SHA: `cb27bc0755dc7f64bed51943ae18c24a00cba912`
Prior accepted V9T commit: `4d4a148ec9ecc797cab0c828157b788dd02f498e`
First strict test: [Run #41228863049](https://github.com/etblink/math/actions/runs/41228863049) — **RED**, preserve verbatim.

## Exact observed evidence

At the pinned original SHA the complete dependency/source hash preflight, pinned Lean 4.34.1/Mathlib restoration, V9T ancestry, fresh V9U source compilation under `-DwarningAsError=true`, and compiler axiom emission all passed. The standalone audit (job `124618640032`) failed after its three `#check` lines and the normalized-generator specialization.

The concrete failure was in `/tmp/PairedSpin9V9U_Audit.lean` at lines 14 and 16. It attempted to treat `coordinateToPairedCanonicalSkewLieHom A`, whose type is a canonical skew-adjoint LieSubalgebra subtype, as a `Matrix Source48Label Source48Label ℝ` using an elaboration-sensitive implicit coercion. Lean reported a type mismatch, subtype versus matrix. This is a separately compiled audit type bridge, **not** a rejection of the source's original exponential identity. The three V9U declarations each reported only the permitted foundational axioms `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was reported in the compiled original module.

## Narrow corrective hypothesis

Change **only the two audit expressions** from `((coordinateToPairedCanonicalSkewLieHom A) : Matrix Source48Label Source48Label ℝ)` to `((coordinateToPairedCanonicalSkewLieHom A).val : Matrix Source48Label Source48Label ℝ)`. The `.val` projection states the exact original underlying matrix explicitly and does not weaken the checked equality. Do not edit V9U Lean source or V9T/V9S ancestry, raise limits, change original Fock index ordering, or lower verification standards.

This correction is **not accepted** until a fresh strict run completes successfully with independent theorem specialization and declaration-level axiom audit. If red, inspect the first actual new error before any further edit.

## Scientific scope boundary

The tested V9U identity establishes orthogonal matrix exponentials of skew inputs only if fully qualified. It does not construct a global homomorphism `Spin(9)→SO(48)`, a continuous lift into original `Spin(48)`, topological covering data, determinant-one orientation on the actual original representation, or any gauge-covariant/spectral BFSS claim.

Preserve the first red run and all source hashes. No modification to main, frozen FCP provenance, or upstream mathcommunity.
