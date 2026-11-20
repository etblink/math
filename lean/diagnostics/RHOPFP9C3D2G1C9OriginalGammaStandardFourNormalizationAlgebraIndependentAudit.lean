import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C9OriginalGammaStandardFourNormalizationAlgebra

/-! Independently imported standard Euclidean real-four normalization audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C9Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1C9

example (t : ℝ) (x : Fin 4 → ℝ) :
    (t • x) ⬝ᵥ (t • x) = t * (t * (x ⬝ᵥ x)) :=
  standardCoordinateDotSelf_smul t x

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    standardCoordinateRadius x * standardCoordinateRadius x =
      x ⬝ᵥ x :=
  standardCoordinateRadius_mul_self x hx

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    ((standardCoordinateRadius x)⁻¹ • x) ⬝ᵥ
      ((standardCoordinateRadius x)⁻¹ • x) = 1 :=
  standardCoordinateDotSelf_inv_radius_smul x hx

#print axioms FCP.RHOPFP9C3D2G1C9.standardCoordinateDotSelf_smul
#print axioms FCP.RHOPFP9C3D2G1C9.standardCoordinateRadius_mul_self
#print axioms FCP.RHOPFP9C3D2G1C9.standardCoordinateDotSelf_inv_radius_smul

end
end FCP.RHOPFP9C3D2G1C9Independent
