import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D51OriginalGammaQUnitCircleGroupLaws

/-!
# RHOPF-P9C3D2G1D52 — locally installable original Gamma9 Circle MulActions

D49 defined the original source Gamma9 matrix Circle action on its Q-unit
carrier and the ordinary unit-complex scalar action on the standard
unit sphere. D51 strictly established each action's identity and
multiplication laws. Package exactly these functions as detached
`MulAction Circle` values, NOT as global instances.

The action is source-exact: it is not an assumed replacement phase.
No quotient, continuity, Hopf characteristic class or physical BFSS
Fock/Hamiltonian/soliton statement follows here.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D52
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D51

/-- Detached MulAction Circle on the ORIGINAL Gamma9 source-Q unit
sphere, using the same D49 matrix action and D51 laws. -/
@[instance_reducible]
noncomputable def relationalSourceQUnitCircleMulAction :
    MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} where
  smul := relationalSourceQUnitCircleAction
  one_smul := relationalSourceQUnitCircleAction_one
  mul_smul := relationalSourceQUnitCircleAction_mul

/-- Detached MulAction Circle on the standard Euclidean ℂ² unit sphere,
using exactly D49's standard scalar action and D51 laws. -/
@[instance_reducible]
noncomputable def relationalEuclideanUnitCircleMulAction :
    MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} where
  smul := relationalEuclideanUnitCircleAction
  one_smul := relationalEuclideanUnitCircleAction_one
  mul_smul := relationalEuclideanUnitCircleAction_mul

/-- Locally installed original Gamma9 MulAction has exactly the
previously accepted D49 underlying source matrix function. -/
theorem relationalSourceQUnitCircleMulAction_smul_eq
    (z : Circle)
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    letI : MulAction Circle
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} :=
      relationalSourceQUnitCircleMulAction;
    z • x = relationalSourceQUnitCircleAction z x := by
  change relationalSourceQUnitCircleAction z x =
    relationalSourceQUnitCircleAction z x
  rfl

/-- Locally installed standard MulAction has exactly the D49
unit-complex scalar Circle function, without changing global instances. -/
theorem relationalEuclideanUnitCircleMulAction_smul_eq
    (z : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    letI : MulAction Circle
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
      relationalEuclideanUnitCircleMulAction;
    z • y = relationalEuclideanUnitCircleAction z y := by
  change relationalEuclideanUnitCircleAction z y =
    relationalEuclideanUnitCircleAction z y
  rfl

#print axioms relationalSourceQUnitCircleMulAction
#print axioms relationalEuclideanUnitCircleMulAction
#print axioms relationalSourceQUnitCircleMulAction_smul_eq
#print axioms relationalEuclideanUnitCircleMulAction_smul_eq

end
end FCP.RHOPFP9C3D2G1D52
