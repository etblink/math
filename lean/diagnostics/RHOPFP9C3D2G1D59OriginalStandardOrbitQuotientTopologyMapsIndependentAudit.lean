import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D59OriginalStandardOrbitQuotientTopologyMaps

/-! Independent exact original Gamma9 and standard orbit quotient map audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D59Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D59

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    IsQuotientMap (relationalSourceQUnitCircleOrbitClass :
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} →
        Quotient relationalSourceQUnitCircleOrbitSetoid) :=
  relationalSourceQUnitCircleOrbitClass_isQuotientMap

example :
    IsQuotientMap (relationalEuclideanUnitCircleOrbitClass :
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} →
        Quotient relationalEuclideanUnitCircleOrbitSetoid) :=
  relationalEuclideanUnitCircleOrbitClass_isQuotientMap

#print axioms FCP.RHOPFP9C3D2G1D59.relationalSourceQUnitCircleOrbitClass_isQuotientMap
#print axioms FCP.RHOPFP9C3D2G1D59.relationalEuclideanUnitCircleOrbitClass_isQuotientMap

end
end FCP.RHOPFP9C3D2G1D59Independent
