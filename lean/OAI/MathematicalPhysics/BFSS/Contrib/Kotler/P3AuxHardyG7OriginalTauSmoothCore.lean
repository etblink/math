import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG6OriginalCorePotentialBinding
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG3OriginalYDerivativeContraction

/-! HARDY-G7: original smooth-core tau and the potential contribution.
Prospective until full strict source/native consumer acceptance. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding

theorem originalHardyY_entry_contDiff (M : AlgebraData 2) (i j : SpaceIndex)
    (A : ColorIndex 2) (α β : SpinIndex) :
    ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (fun X : Boson 2 => (originalHardyY M i j X A α β : ℂ)) := by
  have hreal : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (fun X : Boson 2 => originalHardyY M i j X A α β) := by
    simp_rw [← originalHardyYCLM_apply]
    fun_prop
  exact Complex.ofRealCLM.contDiff.comp hreal

noncomputable def originalHardyTauCore (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) : SmoothCore 2 →ₗ[ℂ] SmoothCore 2 :=
  ∑ A : ColorIndex 2, ∑ β : SpinIndex,
    (M.fermionAction β A).comp
      (smoothMultiplier
        (fun X : Boson 2 => (originalHardyY M i j X A α β : ℂ))
        (originalHardyY_entry_contDiff M i j A α β))

theorem originalHardyTauCore_apply (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore M i j α f X = originalHardyTau M i j α X (f X) := by
  rw [originalHardyTau_apply]
  simp only [originalHardyTauCore, LinearMap.sum_apply, LinearMap.comp_apply,
    _root_.sum_apply, AlgebraData.fermionAction_apply, AlgebraData.smoothMultiplier_apply,
    map_smul]

theorem originalHardyTauCore_support_subset (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (f : SmoothCore 2) :
    Function.support (originalHardyTauCore M i j α f : Boson 2 → Fermion 2) ⊆
      Function.support (f : Boson 2 → Fermion 2) := by
  intro X hX hf
  apply hX
  rw [originalHardyTauCore_apply, hf]
  exact (originalHardyTau M i j α X).map_zero

theorem originalBracketTauCore_anticommutator_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (M.bracketPart α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.bracketPart α f) X)) = 0 := by
  simp only [originalBracketPart_apply_potential, originalHardyTauCore_apply]
  exact originalPotentialTau_anticommutator_apply M i j X (f X)

theorem originalBracketTauCore_anticommutator_zero (M : AlgebraData 2)
    (i j : SpaceIndex) (f : SmoothCore 2) :
    (∑ α : SpinIndex,
      (M.bracketPart α (originalHardyTauCore M i j α f) +
        originalHardyTauCore M i j α (M.bracketPart α f))) = 0 := by
  apply TestFunction.ext
  intro X
  simpa only [_root_.sum_apply, IsAddApply.add_apply, _root_.zero_apply] using
    originalBracketTauCore_anticommutator_apply M i j f X

#print axioms originalHardyY_entry_contDiff
#print axioms originalHardyTauCore
#print axioms originalHardyTauCore_apply
#print axioms originalHardyTauCore_support_subset
#print axioms originalBracketTauCore_anticommutator_apply
#print axioms originalBracketTauCore_anticommutator_zero

end
end FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
