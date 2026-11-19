import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3AOriginalGammaRelationalCirclePhaseFamily

/-!
# RHOPF-P9C3B0 — source-original relational complement support algebra

Before proving the two-real-parameter phase multiplication law, isolate
the necessary orthogonal complement Q = I-P, where P is the actual
qualified original-Gamma9 rank-four relational projector.

Original-source matrix ring relations (using accepted P²=P and PJ=JP=J):
  Q²=Q; QP=PQ=0; QJ=JQ=0; R(a,b)=Q+aP+bJ.

This gate has no coordinate-gamma entry expansions, Fock or Hamiltonian
claims, private signed-permutation copies or resource overrides.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3B0
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2C
open FCP.RHOPFP9C3A

/-- Complementary original-source orthogonal projection. -/
noncomputable def relationalComplement : GammaMatrix :=
  1 - relationalProjector

/-- Complementary projection remains idempotent. -/
theorem relationalComplement_idempotent :
    relationalComplement * relationalComplement =
      relationalComplement := by
  change (1 - relationalProjector) * (1 - relationalProjector) =
    1 - relationalProjector
  calc
    (1 - relationalProjector) * (1 - relationalProjector) =
      1 - relationalProjector - relationalProjector +
      relationalProjector * relationalProjector := by noncomm_ring
    _ = 1 - relationalProjector := by
      rw [relationalProjector_idempotent]
      module

/-- The complement annihilates the selected relational sector on the left. -/
theorem relationalComplement_mul_projector :
    relationalComplement * relationalProjector = 0 := by
  change (1 - relationalProjector) * relationalProjector = 0
  calc
    (1 - relationalProjector) * relationalProjector =
      relationalProjector -
        relationalProjector * relationalProjector := by noncomm_ring
    _ = 0 := by
      rw [relationalProjector_idempotent]
      module

/-- The complement annihilates the relational sector on the right. -/
theorem relationalProjector_mul_complement :
    relationalProjector * relationalComplement = 0 := by
  change relationalProjector * (1 - relationalProjector) = 0
  calc
    relationalProjector * (1 - relationalProjector) =
      relationalProjector -
        relationalProjector * relationalProjector := by noncomm_ring
    _ = 0 := by
      rw [relationalProjector_idempotent]
      module

/-- The complement annihilates source-original phase J on the left. -/
theorem relationalComplement_mul_phaseJ :
    relationalComplement * relationalPhaseJ = 0 := by
  change (1 - relationalProjector) * relationalPhaseJ = 0
  calc
    (1 - relationalProjector) * relationalPhaseJ =
      relationalPhaseJ - relationalProjector * relationalPhaseJ := by
        noncomm_ring
    _ = 0 := by
      rw [relationalProjector_mul_phaseJ]
      module

/-- The complement annihilates source-original phase J on the right. -/
theorem relationalPhaseJ_mul_complement :
    relationalPhaseJ * relationalComplement = 0 := by
  change relationalPhaseJ * (1 - relationalProjector) = 0
  calc
    relationalPhaseJ * (1 - relationalProjector) =
      relationalPhaseJ - relationalPhaseJ * relationalProjector := by
        noncomm_ring
    _ = 0 := by
      rw [relationalPhaseJ_mul_projector]
      module

/-- Exact source-original phase family decomposition Q+aP+bJ. -/
theorem relationalCirclePhase_eq_complement_sum (a b : ℝ) :
    relationalCirclePhase a b =
      relationalComplement +
        a • relationalProjector + b • relationalPhaseJ := by
  rfl

#print axioms relationalComplement_idempotent
#print axioms relationalComplement_mul_projector
#print axioms relationalProjector_mul_complement
#print axioms relationalComplement_mul_phaseJ
#print axioms relationalPhaseJ_mul_complement
#print axioms relationalCirclePhase_eq_complement_sum

end
end FCP.RHOPFP9C3B0
