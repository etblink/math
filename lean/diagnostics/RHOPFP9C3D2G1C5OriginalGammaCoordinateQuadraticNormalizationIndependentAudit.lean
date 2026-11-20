import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C5OriginalGammaCoordinateQuadraticNormalization

/-! Independent exact source-type consumer for radial quadratic normalization. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C5Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C5

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateRadius x *
      relationalRangeCoordinateRadius x =
        relationalRangeCoordinateDotSelf x :=
  relationalRangeCoordinateRadius_mul_self x hx

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateDotSelf
      ((relationalRangeCoordinateRadius x)⁻¹ • x) = 1 :=
  relationalRangeCoordinateDotSelf_inv_radius_smul x hx

#print axioms FCP.RHOPFP9C3D2G1C5.relationalRangeCoordinateRadius_mul_self
#print axioms FCP.RHOPFP9C3D2G1C5.relationalRangeCoordinateDotSelf_inv_radius_smul

end
end FCP.RHOPFP9C3D2G1C5Independent
