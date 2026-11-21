import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D48OriginalGammaQUnitEuclideanUnitHomeomorph

/-! Independent D48 source-Q locally topologized homeomorphism consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D48Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} ≃ₜ
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalSourceQUnitEuclideanUnitHomeomorph

#print axioms FCP.RHOPFP9C3D2G1D48.relationalSourceQUnitEuclideanUnitHomeomorph

end
end FCP.RHOPFP9C3D2G1D48Independent
