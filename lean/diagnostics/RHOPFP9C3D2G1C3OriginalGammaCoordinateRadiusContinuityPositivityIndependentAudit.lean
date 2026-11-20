import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C3OriginalGammaCoordinateRadiusContinuityPositivity

/-! Independent imported source-type witness for the original Gamma9 radius. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C3Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C3

example : Continuous relationalRangeCoordinateRadius :=
  relationalRangeCoordinateRadius_continuous

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateRadius x :=
  relationalRangeCoordinateRadius_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1C3.relationalRangeCoordinateRadius_continuous
#print axioms FCP.RHOPFP9C3D2G1C3.relationalRangeCoordinateRadius_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C3Independent
