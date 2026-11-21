import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D42OriginalGammaCircleComplexScalarBridge

/-! Independent source-exact Gamma9 Circle to complex scalar consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D42Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D39
open FCP.RHOPFP9C3D2G1D42

example (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourCircleAction z x =
      (z : ℂ) • x :=
  relationalSourceComplexFourCircleAction_eq_smul z x

example (z : Circle) (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf
      (relationalSourceComplexFourCircleAction z x).coordinates =
        relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourCircleAction_preserves_Q z x

example (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm
      (relationalSourceComplexFourCircleAction z x) =
        relationalSourceComplexFourGroupNorm x :=
  relationalSourceComplexFourCircleAction_preserves_groupNorm z x

#print axioms FCP.RHOPFP9C3D2G1D42.relationalSourceComplexFourCircleAction
#print axioms FCP.RHOPFP9C3D2G1D42.relationalSourceComplexFourCircleAction_eq_smul
#print axioms FCP.RHOPFP9C3D2G1D42.relationalSourceComplexFourCircleAction_preserves_Q
#print axioms FCP.RHOPFP9C3D2G1D42.relationalSourceComplexFourCircleAction_preserves_groupNorm

end
end FCP.RHOPFP9C3D2G1D42Independent
