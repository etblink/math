import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1AOriginalGammaRelationalRangeUnitSphereEquiv

/-! Independent original-source relational range-sphere type equivalence audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1AIndependent
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1A

example : RelationalUnitSpinor ≃ RelationalRangeUnitSphere :=
  relationalUnitSpinorEquivRange

#print axioms FCP.RHOPFP9C3D2G1A.relationalUnitSpinorEquivRange

end
end FCP.RHOPFP9C3D2G1AIndependent
