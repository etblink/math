import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C1OriginalGammaCoordinateQuadraticPositivity

/-! Independent imported source-type test of transported Gamma9 real dot-self positivity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C1Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateDotSelf x :=
  relationalRangeCoordinateDotSelf_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1C1.relationalRangeCoordinateDotSelf_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C1Independent
