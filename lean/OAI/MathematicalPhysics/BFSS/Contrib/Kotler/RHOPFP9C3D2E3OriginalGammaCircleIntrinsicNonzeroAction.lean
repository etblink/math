import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E2OriginalGammaCirclePreservesNonzeroProjectorImage

/-!
# RHOPF-P9C3D2E3 — intrinsic nonzero original Gamma9 relational sector

The original 16-real-spinor Circle action has strict-qualified
identity/composition, P-image invariance, nonzero-vector preservation,
and the nonidentity fixed-point exclusion on nonzero P-image spinors.

Define the intrinsic subtype of nonzero vectors in the exact
source-original rank-four projector image, and package the original
Circle action as a function on this subtype. Prove identity,
composition, and trivial point stabilizers without introducing
a global typeclass instance or synthetic Gamma9 basis.

This is a purely algebraic action on a subtype; it is not yet
a continuous free action on the unit sphere or a Hopf quotient,
nor a physical 48-Majorana Fock-space implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E3
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2E1
open FCP.RHOPFP9C3D2E2

/-- Original nonzero real spinors supported on the exact
Gamma9 rank-four relational projector P. -/
abbrev RelationalNonzeroSpinor : Type :=
  {v : SpinIndex → ℝ // relationalProjector.mulVec v = v ∧ v ≠ 0}

/-- Restrict the accepted original source Circle action to the
intrinsic nonzero relational projector-image subtype. -/
noncomputable def relationalNonzeroCircleAction
    (z : Circle) (v : RelationalNonzeroSpinor) : RelationalNonzeroSpinor :=
  ⟨relationalCircleVector z v.1,
    relationalCircleVector_preserves_nonzero_projector_image
      z v.1 v.2.1 v.2.2⟩

/-- Identity phase fixes each intrinsic nonzero P-image spinor. -/
theorem relationalNonzeroCircleAction_one (v : RelationalNonzeroSpinor) :
    relationalNonzeroCircleAction 1 v = v := by
  apply Subtype.ext
  exact relationalCircleVector_one v.1

/-- Original Circle phase multiplication acts by exact
composition on the intrinsic nonzero P-image. -/
theorem relationalNonzeroCircleAction_mul
    (z w : Circle) (v : RelationalNonzeroSpinor) :
    relationalNonzeroCircleAction (z * w) v =
      relationalNonzeroCircleAction z (relationalNonzeroCircleAction w v) := by
  apply Subtype.ext
  exact relationalCircleVector_mul z w v.1

/-- Every source-original nonzero P-image spinor has
trivial point stabilizer under the original Circle action. -/
theorem relationalNonzeroCircleAction_fixed_point_implies_one
    (z : Circle) (v : RelationalNonzeroSpinor)
    (hfix : relationalNonzeroCircleAction z v = v) :
    z = 1 := by
  apply relationalCircleVector_fixed_point_implies_one z v.1 v.2.1 v.2.2
  exact congrArg Subtype.val hfix

#print axioms relationalNonzeroCircleAction_one
#print axioms relationalNonzeroCircleAction_mul
#print axioms relationalNonzeroCircleAction_fixed_point_implies_one

end
end FCP.RHOPFP9C3D2E3
