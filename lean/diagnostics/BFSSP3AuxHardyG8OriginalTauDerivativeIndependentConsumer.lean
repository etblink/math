import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG8OriginalTauDerivative
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Literal original paired-data derivative controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG8OriginalTauDerivativeIndependentConsumer
noncomputable section
open MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8DerivativeProductRule
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative

example (k : SpaceIndex) (B A : ColorIndex 2) (β : SpinIndex)
    (g : Boson 2 → ℂ) (hg : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) g)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (pairedAlgebraData.fermionAction β A (smoothMultiplier g hg f)) X =
      g X • pairedAlgebraData.theta β A (coordinateDerivative k B f X) +
        (fderiv ℝ g X (EuclideanSpace.single (k, B) 1)) • pairedAlgebraData.theta β A (f X) :=
  originalFermionMultiplier_derivative_apply pairedAlgebraData k B A β g hg f X

example (i j : SpaceIndex) (α : SpinIndex) : SmoothCore 2 →ₗ[ℂ] SmoothCore 2 :=
  originalHardyTauCore pairedAlgebraData i j α

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex) (X : Boson 2) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  originalHardyTauDerivative pairedAlgebraData i j k B α X

example (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) :
    originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α β X =
      fderiv ℝ (fun Z : Boson 2 => (originalHardyY pairedAlgebraData i j Z A α β : ℂ)) X
        (EuclideanSpace.single (k, B) 1) := rfl

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (X : Boson 2) (v : Fermion 2) :
    originalHardyTauDerivative pairedAlgebraData i j k B α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyTauCoefficientDerivative pairedAlgebraData i j k B A α β X) •
          pairedAlgebraData.theta β A v :=
  originalHardyTauDerivative_apply pairedAlgebraData i j k B α X v

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α f) X =
      originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B f) X +
        originalHardyTauDerivative pairedAlgebraData i j k B α X (f X) :=
  originalHardyTauCore_coordinateDerivative_apply pairedAlgebraData i j k B α f X

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α f) X -
        originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B f) X =
      originalHardyTauDerivative pairedAlgebraData i j k B α X (f X) :=
  originalHardyTauCore_derivative_commutator_apply pairedAlgebraData i j k B α f X

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) (hf : f X = 0) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α f) X -
        originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B f) X = 0 :=
  originalHardyTauCore_derivative_commutator_zero_at pairedAlgebraData i j k B α f X hf

example (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f g : SmoothCore 2) (X : Boson 2) (hfg : f X = g X) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α f) X -
        originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B f) X =
      coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i j α g) X -
        originalHardyTauCore pairedAlgebraData i j α (coordinateDerivative k B g) X := by
  rw [originalHardyTauCore_derivative_commutator_apply,
    originalHardyTauCore_derivative_commutator_apply, hfg]

example (k : SpaceIndex) (B A : ColorIndex 2) (β : SpinIndex) :
    (pairedAlgebraData.fermionAction β A).comp (coordinateDerivative k B) =
      (coordinateDerivative k B).comp (pairedAlgebraData.fermionAction β A) :=
  pairedAlgebraData.fermionAction_derivative_commute β A B k

example (i k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore pairedAlgebraData i i α f) X =
      originalHardyTauCore pairedAlgebraData i i α (coordinateDerivative k B f) X +
        originalHardyTauDerivative pairedAlgebraData i i k B α X (f X) :=
  originalHardyTauCore_coordinateDerivative_apply pairedAlgebraData i i k B α f X

example : FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCoefficientDerivative
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauDerivative
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCore_coordinateDerivative_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCore_derivative_commutator_apply
#print axioms FCP.BFSSP3AuxHardyG8OriginalTauDerivative.originalHardyTauCore_derivative_commutator_zero_at
#print axioms OAI.BFSSQuantum.AlgebraData.coordinateDerivative_multiplier
#print axioms OAI.BFSSQuantum.AlgebraData.fermionAction_derivative_commute
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyY_entry_contDiff
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore
#print axioms FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_apply
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply

end
end FCP.BFSSP3AuxHardyG8OriginalTauDerivativeIndependentConsumer
