import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D54OriginalGammaQUnitCircleJointContinuity

/-! Independent exact original Gamma9 source-Q unit Circle joint-continuity audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D54Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D54

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    Continuous (fun p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} =>
          relationalSourceQUnitCircleAction p.1 p.2) :=
  relationalSourceQUnitCircleAction_continuous

#print axioms FCP.RHOPFP9C3D2G1D54.relationalSourceQUnitCircleAction_continuous

end
end FCP.RHOPFP9C3D2G1D54Independent
