import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D6OriginalGammaStandardSphereCircleFreeAction

/-! Independent source-exact freeness consumer of original Gamma9 action on S³. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D6Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D5
open FCP.RHOPFP9C3D2G1D6

example (z : Circle) (u : StandardUnitCoordinates)
    (hfix : relationalStandardCircleAction z u = u) : z = 1 :=
  relationalStandardCircleAction_fixed_point_implies_one z u hfix

example (z : Circle) (u : StandardUnitCoordinates) (hz : z ≠ 1) :
    relationalStandardCircleAction z u ≠ u :=
  relationalStandardCircleAction_ne_fixed_of_ne_one z u hz

#print axioms FCP.RHOPFP9C3D2G1D6.relationalStandardCircleAction_fixed_point_implies_one
#print axioms FCP.RHOPFP9C3D2G1D6.relationalStandardCircleAction_ne_fixed_of_ne_one

end
end FCP.RHOPFP9C3D2G1D6Independent
