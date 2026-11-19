import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2AOriginalGammaRelationalPhaseSquare
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B0OriginalGammaRelationalTrace

/-!
# RHOPF-P9C2B — source-original orthogonal relational projection and skew phase

Use accepted real Gamma9 source Clifford bivector skewness, pairwise
commuting original complex structures, original expanded projector,
and qualified original phase commutation to show:

  Pᵀ=P and Jᵀ=-J for J=K13 P.

The actual original projector also has P²=P and rank4, and J²=-P
by previously accepted separate strict gates. Together these are
the algebraic metric conditions for an orthogonal complex structure
on im(P), no indexed Gamma9 coordinate expansion required.

No original source edits, private-table imports, resource overrides,
new axioms, physical Hamiltonian/Fock or vortex/particle assertion.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C2B
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.RHOPFP9C0
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B0
open FCP.RHOPFP9C2A

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

/-- Two commuting real skew matrices multiply to a real symmetric
matrix; this generic helper uses no original gamma entries. -/
private theorem transpose_pair_of_commuting_skew
    (A B : GammaMatrix)
    (hA : A.transpose = -A) (hB : B.transpose = -B)
    (hAB : A * B = B * A) :
    (A * B).transpose = A * B := by
  calc
    (A * B).transpose = (-B) * (-A) := by
      rw [Matrix.transpose_mul, hA, hB]
    _ = B * A := by simp only [neg_mul, mul_neg, neg_neg]
    _ = A * B := hAB.symm

/-- The accepted original rank-four projector is a self-adjoint
idempotent on the real 16-spinor carrier. -/
theorem relationalProjector_transpose_eq :
    relationalProjector.transpose = relationalProjector := by
  have hab : (KA * KB).transpose = KA * KB :=
    transpose_pair_of_commuting_skew KA KB
      K13_skew K25_skew K13_K25_commute
  have hac : (KA * KC).transpose = KA * KC :=
    transpose_pair_of_commuting_skew KA KC
      K13_skew K46_skew K13_K46_commute
  have hbc : (KB * KC).transpose = KB * KC :=
    transpose_pair_of_commuting_skew KB KC
      K25_skew K46_skew K25_K46_commute
  rw [relationalProjector_expanded]
  change
    ((1 / 4 : ℝ) •
      ((1 : GammaMatrix) - KA * KB - KA * KC - KB * KC)).transpose =
      (1 / 4 : ℝ) •
        ((1 : GammaMatrix) - KA * KB - KA * KC - KB * KC)
  simp only [Matrix.transpose_smul, Matrix.transpose_sub,
    Matrix.transpose_one, hab, hac, hbc]

/-- The source-original relational phase J=K13*P is skew on the
ambient real 16-spinor space and restricts to the rank-four
common-action image. This does not prove a Hopf bundle itself. -/
theorem relationalPhaseJ_transpose_neg :
    relationalPhaseJ.transpose = -relationalPhaseJ := by
  change (KA * relationalProjector).transpose =
    -(KA * relationalProjector)
  calc
    (KA * relationalProjector).transpose =
        relationalProjector.transpose * KA.transpose := by
          rw [Matrix.transpose_mul]
    _ = relationalProjector * (-KA) := by
      rw [relationalProjector_transpose_eq, K13_skew]
    _ = -(relationalProjector * KA) := by rw [mul_neg]
    _ = -(KA * relationalProjector) := by
      rw [← original_K13_commutes_relationalProjector]

#print axioms relationalProjector_transpose_eq
#print axioms relationalPhaseJ_transpose_neg

end
end FCP.RHOPFP9C2B
