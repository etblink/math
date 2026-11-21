import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D40OriginalGammaSourceQComplexNormedSpace

/-!
# RHOPF-P9C3D2G1D41 — detached full Gamma9 source-Q complex InnerProductSpace

Use D37 original-Gamma9 Hermitian Core, D38 source normed group,
D39 norm-Q coherence and D40 detached complex NormedSpace to build
an isolated full InnerProductSpace ℂ value through pinned Mathlib
InnerProductSpace.ofCore. Test that its inner is exactly the original
source Hermitian and its squared norm is the original source Q.

No global instance, substitute Euclidean metric, C² frame,
Hopf quotient/Chern charge or physical BFSS dynamics is asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D41
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D37
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D39
open FCP.RHOPFP9C3D2G1D40

/-- Full complex inner-product bundle assembled ONLY as a detached
value under the exact source-Q normed group and complex NormedSpace. -/
@[instance_reducible]
noncomputable def relationalSourceComplexFourInnerProductSpace :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    InnerProductSpace ℂ RelationalSourceComplexFour := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  letI : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  letI : InnerProductSpace.Core ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductCore
  exact InnerProductSpace.ofCore
    (𝕜 := ℂ) (F := RelationalSourceComplexFour)
    relationalSourceComplexFourInnerProductCore.toPreInnerProductSpaceCore

/-- The packaged full inner product is still the original Gamma9
Hermitian H, with Mathlib's conjugate-linear-first convention. -/
theorem relationalSourceComplexFourInnerProductSpace_inner
    (x y : RelationalSourceComplexFour) :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    inner ℂ x y) = relationalSourceComplexFourHermitian y x := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  rfl

/-- The actual norm carried by the detached full complex
InnerProductSpace squares to the transported original Gamma9 Q. -/
theorem relationalSourceComplexFourInnerProductSpace_norm_sq
    (x : RelationalSourceComplexFour) :
    (letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    ‖x‖ ^ 2) = relationalRangeCoordinateDotSelf x.coordinates := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  change relationalSourceComplexFourGroupNorm x ^ 2 =
    relationalRangeCoordinateDotSelf x.coordinates
  exact relationalSourceComplexFourGroupNorm_sq x

#print axioms relationalSourceComplexFourInnerProductSpace
#print axioms relationalSourceComplexFourInnerProductSpace_inner
#print axioms relationalSourceComplexFourInnerProductSpace_norm_sq

end
end FCP.RHOPFP9C3D2G1D41
