import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3B0OriginalGammaRelationalComplementSupport

/-!
# RHOPF-P9C3B1 — original Gamma9 relational phase multiplication law

Source-original real 16-dimensional Gamma9 matrices satisfy:
  Q²=Q, P²=P, J²=-P, QP=PQ=QJ=JQ=0, PJ=JP=J.
These laws are independently qualified strict GREEN.
The two-parameter real phase R(a,b)=Q+aP+bJ obeys the exact
complex multiplication formula R(a,b) R(c,d)=R(ac-bd,ad+bc).

This is an algebraic identity for all real parameters. It does NOT
yet assert unit-circle orthogonality, continuity or a physical BFSS
Fock-space implementer. No original gamma coordinate calculation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3B1
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2C
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B0

/-- Source-original phase multiplication law on the ambient real
16-spinor carrier, with no source matrix entry unfolding. -/
theorem relationalCirclePhase_mul (a b c d : ℝ) :
    relationalCirclePhase a b * relationalCirclePhase c d =
      relationalCirclePhase (a * c - b * d) (a * d + b * c) := by
  rw [relationalCirclePhase_eq_complement_sum,
    relationalCirclePhase_eq_complement_sum,
    relationalCirclePhase_eq_complement_sum]
  calc
    (relationalComplement + a • relationalProjector + b • relationalPhaseJ) *
      (relationalComplement + c • relationalProjector + d • relationalPhaseJ) =
      relationalComplement * relationalComplement +
      relationalComplement * (c • relationalProjector) +
      relationalComplement * (d • relationalPhaseJ) +
      (a • relationalProjector) * relationalComplement +
      (a • relationalProjector) * (c • relationalProjector) +
      (a • relationalProjector) * (d • relationalPhaseJ) +
      (b • relationalPhaseJ) * relationalComplement +
      (b • relationalPhaseJ) * (c • relationalProjector) +
      (b • relationalPhaseJ) * (d • relationalPhaseJ) := by
        noncomm_ring
    _ = relationalComplement +
      (a * c - b * d) • relationalProjector +
      (a * d + b * c) • relationalPhaseJ := by
        simp only [mul_smul_comm, smul_mul_assoc, smul_smul,
          relationalComplement_idempotent,
          relationalComplement_mul_projector,
          relationalComplement_mul_phaseJ,
          relationalProjector_mul_complement,
          relationalPhaseJ_mul_complement,
          relationalProjector_idempotent,
          relationalProjector_mul_phaseJ,
          relationalPhaseJ_mul_projector,
          relationalPhaseJ_square_neg_projector,
          smul_zero, zero_smul, smul_neg, zero_add, add_zero]
        module

#print axioms relationalCirclePhase_mul

end
end FCP.RHOPFP9C3B1
