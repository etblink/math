import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F4OriginalGammaRelationalUnitCircleJointContinuity

/-! Independent exact original-source relational unit Circle joint continuity audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F4Independent

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2F4

example :
    Continuous (fun p : Circle × RelationalUnitSpinor =>
      relationalUnitCircleAction p.1 p.2) :=
  relationalUnitCircleAction_joint_continuous

#print axioms FCP.RHOPFP9C3D2F4.relationalUnitCircleAction_joint_continuous

end FCP.RHOPFP9C3D2F4Independent
