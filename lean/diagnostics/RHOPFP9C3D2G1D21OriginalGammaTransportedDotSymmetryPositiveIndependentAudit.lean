import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D21OriginalGammaTransportedDotSymmetryPositive

/-! Independent imported consumer of source-exact Gamma9 transported
real-four dot symmetry and positive-definite diagonal. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D21Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D21

example (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot x y =
      relationalSourceTransportedDot y x :=
  relationalSourceTransportedDot_symm x y

example (x : Fin 4 → ℝ) :
    relationalSourceTransportedDot x x =
      relationalRangeCoordinateDotSelf x :=
  relationalSourceTransportedDot_self_eq_quadratic x

example (x : Fin 4 → ℝ) :
    0 ≤ relationalSourceTransportedDot x x :=
  relationalSourceTransportedDot_self_nonneg x

example (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalSourceTransportedDot x x :=
  relationalSourceTransportedDot_self_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1D21.relationalSourceTransportedDot_symm
#print axioms FCP.RHOPFP9C3D2G1D21.relationalSourceTransportedDot_self_eq_quadratic
#print axioms FCP.RHOPFP9C3D2G1D21.relationalSourceTransportedDot_self_nonneg
#print axioms FCP.RHOPFP9C3D2G1D21.relationalSourceTransportedDot_self_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D21Independent
