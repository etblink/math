import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0COriginalNormalizedFockField
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D0OriginalGramContinuity

/-!
# BFSS NORM-0D / D0-B — original Fock operator-field continuity

Only original Boson 2, Fermion 2 and the strictly qualified NORM-0B
finite 9-by-9 Gram decomposition are used. The D0-A source Gram
continuity lemmas supply the variable coefficients; Fock factors
are fixed bounded complex-linear operators for each fixed B.

No surrogate Fock carrier, new gamma convention, original Hamiltonian,
FullL2 multiplication operator, gauge-domain or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D1OriginalFockFieldContinuity
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSNORM0AOriginalGramTraceBound
open FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D0OriginalGramContinuity

/-- The original, unnormalized Fock Gram observable is continuous in
the actual bosonic coordinates, for every fixed real spinor matrix B.
The 81 original Fock operator factors do not depend on x. -/
theorem originalFockGramObservable_continuous (B : GammaMatrix) :
    Continuous (fun x : Boson 2 => originalFockGramObservable x B) := by
  have heq :
      (fun x : Boson 2 => originalFockGramObservable x B) =
        (fun x : Boson 2 =>
          ∑ i : SpaceIndex, ∑ j : SpaceIndex,
            ((originalSpatialGram x i j : ℝ) : ℂ) •
              originalColorQuadratic
                (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j)) := by
    funext x
    exact originalFockGramObservable_sum x B
  rw [heq]
  exact continuous_finsetSum _ (fun i _ =>
    continuous_finsetSum _ (fun j _ =>
      (Complex.continuous_ofReal.comp
        (originalSpatialGram_continuous i j)).smul continuous_const))

/-- This is the genuine NORM-0C operator field on the original
Fermion 2 fiber. Positivity of 1 + the original trace makes its
complex denominator nonzero at every bosonic point. -/
theorem originalNormalizedFockGramObservable_continuous (B : GammaMatrix) :
    Continuous (fun x : Boson 2 =>
      originalNormalizedFockGramObservable x B) := by
  have hden : Continuous (fun x : Boson 2 =>
      ((1 + originalGramTrace x : ℝ) : ℂ)) :=
    Complex.continuous_ofReal.comp
      ((continuous_const : Continuous (fun _ : Boson 2 => (1 : ℝ))).add
        originalGramTrace_continuous)
  have hden_ne (x : Boson 2) :
      ((1 + originalGramTrace x : ℝ) : ℂ) ≠ 0 := by
    have hpos : 0 < (1 : ℝ) + originalGramTrace x := by
      have h := originalGramTrace_nonneg x
      linarith
    exact_mod_cast (ne_of_gt hpos)
  have hscalar : Continuous (fun x : Boson 2 =>
      (Complex.I : ℂ) / ((1 + originalGramTrace x : ℝ) : ℂ)) :=
    continuous_const.div hden hden_ne
  change Continuous (fun x : Boson 2 =>
    ((Complex.I : ℂ) / ((1 + originalGramTrace x : ℝ) : ℂ)) •
      originalFockGramObservable x B)
  exact hscalar.smul (originalFockGramObservable_continuous B)

#print axioms originalFockGramObservable_continuous
#print axioms originalNormalizedFockGramObservable_continuous

end
end FCP.BFSSNORM0D1OriginalFockFieldContinuity
