import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D19OriginalGammaPolarQuadraticJInvariant

/-! Independent imported consumer: original Gamma9 transported Q polarization. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D19Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D19

example (x y : Fin 4 → ℝ) : ℝ :=
  relationalSourcePolarQuadratic x y

example (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
        relationalSourcePolarQuadratic x y :=
  relationalSourcePolarQuadratic_J4_invariant x y

#print axioms FCP.RHOPFP9C3D2G1D19.relationalSourcePolarQuadratic
#print axioms FCP.RHOPFP9C3D2G1D19.relationalSourcePolarQuadratic_J4_invariant

end
end FCP.RHOPFP9C3D2G1D19Independent
