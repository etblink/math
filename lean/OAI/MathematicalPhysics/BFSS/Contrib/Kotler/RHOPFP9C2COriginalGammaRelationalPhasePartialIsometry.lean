import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2BOriginalGammaOrthogonalRelationalPhase

/-!
# RHOPF-P9C2C — original Gamma9 relational phase partial-isometry laws

From source-original P9C2A J²=-P and P9C2B Jᵀ=-J and Pᵀ=P,
together with original P²=P and K13 P=P K13, derive:

  Jᵀ J=P;  J Jᵀ=P;  J P=J;  P J=J.

These source-exact matrix equations certify that J is orthogonal
on the rank-four common-action image of P and zero on its orthogonal
complement; a separate intrinsic Hopf S³→S² implementation and
Fock/Hamiltonian physical binding remain distinct.

No coordinate gamma entries, copied private source tables,
resource overrides, new axioms, or original source edits.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C2C
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2B

private abbrev KA : GammaMatrix := gamma 1 * gamma 3

/-- The exact original relational phase has initial projection P,
without a finite coordinate expansion. -/
theorem relationalPhaseJ_transpose_mul_self :
    relationalPhaseJ.transpose * relationalPhaseJ =
      relationalProjector := by
  rw [relationalPhaseJ_transpose_neg, neg_mul,
    relationalPhaseJ_square_neg_projector, neg_neg]

/-- The same original phase has final projection P. -/
theorem relationalPhaseJ_mul_transpose_self :
    relationalPhaseJ * relationalPhaseJ.transpose =
      relationalProjector := by
  rw [relationalPhaseJ_transpose_neg, mul_neg,
    relationalPhaseJ_square_neg_projector, neg_neg]

/-- The phase J is already supported on the right by the original P. -/
theorem relationalPhaseJ_mul_projector :
    relationalPhaseJ * relationalProjector =
      relationalPhaseJ := by
  change (KA * relationalProjector) * relationalProjector =
    KA * relationalProjector
  calc
    (KA * relationalProjector) * relationalProjector =
        KA * (relationalProjector * relationalProjector) := by
          noncomm_ring
    _ = KA * relationalProjector := by
      rw [relationalProjector_idempotent]

/-- The source-original phase stays in the common-action image. -/
theorem relationalProjector_mul_phaseJ :
    relationalProjector * relationalPhaseJ =
      relationalPhaseJ := by
  change relationalProjector * (KA * relationalProjector) =
    KA * relationalProjector
  calc
    relationalProjector * (KA * relationalProjector) =
        (relationalProjector * KA) * relationalProjector := by
          noncomm_ring
    _ = (KA * relationalProjector) * relationalProjector := by
      rw [← original_K13_commutes_relationalProjector]
    _ = KA * (relationalProjector * relationalProjector) := by
      noncomm_ring
    _ = KA * relationalProjector := by
      rw [relationalProjector_idempotent]

#print axioms relationalPhaseJ_transpose_mul_self
#print axioms relationalPhaseJ_mul_transpose_self
#print axioms relationalPhaseJ_mul_projector
#print axioms relationalProjector_mul_phaseJ

end
end FCP.RHOPFP9C2C
