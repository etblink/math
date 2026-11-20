import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D14OriginalGammaCirclePreservesQUnit

/-! Independent imported consumer of original Gamma9 Q-isometric Circle action. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D14Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14

example (z : Circle) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (relationalCircleFourAction z x) =
      relationalRangeCoordinateDotSelf x :=
  relationalCircleFourAction_preserves_original_quadratic z x

example (z : Circle) (v : RelationalQUnitCoordinates) :
    RelationalQUnitCoordinates :=
  relationalCircleQUnitAction z v

#print axioms FCP.RHOPFP9C3D2G1D14.relationalCircleFourAction_preserves_original_quadratic
#print axioms FCP.RHOPFP9C3D2G1D14.relationalCircleQUnitAction

end
end FCP.RHOPFP9C3D2G1D14Independent
