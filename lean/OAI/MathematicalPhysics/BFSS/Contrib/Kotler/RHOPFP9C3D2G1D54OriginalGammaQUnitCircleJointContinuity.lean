import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D53StandardEuclideanUnitCircleJointContinuity

/-!
# RHOPF-P9C3D2G1D54 — original Gamma9 source-Q Circle joint continuity

Accepted D48 provides a homeomorphism H from the actual source Gamma9
Q-unit sphere to the standard Euclidean complex unit sphere, using only
locally supplied D38/D40/D41 source-Q metric and topology. Accepted
D49 proves H intertwines the ORIGINAL Gamma9 matrix Circle action
with the standard complex scalar Circle action. D53 independently
established the standard action's joint continuity.

This bounded gate transports exactly that continuity to the original
Gamma9 Q-unit carrier, with no globally installed source topology,
no new phase, no quotient, Chern or physical BFSS result.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D54
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D53

/-- The actual ORIGINAL Gamma9 Circle matrix action is jointly
continuous on its original source-Q unit sphere, with precisely
the D48 locally installed original-Q topology (not an alternative
coordinate norm or globally installed topology). -/
theorem relationalSourceQUnitCircleAction_continuous :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    Continuous (fun p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} =>
          relationalSourceQUnitCircleAction p.1 p.2) := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  let H := relationalSourceQUnitEuclideanUnitHomeomorph
  have hInput : Continuous (fun p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} =>
        (p.1, H p.2)) :=
    continuous_fst.prodMk (H.continuous.comp continuous_snd)
  have hStandard : Continuous (fun p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} =>
        relationalEuclideanUnitCircleAction p.1 (H p.2)) :=
    relationalEuclideanUnitCircleAction_continuous.comp hInput
  have hPullback : Continuous (fun p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} =>
        H.symm (relationalEuclideanUnitCircleAction p.1 (H p.2))) :=
    H.symm.continuous.comp hStandard
  have hPoint (p : Circle ×
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1}) :
      H.symm (relationalEuclideanUnitCircleAction p.1 (H p.2)) =
        relationalSourceQUnitCircleAction p.1 p.2 := by
    rw [← relationalSourceQUnitHomeomorph_circle p.1 p.2]
    exact H.symm_apply_apply _
  simpa only [hPoint] using hPullback

#print axioms relationalSourceQUnitCircleAction_continuous

end
end FCP.RHOPFP9C3D2G1D54
