import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D47OriginalGammaQUnitEuclideanUnitEquiv

/-! Strict independent original Gamma9 Q-unit / Euclidean unit inverse audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D47Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D46
open FCP.RHOPFP9C3D2G1D47

example (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  relationalEuclideanUnitToSourceQUnit y

example :
    {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} ≃
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalSourceQUnitEuclideanUnitEquiv

#print axioms FCP.RHOPFP9C3D2G1D47.relationalEuclideanUnitToSourceQUnit
#print axioms FCP.RHOPFP9C3D2G1D47.relationalSourceQUnitEuclideanUnitEquiv

end
end FCP.RHOPFP9C3D2G1D47Independent
