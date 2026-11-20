import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C8OriginalGammaStandardFourRadiusContinuityPositivity

/-! Independent source-typed audit of the standard four-coordinate Euclidean radius. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C8Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C8

example : Continuous standardCoordinateRadius :=
  standardCoordinateRadius_continuous

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < standardCoordinateRadius x :=
  standardCoordinateRadius_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1C8.standardCoordinateRadius_continuous
#print axioms FCP.RHOPFP9C3D2G1C8.standardCoordinateRadius_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C8Independent
