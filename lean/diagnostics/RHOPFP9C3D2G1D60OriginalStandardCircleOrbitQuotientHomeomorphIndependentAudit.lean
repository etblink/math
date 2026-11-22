import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D60OriginalStandardCircleOrbitQuotientHomeomorph

/-! Independent source-original Gamma9 to standard Circle topological quotient audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D60Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D60

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    Quotient relationalSourceQUnitCircleOrbitSetoid ≃ₜ
      Quotient relationalEuclideanUnitCircleOrbitSetoid :=
  relationalSourceToStandardOrbitQuotientHomeomorph

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    ∀ x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1},
      relationalSourceToStandardOrbitQuotientHomeomorph
          (relationalSourceQUnitCircleOrbitClass x) =
        relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph x) :=
  relationalSourceToStandardOrbitQuotientHomeomorph_class

#print axioms FCP.RHOPFP9C3D2G1D60.relationalSourceToStandardOrbitQuotientHomeomorph
#print axioms FCP.RHOPFP9C3D2G1D60.relationalSourceToStandardOrbitQuotientHomeomorph_class

end
end FCP.RHOPFP9C3D2G1D60Independent
