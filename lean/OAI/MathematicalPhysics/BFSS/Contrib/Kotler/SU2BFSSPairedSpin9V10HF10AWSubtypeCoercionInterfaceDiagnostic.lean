import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10AUOriginalGammaExhaustiveNativePairLieBracket

/-!
Exploratory F10AW diagnostic only.

This file isolates the native LieSubalgebra-to-GammaMatrix
coercion across F10AU's nested dependent-if bracket formula.
It introduces no accepted project theorem and is not part
of the F10AW formal acceptance gate.

Two independent proof forms test the same exact carrier
conversion: (A) split the dependent conditional after
coercing the accepted F10AU equality; (B) expose coercion
through a locally proved subtype conditional lemma.
-/ 

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9Clifford
noncomputable section

open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9DetFixture
open OAI.BFSSQuantum
open Matrix

/-- Diagnostic A: split F10AU's dependent conditional only
after applying the native subtype coercion to its equality. -/
example (r s t u : SpaceIndex) (hrs : r ≠ s) (htu : t ≠ u) :
    (gamma r * gamma s) * (gamma t * gamma u) -
      (gamma t * gamma u) * (gamma r * gamma s) =
      if hac : r = t then
        if hbd : s = u then
          (0 : GammaMatrix)
        else
          -((2 : ℝ) • (gamma s * gamma u))
      else if hbc : s = t then
        if had : r = u then
          (0 : GammaMatrix)
        else
          (2 : ℝ) • (gamma r * gamma u)
      else if _hbd : s = u then
        -((2 : ℝ) • (gamma r * gamma t))
      else if _had : r = u then
        (2 : ℝ) • (gamma s * gamma t)
      else
        (0 : GammaMatrix) := by
  have hpair :=
    source9OriginalGamma_exhaustive_oriented_pair_native_so_bracket
      r s t u hrs htu
  have h := congrArg
    (fun z : LieAlgebra.Orthogonal.so SpinIndex ℝ => (z : GammaMatrix))
    hpair
  simp only [LieSubalgebra.coe_bracket,
    LieRing.of_associative_ring_bracket] at h
  split_ifs at h <;>
    simpa [source9OriginalGammaDistinctPairInSo] using h

/-- Diagnostic B: explicitly distribute subtype coercion over
each dependent conditional before simplifying the pair carrier. -/
example (r s t u : SpaceIndex) (hrs : r ≠ s) (htu : t ≠ u) :
    (gamma r * gamma s) * (gamma t * gamma u) -
      (gamma t * gamma u) * (gamma r * gamma s) =
      if hac : r = t then
        if hbd : s = u then
          (0 : GammaMatrix)
        else
          -((2 : ℝ) • (gamma s * gamma u))
      else if hbc : s = t then
        if had : r = u then
          (0 : GammaMatrix)
        else
          (2 : ℝ) • (gamma r * gamma u)
      else if _hbd : s = u then
        -((2 : ℝ) • (gamma r * gamma t))
      else if _had : r = u then
        (2 : ℝ) • (gamma s * gamma t)
      else
        (0 : GammaMatrix) := by
  have hpair :=
    source9OriginalGamma_exhaustive_oriented_pair_native_so_bracket
      r s t u hrs htu
  have h := congrArg
    (fun z : LieAlgebra.Orthogonal.so SpinIndex ℝ => (z : GammaMatrix))
    hpair
  simp only [LieSubalgebra.coe_bracket,
    LieRing.of_associative_ring_bracket] at h
  have coe_if (p : Prop) [Decidable p]
      (x y : LieAlgebra.Orthogonal.so SpinIndex ℝ) :
      ((if p then x else y : LieAlgebra.Orthogonal.so SpinIndex ℝ) :
        GammaMatrix) =
        if p then (x : GammaMatrix) else (y : GammaMatrix) := by
    by_cases hp : p <;> simp [hp]
  simpa [source9OriginalGammaDistinctPairInSo, coe_if] using h

end
end FCP.BFSSPairedSpin9Clifford
