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
  unfold originalColorQuadratic
  simp only [Matrix.neg_apply, Complex.ofReal_neg, neg_smul,
    Finset.sum_neg_distrib]

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
