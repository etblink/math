import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1C1AOriginalGammaCommonActionEqualizer

/-!
# RHOPF-P9C2A — original relational projector complex-phase algebra

After two native REDs in the direct single-original-gamma column proof,
do not expand original Gamma9 entries. Instead reuse qualified original:
  K13² = -I, K13 K25 = K25 K13, K13 K46 = K46 K13,
  P² = P, P = 1/4 (I-K13 K25)(I-K13 K46).

Prove K13 commutes with P and J²=-P for J=K13 P.
This is a source-exact complex-structure ingredient on the rank-4
common-action sector, NOT a native indexed four-plane equality, complete
Hopf bundle, physical Fock-unitary implementation, Hamiltonian invariant,
Noether charge, particle or vortex.
No gamma tables, private imports, resource overrides or new axioms.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C2A
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.RHOPFP9C0
open FCP.RHOPFP9C1A

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

/-- Elementary commuting complex-structure factor identity in the
same original GammaMatrix ring. -/
private theorem commute_agreement_factor
    (A B : GammaMatrix) (hAB : A * B = B * A) :
    A * (1 - A * B) = (1 - A * B) * A := by
  calc
    A * (1 - A * B) = A - A * (A * B) := by noncomm_ring
    _ = A - A * (B * A) := by rw [hAB]
    _ = (1 - A * B) * A := by noncomm_ring

/-- Commutation passes from each original agreement factor to their
ordered product; no matrix coordinate reduction. -/
private theorem commute_agreement_product
    (A B C : GammaMatrix)
    (hAB : A * B = B * A)
    (hAC : A * C = C * A) :
    A * ((1 - A * B) * (1 - A * C)) =
      ((1 - A * B) * (1 - A * C)) * A := by
  have hB := commute_agreement_factor A B hAB
  have hC := commute_agreement_factor A C hAC
  calc
    A * ((1 - A * B) * (1 - A * C)) =
      (A * (1 - A * B)) * (1 - A * C) := by noncomm_ring
    _ = ((1 - A * B) * A) * (1 - A * C) := by rw [hB]
    _ = (1 - A * B) * (A * (1 - A * C)) := by noncomm_ring
    _ = (1 - A * B) * ((1 - A * C) * A) := by rw [hC]
    _ = ((1 - A * B) * (1 - A * C)) * A := by noncomm_ring

/-- The full original Gamma9 K13 complex structure preserves the
original rank-four relational projector image. -/
theorem original_K13_commutes_relationalProjector :
    KA * relationalProjector = relationalProjector * KA := by
  have hcomm : KA * ((1 - KA * KB) * (1 - KA * KC)) =
      ((1 - KA * KB) * (1 - KA * KC)) * KA :=
    commute_agreement_product KA KB KC
      K13_K25_commute K13_K46_commute
  change KA * ((1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))) =
    ((1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))) * KA
  calc
    _ = (1 / 4 : ℝ) • (KA * ((1 - KA * KB) * (1 - KA * KC))) := by
      rw [mul_smul_comm]
    _ = (1 / 4 : ℝ) • (((1 - KA * KB) * (1 - KA * KC)) * KA) := by
      rw [hcomm]
    _ = ((1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))) * KA := by
      rw [smul_mul_assoc]

/-- Define a source-original phase-complex-structure candidate J=K13 P.
On the image of P, J²=-I. This is only a matrix relation here. -/
noncomputable def relationalPhaseJ : GammaMatrix := KA * relationalProjector

/-- The exact source-original phase operator squares to minus the
original rank-four projector, using ONLY accepted ring identities. -/
theorem relationalPhaseJ_square_neg_projector :
    relationalPhaseJ * relationalPhaseJ = -relationalProjector := by
  change (KA * relationalProjector) * (KA * relationalProjector) =
    -relationalProjector
  calc
    (KA * relationalProjector) * (KA * relationalProjector) =
        KA * (relationalProjector * KA) * relationalProjector := by
          noncomm_ring
    _ = KA * (KA * relationalProjector) * relationalProjector := by
      rw [← original_K13_commutes_relationalProjector]
    _ = (KA * KA) * (relationalProjector * relationalProjector) := by
      noncomm_ring
    _ = (-(1 : GammaMatrix)) * relationalProjector := by
      rw [K13_sq, relationalProjector_idempotent]
    _ = -relationalProjector := by simp

#print axioms original_K13_commutes_relationalProjector
#print axioms relationalPhaseJ_square_neg_projector

end
end FCP.RHOPFP9C2A
