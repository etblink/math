import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG10OriginalKineticTauCAR

/-! HARDY-G11: original derivative coefficient contraction across all colors.
Prospective until complete strict source/native qualification.
No final Fock bilinear, smooth-core rotation or physical-sector conclusion. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding

theorem originalHardyY_basis_off_color (M : AlgebraData 2) (i j k : SpaceIndex)
    (B A : ColorIndex 2) (hBA : B ≠ A) :
    originalHardyY M i j (EuclideanSpace.single (k, B) 1) A = 0 := by
  classical
  have hAB : A ≠ B := Ne.symm hBA
  simp_all [originalHardyY, PiLp.single_apply]

theorem originalHardyY_basis_color (M : AlgebraData 2) (i j k : SpaceIndex)
    (B A : ColorIndex 2) :
    originalHardyY M i j (EuclideanSpace.single (k, B) 1) A =
      if B = A then originalHardyY M i j (EuclideanSpace.single (k, A) 1) A else 0 := by
  classical
  by_cases hBA : B = A
  · subst B
    rw [if_pos rfl]
  · rw [if_neg hBA, originalHardyY_basis_off_color M i j k B A hBA]

theorem originalHardyY_basis_color_contraction (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) :
    (∑ k : SpaceIndex, M.gamma k *
      originalHardyY M i j (EuclideanSpace.single (k, B) 1) A) =
      if B = A then (1 / 4 : ℝ) • (M.gamma i * M.gamma j) else 0 := by
  classical
  by_cases hBA : B = A
  · subst B
    rw [if_pos rfl]
    exact originalHardyY_basis_contraction M i j hij A
  · rw [if_neg hBA]
    simp_rw [originalHardyY_basis_off_color M i j _ B A hBA]
    simp only [mul_zero, Finset.sum_const_zero]

theorem originalHardyY_basis_spin_contraction (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, M.gamma k α β *
      originalHardyY M i j (EuclideanSpace.single (k, B) 1) A α δ) =
      if B = A then (1 / 4 : ℝ) * (M.gamma i * M.gamma j) β δ else 0 := by
  classical
  have hs (k : SpaceIndex) (α : SpinIndex) : M.gamma k α β = M.gamma k β α :=
    congrArg (fun C : GammaMatrix => C β α) (M.gamma_symmetric k).eq
  simp_rw [hs]
  have he := congrArg (fun C : GammaMatrix => C β δ)
    (originalHardyY_basis_color_contraction M i j hij B A)
  by_cases hBA : B = A
  · simpa only [if_pos hBA, Matrix.sum_apply, Matrix.mul_apply,
      Matrix.smul_apply, smul_eq_mul] using he
  · simpa only [if_neg hBA, Matrix.sum_apply, Matrix.mul_apply,
      Matrix.zero_apply] using he

theorem originalHardyY_basis_complex_spin_contraction (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (M.gamma k α β : ℂ) *
      (originalHardyY M i j (EuclideanSpace.single (k, B) 1) A α δ : ℂ)) =
      if B = A then (1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ) else 0 := by
  have he := congrArg (fun r : ℝ => (r : ℂ))
    (originalHardyY_basis_spin_contraction M i j hij B A β δ)
  by_cases hBA : B = A
  · simp only [if_pos hBA] at he ⊢
    push_cast at he
    exact he
  · simp only [if_neg hBA] at he ⊢
    push_cast at he
    exact he

theorem originalHardyTauCoefficientDerivative_spin_contraction (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (B A : ColorIndex 2) (β δ : SpinIndex)
    (X : Boson 2) :
    (∑ k : SpaceIndex, ∑ α : SpinIndex, (M.gamma k α β : ℂ) *
      originalHardyTauCoefficientDerivative M i j k B A α δ X) =
      if B = A then (1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ) else 0 := by
  simp_rw [originalHardyTauCoefficientDerivative_eq_basis]
  exact originalHardyY_basis_complex_spin_contraction M i j hij B A β δ

#print axioms originalHardyY_basis_off_color
#print axioms originalHardyY_basis_color
#print axioms originalHardyY_basis_color_contraction
#print axioms originalHardyY_basis_spin_contraction
#print axioms originalHardyY_basis_complex_spin_contraction
#print axioms originalHardyTauCoefficientDerivative_spin_contraction

end
end FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction
