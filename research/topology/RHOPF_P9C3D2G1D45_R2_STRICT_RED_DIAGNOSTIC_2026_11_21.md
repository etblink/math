# RHOPF-P9C3D2G1D45 R2 — original strict RED preserved

**Date (Pacific):** 2026-11-21. **Disposition:** RED, D45 UNQUALIFIED. [Original run #44928402965](https://github.com/etblink/math/actions/runs/44928402965), job `136919462704`, attempt 1, exact tested commit `3ecff15501ecceb362a83861c9cf7f5a55fe2ec9`.

The frozen source-original Gamma9 SHA/contract preflight PASSED; source-original independent integer signed-permutation fixture PASSED; Lean 4.34.1 / pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; dependency build 9,092 jobs PASSED.

**Original artifact** [#14717037792](https://github.com/etblink/math/actions/runs/44928402965/artifacts/14717037792) downloaded independently and SHA-256 verified: `90e214d8ec8c6caa3460b683612f224dd5b2db66019fcde0fdd2b10f5bb340e8` (matches GitHub upload digest). ZIP integrity verified with `zipfile.testzip`; all five members enumerated and embedded `exact-tested-commit.txt` equals `3ecff15501ecceb362a83861c9cf7f5a55fe2ec9`.

## Actual native error
New D45 source `RHOPFP9C3D2G1D45OriginalGammaSourceQOrthonormalRepr.lean` at line 90:
```text
error(lean.synthInstanceFailed): failed to synthesize
  SeminormedAddCommGroup RelationalSourceComplexFour
```
The R2 changes fixed the indexing and strict linter errors seen in R1. The native source's first three declarations **compiled and had only permitted axioms** `propext`, `Classical.choice`, `Quot.sound`: (1) a source-Q local `OrthonormalBasis (Fin 2)`; (2) its complex linear isometry `V ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2)`; and (3) the equality of squared isometric coordinate norm and original Gamma9 Q. The fourth source Circle-action intertwining theorem FAILED since the detached D38 source normed-group instance was not introduced locally before taking the isometry's `toLinearEquiv`. Fourth theorem's axiom report included `sorryAx`. Independent imported consumer skipped. This is proof-scoping, not a counterexample; **no D45 theorem is qualified through strict gate yet**.

## R3 exact bounded correction
Add the same three **local**, unregistered D38/D40/D41 structures in D45's Circle-equivariance theorem proof that already passed for `...norm_sq`: use `let : NormedAddCommGroup`, `let : NormedSpace ℂ`, `let : InnerProductSpace ℂ`. No global typeclass registrations, no linter suppression, no change to theorem statements, no source Q substitution. Repin only D45 source blob in existing strict workflow; preserve D41–D44, independent D45 consumer, full strict native+independent axiom whitelist, and `main`.

R3 requires its own complete strict original native and independent consumer GREEN and original ZIP verification before qualification. Keep the R1 and R2 original RED evidence separate and immutable.
