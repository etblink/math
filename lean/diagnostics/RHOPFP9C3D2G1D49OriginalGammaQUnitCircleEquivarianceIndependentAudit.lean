import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D49OriginalGammaQUnitCircleEquivariance

/-! Independent exact Gamma9 source-Q Circle homeomorphism conjugacy type audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D49Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D49

example (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  relationalSourceQUnitCircleAction z x

example (z : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalEuclideanUnitCircleAction z y

example (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitEuclideanUnitHomeomorph
      (relationalSourceQUnitCircleAction z x) =
      relationalEuclideanUnitCircleAction z
        (relationalSourceQUnitEuclideanUnitHomeomorph x) :=
  relationalSourceQUnitHomeomorph_circle z x

#print axioms FCP.RHOPFP9C3D2G1D49.relationalSourceQUnitCircleAction
#print axioms FCP.RHOPFP9C3D2G1D49.relationalEuclideanUnitCircleAction
#print axioms FCP.RHOPFP9C3D2G1D49.relationalSourceQUnitHomeomorph_circle

end
end FCP.RHOPFP9C3D2G1D49Independent
