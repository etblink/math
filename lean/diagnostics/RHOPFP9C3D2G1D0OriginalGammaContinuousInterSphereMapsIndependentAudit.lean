import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D0OriginalGammaContinuousInterSphereMaps

/-! Independent source-typed consumer for two exact Gamma9/Euclidean sphere maps. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D0Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D0

example (v : StandardUnitCoordinates) : (v.1 : Fin 4 → ℝ) ≠ 0 :=
  standardUnitCoordinates_ne_zero v

example :
    RelationalQUnitCoordinates → StandardUnitCoordinates :=
  relationalQUnitToStandardUnit

example :
    StandardUnitCoordinates → RelationalQUnitCoordinates :=
  standardUnitToRelationalQUnit

example : Continuous relationalQUnitToStandardUnit :=
  relationalQUnitToStandardUnit_continuous

example : Continuous standardUnitToRelationalQUnit :=
  standardUnitToRelationalQUnit_continuous

#print axioms FCP.RHOPFP9C3D2G1D0.standardUnitCoordinates_ne_zero
#print axioms FCP.RHOPFP9C3D2G1D0.relationalQUnitToStandardUnit_continuous
#print axioms FCP.RHOPFP9C3D2G1D0.standardUnitToRelationalQUnit_continuous

end
end FCP.RHOPFP9C3D2G1D0Independent
