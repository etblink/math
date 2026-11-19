import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A0OriginalGammaPairClifford
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10ANOriginalGammaDisjointPairLieBracketProbe

/-!
# RHOPF-P9C0 — original Gamma9 commuting triple and involutions

The proposed relational Hopf projector is built from three full original
Spin(9) gamma bivectors. This source-exact microgate proves:
(1) the three chosen bivectors commute in the original 16-real carrier;
(2) products of any two are involutions.

Reuse P9A0 original Clifford complex-structure squares and the F10AN
original public-source disjoint-pair commutation theorem. No coordinate
matrix expansion, imported private signed permutations, option overrides,
replacement gamma tables, Fock operators or physical Hamiltonian claims.

This gate does NOT yet prove the rank-four relational projector or its
equality with the selected source Hopf coordinate plane.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C0
noncomputable section

open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.BFSSPairedSpin9Clifford
open OAI.BFSSQuantum

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

/-- Full original gamma bivectors K13 and K25 commute despite
being inequivalent full 16-real matrices (qualified P9A1A). -/
theorem K13_K25_commute : KA * KB = KB * KA := by
  have h :
      (gamma 1 * gamma 3) * (gamma 2 * gamma 5) =
        (gamma 2 * gamma 5) * (gamma 1 * gamma 3) :=
    (source9OriginalGamma_disjoint_pair_commute
      1 3 2 5 (by decide) (by decide) (by decide) (by decide)).symm
  change (gamma 1 * gamma 3) * (-(gamma 2 * gamma 5)) =
    (-(gamma 2 * gamma 5)) * (gamma 1 * gamma 3)
  simpa only [mul_neg, neg_mul] using
    congrArg (fun M : GammaMatrix => -M) h

/-- K13 and K46 also commute as disjoint original source gamma pairs. -/
theorem K13_K46_commute : KA * KC = KC * KA := by
  have h :
      (gamma 1 * gamma 3) * (gamma 4 * gamma 6) =
        (gamma 4 * gamma 6) * (gamma 1 * gamma 3) :=
    (source9OriginalGamma_disjoint_pair_commute
      1 3 4 6 (by decide) (by decide) (by decide) (by decide)).symm
  change (gamma 1 * gamma 3) * (-(gamma 4 * gamma 6)) =
    (-(gamma 4 * gamma 6)) * (gamma 1 * gamma 3)
  simpa only [mul_neg, neg_mul] using
    congrArg (fun M : GammaMatrix => -M) h

/-- K25 and K46 commute even with both source orientation signs. -/
theorem K25_K46_commute : KB * KC = KC * KB := by
  have h :
      (gamma 2 * gamma 5) * (gamma 4 * gamma 6) =
        (gamma 4 * gamma 6) * (gamma 2 * gamma 5) :=
    (source9OriginalGamma_disjoint_pair_commute
      2 5 4 6 (by decide) (by decide) (by decide) (by decide)).symm
  change (-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6)) =
    (-(gamma 4 * gamma 6)) * (-(gamma 2 * gamma 5))
  simpa only [neg_mul, mul_neg, neg_neg] using h

/-- Abstract matrix-ring carrier lemma: a product of two commuting
complex structures is an involution. No commutative matrix ring assumed. -/
private theorem product_sq_one_of_commuting_neg_squares
    (A B : GammaMatrix) (hAB : A * B = B * A)
    (hA : A * A = -(1 : GammaMatrix))
    (hB : B * B = -(1 : GammaMatrix)) :
    (A * B) * (A * B) = (1 : GammaMatrix) := by
  calc
    (A * B) * (A * B) = A * (B * A) * B := by noncomm_ring
    _ = A * (A * B) * B := by rw [← hAB]
    _ = (A * A) * (B * B) := by noncomm_ring
    _ = (-(1 : GammaMatrix)) * (-(1 : GammaMatrix)) := by
      rw [hA, hB]
    _ = 1 := by simp

/-- First pairwise agreement-sign involution in the original source. -/
theorem K13K25_involution :
    (KA * KB) * (KA * KB) = (1 : GammaMatrix) := by
  exact product_sq_one_of_commuting_neg_squares
    KA KB K13_K25_commute K13_sq K25_sq

/-- Second source agreement-sign involution. -/
theorem K13K46_involution :
    (KA * KC) * (KA * KC) = (1 : GammaMatrix) := by
  exact product_sq_one_of_commuting_neg_squares
    KA KC K13_K46_commute K13_sq K46_sq

/-- Third original-source agreement-sign involution. -/
theorem K25K46_involution :
    (KB * KC) * (KB * KC) = (1 : GammaMatrix) := by
  exact product_sq_one_of_commuting_neg_squares
    KB KC K25_K46_commute K25_sq K46_sq

#print axioms K13_K25_commute
#print axioms K13_K46_commute
#print axioms K25_K46_commute
#print axioms K13K25_involution
#print axioms K13K46_involution
#print axioms K25K46_involution

end
end FCP.RHOPFP9C0
