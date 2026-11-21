# RHOPF-P9C3D2G1D43 R2 — original strict RED preserved

**Pacific date:** 2026-11-21. **Disposition:** RED, D43 UNQUALIFIED. Original [run #44920630914](https://github.com/etblink/math/actions/runs/44920630914), attempt 1, job `136895662275`, exact tested `71ab1efe0d256722cb9acff1ccfdb617815e9c6a`. The original GitHub API reports conclusion **failure**, irrespective of any contradictory UI or chat report.

## Original evidence
[Original artifact #14713813537](https://github.com/etblink/math/actions/runs/44920630914/artifacts/14713813537) independently downloaded and SHA-256 hashed `406293826c8ecb149837dd88472e32236369ea30c56c6a661f954b1680639d45`, agreeing with the original GitHub digest; ZIP integrity checked; five members, embedded tested commit exactly `71ab1efe0d256722cb9acff1ccfdb617815e9c6a`.

Frozen exact original Gamma9 SHA/contract preflight PASS; source original integer signed-permutation independent fixture PASS; Lean 4.34.1 and pinned Mathlib restored; dependency build **9,090 jobs PASS**.

## Native compiler diagnostic
New source `RHOPFP9C3D2G1D43OriginalGammaComplexFinrankTwo.lean`, line 62: `exact Module.finrank_fin_fun` is ill-typed because pinned theorem requires explicit ring argument `(R : Type)`, with type `∀ (R : Type _) [Semiring R] [StrongRankCondition R] {n : ℕ}, Module.finrank R (Fin n → R) = n`.

Native `relationalSourceComplexFourRealLinearEquiv` has a clean permitted axiom report. Both downstream real-/complex-finrank reports include `sorryAx` as a direct consequence of the compiler error. Independent imported consumer SKIPPED. No D43 qualification; this is a theorem application/elaboration error, not a contradiction of source-complex dimension two.

## R3 bounded repair and controls
Modify **only** `exact Module.finrank_fin_fun` to `exact Module.finrank_fin_fun ℝ` in D43 source; repin its exact SHA in strict CI. Preserve theorem statements, source Gamma9 inputs, D42 acceptance and independent consumer, `main`, and original negative evidence. Do not relax warnings-as-errors, axiom whitelist or original artifact checks. Require new strict GREEN and independently verified ZIP before promotion.
