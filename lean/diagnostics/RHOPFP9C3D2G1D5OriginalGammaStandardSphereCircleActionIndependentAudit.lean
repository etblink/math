import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D5OriginalGammaStandardSphereCircleAction

/-! Independent original Gamma9 source-action transport consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D5Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D5

example (z : Circle) (u : StandardUnitCoordinates) :
    StandardUnitCoordinates := relationalStandardCircleAction z u

example (u : StandardUnitCoordinates) :
    relationalStandardCircleAction 1 u = u :=
  relationalStandardCircleAction_one u

example (z w : Circle) (u : StandardUnitCoordinates) :
    relationalStandardCircleAction (z * w) u =
      relationalStandardCircleAction z (relationalStandardCircleAction w u) :=
  relationalStandardCircleAction_mul z w u

#print axioms FCP.RHOPFP9C3D2G1D5.relationalStandardCircleAction
#print axioms FCP.RHOPFP9C3D2G1D5.relationalStandardCircleAction_one
#print axioms FCP.RHOPFP9C3D2G1D5.relationalStandardCircleAction_mul

end
end FCP.RHOPFP9C3D2G1D5Independent
