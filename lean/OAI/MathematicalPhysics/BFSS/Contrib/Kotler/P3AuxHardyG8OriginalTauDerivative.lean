import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG7OriginalTauSmoothCore
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG8DerivativeProductRule

/-! HARDY-G8: literal coordinate derivative of original smooth-core tau.
Prospective until full strict source/native qualification. No full charge identity. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG8OriginalTauDerivative
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8DerivativeProductRule

noncomputable def originalHardyTauCoefficientDerivative (M : AlgebraData 2)
    (i j k : SpaceIndex) (B A : ColorIndex 2) (α β : SpinIndex) (X : Boson 2) : ℂ :=
  fderiv ℝ (fun Z : Boson 2 => (originalHardyY M i j Z A α β : ℂ)) X
    (EuclideanSpace.single (k, B) 1)

noncomputable def originalHardyTauDerivative (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex) (X : Boson 2) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  ∑ A : ColorIndex 2, ∑ β : SpinIndex,
    (originalHardyTauCoefficientDerivative M i j k B A α β X) • M.theta β A

theorem originalHardyTauDerivative_apply (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex) (X : Boson 2)
    (v : Fermion 2) :
    originalHardyTauDerivative M i j k B α X v =
      ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        (originalHardyTauCoefficientDerivative M i j k B A α β X) • M.theta β A v := by
  simp only [originalHardyTauDerivative, _root_.sum_apply, IsSMulApply.smul_apply]

theorem originalHardyTauCore_coordinateDerivative_apply (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore M i j α f) X =
      originalHardyTauCore M i j α (coordinateDerivative k B f) X +
        originalHardyTauDerivative M i j k B α X (f X) := by
  simp only [originalHardyTauCore, LinearMap.sum_apply, LinearMap.comp_apply,
    map_sum, _root_.sum_apply, originalFermionMultiplier_derivative_apply,
    fermionAction_apply, AlgebraData.smoothMultiplier_apply, map_smul, originalHardyTauDerivative_apply,
    originalHardyTauCoefficientDerivative, Finset.sum_add_distrib]

theorem originalHardyTauCore_derivative_commutator_apply (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (originalHardyTauCore M i j α f) X -
        originalHardyTauCore M i j α (coordinateDerivative k B f) X =
      originalHardyTauDerivative M i j k B α X (f X) := by
  rw [originalHardyTauCore_coordinateDerivative_apply, add_sub_cancel_left]

theorem originalHardyTauCore_derivative_commutator_zero_at (M : AlgebraData 2)
    (i j k : SpaceIndex) (B : ColorIndex 2) (α : SpinIndex)
    (f : SmoothCore 2) (X : Boson 2) (hf : f X = 0) :
    coordinateDerivative k B (originalHardyTauCore M i j α f) X -
        originalHardyTauCore M i j α (coordinateDerivative k B f) X = 0 := by
  rw [originalHardyTauCore_derivative_commutator_apply, hf]
  exact (originalHardyTauDerivative M i j k B α X).map_zero

#print axioms originalHardyTauCoefficientDerivative
#print axioms originalHardyTauDerivative
#print axioms originalHardyTauDerivative_apply
#print axioms originalHardyTauCore_coordinateDerivative_apply
#print axioms originalHardyTauCore_derivative_commutator_apply
#print axioms originalHardyTauCore_derivative_commutator_zero_at

end
end FCP.BFSSP3AuxHardyG8OriginalTauDerivative
