import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG9OriginalYEntryDerivativeBinding
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Twelve literal original paired-data entry derivative controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBindingIndependentConsumer
noncomputable section
open MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding

example (i j : SpaceIndex) (A : ColorIndex 2) (α β : SpinIndex) :
    Boson 2 →L[ℝ] ℂ := originalHardyYEntryCLM pairedAlgebraData i j A α β

example (i j : SpaceIndex) (A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyYEntryCLM pairedAlgebraData i j A α β X =
      (originalHardyY pairedAlgebraData i j X A α β : ℂ) :=
  originalHardyYEntryCLM_apply pairedAlgebraData i j A α β X

example (i j : SpaceIndex) (A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => (originalHardyY pairedAlgebraData i j Z A α β : ℂ)) X =
      originalHardyYEntryCLM pairedAlgebraData i j A α β :=
  originalHardyY_entry_fderiv pairedAlgebraData i j A α β X

example (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α β X =
      (originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) :=
  originalHardyTauCoefficientDerivative_eq_basis pairedAlgebraData i j k B A α β X

example (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X Z : Boson 2) :
    originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α β X =
      originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α β Z :=
  originalHardyTauCoefficientDerivative_independent_point pairedAlgebraData i j k B A α β X Z

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex) (X : Boson 2) :
    originalHardyTauDerivative pairedAlgebraData i j k B α X =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) •
          pairedAlgebraData.theta β A :=
  originalHardyTauDerivative_eq_basis pairedAlgebraData i j k B α X

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (X : Boson 2) (v : Fermion 2) :
    originalHardyTauDerivative pairedAlgebraData i j k B α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) •
          pairedAlgebraData.theta β A v := by
  rw [originalHardyTauDerivative_apply]
  simp_rw [originalHardyTauCoefficientDerivative_eq_basis]

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α f) X =
      originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B f) X +
        (∑ A : ColorIndex 2, ∑ β : SpinIndex,
          (originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, B) 1) A α β : ℂ) •
            pairedAlgebraData.theta β A) (f X) := by
  rw [originalHardyTauCore_coordinateDerivative_apply, originalHardyTauDerivative_eq_basis]

example (i j : SpaceIndex) (A : ColorIndex 2) (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData i j Z A) X =
      originalHardyYCLM pairedAlgebraData i j A :=
  originalHardyY_fderiv pairedAlgebraData i j A X

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) (X : Boson 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData i j Z A) X
        (EuclideanSpace.single (k, A) 1))) =
      (1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) :=
  originalHardyY_derivative_contraction pairedAlgebraData i j hij A X

example (i k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyTauCoefficientDerivative pairedAlgebraData i i k B A α β X =
      (originalHardyY pairedAlgebraData i i (EuclideanSpace.single (k, B) 1) A α β : ℂ) :=
  originalHardyTauCoefficientDerivative_eq_basis pairedAlgebraData i i k B A α β X

example : FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyYEntryCLM
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyYEntryCLM_apply
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyY_entry_fderiv
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauCoefficientDerivative_eq_basis
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauCoefficientDerivative_independent_point
#print axioms FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding.originalHardyTauDerivative_eq_basis
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_fderiv
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_derivative_contraction
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCoefficientDerivative
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCore_coordinateDerivative_apply

end
end FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBindingIndependentConsumer
