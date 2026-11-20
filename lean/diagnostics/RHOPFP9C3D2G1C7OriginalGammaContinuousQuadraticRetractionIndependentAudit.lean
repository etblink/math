import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C7OriginalGammaContinuousQuadraticRetraction

/-! Independently imported original Gamma9 source Q-unit continuous retraction audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C7Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C7

example : Continuous relationalRadialNormalize :=
  relationalRadialNormalize_continuous

example : Continuous relationalQUnitIntoNonzero :=
  relationalQUnitIntoNonzero_continuous

example (v : RelationalQUnitCoordinates) :
    relationalRadialNormalize (relationalQUnitIntoNonzero v) = v :=
  relationalRadialNormalize_retract v

#print axioms FCP.RHOPFP9C3D2G1C7.relationalRadialNormalize_continuous
#print axioms FCP.RHOPFP9C3D2G1C7.relationalQUnitIntoNonzero_continuous
#print axioms FCP.RHOPFP9C3D2G1C7.relationalRadialNormalize_retract

end
end FCP.RHOPFP9C3D2G1C7Independent
