import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D46OriginalGammaQUnitEuclideanUnitBoundary

/-! Independent D46 source-Q-unit to standard Euclidean unit boundary audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D46Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D45
open FCP.RHOPFP9C3D2G1D46

example (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf x.coordinates = 1 ↔
      ‖relationalSourceComplexFourSourceQIsometricRepr x‖ = 1 :=
  relationalSourceQUnit_iff_euclideanUnit x

example (x : {x : RelationalSourceComplexFour //
    relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalSourceQUnitToEuclideanUnit x

#print axioms FCP.RHOPFP9C3D2G1D46.relationalSourceQUnit_iff_euclideanUnit
#print axioms FCP.RHOPFP9C3D2G1D46.relationalSourceQUnitToEuclideanUnit

end
end FCP.RHOPFP9C3D2G1D46Independent
