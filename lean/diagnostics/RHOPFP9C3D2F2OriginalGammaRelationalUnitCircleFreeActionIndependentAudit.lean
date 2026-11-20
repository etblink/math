import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F2OriginalGammaRelationalUnitCircleFreeAction

/-! Independent exact source-relational unit Circle trivial stabilizer audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F2Independent

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2F2

example (z : Circle) (v : RelationalUnitSpinor)
    (hfix : relationalUnitCircleAction z v = v) :
    z = 1 :=
  relationalUnitCircleAction_fixed_point_implies_one z v hfix

#print axioms FCP.RHOPFP9C3D2F2.relationalUnitCircleAction_fixed_point_implies_one

end FCP.RHOPFP9C3D2F2Independent
