import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D20OriginalGammaPolarEqualsTransportedDot

/-! Independently imported source-exact transported Gamma9 dot/polar comparison. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D20Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D19
open FCP.RHOPFP9C3D2G1D20

example (x y : Fin 4 → ℝ) : ℝ :=
  relationalSourceTransportedDot x y

example (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic x y =
      relationalSourceTransportedDot x y :=
  relationalSourcePolarQuadratic_eq_transported_dot x y

#print axioms FCP.RHOPFP9C3D2G1D20.relationalSourceTransportedDot
#print axioms FCP.RHOPFP9C3D2G1D20.relationalSourcePolarQuadratic_eq_transported_dot

end
end FCP.RHOPFP9C3D2G1D20Independent
