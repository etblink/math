import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D55OriginalGammaQUnitCircleContinuousSMul

/-! Independent source-original Gamma9 Q-unit ContinuousSMul audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D55Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D52
open FCP.RHOPFP9C3D2G1D55

example :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    letI : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
      relationalSourceQUnitCircleMulAction;
    ContinuousSMul Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  relationalSourceQUnitCircleContinuousSMul

#print axioms FCP.RHOPFP9C3D2G1D55.relationalSourceQUnitCircleContinuousSMul

end
end FCP.RHOPFP9C3D2G1D55Independent
