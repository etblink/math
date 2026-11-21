import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D48OriginalGammaQUnitEuclideanUnitHomeomorph

/-!
# RHOPF-P9C3D2G1D49 — original Gamma9 Circle action conjugated on Q-unit sphere

D42 constructs the actual original Gamma9 Circle matrix action on
the isolated D31 complex carrier and proves source Q preservation.
D45 proves the SAME action intertwines complex scalar multiplication
under the original-Q complex isometry, and D48 upgrades the restricted
isometry to a source-Q-topology homeomorphism.

This gate restricts both actual actions to their corresponding unit
spheres and proves exact conjugacy by the D48 homeomorphism.
No alternative source phase, global metric/topology or Hopf quotient.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D49
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D42
open FCP.RHOPFP9C3D2G1D45
open FCP.RHOPFP9C3D2G1D46
open FCP.RHOPFP9C3D2G1D48

/-- Restriction of the real original Gamma9 Circle matrix action to
the original source-Q unit level, with no invented phase action. -/
noncomputable def relationalSourceQUnitCircleAction
    (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  ⟨relationalSourceComplexFourCircleAction z x.val, by
    rw [relationalSourceComplexFourCircleAction_preserves_Q]
    exact x.property⟩

/-- Standard unit-complex scalar action on the usual norm-one subset
of EuclideanSpace ℂ (Fin 2), preserving the Euclidean unit norm. -/
noncomputable def relationalEuclideanUnitCircleAction
    (z : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  ⟨(z : ℂ) • y.val, by
    simpa only [norm_smul, Circle.norm_coe, one_mul] using y.property⟩

/-- The D48 original Gamma9 source-Q sphere homeomorphism conjugates
the ACTUAL source matrix Circle action to the STANDARD complex scalar
Circle action, pointwise on the two original unit-sphere subtypes. -/
theorem relationalSourceQUnitHomeomorph_circle
    (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitEuclideanUnitHomeomorph
      (relationalSourceQUnitCircleAction z x) =
      relationalEuclideanUnitCircleAction z
        (relationalSourceQUnitEuclideanUnitHomeomorph x) := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  apply Subtype.ext
  change relationalSourceComplexFourSourceQIsometricRepr
      (relationalSourceComplexFourCircleAction z x.val) =
        (z : ℂ) • relationalSourceComplexFourSourceQIsometricRepr x.val
  exact relationalSourceComplexFourSourceQIsometricRepr_circle z x.val

#print axioms relationalSourceQUnitCircleAction
#print axioms relationalEuclideanUnitCircleAction
#print axioms relationalSourceQUnitHomeomorph_circle

end
end FCP.RHOPFP9C3D2G1D49
