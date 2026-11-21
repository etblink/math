import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D54OriginalGammaQUnitCircleJointContinuity

/-!
# RHOPF-P9C3D2G1D55 — original Gamma9 source-Q ContinuousSMul certificate

Accepted D54 proves joint continuity of the actual D49 original
Gamma9 source-Q Circle matrix action. D52 packages that exact same
action as a detached MulAction. This gate proves a locally scoped
ContinuousSMul Circle certificate under the same original source-Q
D38/D40/D41 topology; no global instances or new phase action.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D55
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D52
open FCP.RHOPFP9C3D2G1D54

/-- Source-exact jointly continuous Circle action packaged as a
detached ContinuousSMul certificate; all source-Q topology and
D52 action instances are locally scoped in this proposition. -/
theorem relationalSourceQUnitCircleContinuousSMul :
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
        relationalRangeCoordinateDotSelf x.coordinates = 1} := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  let : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
    relationalSourceQUnitCircleMulAction
  refine ⟨?_⟩
  change Continuous (fun p : Circle ×
    {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} =>
        relationalSourceQUnitCircleAction p.1 p.2)
  exact relationalSourceQUnitCircleAction_continuous

#print axioms relationalSourceQUnitCircleContinuousSMul

end
end FCP.RHOPFP9C3D2G1D55
