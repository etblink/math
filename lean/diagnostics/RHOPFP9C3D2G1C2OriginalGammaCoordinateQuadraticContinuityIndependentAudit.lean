import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C2OriginalGammaCoordinateQuadraticContinuity

/-! Independently imported continuity consumer for transported source Gamma9 dot-self. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C2Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C2

example : Continuous relationalRangeCoordinateDotSelf :=
  relationalRangeCoordinateDotSelf_continuous

#print axioms FCP.RHOPFP9C3D2G1C2.relationalRangeCoordinateDotSelf_continuous

end
end FCP.RHOPFP9C3D2G1C2Independent
