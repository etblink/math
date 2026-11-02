import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10AUOriginalGammaExhaustiveNativePairLieBracket

/-!
Exploratory F10AW diagnostic only.

This file isolates the native LieSubalgebra-to-GammaMatrix
coercion across F10AU's nested dependent-if bracket formula.
It introduces no accepted project theorem and is not part
of the F10AW formal acceptance gate.

Run #41392402777 showed that splitting the dependent
conditionals only in the coerced equality reduces that
equality branchwise while leaving the target conditional
tree intact. Its ordinary nondependent-if coercion lemma
also does not match F10AU's proof-dependent subtype values.

This diagnostic performs the single causal correction:
split the identical source-label conditionals in both the
coerced equality and the target before simplifying the
native pair carriers.
-/

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9Clifford
noncomputable section

open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9DetFixture
open OAI.BFSSQuantum
open Matrix

/-- Diagnostic: after coercing F10AU's accepted native
so(16) equality, split the same dependent conditionals in
both the hypothesis and target, then simplify only the
original gamma-pair carrier. -/
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
  split_ifs at h ⊢ <;>
    simpa [source9OriginalGammaDistinctPairInSo] using h

end
end FCP.BFSSPairedSpin9Clifford
