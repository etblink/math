import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D22OriginalGammaTransportedDotRealBilinearity

/-! Independently imported original Gamma9 real bilinearity consumer:
four source-exact type signatures, no new axioms or chosen coordinate frame. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D22Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D22

example (x y z : Fin 4 → ℝ) :
    relationalSourceTransportedDot (x + y) z =
      relationalSourceTransportedDot x z +
        relationalSourceTransportedDot y z :=
  relationalSourceTransportedDot_add_left x y z

example (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot (a • x) y =
      a * relationalSourceTransportedDot x y :=
  relationalSourceTransportedDot_smul_left a x y

example (x y z : Fin 4 → ℝ) :
    relationalSourceTransportedDot x (y + z) =
      relationalSourceTransportedDot x y +
        relationalSourceTransportedDot x z :=
  relationalSourceTransportedDot_add_right x y z

example (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot x (a • y) =
      a * relationalSourceTransportedDot x y :=
  relationalSourceTransportedDot_smul_right a x y

#print axioms FCP.RHOPFP9C3D2G1D22.relationalSourceTransportedDot_add_left
#print axioms FCP.RHOPFP9C3D2G1D22.relationalSourceTransportedDot_smul_left
#print axioms FCP.RHOPFP9C3D2G1D22.relationalSourceTransportedDot_add_right
#print axioms FCP.RHOPFP9C3D2G1D22.relationalSourceTransportedDot_smul_right

end
end FCP.RHOPFP9C3D2G1D22Independent
