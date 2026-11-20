import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D14OriginalGammaCirclePreservesQUnit
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2AOriginalGammaCircleVectorAction

/-!
# RHOPF-P9C3D2G1D15 — source-exact Circle identity and composition on Q-unit sphere

D14 constructed the literal original Gamma9 Circle action on the Q-unit
real-four sphere, by restricting the source 16-real-spinor Circle action
through the original projector range and the accepted E equiv.

Prove the native Circle identity and composition laws at three successive
typed carriers: original projector range, noncanonical real-four coordinates,
and Q-unit coordinates. Every proof reduces to accepted D2A original
matrix-vector group laws and the exact conjugation by E.

This does not construct a compatible complex orthonormal frame or prove
the standard Hopf fibration, quotient, Fock lift or physical hopfion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D15
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14

/-- Exact original Gamma9 projector-range Circle action at identity. -/
theorem relationalCircleRangeAction_one
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction 1 v = v := by
  apply Subtype.ext
  change relationalCircleVector 1 v.1 = v.1
  exact relationalCircleVector_one v.1

/-- Exact source group multiplication on the projector range. -/
theorem relationalCircleRangeAction_mul
    (z w : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction (z * w) v =
      relationalCircleRangeAction z (relationalCircleRangeAction w v) := by
  apply Subtype.ext
  change relationalCircleVector (z * w) v.1 =
    relationalCircleVector z (relationalCircleVector w v.1)
  exact relationalCircleVector_mul z w v.1

/-- Native original Gamma9 Circle identity in the accepted real-four coordinates. -/
theorem relationalCircleFourAction_one (x : Fin 4 → ℝ) :
    relationalCircleFourAction 1 x = x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  calc
    relationalCircleFourAction 1 x =
        E (relationalCircleRangeAction 1 (E.symm x)) := by rfl
    _ = E (E.symm x) := by rw [relationalCircleRangeAction_one]
    _ = x := E.apply_symm_apply x

/-- Original source circle group multiplication transported by E to real-four. -/
theorem relationalCircleFourAction_mul (z w : Circle) (x : Fin 4 → ℝ) :
    relationalCircleFourAction (z * w) x =
      relationalCircleFourAction z (relationalCircleFourAction w x) := by
  let E := relationalRangeContinuousLinearEquivFinFour
  change E (relationalCircleRangeAction (z * w) (E.symm x)) =
    E (relationalCircleRangeAction z
      (E.symm (E (relationalCircleRangeAction w (E.symm x)))))
  rw [relationalCircleRangeAction_mul, E.symm_apply_apply]

/-- Original Gamma9 Circle identity on the transported original Q-unit sphere. -/
theorem relationalCircleQUnitAction_one (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction 1 v = v := by
  apply Subtype.ext
  change relationalCircleFourAction 1 v.1 = v.1
  exact relationalCircleFourAction_one v.1

/-- Source-exact Circle composition on the transported original Q-unit sphere. -/
theorem relationalCircleQUnitAction_mul
    (z w : Circle) (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction (z * w) v =
      relationalCircleQUnitAction z (relationalCircleQUnitAction w v) := by
  apply Subtype.ext
  change relationalCircleFourAction (z * w) v.1 =
    relationalCircleFourAction z (relationalCircleFourAction w v.1)
  exact relationalCircleFourAction_mul z w v.1

#print axioms relationalCircleRangeAction_one
#print axioms relationalCircleRangeAction_mul
#print axioms relationalCircleFourAction_one
#print axioms relationalCircleFourAction_mul
#print axioms relationalCircleQUnitAction_one
#print axioms relationalCircleQUnitAction_mul

end
end FCP.RHOPFP9C3D2G1D15
