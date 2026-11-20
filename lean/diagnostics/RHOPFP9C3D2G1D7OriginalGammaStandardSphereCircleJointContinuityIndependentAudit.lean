import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D7OriginalGammaStandardSphereCircleJointContinuity

/-! Independently imported consumer of the original Gamma9 standard-S³ circle-action joint continuity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D7Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D5
open FCP.RHOPFP9C3D2G1D7

example : Continuous (fun p : Circle × StandardUnitCoordinates =>
    relationalStandardCircleAction p.1 p.2) :=
  relationalStandardCircleAction_joint_continuous

#print axioms FCP.RHOPFP9C3D2G1D7.relationalStandardCircleAction_joint_continuous

end
end FCP.RHOPFP9C3D2G1D7Independent
