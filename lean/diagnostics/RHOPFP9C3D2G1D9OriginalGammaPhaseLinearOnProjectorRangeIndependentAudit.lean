import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D9OriginalGammaPhaseLinearOnProjectorRange

/-! Independent imported consumer of original Gamma9 J as a linear complex structure. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D9Independent
noncomputable section

open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1D9

example :
    (LinearMap.range (Matrix.toLin' relationalProjector)) →ₗ[ℝ]
    (LinearMap.range (Matrix.toLin' relationalProjector)) :=
  relationalPhaseJRangeLinear

example (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalPhaseJRangeLinear (relationalPhaseJRangeLinear v) = -v :=
  relationalPhaseJRangeLinear_square v

#print axioms FCP.RHOPFP9C3D2G1D9.relationalPhaseJRangeLinear
#print axioms FCP.RHOPFP9C3D2G1D9.relationalPhaseJRangeLinear_square

end
end FCP.RHOPFP9C3D2G1D9Independent
