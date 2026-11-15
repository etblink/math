import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG11OriginalDerivativeColorContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG12FiniteCoefficientContraction

/-! HARDY-G12: actual ordered kinetic-symbol/tau-derivative Fock bilinear.
Prospective until complete strict source/native qualification.
No full smooth-core rotation, tau norm or physical-sector conclusion. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction
open FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction

theorem originalKineticFermion_eq_sum (M : AlgebraData 2) (α : SpinIndex)
    (k : SpaceIndex) (B : ColorIndex 2) :
    originalKineticFermion M α k B =
      ∑ β : SpinIndex, (M.gamma k α β : ℂ) • M.theta β B := by
  ext v : 1
  simpa only [_root_.sum_apply, IsSMulApply.smul_apply] using
    (originalKineticFermion_apply M α k B v)

noncomputable def originalKineticTauDerivativeFermion (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  ∑ k : SpaceIndex, ∑ α : SpinIndex, ∑ B : ColorIndex 2,
    originalKineticFermion M α k B * originalHardyTauDerivative M i j k B α X

theorem originalKineticTauDerivativeFermion_expand (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) :
    originalKineticTauDerivativeFermion M i j X =
      ∑ k : SpaceIndex, ∑ α : SpinIndex, ∑ B : ColorIndex 2,
        ∑ β : SpinIndex, ∑ A : ColorIndex 2, ∑ δ : SpinIndex,
          ((M.gamma k α β : ℂ) * originalHardyTauCoefficientDerivative M i j k B A α δ X) •
            (M.theta β B * M.theta δ A) := by
  classical
  unfold originalKineticTauDerivativeFermion
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro α _
  apply Finset.sum_congr rfl
  intro B _
  rw [originalKineticFermion_eq_sum]
  unfold originalHardyTauDerivative
  rw [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro β _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro A _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro δ _
  rw [smul_mul_assoc, mul_smul_comm, smul_smul]

theorem originalKineticTauDerivativeFermion_eq_contracted (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) :
    originalKineticTauDerivativeFermion M i j X =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ A : ColorIndex 2, ∑ δ : SpinIndex,
        (∑ k : SpaceIndex, ∑ α : SpinIndex, (M.gamma k α β : ℂ) *
          originalHardyTauCoefficientDerivative M i j k B A α δ X) •
            (M.theta β B * M.theta δ A) := by
  rw [originalKineticTauDerivativeFermion_expand]
  simpa only [Fintype.sum_prod_type] using
    (finiteOperatorCoefficientContraction
      (fun (r : SpaceIndex × SpinIndex) (p q : ColorIndex 2 × SpinIndex) =>
        (M.gamma r.1 r.2 p.2 : ℂ) *
          originalHardyTauCoefficientDerivative M i j r.1 p.1 q.1 r.2 q.2 X)
      (fun p : ColorIndex 2 × SpinIndex => M.theta p.2 p.1)
      (fun q : ColorIndex 2 × SpinIndex => M.theta q.2 q.1))

theorem originalKineticTauDerivativeFermion_eq_bilinear (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) :
    originalKineticTauDerivativeFermion M i j X =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ)) •
          (M.theta β B * M.theta δ B) := by
  classical
  rw [originalKineticTauDerivativeFermion_eq_contracted]
  simp_rw [originalHardyTauCoefficientDerivative_spin_contraction M i j hij]
  apply Finset.sum_congr rfl
  intro B _
  apply Finset.sum_congr rfl
  intro β _
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro δ _
  rw [Finset.sum_eq_single B]
  · rw [ite_eq_left rfl]
  · intro A _ hAB
    rw [ite_eq_right (Ne.symm hAB), zero_smul]
  · intro hB
    exact False.elim (hB (Finset.mem_univ B))

theorem originalKineticTauDerivativeFermion_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) (v : Fermion 2) :
    originalKineticTauDerivativeFermion M i j X v =
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ)) •
          M.theta β B (M.theta δ B v) := by
  rw [originalKineticTauDerivativeFermion_eq_bilinear M i j hij X]
  simp only [_root_.sum_apply, IsSMulApply.smul_apply, mul_apply_eq_comp]

#print axioms originalKineticFermion_eq_sum
#print axioms originalKineticTauDerivativeFermion
#print axioms originalKineticTauDerivativeFermion_expand
#print axioms originalKineticTauDerivativeFermion_eq_contracted
#print axioms originalKineticTauDerivativeFermion_eq_bilinear
#print axioms originalKineticTauDerivativeFermion_apply

end
end FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear
