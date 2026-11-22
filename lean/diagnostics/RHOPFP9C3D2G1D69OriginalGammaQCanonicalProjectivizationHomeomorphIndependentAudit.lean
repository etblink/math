import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D69OriginalGammaQCanonicalProjectivizationHomeomorph

/-! Independent imported exact Gamma9 source-Q canonical projectivization consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D69Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D66
open FCP.RHOPFP9C3D2G1D69

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology;
    Quotient relationalSourceQUnitCircleOrbitSetoid ≃ₜ
      Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  relationalSourceQCircleOrbitCanonicalProjectivizationHomeomorph

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology;
    ∀ x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1},
      relationalSourceQCircleOrbitCanonicalProjectivizationHomeomorph
          (relationalSourceQUnitCircleOrbitClass x) =
        relationalStandardUnitSphereProjectivePoint
          (relationalSourceQUnitEuclideanUnitHomeomorph x) :=
  relationalSourceQCircleOrbitCanonicalProjectivizationHomeomorph_class

#print axioms FCP.RHOPFP9C3D2G1D69.relationalSourceQCircleOrbitCanonicalProjectivizationHomeomorph
#print axioms FCP.RHOPFP9C3D2G1D69.relationalSourceQCircleOrbitCanonicalProjectivizationHomeomorph_class

end
end FCP.RHOPFP9C3D2G1D69Independent
