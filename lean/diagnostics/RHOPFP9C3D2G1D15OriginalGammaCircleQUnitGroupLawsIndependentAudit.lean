import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D15OriginalGammaCircleQUnitGroupLaws

/-! Independent imported consumer of source-exact original Gamma9 Circle
laws on the original projector range, real-four, and Q-unit carrier. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D15Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14
open FCP.RHOPFP9C3D2G1D15

example (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction 1 v = v :=
  relationalCircleRangeAction_one v

example (z w : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction (z * w) v =
      relationalCircleRangeAction z (relationalCircleRangeAction w v) :=
  relationalCircleRangeAction_mul z w v

example (x : Fin 4 → ℝ) : relationalCircleFourAction 1 x = x :=
  relationalCircleFourAction_one x

example (z w : Circle) (x : Fin 4 → ℝ) :
    relationalCircleFourAction (z * w) x =
      relationalCircleFourAction z (relationalCircleFourAction w x) :=
  relationalCircleFourAction_mul z w x

example (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction 1 v = v :=
  relationalCircleQUnitAction_one v

example (z w : Circle) (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction (z * w) v =
      relationalCircleQUnitAction z (relationalCircleQUnitAction w v) :=
  relationalCircleQUnitAction_mul z w v

#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleRangeAction_one
#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleRangeAction_mul
#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleFourAction_one
#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleFourAction_mul
#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleQUnitAction_one
#print axioms FCP.RHOPFP9C3D2G1D15.relationalCircleQUnitAction_mul

end
end FCP.RHOPFP9C3D2G1D15Independent
