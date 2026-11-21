import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D41OriginalGammaSourceQComplexInnerProductSpace

/-! Independent D41 imported consumer of detached full complex
InnerProductSpace ℂ, original source Hermitian and source-Q norm. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D41Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41

example :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    InnerProductSpace ℂ RelationalSourceComplexFour) :=
  relationalSourceComplexFourInnerProductSpace

example (x y : RelationalSourceComplexFour) :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    inner ℂ x y) = relationalSourceComplexFourHermitian y x :=
  relationalSourceComplexFourInnerProductSpace_inner x y

example (x : RelationalSourceComplexFour) :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    ‖x‖ ^ 2) = relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourInnerProductSpace_norm_sq x

#print axioms FCP.RHOPFP9C3D2G1D41.relationalSourceComplexFourInnerProductSpace
#print axioms FCP.RHOPFP9C3D2G1D41.relationalSourceComplexFourInnerProductSpace_inner
#print axioms FCP.RHOPFP9C3D2G1D41.relationalSourceComplexFourInnerProductSpace_norm_sq

end
end FCP.RHOPFP9C3D2G1D41Independent
