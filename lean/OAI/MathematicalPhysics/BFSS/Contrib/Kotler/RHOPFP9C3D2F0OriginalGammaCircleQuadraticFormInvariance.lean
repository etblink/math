import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E3OriginalGammaCircleIntrinsicNonzeroAction

/-!
# RHOPF-P9C3D2F0 — source-original Euclidean quadratic form invariance

The original real 16-spinor Gamma9 Circle matrices are already
strict-qualified orthogonal: rho(z)ᵀ rho(z)=I. The exact induced
Circle action therefore preserves the native real dot-product
quadratic form v·v on the original carrier.

This is the minimal, independent prerequisite for restricting the
source-derived free algebraic Circle action to a unit norm P-image.
The theorem does not yet package the unit sphere, prove continuous
action, S³ identification, Hopf quotient or physical Fock covariance.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F0
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D2A

/-- Source-original Gamma9 real orthogonal Circle phases preserve
the exact Euclidean spinor quadratic form. -/
theorem relationalCircleVector_dot_self
    (z : Circle) (v : SpinIndex → ℝ) :
    (relationalCircleVector z v) ⬝ᵥ
        (relationalCircleVector z v) = v ⬝ᵥ v := by
  change ((relationalCircleMatrix z).mulVec v) ⬝ᵥ
    ((relationalCircleMatrix z).mulVec v) = v ⬝ᵥ v
  calc
    ((relationalCircleMatrix z).mulVec v) ⬝ᵥ
        ((relationalCircleMatrix z).mulVec v) =
        (((relationalCircleMatrix z).mulVec v) ᵥ*
          relationalCircleMatrix z) ⬝ᵥ v := by
            rw [Matrix.dotProduct_mulVec]
    _ = (((relationalCircleMatrix z).transpose *
          relationalCircleMatrix z).mulVec v) ⬝ᵥ v := by
            rw [← Matrix.mulVec_transpose, Matrix.mulVec_mulVec]
    _ = v ⬝ᵥ v := by
          rw [relationalCircleMatrix_orthogonal, Matrix.one_mulVec]

#print axioms relationalCircleVector_dot_self

end
end FCP.RHOPFP9C3D2F0
