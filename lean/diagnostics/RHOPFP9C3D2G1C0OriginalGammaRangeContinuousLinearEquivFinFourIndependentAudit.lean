import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C0OriginalGammaRangeContinuousLinearEquivFinFour

/-! Independent source-typed audit: exact original projector range continuous R4 model. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C0Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0

example :
    (LinearMap.range (Matrix.toLin' relationalProjector)) ≃L[ℝ]
      (Fin 4 → ℝ) :=
  relationalRangeContinuousLinearEquivFinFour

#print axioms FCP.RHOPFP9C3D2G1C0.relationalRangeContinuousLinearEquivFinFour

end
end FCP.RHOPFP9C3D2G1C0Independent
