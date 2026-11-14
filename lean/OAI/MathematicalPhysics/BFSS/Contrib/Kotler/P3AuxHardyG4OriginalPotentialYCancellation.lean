import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG2OriginalPlaneCoefficientTrace

/-!
HARDY-G4 R1: original real potential coefficient and correct scalar Y pairing.
PROSPECTIVE until exact strict source and independent native consumer acceptance.
No source Fock/core anticommutator, physical Spin9 or Hardy theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace

private theorem nativeGammaTwo_trace_gamma (M : AlgebraData 2) (k l a : SpaceIndex) :
    Matrix.trace (M.gammaTwo k l * M.gamma a) = 0 := by
  simp only [AlgebraData.gammaTwo, smul_mul_assoc, sub_mul, Matrix.trace_smul,
    Matrix.trace_sub, originalGamma_three_trace_zero, sub_self, smul_zero]

private theorem nativeGammaTwo_trace_three (M : AlgebraData 2) (k l a b c : SpaceIndex) :
    Matrix.trace (M.gammaTwo k l * (M.gamma a * M.gamma b * M.gamma c)) = 0 := by
  simp only [AlgebraData.gammaTwo, smul_mul_assoc, sub_mul, Matrix.trace_smul,
    Matrix.trace_sub, ← mul_assoc, originalGamma_five_trace_zero, sub_self, smul_zero]

theorem originalGammaTwo_trace_Y (M : AlgebraData 2) (k l i j : SpaceIndex)
    (X : Boson 2) (D : ColorIndex 2) :
    Matrix.trace (M.gammaTwo k l * originalHardyY M i j X D) = 0 := by
  simp only [originalHardyY, Matrix.mul_add, Matrix.mul_smul, Matrix.trace_add,
    Matrix.trace_smul, Matrix.mul_sub, Matrix.trace_sub, Matrix.mul_sum, Matrix.trace_sum,
    nativeGammaTwo_trace_gamma, nativeGammaTwo_trace_three, smul_zero, sub_self,
    Finset.sum_const_zero, add_zero]

noncomputable def originalPotentialGamma (M : AlgebraData 2) (X : Boson 2)
    (A : ColorIndex 2) : GammaMatrix :=
  ∑ k : SpaceIndex, ∑ l : SpaceIndex, ∑ B : ColorIndex 2, ∑ C : ColorIndex 2,
    ((1 / 2 : ℝ) * M.structureConstant A B C * X (k, B) * X (l, C)) • M.gammaTwo k l

theorem originalPotentialGamma_apply (M : AlgebraData 2) (X : Boson 2)
    (A : ColorIndex 2) (α β : SpinIndex) :
    originalPotentialGamma M X A α β =
      ∑ k : SpaceIndex, ∑ l : SpaceIndex, ∑ B : ColorIndex 2, ∑ C : ColorIndex 2,
        (1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo k l α β *
          X (k, B) * X (l, C) := by
  simp only [originalPotentialGamma, Matrix.sum_apply, Matrix.smul_apply, smul_eq_mul]
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro l _
  apply Finset.sum_congr rfl
  intro B _
  apply Finset.sum_congr rfl
  intro C _
  ring

private theorem nativeGammaTwo_transpose (M : AlgebraData 2) (k l : SpaceIndex) :
    (M.gammaTwo k l).transpose = -M.gammaTwo k l := by
  simp only [AlgebraData.gammaTwo, Matrix.transpose_smul, Matrix.transpose_sub,
    Matrix.transpose_mul, (M.gamma_symmetric k).eq, (M.gamma_symmetric l).eq]
  module

theorem originalPotentialGamma_transpose (M : AlgebraData 2) (X : Boson 2)
    (A : ColorIndex 2) :
    (originalPotentialGamma M X A).transpose = -originalPotentialGamma M X A := by
  simp only [originalPotentialGamma, Matrix.transpose_sum, Matrix.transpose_smul,
    nativeGammaTwo_transpose, smul_neg, Finset.sum_neg_distrib]

theorem originalPotentialGamma_trace_Y (M : AlgebraData 2) (X : Boson 2)
    (A D : ColorIndex 2) (i j : SpaceIndex) :
    Matrix.trace (originalPotentialGamma M X A * originalHardyY M i j X D) = 0 := by
  simp only [originalPotentialGamma, Finset.sum_mul, smul_mul_assoc, Matrix.trace_sum,
    Matrix.trace_smul, originalGammaTwo_trace_Y, smul_zero, Finset.sum_const_zero]

theorem originalPotentialGamma_pairing_zero (M : AlgebraData 2) (X : Boson 2)
    (A D : ColorIndex 2) (i j : SpaceIndex) :
    (∑ α : SpinIndex, ∑ β : SpinIndex,
      originalPotentialGamma M X A α β * originalHardyY M i j X D α β) = 0 := by
  have ht : Matrix.trace ((originalPotentialGamma M X A).transpose *
      originalHardyY M i j X D) = 0 := by
    rw [originalPotentialGamma_transpose, neg_mul, Matrix.trace_neg,
      originalPotentialGamma_trace_Y, neg_zero]
  have hsum : Matrix.trace ((originalPotentialGamma M X A).transpose *
      originalHardyY M i j X D) =
      ∑ α : SpinIndex, ∑ β : SpinIndex,
        originalPotentialGamma M X A α β * originalHardyY M i j X D α β := by
    simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply, Matrix.transpose_apply]
    exact Finset.sum_comm
  rw [hsum] at ht
  exact ht

#print axioms originalGammaTwo_trace_Y
#print axioms originalPotentialGamma
#print axioms originalPotentialGamma_apply
#print axioms originalPotentialGamma_transpose
#print axioms originalPotentialGamma_trace_Y
#print axioms originalPotentialGamma_pairing_zero

end
end FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
