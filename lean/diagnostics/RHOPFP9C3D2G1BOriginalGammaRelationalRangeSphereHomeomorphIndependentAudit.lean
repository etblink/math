import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1BOriginalGammaRelationalRangeSphereHomeomorph

/-! Independent source-typed audit of original relational sphere homeomorphism. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1BIndependent
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1A
open FCP.RHOPFP9C3D2G1B

example : RelationalUnitSpinor ≃ₜ RelationalRangeUnitSphere :=
  relationalUnitSpinorHomeomorphRange

#print axioms FCP.RHOPFP9C3D2G1B.relationalUnitSpinorHomeomorphRange

end
end FCP.RHOPFP9C3D2G1BIndependent
