import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F0OriginalGammaCircleQuadraticFormInvariance

/-!
# RHOPF-P9C3D2F1 — source-original relational unit-spinor Circle action

The original BFSS real 16-spinor Gamma9 Circle action already has
strict-qualified projector-image invariance, group identity and
composition laws, and Euclidean dot-self invariance.

Define the source-original relational unit sphere by its exact
projector and real dot-product equations, and restrict the accepted
Circle vector action to it. Verify the identity and composition laws
without inventing a projector basis or a global typeclass instance.

This stage does not establish the sphere is homeomorphic to S³,
package a continuous action, certify freeness on this new subtype,
construct a Hopf quotient, or implement a physical BFSS Fock action.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F1
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2B
open FCP.RHOPFP9C3D2F0

/-- Exact native real Euclidean unit sphere in the original
rank-four relational projector image. -/
abbrev RelationalUnitSpinor : Type :=
  {v : SpinIndex → ℝ //
    relationalProjector.mulVec v = v ∧ v ⬝ᵥ v = 1}

/-- Circle action restricted to the intrinsic original-source
norm-one relational image. -/
noncomputable def relationalUnitCircleAction
    (z : Circle) (v : RelationalUnitSpinor) : RelationalUnitSpinor :=
  ⟨relationalCircleVector z v.1,
    ⟨relationalCircleVector_preserves_projector_image z v.1 v.2.1,
      (relationalCircleVector_dot_self z v.1).trans v.2.2⟩⟩

/-- The original identity phase fixes each relational unit spinor. -/
theorem relationalUnitCircleAction_one (v : RelationalUnitSpinor) :
    relationalUnitCircleAction 1 v = v := by
  apply Subtype.ext
  exact relationalCircleVector_one v.1

/-- The original Circle product acts by composition on the
relational unit sphere. -/
theorem relationalUnitCircleAction_mul
    (z w : Circle) (v : RelationalUnitSpinor) :
    relationalUnitCircleAction (z * w) v =
      relationalUnitCircleAction z (relationalUnitCircleAction w v) := by
  apply Subtype.ext
  exact relationalCircleVector_mul z w v.1

#print axioms relationalUnitCircleAction_one
#print axioms relationalUnitCircleAction_mul

end
end FCP.RHOPFP9C3D2F1
