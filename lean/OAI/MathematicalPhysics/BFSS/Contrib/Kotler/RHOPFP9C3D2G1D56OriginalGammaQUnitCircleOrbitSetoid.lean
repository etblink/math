import Mathlib.Tactic
import Mathlib.GroupTheory.GroupAction.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D55OriginalGammaQUnitCircleContinuousSMul

/-!
# RHOPF-P9C3D2G1D56 — original Gamma9 Circle orbit Setoid and set quotient

D50 proved the original Gamma9 Circle witness relation on its source-Q
unit sphere. D52 supplied the SAME source Gamma9 matrix Circle MulAction;
D55 certified that action as continuous for the original source-Q topology.

This bounded gate constructs Mathlib's actual MulAction.orbitRel Setoid,
its bare set quotient and a quotient-class constructor, then proves
they identify exactly D50's original Gamma9 witness relation. This is
not yet a topological quotient homeomorphism, CP¹/S² Hopf identification,
characteristic class, or physical BFSS soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D56
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D52

/-- Mathlib's exact Circle orbit equivalence relation of the
original Gamma9 source-Q unit-sphere matrix action, using the
locally installed D52 structure rather than a replacement phase. -/
noncomputable def relationalSourceQUnitCircleOrbitSetoid :
    Setoid {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  letI : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
    relationalSourceQUnitCircleMulAction
  MulAction.orbitRel Circle _

/-- Canonical class of an original Gamma9 source-Q unit vector in
the SET quotient by the exact Circle-orbit Setoid.
No topological quotient homeomorphism is claimed. -/
noncomputable def relationalSourceQUnitCircleOrbitClass
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    Quotient relationalSourceQUnitCircleOrbitSetoid :=
  Quotient.mk _ x

/-- The source-exact D50 forward-orbit reachability proposition is
identical to Mathlib's orbit Setoid, up to the orientation that is
symmetrical for a genuine group action. -/
theorem relationalSourceQUnitCircleRelated_iff_orbitSetoid
    (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalSourceQUnitCircleOrbitSetoid x y := by
  let : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
    relationalSourceQUnitCircleMulAction
  change (∃ z : Circle, z • x = y) ↔
    x ∈ MulAction.orbit Circle y
  exact (MulAction.mem_orbit_symm (a₁ := x) (a₂ := y)).symm

/-- Two exact source-Q Gamma9 vectors have the same quotient class
if and only if an ORIGINAL source Gamma9 Circle transformation
takes one to the other. This is an equality of SET-quotient classes. -/
theorem relationalSourceQUnitCircleRelated_iff_orbitClass_eq
    (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalSourceQUnitCircleOrbitClass x =
        relationalSourceQUnitCircleOrbitClass y := by
  change relationalSourceQUnitCircleRelated x y ↔
    (Quotient.mk relationalSourceQUnitCircleOrbitSetoid x =
      Quotient.mk relationalSourceQUnitCircleOrbitSetoid y)
  exact (relationalSourceQUnitCircleRelated_iff_orbitSetoid x y).trans
    (Quotient.eq).symm

#print axioms relationalSourceQUnitCircleOrbitSetoid
#print axioms relationalSourceQUnitCircleOrbitClass
#print axioms relationalSourceQUnitCircleRelated_iff_orbitSetoid
#print axioms relationalSourceQUnitCircleRelated_iff_orbitClass_eq

end
end FCP.RHOPFP9C3D2G1D56
