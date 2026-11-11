import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

/-!
# JOIN-0B2 independent skew-Fock-adjoint consumer

A genuinely different consequence of the source star/transpose
theorem, checked with the exact original Fock quadratic and a
real skew coefficient hypothesis. This is not a physical FullL2
operator-domain or source BFSS Hamiltonian statement.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B2OriginalFockSkewAdjointConsumer
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

/-- Direct real coefficient oddness of the ORIGINAL color-summed
quadratic operator, not an unproved generic Fock representation. -/
private theorem originalColorQuadratic_neg
    (J : Matrix SpinIndex SpinIndex ℝ) :
    originalColorQuadratic (-J) = -originalColorQuadratic J := by
  let F : SpinIndex → SpinIndex →
      (Fermion 2 →L[ℂ] Fermion 2) :=
    fun α β => ∑ A : ColorIndex 2,
      FCP.BFSSSU2GaugeG1A.pairedTheta α A *
      FCP.BFSSSU2GaugeG1A.pairedTheta β A
  change (∑ α : SpinIndex, ∑ β : SpinIndex,
      (((-J) α β : ℝ) : ℂ) • F α β) =
    -(∑ α : SpinIndex, ∑ β : SpinIndex,
      ((J α β : ℝ) : ℂ) • F α β)
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          -(((J α β : ℝ) : ℂ) • F α β) := by
      apply Finset.sum_congr rfl
      intro α _
      apply Finset.sum_congr rfl
      intro β _
      rw [Matrix.neg_apply, Complex.ofReal_neg, neg_smul]
    _ = ∑ α : SpinIndex, -(∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β) := by
      apply Finset.sum_congr rfl
      intro α _
      exact Finset.sum_neg_distrib
    _ = -(∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β) := by
      exact Finset.sum_neg_distrib

theorem originalColorQuadratic_skewAdjoint
    (J : Matrix SpinIndex SpinIndex ℝ) (hJ : Jᵀ = -J) :
    star (originalColorQuadratic J) =
      -(originalColorQuadratic J) := by
  rw [originalColorQuadratic_star_transpose, hJ,
    originalColorQuadratic_neg]

#print axioms FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose.originalColorQuadratic_star_transpose
#print axioms originalColorQuadratic_skewAdjoint

end
end FCP.BFSSJOIN0B2OriginalFockSkewAdjointConsumer
