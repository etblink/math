import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D40OriginalGammaSourceQComplexNormedSpace

/-! Independent source-exact imported consumer of detached complex
NormedSpace and Q scaling, with no new global norm instance. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D40Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D39
open FCP.RHOPFP9C3D2G1D40

example :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    NormedSpace ℂ RelationalSourceComplexFour) :=
  relationalSourceComplexFourNormedSpace

example (z : ℂ) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm (z • x) =
      ‖z‖ * relationalSourceComplexFourGroupNorm x :=
  relationalSourceComplexFourGroupNorm_smul z x

example (z : ℂ) (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf (z • x).coordinates =
      ‖z‖ ^ 2 * relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourSourceQ_complex_smul z x

#print axioms FCP.RHOPFP9C3D2G1D40.relationalSourceComplexFourNormedSpace
#print axioms FCP.RHOPFP9C3D2G1D40.relationalSourceComplexFourGroupNorm_smul
#print axioms FCP.RHOPFP9C3D2G1D40.relationalSourceComplexFourSourceQ_complex_smul

end
end FCP.RHOPFP9C3D2G1D40Independent
