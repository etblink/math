import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG7OriginalTauSmoothCore
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Original native tau core, support and potential-contribution controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG7OriginalTauSmoothCoreIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open MeasureTheory

example (i j : SpaceIndex) (A : ColorIndex 2) (α β : SpinIndex) :
    ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (fun X : Boson 2 => (originalHardyY pairedAlgebraData i j X A α β : ℂ)) :=
  originalHardyY_entry_contDiff pairedAlgebraData i j A α β

example (i j : SpaceIndex) (α : SpinIndex) :
    (originalHardyTauCore pairedAlgebraData i j α : SmoothCore 2 →ₗ[ℂ] SmoothCore 2) =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (pairedAlgebraData.fermionAction β A).comp
          (smoothMultiplier
            (fun X : Boson 2 => (originalHardyY pairedAlgebraData i j X A α β : ℂ))
            (originalHardyY_entry_contDiff pairedAlgebraData i j A α β)) := rfl

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore pairedAlgebraData i j α f X =
      originalHardyTau pairedAlgebraData i j α X (f X) :=
  originalHardyTauCore_apply pairedAlgebraData i j α f X

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) :
    Function.support (originalHardyTauCore pairedAlgebraData i j α f : Boson 2 → Fermion 2) ⊆
      Function.support (f : Boson 2 → Fermion 2) :=
  originalHardyTauCore_support_subset pairedAlgebraData i j α f

example (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.bracketPart α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.bracketPart α f) X)) = 0 :=
  originalBracketTauCore_anticommutator_apply pairedAlgebraData i j f X

example (i j : SpaceIndex) (f : SmoothCore 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.bracketPart α (originalHardyTauCore pairedAlgebraData i j α f) +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.bracketPart α f))) = 0 :=
  originalBracketTauCore_anticommutator_zero pairedAlgebraData i j f

example (i j : SpaceIndex) (α : SpinIndex) (f g : SmoothCore 2) :
    originalHardyTauCore pairedAlgebraData i j α (f + g) =
      originalHardyTauCore pairedAlgebraData i j α f +
        originalHardyTauCore pairedAlgebraData i j α g :=
  map_add (originalHardyTauCore pairedAlgebraData i j α) f g

example (i j : SpaceIndex) (α : SpinIndex) (c : ℂ) (f : SmoothCore 2) :
    originalHardyTauCore pairedAlgebraData i j α (c • f) =
      c • originalHardyTauCore pairedAlgebraData i j α f :=
  map_smul (originalHardyTauCore pairedAlgebraData i j α) c f

example (i j : SpaceIndex) (α : SpinIndex) :
    originalHardyTauCore pairedAlgebraData i j α (0 : SmoothCore 2) = 0 :=
  map_zero (originalHardyTauCore pairedAlgebraData i j α)

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2)
    (hf : f X = 0) :
    originalHardyTauCore pairedAlgebraData i j α f X = 0 := by
  rw [originalHardyTauCore_apply, hf]
  exact (originalHardyTau pairedAlgebraData i j α X).map_zero

example : FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

-- Preserve the actual all-label formula; no diagonal-plane vanishing is assumed.
example (i : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore pairedAlgebraData i i α f X =
      originalHardyTau pairedAlgebraData i i α X (f X) :=
  originalHardyTauCore_apply pairedAlgebraData i i α f X

#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyY_entry_contDiff
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_apply
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_support_subset
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalBracketTauCore_anticommutator_apply
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalBracketTauCore_anticommutator_zero
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalHardyTau_apply
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_apply
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalBracketPart_apply_potential
#print axioms OAI.BFSSQuantum.AlgebraData.fermionAction_apply
#print axioms OAI.BFSSQuantum.AlgebraData.smoothMultiplier_apply

end
end BFSSP3AuxHardyG7OriginalTauSmoothCoreIndependentConsumer
