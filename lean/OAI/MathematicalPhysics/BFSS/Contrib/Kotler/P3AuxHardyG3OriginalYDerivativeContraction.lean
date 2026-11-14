import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG2OriginalPlaneCoefficientTrace

/-!
HARDY-G3 R1: actual original Y derivative and nine-direction contraction.
PROSPECTIVE until exact strict source and independent native consumer acceptance.
No tau anticommutator, physical Spin9, Hardy/fidelity or spectral theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace

noncomputable def originalHardyYCLM (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) : Boson 2 →L[ℝ] GammaMatrix :=
  (1 / 16 : ℝ) •
    ((EuclideanSpace.proj (𝕜 := ℝ) (i, A)).smulRight (M.gamma j) -
      (EuclideanSpace.proj (𝕜 := ℝ) (j, A)).smulRight (M.gamma i)) +
    (1 / 56 : ℝ) • ∑ k ∈ Finset.univ.filter (fun k : SpaceIndex => k ≠ i ∧ k ≠ j),
      (EuclideanSpace.proj (𝕜 := ℝ) (k, A)).smulRight
        (M.gamma k * M.gamma i * M.gamma j)

theorem originalHardyYCLM_apply (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (X : Boson 2) :
    originalHardyYCLM M i j A X = originalHardyY M i j X A := by
  simp [originalHardyYCLM, originalHardyY]

theorem originalHardyY_fderiv (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY M i j Z A) X =
      originalHardyYCLM M i j A := by
  have hfun : (fun Z : Boson 2 => originalHardyY M i j Z A) =
      ⇑(originalHardyYCLM M i j A) := by
    funext Z
    exact (originalHardyYCLM_apply M i j A Z).symm
  rw [hfun]
  exact (originalHardyYCLM M i j A).fderiv

private theorem nativeY_basis_value (M : AlgebraData 2) (i j k : SpaceIndex)
    (A : ColorIndex 2) :
    originalHardyY M i j (EuclideanSpace.single (k, A) 1) A =
      (1 / 16 : ℝ) • ((if i = k then M.gamma j else 0) -
        (if j = k then M.gamma i else 0)) +
      (if k ≠ i ∧ k ≠ j then
        (1 / 56 : ℝ) • (M.gamma k * M.gamma i * M.gamma j) else 0) := by
  classical
  simp [originalHardyY, PiLp.single_apply, ite_smul, smul_ite]

private theorem nativeY_basis_weight (M : AlgebraData 2) (i j : SpaceIndex)
    (hij : i ≠ j) (A : ColorIndex 2) (k : SpaceIndex) :
    M.gamma k * originalHardyY M i j (EuclideanSpace.single (k, A) 1) A =
      (1 / 56 : ℝ) • (M.gamma i * M.gamma j) +
        (if k = i then (1 / 16 - 1 / 56 : ℝ) • (M.gamma i * M.gamma j) else 0) +
        (if k = j then (1 / 16 - 1 / 56 : ℝ) • (M.gamma i * M.gamma j) else 0) := by
  rw [nativeY_basis_value]
  by_cases hki : k = i
  · subst k
    simp [hij, Ne.symm hij]
    module
  · by_cases hkj : k = j
    · subst k
      simp [hij, Ne.symm hij,
        OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford (Ne.symm hij)]
      module
    · simp [hki, hkj, Ne.symm hki, Ne.symm hkj, ← mul_assoc,
        OAI.BFSSGamma.gamma_sq M.gamma M.gamma_clifford k]

theorem originalHardyY_basis_contraction (M : AlgebraData 2) (i j : SpaceIndex)
    (hij : i ≠ j) (A : ColorIndex 2) :
    (∑ k : SpaceIndex, M.gamma k *
      originalHardyY M i j (EuclideanSpace.single (k, A) 1) A) =
      (1 / 4 : ℝ) • (M.gamma i * M.gamma j) := by
  simp_rw [nativeY_basis_weight M i j hij A]
  simp only [Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, ite_true,
    Finset.sum_const, Finset.card_univ, Fintype.card_fin]
  module

theorem originalHardyY_derivative_contraction (M : AlgebraData 2) (i j : SpaceIndex)
    (hij : i ≠ j) (A : ColorIndex 2) (X : Boson 2) :
    (∑ k : SpaceIndex, M.gamma k *
      (fderiv ℝ (fun Z : Boson 2 => originalHardyY M i j Z A) X
        (EuclideanSpace.single (k, A) 1))) =
      (1 / 4 : ℝ) • (M.gamma i * M.gamma j) := by
  simp_rw [originalHardyY_fderiv, originalHardyYCLM_apply]
  exact originalHardyY_basis_contraction M i j hij A

#print axioms originalHardyYCLM
#print axioms originalHardyYCLM_apply
#print axioms originalHardyY_fderiv
#print axioms originalHardyY_basis_contraction
#print axioms originalHardyY_derivative_contraction

end
end FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
