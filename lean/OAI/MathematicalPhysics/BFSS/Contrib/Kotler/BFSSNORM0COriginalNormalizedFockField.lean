import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0AOriginalGramTraceBound
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum

/-!
# NORM-0C — original BFSS normalized pointwise Fock field norm

The original 9×9 real spatial Gram coefficients are bounded by their
nonnegative trace (NORM-0A), and their exact original color-quadratic
Fock expansion is strictly qualified (NORM-0B).

This module proves a fixed-B, uniform-in-x bound on the genuine source
Fermion 2 bounded operator field. It does not construct a multiplication
operator on FullL2 2, preserve physical Hamiltonian domains, or claim
confinement, positive spectrum or a mass gap.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0COriginalNormalizedFockField
noncomputable section

open Finset
open OAI.BFSSQuantum
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSNORM0AOriginalGramTraceBound
open FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance

private abbrev OriginalFockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Each coefficient acts on the genuine original Fock operator,
not a surrogate gamma or exterior-algebra carrier. -/
private abbrev originalFockGammaTerm
    (B : GammaMatrix) (i j : SpaceIndex) : OriginalFockOp :=
  originalColorQuadratic
    (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j)

/-- Finite, source-exact coefficient-norm envelope for a fixed real B. -/
noncomputable def originalFockGammaBoundConstant (B : GammaMatrix) : ℝ :=
  ∑ i : SpaceIndex, ∑ j : SpaceIndex, ‖originalFockGammaTerm B i j‖

theorem originalFockGammaBoundConstant_nonneg (B : GammaMatrix) :
    0 ≤ originalFockGammaBoundConstant B := by
  unfold originalFockGammaBoundConstant
  apply Finset.sum_nonneg
  intro i _
  apply Finset.sum_nonneg
  intro j _
  exact norm_nonneg _

/-- Fully typed scalar-weighted finite double-sum bound.
This lemma deliberately isolates the operator-norm interface from
the semireducible matrix-entry coefficients of originalSpatialGram. -/
private theorem originalFock_double_sum_norm_bound
    (w : SpaceIndex → SpaceIndex → ℂ)
    (F : SpaceIndex → SpaceIndex → OriginalFockOp)
    (t : ℝ)
    (hwt : ∀ i j, ‖w i j‖ ≤ t) :
    ‖∑ i : SpaceIndex, ∑ j : SpaceIndex, w i j • F i j‖ ≤
      t * ∑ i : SpaceIndex, ∑ j : SpaceIndex, ‖F i j‖ := by
  calc
    ‖∑ i : SpaceIndex, ∑ j : SpaceIndex, w i j • F i j‖ ≤
        ∑ i : SpaceIndex, t * ∑ j : SpaceIndex, ‖F i j‖ := by
      apply norm_sum_le_of_le
      intro i _
      calc
        ‖∑ j : SpaceIndex, w i j • F i j‖ ≤
            ∑ j : SpaceIndex, t * ‖F i j‖ := by
          apply norm_sum_le_of_le
          intro j _
          rw [norm_smul]
          exact mul_le_mul_of_nonneg_right (hwt i j) (norm_nonneg (F i j))
        _ = t * ∑ j : SpaceIndex, ‖F i j‖ := by
          rw [Finset.mul_sum]
    _ = t * ∑ i : SpaceIndex, ∑ j : SpaceIndex, ‖F i j‖ := by
      rw [Finset.mul_sum]

/-- The literal Gram/Fock observable is bounded by the source
nonnegative Gram trace times the finite original Fock constant. -/
theorem originalFockGram_norm_le_trace (x : Boson 2) (B : GammaMatrix) :
    ‖originalFockGramObservable x B‖ ≤
      originalGramTrace x * originalFockGammaBoundConstant B := by
  rw [originalFockGramObservable_sum]
  exact originalFock_double_sum_norm_bound
    (w := fun i j => ((originalSpatialGram x i j : ℝ) : ℂ))
    (F := originalFockGammaTerm B)
    (t := originalGramTrace x)
    (by
      intro i j
      simpa only [Complex.norm_real, Real.norm_eq_abs] using
        (originalGram_abs_le_trace x i j))

/-- Normalized original, pointwise bounded Fermion 2 Fock operator.
The denominator is strictly positive by the accepted original Gram trace.
The complex I factor is retained for later skew-matrix self-adjointness. -/
noncomputable def originalNormalizedFockGramObservable
    (x : Boson 2) (B : GammaMatrix) : OriginalFockOp :=
  ((Complex.I : ℂ) / ((1 + originalGramTrace x : ℝ) : ℂ)) •
    originalFockGramObservable x B

/-- Source-faithful uniform bound in original boson x, for each fixed B.
This is a pointwise operator estimate, not yet a FullL2 2 multiplier. -/
theorem originalNormalizedFockGram_norm_le (x : Boson 2) (B : GammaMatrix) :
    ‖originalNormalizedFockGramObservable x B‖ ≤
      originalFockGammaBoundConstant B := by
  have hT := originalGramTrace_nonneg x
  have hd : 0 < 1 + originalGramTrace x := by linarith
  have hC := originalFockGammaBoundConstant_nonneg B
  calc
    ‖originalNormalizedFockGramObservable x B‖ =
        ‖originalFockGramObservable x B‖ / (1 + originalGramTrace x) := by
      unfold originalNormalizedFockGramObservable
      rw [norm_smul, Complex.norm_div, Complex.norm_I,
        Complex.norm_real, Real.norm_of_nonneg hd.le]
      ring
    _ ≤ originalFockGammaBoundConstant B := by
      apply (div_le_iff₀ hd).2
      have hbound := originalFockGram_norm_le_trace x B
      nlinarith

#print axioms originalFockGammaBoundConstant_nonneg
#print axioms originalFockGram_norm_le_trace
#print axioms originalNormalizedFockGram_norm_le

end
end FCP.BFSSNORM0COriginalNormalizedFockField
