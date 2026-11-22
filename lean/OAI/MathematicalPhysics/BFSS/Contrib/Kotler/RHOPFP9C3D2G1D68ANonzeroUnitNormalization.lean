import Mathlib.Tactic
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D67CanonicalProjectiveForwardContinuity

/-!
# RHOPF-P9C3D2G1D68A — nonzero complex vector unit normalization and projective class

Preserve the D65 actual orbit-class Equiv and the independently defined
D66 complex-projective topology. This gate proves that every nonzero
standard complex two-vector has a norm-one normalized representative
in the SAME algebraic projective class and D65 orbit class.

This gate intentionally proves NO continuity, inverse continuity,
Homeomorph, CP¹ ≃ₜ S², physical BFSS hopfion or GUT claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68A
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65

/-- The explicit norm-one representative of a nonzero complex
Euclidean two-vector, using the same real-positive scaling as D64. -/
noncomputable def relationalCanonicalNonzeroUnitNormalization
    (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} := by
  have hn : ‖v.val‖ ≠ 0 := norm_ne_zero_iff.mpr v.property
  refine ⟨((((‖v.val‖⁻¹ : ℝ) : ℂ) • v.val)), ?_⟩
  simpa only [norm_smul, norm_inv, norm_norm] using
    (inv_mul_cancel₀ hn)

/-- Normalization preserves the actual D61 complex projective
point; RHS is the pinned original Projectivization.mk' of v. -/
theorem relationalCanonicalNonzeroUnitNormalization_projectivePoint
    (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    relationalStandardUnitSphereProjectivePoint
        (relationalCanonicalNonzeroUnitNormalization v) =
      Projectivization.mk' ℂ v := by
  rw [Projectivization.mk'_eq_mk]
  unfold relationalStandardUnitSphereProjectivePoint
  apply (Projectivization.mk_eq_mk_iff' ℂ
      (relationalCanonicalNonzeroUnitNormalization v).val v.val
      (relationalStandardUnitSphere_nonzero _) v.property).2
  exact ⟨((‖v.val‖⁻¹ : ℝ) : ℂ), rfl⟩

/-- The SAME accepted D65 algebraic Equiv sends the exact D57
Circle-orbit class of normalized v to the original projective point. -/
theorem relationalCanonicalNonzeroUnitNormalization_orbitClass
    (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    relationalStandardCircleOrbitQuotientProjectivizationEquiv
        (relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v)) =
      Projectivization.mk' ℂ v := by
  rw [relationalStandardCircleOrbitQuotientProjectivizationEquiv_class]
  exact relationalCanonicalNonzeroUnitNormalization_projectivePoint v

#print axioms relationalCanonicalNonzeroUnitNormalization
#print axioms relationalCanonicalNonzeroUnitNormalization_projectivePoint
#print axioms relationalCanonicalNonzeroUnitNormalization_orbitClass

end
end FCP.RHOPFP9C3D2G1D68A
