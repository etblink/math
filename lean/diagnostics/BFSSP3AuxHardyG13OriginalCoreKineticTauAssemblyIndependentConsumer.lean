import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG13OriginalCoreKineticTauAssembly
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! G13: twelve literal original paired core assembly controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssemblyIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly

example (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f X =
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion pairedAlgebraData α k B (coordinateDerivative k B f X) :=
  originalKineticDerivative_apply pairedAlgebraData α f X

example
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
        (originalHardyTauCore pairedAlgebraData i j α f) X =
      (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion pairedAlgebraData α k B
          (originalHardyTau pairedAlgebraData i j α X (coordinateDerivative k B f X))) +
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion pairedAlgebraData α k B
          (originalHardyTauDerivative pairedAlgebraData i j k B α X (f X)) :=
  originalKineticDerivative_tauCore_productRule_apply pairedAlgebraData i j α f X

example
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore pairedAlgebraData i j α
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X =
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalHardyTau pairedAlgebraData i j α X
          (originalKineticFermion pairedAlgebraData α k B (coordinateDerivative k B f X)) :=
  originalTauCore_kineticDerivative_apply pairedAlgebraData i j α f X

example
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
        (originalHardyTauCore pairedAlgebraData i j α f) X +
      originalHardyTauCore pairedAlgebraData i j α
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X =
      (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        (originalKineticFermion pairedAlgebraData α k B
            (originalHardyTau pairedAlgebraData i j α X (coordinateDerivative k B f X)) +
          originalHardyTau pairedAlgebraData i j α X
            (originalKineticFermion pairedAlgebraData α k B (coordinateDerivative k B f X)))) +
      ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
        originalKineticFermion pairedAlgebraData α k B
          (originalHardyTauDerivative pairedAlgebraData i j k B α X (f X)) :=
  originalKineticTauCore_pair_apply pairedAlgebraData i j α f X

example
    (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) X =
      (-Complex.I) •
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
            (originalHardyTauCore pairedAlgebraData i j α f) X +
          originalHardyTauCore pairedAlgebraData i j α
            (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X) +
      (pairedAlgebraData.bracketPart α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.bracketPart α f) X) :=
  originalChargeTauCore_pair_apply pairedAlgebraData i j α f X

example
    (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) X)) =
      (-Complex.I) • ∑ α : SpinIndex,
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
            (originalHardyTauCore pairedAlgebraData i j α f) X +
          originalHardyTauCore pairedAlgebraData i j α
            (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X) :=
  originalChargeTauCore_sum_eq_kinetic_apply pairedAlgebraData i j f X

example (i j : SpaceIndex) (f : SmoothCore 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) 0 +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) 0)) =
      (-Complex.I) • ∑ α : SpinIndex,
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
            (originalHardyTauCore pairedAlgebraData i j α f) 0 +
          originalHardyTauCore pairedAlgebraData i j α
            (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) 0) := by
  generalize (0 : Boson 2) = X
  exact originalChargeTauCore_sum_eq_kinetic_apply pairedAlgebraData i j f X

example (i : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i i α f) X +
        originalHardyTauCore pairedAlgebraData i i α (pairedAlgebraData.charge α f) X)) =
      (-Complex.I) • ∑ α : SpinIndex,
        (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
            (originalHardyTauCore pairedAlgebraData i i α f) X +
          originalHardyTauCore pairedAlgebraData i i α
            (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X) :=
  originalChargeTauCore_sum_eq_kinetic_apply pairedAlgebraData i i f X

example (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α 0) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α 0) X)) = 0 := by
  simp only [map_zero, _root_.zero_apply, add_zero, Finset.sum_const_zero]

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) : FullL2 2 :=
  coreToL2 (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f))

example (i j : SpaceIndex) (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    originalHardyTauCore pairedAlgebraData i j α f X =
      originalHardyTau pairedAlgebraData i j α X (f X) :=
  originalHardyTauCore_apply pairedAlgebraData i j α f X

example (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    pairedAlgebraData.charge α f X =
      (-Complex.I) • OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f X +
        originalPotentialFermion pairedAlgebraData α X (f X) :=
  originalCharge_apply_kinetic_add_potential pairedAlgebraData α f X

#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalKineticDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalKineticDerivative_tauCore_productRule_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalTauCore_kineticDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalKineticTauCore_pair_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalChargeTauCore_pair_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalChargeTauCore_sum_eq_kinetic_apply
#print axioms OAI.BFSSQuantum.AlgebraData.kineticDerivative_pointwise
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_apply
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalBracketTauCore_anticommutator_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCore_coordinateDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_eq_bilinear

end
end FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssemblyIndependentConsumer
