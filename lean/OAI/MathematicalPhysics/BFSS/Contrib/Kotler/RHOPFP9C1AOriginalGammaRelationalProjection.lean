import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C0OriginalGammaCommutingTriple

/-!
# RHOPF-P9C1A — original-gamma relational projection algebra

This is the bounded projector gate after qualified RHOPF-P9C0.
Use original source K13/K25/K46, each square -I (P9A0) and
each pair commutes (P9C0). Construct the agreement projector P
using (I-K1*K2)*(I-K1*K3)/4.

Three original-source native conclusions:
  P*P=P, K1*P=K2*P, K1*P=K3*P.

All simplification occurs abstractly in the original GammaMatrix ring;
no 16x16 coordinate expansion, copied gamma table, private import,
resource override, physical Fock implementer, Hamiltonian or Noether claim.
Rank four and equality to the indexed four-coordinate Hopf carrier remain
SEPARATE obligations.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C1A
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A0
open FCP.RHOPFP9C0

private abbrev KA : GammaMatrix := gamma 1 * gamma 3
private abbrev KB : GammaMatrix := -(gamma 2 * gamma 5)
private abbrev KC : GammaMatrix := -(gamma 4 * gamma 6)

/-- Source-defined agreement-sector projection; not an extra Spin9 generator. -/
noncomputable def relationalProjector : GammaMatrix :=
  (1 / 4 : ℝ) • ((1 - KA * KB) * (1 - KA * KC))

/-- Commuting complex structures yield commuting pairwise agreement signs. -/
private theorem agreement_signs_commute
    (A B C : GammaMatrix)
    (hAB : A * B = B * A) (hAC : A * C = C * A)
    (hBC : B * C = C * B) :
    (A * B) * (A * C) = (A * C) * (A * B) := by
  calc
    (A * B) * (A * C) = A * (B * A) * C := by noncomm_ring
    _ = A * (A * B) * C := by rw [← hAB]
    _ = (A * A) * (B * C) := by noncomm_ring
    _ = (A * A) * (C * B) := by rw [hBC]
    _ = A * (A * C) * B := by noncomm_ring
    _ = A * (C * A) * B := by rw [hAC]
    _ = (A * C) * (A * B) := by noncomm_ring

/-- Abstract noncommutative ring identity: the product of two
commuting involution minus-one factors squares to four times itself. -/
private theorem agreement_raw_square_four
    (X Y : GammaMatrix)
    (hX : X * X = (1 : GammaMatrix))
    (hY : Y * Y = (1 : GammaMatrix))
    (hXY : X * Y = Y * X) :
    ((1 - X) * (1 - Y)) * ((1 - X) * (1 - Y)) =
      (1 - X) * (1 - Y) + (1 - X) * (1 - Y) +
      (1 - X) * (1 - Y) + (1 - X) * (1 - Y) := by
  have hcomm : (1 - Y) * (1 - X) = (1 - X) * (1 - Y) := by
    calc
      (1 - Y) * (1 - X) = 1 - Y - X + Y * X := by noncomm_ring
      _ = 1 - Y - X + X * Y := by rw [← hXY]
      _ = (1 - X) * (1 - Y) := by noncomm_ring
  have hx : (1 - X) * (1 - X) = (1 - X) + (1 - X) := by
    calc
      (1 - X) * (1 - X) = 1 - X - X + X * X := by noncomm_ring
      _ = (1 - X) + (1 - X) := by rw [hX]; noncomm_ring
  have hy : (1 - Y) * (1 - Y) = (1 - Y) + (1 - Y) := by
    calc
      (1 - Y) * (1 - Y) = 1 - Y - Y + Y * Y := by noncomm_ring
      _ = (1 - Y) + (1 - Y) := by rw [hY]; noncomm_ring
  calc
    ((1 - X) * (1 - Y)) * ((1 - X) * (1 - Y)) =
      ((1 - X) * (1 - X)) * ((1 - Y) * (1 - Y)) := by
        calc
          _ = (1 - X) * ((1 - Y) * (1 - X)) * (1 - Y) := by noncomm_ring
          _ = (1 - X) * ((1 - X) * (1 - Y)) * (1 - Y) := by rw [hcomm]
          _ = ((1 - X) * (1 - X)) * ((1 - Y) * (1 - Y)) := by noncomm_ring
    _ = ((1 - X) + (1 - X)) * ((1 - Y) + (1 - Y)) := by
      rw [hx, hy]
    _ = (1 - X) * (1 - Y) + (1 - X) * (1 - Y) +
        (1 - X) * (1 - Y) + (1 - X) * (1 - Y) := by noncomm_ring

/-- A scaled product of two commuting minus-one involutions is
idempotent; this generic proof handles the original matrix ring. -/
private theorem abstract_agreement_projection_idempotent
    (X Y : GammaMatrix)
    (hX : X * X = (1 : GammaMatrix))
    (hY : Y * Y = (1 : GammaMatrix))
    (hXY : X * Y = Y * X) :
    ((1 / 4 : ℝ) • ((1 - X) * (1 - Y))) *
      ((1 / 4 : ℝ) • ((1 - X) * (1 - Y))) =
      (1 / 4 : ℝ) • ((1 - X) * (1 - Y)) := by
  have hraw := agreement_raw_square_four X Y hX hY hXY
  calc
    ((1 / 4 : ℝ) • ((1 - X) * (1 - Y))) *
        ((1 / 4 : ℝ) • ((1 - X) * (1 - Y))) =
      ((1 / 4 : ℝ) * (1 / 4 : ℝ)) •
        (((1 - X) * (1 - Y)) * ((1 - X) * (1 - Y))) := by
          rw [smul_mul_assoc, mul_smul_comm, smul_smul]
    _ = (1 / 16 : ℝ) •
        (((1 - X) * (1 - Y)) * ((1 - X) * (1 - Y))) := by
          norm_num
    _ = (1 / 16 : ℝ) •
        ((1 - X) * (1 - Y) + (1 - X) * (1 - Y) +
        (1 - X) * (1 - Y) + (1 - X) * (1 - Y)) := by rw [hraw]
    _ = (1 / 4 : ℝ) • ((1 - X) * (1 - Y)) := by module

/-- Source-original relational projection squares to itself. -/
theorem relationalProjector_idempotent :
    relationalProjector * relationalProjector = relationalProjector := by
  exact abstract_agreement_projection_idempotent
    (KA * KB) (KA * KC)
    K13K25_involution K13K46_involution
    (agreement_signs_commute KA KB KC
      K13_K25_commute K13_K46_commute K25_K46_commute)

/-- For two commuting original complex structures, their difference
annihilates the agreement-sign factor (I-A*B) on the left. -/
private theorem difference_agreement_factor_zero
    (A B : GammaMatrix)
    (hAB : A * B = B * A)
    (hA : A * A = -(1 : GammaMatrix))
    (hB : B * B = -(1 : GammaMatrix)) :
    (A - B) * (1 - A * B) = (0 : GammaMatrix) := by
  calc
    (A - B) * (1 - A * B) =
        (A - B) - (A * A) * B + (B * A) * B := by noncomm_ring
    _ = (A - B) - (A * A) * B + (A * B) * B := by rw [← hAB]
    _ = (A - B) - (-(1 : GammaMatrix)) * B + A * (B * B) := by
      rw [hA]; noncomm_ring
    _ = 0 := by rw [hB]; noncomm_ring

private theorem agreement_factors_commute
    (X Y : GammaMatrix) (hXY : X * Y = Y * X) :
    (1 - X) * (1 - Y) = (1 - Y) * (1 - X) := by
  calc
    (1 - X) * (1 - Y) = 1 - X - Y + X * Y := by noncomm_ring
    _ = 1 - X - Y + Y * X := by rw [hXY]
    _ = (1 - Y) * (1 - X) := by noncomm_ring

/-- K13 and K25 act identically after source-original agreement projection. -/
theorem K13_projected_eq_K25 :
    KA * relationalProjector = KB * relationalProjector := by
  apply sub_eq_zero.mp
  have hzero : (KA - KB) * (1 - KA * KB) = 0 :=
    difference_agreement_factor_zero KA KB
      K13_K25_commute K13_sq K25_sq
  calc
    KA * relationalProjector - KB * relationalProjector =
        (KA - KB) * relationalProjector := by noncomm_ring
    _ = (1 / 4 : ℝ) •
        ((KA - KB) * ((1 - KA * KB) * (1 - KA * KC))) := by
      simp only [relationalProjector, mul_smul_comm]
    _ = (1 / 4 : ℝ) •
        (((KA - KB) * (1 - KA * KB)) * (1 - KA * KC)) := by
      congr 1
      noncomm_ring
    _ = 0 := by rw [hzero]; simp

/-- K13 and K46 also act identically after source-original agreement projection. -/
theorem K13_projected_eq_K46 :
    KA * relationalProjector = KC * relationalProjector := by
  apply sub_eq_zero.mp
  have hzero : (KA - KC) * (1 - KA * KC) = 0 :=
    difference_agreement_factor_zero KA KC
      K13_K46_commute K13_sq K46_sq
  have hcom : (1 - KA * KB) * (1 - KA * KC) =
      (1 - KA * KC) * (1 - KA * KB) :=
    agreement_factors_commute (KA * KB) (KA * KC)
      (agreement_signs_commute KA KB KC
        K13_K25_commute K13_K46_commute K25_K46_commute)
  calc
    KA * relationalProjector - KC * relationalProjector =
        (KA - KC) * relationalProjector := by noncomm_ring
    _ = (1 / 4 : ℝ) •
        ((KA - KC) * ((1 - KA * KB) * (1 - KA * KC))) := by
      simp only [relationalProjector, mul_smul_comm]
    _ = (1 / 4 : ℝ) •
        ((KA - KC) * ((1 - KA * KC) * (1 - KA * KB))) := by rw [hcom]
    _ = (1 / 4 : ℝ) •
        (((KA - KC) * (1 - KA * KC)) * (1 - KA * KB)) := by
      congr 1
      noncomm_ring
    _ = 0 := by rw [hzero]; simp

#print axioms relationalProjector_idempotent
#print axioms K13_projected_eq_K25
#print axioms K13_projected_eq_K46

end
end FCP.RHOPFP9C1A
