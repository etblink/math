import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D50OriginalGammaQUnitCircleOrbitCorrespondence
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D15OriginalGammaCircleQUnitGroupLaws

/-!
# RHOPF-P9C3D2G1D51 — original Gamma9 Circle unit-sphere group laws

D15 qualified the original Gamma9 Circle matrix action's identity and
multiplication laws at the original real-four carrier and Q unit level.
D49 restricted this SAME original action to the isolated source Q unit
complex carrier and separately defined the standard scalar action
on EuclideanSpace ℂ (Fin 2)'s unit sphere. D50 qualified orbit relations.

This gate proves identity and group composition for both D49
restricted functions, without yet installing a MulAction instance or
asserting continuity of a jointly parametrized group action, quotient,
Hopf charge, physical Fock dynamics or BFSS soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D51
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D15
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D50

/-- Identity for original Gamma9 source Circle transformation
restricted to the original Q-unit sphere. -/
theorem relationalSourceQUnitCircleAction_one
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleAction 1 x = x := by
  apply Subtype.ext
  apply RelationalSourceComplexFour.ext
  change relationalCircleFourAction 1 x.val.coordinates = x.val.coordinates
  exact relationalCircleFourAction_one x.val.coordinates

/-- Group composition for the *original* source Gamma9 Circle matrix
action, restricted to source-Q unit vectors. -/
theorem relationalSourceQUnitCircleAction_mul
    (z w : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleAction (z * w) x =
      relationalSourceQUnitCircleAction z
        (relationalSourceQUnitCircleAction w x) := by
  apply Subtype.ext
  apply RelationalSourceComplexFour.ext
  change relationalCircleFourAction (z * w) x.val.coordinates =
    relationalCircleFourAction z
      (relationalCircleFourAction w x.val.coordinates)
  exact relationalCircleFourAction_mul z w x.val.coordinates

/-- Identity for the standard complex scalar Circle action
on the unit sphere of EuclideanSpace ℂ (Fin 2). -/
theorem relationalEuclideanUnitCircleAction_one
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleAction 1 y = y := by
  apply Subtype.ext
  change ((1 : Circle) : ℂ) • y.val = y.val
  simp

/-- Group composition for the standard Circle scalar action on S³. -/
theorem relationalEuclideanUnitCircleAction_mul
    (z w : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleAction (z * w) y =
      relationalEuclideanUnitCircleAction z
        (relationalEuclideanUnitCircleAction w y) := by
  apply Subtype.ext
  change (((z * w : Circle) : ℂ) • y.val) =
    ((z : ℂ) • ((w : ℂ) • y.val))
  rw [Circle.coe_mul, mul_smul]

#print axioms relationalSourceQUnitCircleAction_one
#print axioms relationalSourceQUnitCircleAction_mul
#print axioms relationalEuclideanUnitCircleAction_one
#print axioms relationalEuclideanUnitCircleAction_mul

end
end FCP.RHOPFP9C3D2G1D51
