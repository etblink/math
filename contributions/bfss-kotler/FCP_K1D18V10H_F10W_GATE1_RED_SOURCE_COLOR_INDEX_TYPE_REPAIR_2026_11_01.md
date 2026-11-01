# F10W Gate 1 RED — source exact finite color-index repair (2026-11-01)

**Red run:** [#41312208775](https://github.com/etblink/math/actions/runs/41312208775); tested commit `ae505a87a60b024e323eacb0fb03a7a6f702b0ad`, first attempt, completed FAILURE. Preserve red evidence, do not recast this run as accepted.

**Red evidence:** [artifact #13086272296](https://github.com/etblink/math/actions/runs/41312208775/artifacts/13086272296), ZIP SHA-256 `1ae097a772a5c3b74f4b89412d34cdf577902a327072e5f252064aa2b0ecb000`.

**Passed before failure:** exact original gamma V10E V10F F10V source blob pins; pinned Lean 4.34.1 + Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; full accepted F10V ancestry rebuild.

**First causal error:** fresh warnings-as-errors F10W compilation, at `SU2BFSSPairedSpin9V10HF10WOriginalPairedSO48Gamma16KernelReductionProbe.lean:54:10` and `:54:34`, failed to synthesize `OfNat (ColorIndex 2) 0` for the two source-color diagonal index literals `(0 : ColorIndex 2)`. The F10W four-declaration independent type audit was skipped. The compiler's `sorryAx` reports are downstream artifacts of failed elaboration and are not qualified evidence.

**Original source type provenance:** `OAI.MathematicalPhysics.BFSS.Core` defines `abbrev colorDim (N : ℕ) : ℕ := N ^ 2 - 1` and `abbrev ColorIndex (N : ℕ) := Fin (colorDim N)`. Therefore `ColorIndex 2` is definitionally `Fin 3` but the chosen numeral notation is not synthesized for the abbreviated type under the pinned elaboration context. The actual source-aligned finite-coordinate element `(⟨0, by decide⟩ : ColorIndex 2)` has explicit source membership and does not replace the three-color set with another type.

**Minimal repair:** replace only the two `(0 : ColorIndex 2)` occurrence(s) in the genuine first-color diagonal evaluator of the original gamma16 Kronecker injectivity proof with `(⟨0, by decide⟩ : ColorIndex 2)`. Leave the original `pairedColorSpinEquiv`, genuine gamma family, all four theorem statements, proofs outside this expression, and all original-source/Mathlib pins unchanged. Update the exact F10W workflow source blob SHA; preserve all strict gates and audits.

**Scope:** still only tests injectivity of original gamma16→paired48 transport, equality of original SO48 and gamma16 image equality relations, per-element kernel equivalence and kernel subgroup equality. No assertion that either kernel is trivial or complete classification; no Spin48 lift, physical claim, main merge or upstream PR. Gate 2 is unqualified until strict completion.
