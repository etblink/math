import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2AOriginalGammaCircleVectorAction

/-!
# RHOPF-P9C3D2B — original Gamma9 projector sector invariance

The real 16-spinor circle action is strictly qualified and acts through
the original source circle matrix representation. The projector P
onto the original rank-four relational sector must be invariant.

We prove P rho(z) = rho(z) P, then P v = v implies
P (rho(z) v) = rho(z) v. This does not prove a free action or Hopf
quotient. The full 16-dimensional ambient spinor has a fixed
complement, and the physical Fock-space implementation is unproved.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2B
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2C
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B0
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D2A

/-- Exact source original Gamma9 relational projector P commutes
with every source-original real circle phase matrix. -/
theorem relationalProjector_commutes_circleMatrix (z : Circle) :
    relationalProjector * relationalCircleMatrix z =
      relationalCircleMatrix z * relationalProjector := by
  change relationalProjector *
    relationalCirclePhase (z : ℂ).re (z : ℂ).im =
      relationalCirclePhase (z : ℂ).re (z : ℂ).im * relationalProjector
  rw [relationalCirclePhase_eq_complement_sum,
    relationalCirclePhase_eq_complement_sum]
  simp only [mul_add, add_mul, mul_smul_comm, smul_mul_assoc,
    relationalProjector_mul_complement,
    relationalComplement_mul_projector,
    relationalProjector_idempotent,
    relationalProjector_mul_phaseJ,
    relationalPhaseJ_mul_projector, zero_add]

/-- Every circle phase preserves the original relational sector
specified by the source Gamma9 projector P. -/
theorem relationalCircleVector_preserves_projector_image
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalProjector.mulVec (relationalCircleVector z v) =
      relationalCircleVector z v := by
  change relationalProjector.mulVec
    ((relationalCircleMatrix z).mulVec v) =
      (relationalCircleMatrix z).mulVec v
  rw [Matrix.mulVec_mulVec,
    relationalProjector_commutes_circleMatrix,
    ← Matrix.mulVec_mulVec, hv]

#print axioms relationalProjector_commutes_circleMatrix
#print axioms relationalCircleVector_preserves_projector_image

end
end FCP.RHOPFP9C3D2B
