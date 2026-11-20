import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D2OriginalGammaInterSphereHomeomorph

/-! Independent original source-typed Gamma9 Q-unit sphere Homeomorph consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D2Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D2

example : RelationalQUnitCoordinates ≃ₜ StandardUnitCoordinates :=
  relationalQUnitHomeomorphStandardUnit

example (v : RelationalQUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit v = relationalQUnitToStandardUnit v :=
  relationalQUnitHomeomorphStandardUnit_apply v

example (v : StandardUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit.symm v = standardUnitToRelationalQUnit v :=
  relationalQUnitHomeomorphStandardUnit_symm_apply v

example (v : RelationalQUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit.symm
      (relationalQUnitHomeomorphStandardUnit v) = v :=
  relationalQUnitHomeomorphStandardUnit.symm_apply_apply v

example (v : StandardUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit
      (relationalQUnitHomeomorphStandardUnit.symm v) = v :=
  relationalQUnitHomeomorphStandardUnit.apply_symm_apply v

#print axioms FCP.RHOPFP9C3D2G1D2.relationalQUnitHomeomorphStandardUnit
#print axioms FCP.RHOPFP9C3D2G1D2.relationalQUnitHomeomorphStandardUnit_apply
#print axioms FCP.RHOPFP9C3D2G1D2.relationalQUnitHomeomorphStandardUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D2Independent
