import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D17OriginalGammaCircleQUnitFreeness

/-! Independent imported consumer of source-exact Gamma9 Q-unit freeness. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D17Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D14
open FCP.RHOPFP9C3D2G1D17

example (z : Circle) (v : RelationalQUnitCoordinates)
    (hfix : relationalCircleQUnitAction z v = v) :
    z = 1 :=
  relationalCircleQUnitAction_fixed_point_implies_one z v hfix

#print axioms FCP.RHOPFP9C3D2G1D17.relationalCircleQUnitAction_fixed_point_implies_one

end
end FCP.RHOPFP9C3D2G1D17Independent
