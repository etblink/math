import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D7OriginalGammaStandardSphereCircleJointContinuity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2COriginalGammaRelationalPhasePartialIsometry

/-!
# RHOPF-P9C3D2G1D8 — source-original phase J on the rank-four projector image

The original exact Gamma9 matrix relations P*J=J and J*J=-P
must imply two simple source-vector statements:
  P v = v ⇒ P (J v) = J v;
  P v = v ⇒ J (J v) = -v.

This deliberately isolates the complex-structure ingredient
BEFORE any noncanonical R4 coordinate transport, compatible
orthonormal basis, equivariance or Hopf quotient claim.

No new gamma tables or physical Fock/Hamiltonian claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D8
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2C

/-- The exact source-original phase J remains in the P-fixed
real rank-four relational image, with no coordinate basis chosen. -/
theorem relationalPhaseJ_mulVec_preserves_projector_image
    (v : SpinIndex → ℝ)
    (_hv : relationalProjector.mulVec v = v) :
    relationalProjector.mulVec (relationalPhaseJ.mulVec v) =
      relationalPhaseJ.mulVec v := by
  calc
    relationalProjector.mulVec (relationalPhaseJ.mulVec v) =
        (relationalProjector * relationalPhaseJ).mulVec v :=
      Matrix.mulVec_mulVec v relationalProjector relationalPhaseJ
    _ = relationalPhaseJ.mulVec v := by
      rw [relationalProjector_mul_phaseJ]

/-- The accepted original matrix identity J²=-P becomes a
complex-structure square law on every vector fixed by P. -/
theorem relationalPhaseJ_mulVec_square_on_projector_image
    (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
    relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v) = -v := by
  calc
    relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v) =
        (relationalPhaseJ * relationalPhaseJ).mulVec v :=
      Matrix.mulVec_mulVec v relationalPhaseJ relationalPhaseJ
    _ = (-relationalProjector).mulVec v := by
      rw [relationalPhaseJ_square_neg_projector]
    _ = -v := by
      simp only [Matrix.neg_mulVec, hv]

#print axioms relationalPhaseJ_mulVec_preserves_projector_image
#print axioms relationalPhaseJ_mulVec_square_on_projector_image

end
end FCP.RHOPFP9C3D2G1D8
