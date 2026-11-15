import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG14OriginalCoreAnticommutatorCollapse
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! G14: twelve literal actual paired source controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapseIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly
open FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse

example (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      (((if k = j then X (i, B) else 0) -
        (if k = i then X (j, B) else 0) : ℝ) : ℂ) •
          (coordinateDerivative k B f X)) =
      (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) :=
  originalOrbitalCoefficient_sum_apply i j f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex, ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      (originalKineticFermion pairedAlgebraData α k B
          (originalHardyTau pairedAlgebraData i j α X (coordinateDerivative k B f X)) +
        originalHardyTau pairedAlgebraData i j α X
          (originalKineticFermion pairedAlgebraData α k B (coordinateDerivative k B f X)))) = (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) :=
  originalKineticTauCore_orbital_sum_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex, ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      originalKineticFermion pairedAlgebraData α k B
        (originalHardyTauDerivative pairedAlgebraData i j k B α X (f X))) = (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X))) :=
  originalKineticTauCore_derivative_sum_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α)
          (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α
          (OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f) X)) =
      (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X))) :=
  originalKineticTauCore_sum_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) X)) =
      (-Complex.I) • ((∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X)))) :=
  originalChargeTauCore_sum_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) X +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) X)) =
      (∑ B : ColorIndex 2,
        (-Complex.I) • ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) +
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((-Complex.I) * ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ))) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X)) :=
  originalChargeTauCore_sum_distributed_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData i j α f) (0 : Boson 2) +
        originalHardyTauCore pairedAlgebraData i j α (pairedAlgebraData.charge α f) (0 : Boson 2))) =
      (-Complex.I) • ((∑ B : ColorIndex 2,
        (((0 : Boson 2) (i, B) : ℂ) • (coordinateDerivative j B f (0 : Boson 2)) -
          ((0 : Boson 2) (j, B) : ℂ) • (coordinateDerivative i B f (0 : Boson 2)))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f (0 : Boson 2))))) := by
  generalize (0 : Boson 2) = X
  exact originalChargeTauCore_sum_apply pairedAlgebraData i j hij f X

example (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.charge α (originalHardyTauCore pairedAlgebraData j i α f) X +
        originalHardyTauCore pairedAlgebraData j i α (pairedAlgebraData.charge α f) X)) =
      (-Complex.I) • ((∑ B : ColorIndex 2,
        ((X (j, B) : ℂ) • (coordinateDerivative i B f X) -
          (X (i, B) : ℂ) • (coordinateDerivative j B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((pairedAlgebraData.gamma j * pairedAlgebraData.gamma i) β δ : ℂ)) •
          pairedAlgebraData.theta β B (pairedAlgebraData.theta δ B (f X)))) :=
  originalChargeTauCore_sum_apply pairedAlgebraData j i (Ne.symm hij) f X

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

#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalOrbitalCoefficient_sum_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalKineticTauCore_orbital_sum_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalKineticTauCore_derivative_sum_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalKineticTauCore_sum_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalChargeTauCore_sum_apply
#print axioms FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse.originalChargeTauCore_sum_distributed_apply
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator
#print axioms FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR.originalKineticTau_anticommutator_apply
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_eq_bilinear
#print axioms FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear.originalKineticTauDerivativeFermion_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalKineticTauCore_pair_apply
#print axioms FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly.originalChargeTauCore_sum_eq_kinetic_apply

end
end FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapseIndependentConsumer
