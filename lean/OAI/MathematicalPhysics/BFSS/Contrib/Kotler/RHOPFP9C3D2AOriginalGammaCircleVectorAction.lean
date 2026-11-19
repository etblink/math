import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D1OriginalGammaCircleRepresentationContinuity

/-!
# RHOPF-P9C3D2A — original Gamma9 Circle action on real spinor vectors

The qualified continuous original-source circle matrix representation
acts on the original finite real 16-spinor carrier by matrix-vector
multiplication. This gate establishes the identity and composition
laws for that action, with no new matrix or Gamma9 definitions.

This does not claim freeness on the ambient spinor sphere, an
explicit continuous group action object, the Hopf quotient, or
implementation in the original physical BFSS fermionic Fock space.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2A
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D0

/-- The accepted original Gamma9 real matrix phase acting on
the original real 16-spinor vector carrier. -/
noncomputable def relationalCircleVector
    (z : Circle) (v : SpinIndex → ℝ) : SpinIndex → ℝ :=
  (relationalCircleMatrix z).mulVec v

/-- The identity circle phase fixes every original real spinor. -/
theorem relationalCircleVector_one (v : SpinIndex → ℝ) :
    relationalCircleVector 1 v = v := by
  change (relationalCircleMatrix 1).mulVec v = v
  rw [relationalCircleMatrix_one]
  exact Matrix.one_mulVec v

/-- Circle multiplication composes exact source-original actions
on original real spinor vectors in the correct order. -/
theorem relationalCircleVector_mul (z w : Circle) (v : SpinIndex → ℝ) :
    relationalCircleVector (z * w) v =
      relationalCircleVector z (relationalCircleVector w v) := by
  change (relationalCircleMatrix (z * w)).mulVec v =
    (relationalCircleMatrix z).mulVec ((relationalCircleMatrix w).mulVec v)
  rw [relationalCircleMatrix_mul]
  exact (Matrix.mulVec_mulVec v (relationalCircleMatrix z) (relationalCircleMatrix w)).symm

#print axioms relationalCircleVector_one
#print axioms relationalCircleVector_mul

end
end FCP.RHOPFP9C3D2A
