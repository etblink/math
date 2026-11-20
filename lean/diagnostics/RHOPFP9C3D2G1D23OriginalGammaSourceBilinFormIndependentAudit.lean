import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D23OriginalGammaSourceBilinForm

/-! Independent imported consumer of a bundled real source bilinear form,
its exact original 16-real-spinor application, symmetry and positive metric. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D23Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D23

example : LinearMap.BilinForm ℝ (Fin 4 → ℝ) :=
  relationalSourceBilinForm

example (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y =
      relationalSourceTransportedDot x y :=
  relationalSourceBilinForm_apply x y

example (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y =
      relationalSourceBilinForm y x :=
  relationalSourceBilinForm_symm x y

example (x : Fin 4 → ℝ) :
    relationalSourceBilinForm x x =
      relationalRangeCoordinateDotSelf x :=
  relationalSourceBilinForm_self_eq_quadratic x

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalSourceBilinForm x x :=
  relationalSourceBilinForm_self_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1D23.relationalSourceBilinForm
#print axioms FCP.RHOPFP9C3D2G1D23.relationalSourceBilinForm_apply
#print axioms FCP.RHOPFP9C3D2G1D23.relationalSourceBilinForm_symm
#print axioms FCP.RHOPFP9C3D2G1D23.relationalSourceBilinForm_self_eq_quadratic
#print axioms FCP.RHOPFP9C3D2G1D23.relationalSourceBilinForm_self_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D23Independent
