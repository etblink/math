import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D4OriginalGammaRelationalStandardSphereHomeomorph

/-! Independent imported consumer of source-original Gamma9 unit sphere ≃ₜ standard S³. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D4Independent
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1B
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D2
open FCP.RHOPFP9C3D2G1D3
open FCP.RHOPFP9C3D2G1D4

example : RelationalUnitSpinor ≃ₜ StandardUnitCoordinates :=
  relationalUnitSpinorHomeomorphStandardUnit

example (v : RelationalUnitSpinor) :
    relationalUnitSpinorHomeomorphStandardUnit v =
      relationalQUnitHomeomorphStandardUnit
        (relationalRangeUnitHomeomorphQUnit
          (relationalUnitSpinorHomeomorphRange v)) :=
  relationalUnitSpinorHomeomorphStandardUnit_apply v

example (v : StandardUnitCoordinates) :
    relationalUnitSpinorHomeomorphStandardUnit.symm v =
      relationalUnitSpinorHomeomorphRange.symm
        (relationalRangeUnitHomeomorphQUnit.symm
          (relationalQUnitHomeomorphStandardUnit.symm v)) :=
  relationalUnitSpinorHomeomorphStandardUnit_symm_apply v

example (v : RelationalUnitSpinor) :
    relationalUnitSpinorHomeomorphStandardUnit.symm
      (relationalUnitSpinorHomeomorphStandardUnit v) = v :=
  relationalUnitSpinorHomeomorphStandardUnit.symm_apply_apply v

example (v : StandardUnitCoordinates) :
    relationalUnitSpinorHomeomorphStandardUnit
      (relationalUnitSpinorHomeomorphStandardUnit.symm v) = v :=
  relationalUnitSpinorHomeomorphStandardUnit.apply_symm_apply v

#print axioms FCP.RHOPFP9C3D2G1D4.relationalUnitSpinorHomeomorphStandardUnit
#print axioms FCP.RHOPFP9C3D2G1D4.relationalUnitSpinorHomeomorphStandardUnit_apply
#print axioms FCP.RHOPFP9C3D2G1D4.relationalUnitSpinorHomeomorphStandardUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D4Independent
