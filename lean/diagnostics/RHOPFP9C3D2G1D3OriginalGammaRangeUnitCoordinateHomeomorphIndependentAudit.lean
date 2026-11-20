import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D3OriginalGammaRangeUnitCoordinateHomeomorph

/-! Independent source-exact unit-range to Q-coordinate Homeomorph consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D3Independent
noncomputable section

open FCP.RHOPFP9C3D2G1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D3

example : RelationalRangeUnitSphere ≃ₜ RelationalQUnitCoordinates :=
  relationalRangeUnitHomeomorphQUnit

example (v : RelationalRangeUnitSphere) :
    (relationalRangeUnitHomeomorphQUnit v).1 =
      relationalRangeContinuousLinearEquivFinFour v.1 :=
  relationalRangeUnitHomeomorphQUnit_apply v

example (v : RelationalQUnitCoordinates) :
    (relationalRangeUnitHomeomorphQUnit.symm v).1 =
      relationalRangeContinuousLinearEquivFinFour.symm v.1 :=
  relationalRangeUnitHomeomorphQUnit_symm_apply v

example (v : RelationalRangeUnitSphere) :
    relationalRangeUnitHomeomorphQUnit.symm
      (relationalRangeUnitHomeomorphQUnit v) = v :=
  relationalRangeUnitHomeomorphQUnit.symm_apply_apply v

example (v : RelationalQUnitCoordinates) :
    relationalRangeUnitHomeomorphQUnit
      (relationalRangeUnitHomeomorphQUnit.symm v) = v :=
  relationalRangeUnitHomeomorphQUnit.apply_symm_apply v

#print axioms FCP.RHOPFP9C3D2G1D3.relationalRangeUnitHomeomorphQUnit
#print axioms FCP.RHOPFP9C3D2G1D3.relationalRangeUnitHomeomorphQUnit_apply
#print axioms FCP.RHOPFP9C3D2G1D3.relationalRangeUnitHomeomorphQUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D3Independent
