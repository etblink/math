import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0AOriginalGaugeColorRowOrthogonality

/-!
# BIL-0A independent downstream consumer

Move the original real output-row contraction into the precise COMPLEX
coefficient field required by original G4H theta gauge covariance.
This is an independent scalar-interface assertion, NOT a Fock bilinear
gauge-invariance theorem or a replacement representation.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0AOriginalGaugeColorComplexConsumer
noncomputable section

open scoped BigOperators
open Matrix Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG3A

theorem originalColorRow_complex_orthogonal
    (g : GaugeGroup 2) (B C : ColorIndex 2) :
    (∑ A : ColorIndex 2,
      (adjointColorMatrix g B A : ℂ) * (adjointColorMatrix g C A : ℂ)) =
      if B = C then 1 else 0 := by
  have h : (∑ A : ColorIndex 2,
        adjointColorMatrix g B A * adjointColorMatrix g C A) =
      (if B = C then 1 else 0 : ℝ) := by
    have hh := congrArg
      (fun X : Matrix (ColorIndex 2) (ColorIndex 2) ℝ => X B C)
      (FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality.originalColorRow_matrix_orthogonal g)
    simpa only [Matrix.mul_apply, Matrix.transpose_apply, Matrix.one_apply] using hh
  calc
    _ = ∑ A : ColorIndex 2,
          ((adjointColorMatrix g B A *
            adjointColorMatrix g C A : ℝ) : ℂ) := by
        apply Finset.sum_congr rfl
        intro A _
        exact (Complex.ofReal_mul _ _).symm
    _ = ((∑ A : ColorIndex 2,
          adjointColorMatrix g B A *
            adjointColorMatrix g C A : ℝ) : ℂ) := by
        simp
    _ = ((if B = C then (1 : ℝ) else 0) : ℂ) := by
        rw [h]
        by_cases hBC : B = C
        · simp [hBC]
        · simp [hBC]
    _ = if B = C then 1 else 0 := by
        by_cases hBC : B = C
        · simp [hBC]
        · simp [hBC]

#print axioms FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality.originalColorRow_matrix_orthogonal
#print axioms originalColorRow_complex_orthogonal

end
end FCP.BFSSBIL0AOriginalGaugeColorComplexConsumer
