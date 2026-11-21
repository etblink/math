import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D53StandardEuclideanUnitCircleJointContinuity

/-! Independent strict imported D53 unit-circle joint-continuity audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D53Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D52
open FCP.RHOPFP9C3D2G1D53

example :
    Continuous (fun p : Circle ×
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
        relationalEuclideanUnitCircleAction p.1 p.2) :=
  relationalEuclideanUnitCircleAction_continuous

example :
    letI : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
        relationalEuclideanUnitCircleMulAction;
    ContinuousSMul Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalEuclideanUnitCircleContinuousSMul

#print axioms FCP.RHOPFP9C3D2G1D53.relationalEuclideanUnitCircleAction_continuous
#print axioms FCP.RHOPFP9C3D2G1D53.relationalEuclideanUnitCircleContinuousSMul

end
end FCP.RHOPFP9C3D2G1D53Independent
