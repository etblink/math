import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG12OriginalDerivativeFockBilinear

/-! G13: actual smooth-core kinetic/tau assembly, before final rotation collapse. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR

theorem originalKineticDerivative_apply (M : AlgebraData 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f X =
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion M α k B (coordinateDerivative k B f X) := by
  simp only [M.kineticDerivative_pointwise, originalKineticFermion_apply]

theorem originalKineticDerivative_tauCore_productRule_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α)
        (originalHardyTauCore M i j α f) X =
      (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion M α k B
          (originalHardyTau M i j α X (coordinateDerivative k B f X))) +
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion M α k B
          (originalHardyTauDerivative M i j k B α X (f X)) := by
  rw [originalKineticDerivative_apply]
  simp_rw [originalHardyTauCore_coordinateDerivative_apply, originalHardyTauCore_apply]
  simp only [map_add, Finset.sum_add_distrib]

theorem originalTauCore_kineticDerivative_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore M i j α
        (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f) X =
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalHardyTau M i j α X
          (originalKineticFermion M α k B (coordinateDerivative k B f X)) := by
  rw [originalHardyTauCore_apply, originalKineticDerivative_apply]
  simp only [map_sum]

theorem originalKineticTauCore_pair_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α)
        (originalHardyTauCore M i j α f) X +
      originalHardyTauCore M i j α
        (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f) X =
      (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        (originalKineticFermion M α k B
            (originalHardyTau M i j α X (coordinateDerivative k B f X)) +
          originalHardyTau M i j α X
            (originalKineticFermion M α k B (coordinateDerivative k B f X)))) +
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion M α k B
          (originalHardyTauDerivative M i j k B α X (f X)) := by
  rw [originalKineticDerivative_tauCore_productRule_apply,
    originalTauCore_kineticDerivative_apply]
  simp only [Finset.sum_add_distrib]
  abel

theorem originalChargeTauCore_pair_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    M.charge α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.charge α f) X =
      (-Complex.I) •
        (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α)
            (originalHardyTauCore M i j α f) X +
          originalHardyTauCore M i j α
            (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f) X) +
      (M.bracketPart α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.bracketPart α f) X) := by
  simp only [M.charge_kinetic_plus_bracket, originalHardyTauCore_apply,
    M.bracketPart_apply, map_add, map_smul, smul_add]
  abel

theorem originalChargeTauCore_sum_eq_kinetic_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (M.charge α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.charge α f) X)) =
      (-Complex.I) • ∑ α : SpinIndex,
        (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α)
            (originalHardyTauCore M i j α f) X +
          originalHardyTauCore M i j α
            (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f) X) := by
  simp_rw [originalChargeTauCore_pair_apply]
  rw [Finset.sum_add_distrib, ← Finset.smul_sum,
    originalBracketTauCore_anticommutator_apply, add_zero]

#print axioms originalKineticDerivative_apply
#print axioms originalKineticDerivative_tauCore_productRule_apply
#print axioms originalTauCore_kineticDerivative_apply
#print axioms originalKineticTauCore_pair_apply
#print axioms originalChargeTauCore_pair_apply
#print axioms originalChargeTauCore_sum_eq_kinetic_apply

end
end FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly
