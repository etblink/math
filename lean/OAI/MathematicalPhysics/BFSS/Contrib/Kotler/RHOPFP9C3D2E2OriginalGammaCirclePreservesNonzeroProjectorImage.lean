import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E1OriginalGammaCircleNonzeroFixedPointCriterion

/-!
# RHOPF-P9C3D2E2 — Circle action preserves nonzero relational spinors

The original 16-real-spinor source Circle action has strictly qualified
identity/composition equations, preserves the rank-four P-image, and
admits no nonidentity phase fixing any nonzero P-image vector.

This gate proves that the action maps nonzero real vectors to nonzero
vectors using the existing inverse circle phase. Together with the
qualified projector-image invariance, it preserves the intrinsic
nonzero P-image as a set. A future gate can package the action on
that subtype, before handling the unit sphere topology.

No new gamma coordinates, Hopf quotient, Fock or physics claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E2
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2B

/-- Source-original real circle phases cannot annihilate
any nonzero spinor, by their qualified inverse action. -/
theorem relationalCircleVector_ne_zero
    (z : Circle) (v : SpinIndex → ℝ) (hne : v ≠ 0) :
    relationalCircleVector z v ≠ 0 := by
  intro hz
  have hcomp := relationalCircleVector_mul z⁻¹ z v
  rw [inv_mul_cancel, relationalCircleVector_one] at hcomp
  rw [hz] at hcomp
  have hzero : relationalCircleVector z⁻¹ (0 : SpinIndex → ℝ) = 0 := by
    simp [relationalCircleVector]
  rw [hzero] at hcomp
  exact hne hcomp

/-- The exact original circle action preserves nonzero vectors
inside the rank-four relational P-image. -/
theorem relationalCircleVector_preserves_nonzero_projector_image
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0) :
    relationalProjector.mulVec (relationalCircleVector z v) =
      relationalCircleVector z v ∧
      relationalCircleVector z v ≠ 0 :=
  ⟨relationalCircleVector_preserves_projector_image z v hv,
    relationalCircleVector_ne_zero z v hne⟩

#print axioms relationalCircleVector_ne_zero
#print axioms relationalCircleVector_preserves_nonzero_projector_image

end
end FCP.RHOPFP9C3D2E2
