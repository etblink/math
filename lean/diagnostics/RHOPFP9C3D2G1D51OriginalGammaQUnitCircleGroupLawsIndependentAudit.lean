import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D51OriginalGammaQUnitCircleGroupLaws

/-! Independent exact original Gamma9 Circle unit-sphere group laws audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D51Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D51

example (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleAction 1 x = x :=
  relationalSourceQUnitCircleAction_one x

example (z w : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleAction (z * w) x =
      relationalSourceQUnitCircleAction z
        (relationalSourceQUnitCircleAction w x) :=
  relationalSourceQUnitCircleAction_mul z w x

example (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleAction 1 y = y :=
  relationalEuclideanUnitCircleAction_one y

example (z w : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleAction (z * w) y =
      relationalEuclideanUnitCircleAction z
        (relationalEuclideanUnitCircleAction w y) :=
  relationalEuclideanUnitCircleAction_mul z w y

#print axioms FCP.RHOPFP9C3D2G1D51.relationalSourceQUnitCircleAction_one
#print axioms FCP.RHOPFP9C3D2G1D51.relationalSourceQUnitCircleAction_mul
#print axioms FCP.RHOPFP9C3D2G1D51.relationalEuclideanUnitCircleAction_one
#print axioms FCP.RHOPFP9C3D2G1D51.relationalEuclideanUnitCircleAction_mul

end
end FCP.RHOPFP9C3D2G1D51Independent
