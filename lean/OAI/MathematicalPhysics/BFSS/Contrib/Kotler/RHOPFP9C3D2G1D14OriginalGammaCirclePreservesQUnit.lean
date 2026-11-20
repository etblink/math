import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D13OriginalGammaCircleActionFinFourPhase
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F0OriginalGammaCircleQuadraticFormInvariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C7OriginalGammaContinuousQuadraticRetraction

/-!
# RHOPF-P9C3D2G1D14 — original Gamma9 Circle action preserves Q on real-four

G1D13 defines a genuine source-original Gamma9 Circle action
on Fin 4 → ℝ by conjugation through the already accepted
noncanonical linear equivalence E. D2F0 proves the native original
16-real-spinor Euclidean norm preservation under the Circle action.

These imply that the actual transported circle action preserves
Q(x)=dot(E⁻¹ x, E⁻¹ x), and so acts on the Q-unit level set.

No alternative Gamma9 tables or substitution of a postulated
complex phase action; no standard Hopf-equivariance, quotient,
physical 48-Majorana Fock/Hamiltonian or soliton claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D14
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F0
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13

/-- The source-original Gamma9 circle action in the exact
accepted real-four model preserves the transported original
Euclidean quadratic form Q (not necessarily ordinary R4 dot-self). -/
theorem relationalCircleFourAction_preserves_original_quadratic
    (z : Circle) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (relationalCircleFourAction z x) =
      relationalRangeCoordinateDotSelf x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  let w : LinearMap.range (Matrix.toLin' relationalProjector) := E.symm x
  have hpre : E.symm (relationalCircleFourAction z x) =
      relationalCircleRangeAction z w := by
    change E.symm (E (relationalCircleRangeAction z (E.symm x))) =
      relationalCircleRangeAction z w
    rw [E.symm_apply_apply]
  change (E.symm (relationalCircleFourAction z x)).1 ⬝ᵥ
      (E.symm (relationalCircleFourAction z x)).1 = w.1 ⬝ᵥ w.1
  rw [hpre]
  change (relationalCircleVector z w.1) ⬝ᵥ
    (relationalCircleVector z w.1) = w.1 ⬝ᵥ w.1
  exact relationalCircleVector_dot_self z w.1

/-- Restrict the actual original Gamma9 transported circle action
to the accepted Q-unit sphere in noncanonical real-four coordinates. -/
noncomputable def relationalCircleQUnitAction
    (z : Circle) (v : RelationalQUnitCoordinates) :
    RelationalQUnitCoordinates :=
  ⟨relationalCircleFourAction z v.1,
    (relationalCircleFourAction_preserves_original_quadratic z v.1).trans v.2⟩

#print axioms relationalCircleFourAction_preserves_original_quadratic
#print axioms relationalCircleQUnitAction

end
end FCP.RHOPFP9C3D2G1D14
