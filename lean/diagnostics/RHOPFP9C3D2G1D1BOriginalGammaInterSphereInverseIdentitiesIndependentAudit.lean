import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D1BOriginalGammaInterSphereInverseIdentities

/-! Independent imported original Gamma9/Euclidean unit-sphere inverse audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D1BIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D1B

example (v : StandardUnitCoordinates) :
    standardCoordinateRadius v.1 = 1 :=
  standardCoordinateRadius_eq_one_of_dotSelf_eq_one v

example (v : RelationalQUnitCoordinates) :
    standardUnitToRelationalQUnit (relationalQUnitToStandardUnit v) = v :=
  standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit v

example (v : StandardUnitCoordinates) :
    relationalQUnitToStandardUnit (standardUnitToRelationalQUnit v) = v :=
  relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit v

#print axioms FCP.RHOPFP9C3D2G1D1B.standardCoordinateRadius_eq_one_of_dotSelf_eq_one
#print axioms FCP.RHOPFP9C3D2G1D1B.standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit
#print axioms FCP.RHOPFP9C3D2G1D1B.relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit

end
end FCP.RHOPFP9C3D2G1D1BIndependent
