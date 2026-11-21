import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D45OriginalGammaSourceQOrthonormalRepr

/-! Independent D45 original Gamma9 Q-isometric repr audit. -/
set_option autoImplicit false
namespace FCP.RHOPFP9C3D2G1D45Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D42
open FCP.RHOPFP9C3D2G1D45

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    OrthonormalBasis (Fin 2) ℂ RelationalSourceComplexFour :=
  relationalSourceComplexFourSourceQOrthonormalBasis

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    RelationalSourceComplexFour ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2) :=
  relationalSourceComplexFourSourceQIsometricRepr

example (x : RelationalSourceComplexFour) :
    ‖relationalSourceComplexFourSourceQIsometricRepr x‖ ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourSourceQIsometricRepr_norm_sq x

example (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourSourceQIsometricRepr
      (relationalSourceComplexFourCircleAction z x) =
        (z : ℂ) • relationalSourceComplexFourSourceQIsometricRepr x :=
  relationalSourceComplexFourSourceQIsometricRepr_circle z x

#print axioms FCP.RHOPFP9C3D2G1D45.relationalSourceComplexFourSourceQOrthonormalBasis
#print axioms FCP.RHOPFP9C3D2G1D45.relationalSourceComplexFourSourceQIsometricRepr
#print axioms FCP.RHOPFP9C3D2G1D45.relationalSourceComplexFourSourceQIsometricRepr_norm_sq
#print axioms FCP.RHOPFP9C3D2G1D45.relationalSourceComplexFourSourceQIsometricRepr_circle

end
end FCP.RHOPFP9C3D2G1D45Independent
