import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2DOriginalGammaRelationalPhaseOnProjectorImage

/-!
# RHOPF-P9C3D2E0 — linear coefficient uniqueness on original P-image

The source-original rank-four projection P and partial complex
structure J satisfy J²=-P. On any nonzero source real spinor v in
the P-image, v and Jv are real-linearly independent. This is the
algebraic ingredient needed for a later exact Circle fixed-point
argument, not yet a freeness or topological quotient statement.

No Gamma9 coordinates, physical 24-mode Fock space, Hamiltonian,
global Spin(9) equivariance, Hopfion or empirical claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E0
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A

/-- Original relational v and Jv have unique real coefficients
whenever Pv=v and v is nonzero. -/
theorem relationalPhaseJ_linear_coefficients_unique
    (c d : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (h : c • v + d • relationalPhaseJ.mulVec v = 0) :
    c = 0 ∧ d = 0 := by
  let w : SpinIndex → ℝ := relationalPhaseJ.mulVec v
  change c • v + d • w = 0 at h
  have hw : relationalPhaseJ.mulVec w = -v := by
    dsimp [w]
    rw [Matrix.mulVec_mulVec, relationalPhaseJ_square_neg_projector,
      Matrix.neg_mulVec, hv]
  have hJ : c • w - d • v = 0 := by
    have h' := congrArg
      (fun u : SpinIndex → ℝ => relationalPhaseJ.mulVec u) h
    simp only [Matrix.mulVec_add, Matrix.mulVec_smul,
      Matrix.mulVec_zero, hw] at h'
    simpa only [smul_neg, sub_eq_add_neg] using h'
  have hnorm : (c * c + d * d) • v = 0 := by
    calc
      (c * c + d * d) • v =
          c • (c • v + d • w) - d • (c • w - d • v) := by
            module
      _ = 0 := by rw [h, hJ]; simp
  exact mul_self_add_mul_self_eq_zero.mp
    ((smul_eq_zero.mp hnorm).resolve_right hne)

#print axioms relationalPhaseJ_linear_coefficients_unique

end
end FCP.RHOPFP9C3D2E0
