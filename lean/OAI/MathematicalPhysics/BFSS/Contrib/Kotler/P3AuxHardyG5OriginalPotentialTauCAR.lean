import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG4OriginalPotentialYCancellation
import OAI.MathematicalPhysics.BFSS.CliffordSymbols

/-!
HARDY-G5 R1: pointwise original Fock potential/tau CAR compression.
PROSPECTIVE until exact strict source and independent native consumer acceptance.
Literal Core charge-potential identification and full smooth-core identity remain separate.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation

noncomputable def originalHardyTau (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  M.cliffordLinear (fun p : FermionIndex 2 => originalHardyY M i j X p.2 α p.1)

theorem originalHardyTau_apply (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalHardyTau M i j α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyY M i j X A α β : ℂ) • M.theta β A v := by
  simp only [originalHardyTau, AlgebraData.cliffordLinear, sum_apply,
    IsSMulApply.smul_apply, Fintype.sum_prod_type]
  exact Finset.sum_comm

noncomputable def originalPotentialFermion (M : AlgebraData 2) (α : SpinIndex)
    (X : Boson 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  M.cliffordLinear (fun p : FermionIndex 2 => originalPotentialGamma M X p.2 α p.1)

theorem originalPotentialFermion_apply (M : AlgebraData 2) (α : SpinIndex)
    (X : Boson 2) (v : Fermion 2) :
    originalPotentialFermion M α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalPotentialGamma M X A α β : ℂ) • M.theta β A v := by
  simp only [originalPotentialFermion, AlgebraData.cliffordLinear, sum_apply,
    IsSMulApply.smul_apply, Fintype.sum_prod_type]
  exact Finset.sum_comm

private theorem nativePotentialTauCoefficient_zero (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex, ∑ p : FermionIndex 2,
      originalPotentialGamma M X p.2 α p.1 * originalHardyY M i j X p.2 α p.1) = 0 := by
  simp only [Fintype.sum_prod_type]
  calc
    (∑ α : SpinIndex, ∑ β : SpinIndex, ∑ A : ColorIndex 2,
      originalPotentialGamma M X A α β * originalHardyY M i j X A α β) =
        ∑ α : SpinIndex, ∑ A : ColorIndex 2, ∑ β : SpinIndex,
          originalPotentialGamma M X A α β * originalHardyY M i j X A α β := by
      apply Finset.sum_congr rfl
      intro α _
      exact Finset.sum_comm
    _ = ∑ A : ColorIndex 2, ∑ α : SpinIndex, ∑ β : SpinIndex,
        originalPotentialGamma M X A α β * originalHardyY M i j X A α β := Finset.sum_comm
    _ = 0 := by simp only [originalPotentialGamma_pairing_zero, Finset.sum_const_zero]

theorem originalPotentialTau_anticommutator_zero (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      (originalPotentialFermion M α X * originalHardyTau M i j α X +
        originalHardyTau M i j α X * originalPotentialFermion M α X)) = 0 := by
  unfold originalPotentialFermion originalHardyTau
  simp_rw [M.cliffordLinear_mixed]
  rw [← Finset.sum_smul, ← Complex.ofReal_sum, nativePotentialTauCoefficient_zero,
    Complex.ofReal_zero, zero_smul]

theorem originalPotentialTau_anticommutator_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      (originalPotentialFermion M α X (originalHardyTau M i j α X v) +
        originalHardyTau M i j α X (originalPotentialFermion M α X v))) = 0 := by
  have h := congrArg (fun L : Fermion 2 →L[ℂ] Fermion 2 => L v)
    (originalPotentialTau_anticommutator_zero M i j X)
  simpa only [sum_apply, IsAddApply.add_apply] using h

#print axioms originalHardyTau
#print axioms originalHardyTau_apply
#print axioms originalPotentialFermion
#print axioms originalPotentialFermion_apply
#print axioms originalPotentialTau_anticommutator_zero
#print axioms originalPotentialTau_anticommutator_apply

end
end FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
