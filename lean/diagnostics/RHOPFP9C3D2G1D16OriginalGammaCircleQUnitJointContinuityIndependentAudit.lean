import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D16OriginalGammaCircleQUnitJointContinuity

/-! Independent imported consumer of exact original Gamma9 Circle joint continuity
on projector range, real-four coordinates and Q-unit sphere. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D16Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14
open FCP.RHOPFP9C3D2G1D16

example :
    Continuous (fun p : Circle ×
      (LinearMap.range (Matrix.toLin' relationalProjector)) =>
      relationalCircleRangeAction p.1 p.2) :=
  relationalCircleRangeAction_joint_continuous

example :
    Continuous (fun p : Circle × (Fin 4 → ℝ) =>
      relationalCircleFourAction p.1 p.2) :=
  relationalCircleFourAction_joint_continuous

example :
    Continuous (fun p : Circle × RelationalQUnitCoordinates =>
      relationalCircleQUnitAction p.1 p.2) :=
  relationalCircleQUnitAction_joint_continuous

#print axioms FCP.RHOPFP9C3D2G1D16.relationalCircleRangeAction_joint_continuous
#print axioms FCP.RHOPFP9C3D2G1D16.relationalCircleFourAction_joint_continuous
#print axioms FCP.RHOPFP9C3D2G1D16.relationalCircleQUnitAction_joint_continuous

end
end FCP.RHOPFP9C3D2G1D16Independent
