import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68BNonzeroUnitNormalizationContinuity

/-! Independent imported consumer of original exact normalization continuity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68BIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1D68A
open FCP.RHOPFP9C3D2G1D68B

example : Continuous relationalCanonicalNonzeroUnitNormalization :=
  relationalCanonicalNonzeroUnitNormalization_continuous

#print axioms FCP.RHOPFP9C3D2G1D68B.relationalCanonicalNonzeroUnitNormalization_continuous

end
end FCP.RHOPFP9C3D2G1D68BIndependent
