import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F3OriginalGammaCircleVectorJointContinuity

/-! Independent source-original Circle action joint continuity audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F3Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F3

example :
    Continuous (fun p : Circle × (SpinIndex → ℝ) =>
      relationalCircleVector p.1 p.2) :=
  relationalCircleVector_joint_continuous

#print axioms FCP.RHOPFP9C3D2F3.relationalCircleVector_joint_continuous

end FCP.RHOPFP9C3D2F3Independent
