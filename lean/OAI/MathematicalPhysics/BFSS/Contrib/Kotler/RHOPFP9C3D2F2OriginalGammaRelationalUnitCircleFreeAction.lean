import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F1OriginalGammaRelationalUnitCircleAction

/-!
# RHOPF-P9C3D2F2 — source-original relational unit Circle freeness

The exact original real 16-spinor Gamma9 source now supports an
algebraic Circle action on the intrinsic relational norm-one P-image.
The earlier source-original fixed-point theorem excludes nonidentity
Circle phases fixing nonzero vectors in the same P-image.

This bounded gate establishes that a relational unit vector is
nonzero and uses the accepted nonzero-vector theorem to prove
trivial point stabilizers for the exact unit subtype.

No source Gamma9 coordinate expansion, global typeclass instances,
joint continuity, S³ identification, Hopf quotient, physical Fock
lifting, gauge/Hamiltonian covariance or empirical assertion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F2
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2E1
open FCP.RHOPFP9C3D2F1

/-- No nonidentity Circle element fixes a source-original
rank-four relational unit spinor under the restricted action. -/
theorem relationalUnitCircleAction_fixed_point_implies_one
    (z : Circle) (v : RelationalUnitSpinor)
    (hfix : relationalUnitCircleAction z v = v) :
    z = 1 := by
  have hv_ne : (v.1 : SpinIndex → ℝ) ≠ 0 := by
    intro hzero
    have hun : v.1 ⬝ᵥ v.1 = (1 : ℝ) := v.2.2
    simp [hzero] at hun
  exact relationalCircleVector_fixed_point_implies_one
    z v.1 v.2.1 hv_ne (congrArg Subtype.val hfix)

#print axioms relationalUnitCircleAction_fixed_point_implies_one

end
end FCP.RHOPFP9C3D2F2
