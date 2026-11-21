import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D52OriginalGammaQUnitCircleMulActions

/-! Independently consume detached original-Gamma9 and Euclidean Circle actions. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D52Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D52

example : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  relationalSourceQUnitCircleMulAction

example : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalEuclideanUnitCircleMulAction

example (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    letI : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
      relationalSourceQUnitCircleMulAction;
    z • x = relationalSourceQUnitCircleAction z x :=
  relationalSourceQUnitCircleMulAction_smul_eq z x

example (z : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    letI : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
      relationalEuclideanUnitCircleMulAction;
    z • y = relationalEuclideanUnitCircleAction z y :=
  relationalEuclideanUnitCircleMulAction_smul_eq z y

#print axioms FCP.RHOPFP9C3D2G1D52.relationalSourceQUnitCircleMulAction
#print axioms FCP.RHOPFP9C3D2G1D52.relationalEuclideanUnitCircleMulAction
#print axioms FCP.RHOPFP9C3D2G1D52.relationalSourceQUnitCircleMulAction_smul_eq
#print axioms FCP.RHOPFP9C3D2G1D52.relationalEuclideanUnitCircleMulAction_smul_eq

end
end FCP.RHOPFP9C3D2G1D52Independent
