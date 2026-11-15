import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CNativeXGenerator

/-!
# G0C-X-IMAGE — exact original BFSS gauge SU(2) X-axis adjoint image

Use actual original GaugeGroup 2 and source Pauli trace, output B/input A.
Native X generator, source inverse Pauli and G3A are already accepted.
Only a new finite-matrix rotation-image theorem is proposed; no generic
textbook surrogate, QICLean package import, global SO(3) surjectivity,
kernel, orbit, Fock or spectral theorem is asserted.
Finite-component proof adapted from public LionSR/QICLean EulerAngles
at commit 603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CXImage
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeXGenerator
open FCP.BFSSIBIG0CInversePauli
open Matrix

/-- Target positive X rotation in original output-row/input-column order. -/
def sourceRotX (β : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![1, 0, 0;
     0, Real.cos β, -Real.sin β;
     0, Real.sin β, Real.cos β]

private theorem sourceXMatrix_inv_adjugate (β : ℝ) :
    (sourceXMatrix β)⁻¹ = (sourceXMatrix β).adjugate := by
  have hdet : (sourceXMatrix β).det = 1 :=
    (Matrix.mem_specialUnitaryGroup_iff.mp (sourceXMatrix_mem_specialUnitary β)).2
  rw [Matrix.inv_def, hdet]
  simp

private theorem complex_re_div_two (z : ℂ) :
    (z / 2).re = z.re / 2 := by
  norm_num [div_eq_mul_inv, Complex.mul_re]

/-- The exact ORIGINAL source Pauli conjugation trace of X(β), prior to
extracting its real BFSS color coefficient, is the embedded X rotation. -/
theorem sourceXPauli_trace_rotX (β : ℝ) (B A : Fin 3) :
    (Matrix.trace (FCP.BFSSSU2.pauli B *
      (sourceXMatrix β * FCP.BFSSSU2.pauli A *
        (sourceXMatrix β)⁻¹))) / 2 =
      (sourceRotX β B A : ℂ) := by
  have hcos : (Real.cos β : ℂ) =
      (Real.cos (β / 2) : ℂ) ^ 2 -
        (Real.sin (β / 2) : ℂ) ^ 2 := by
    have h : Real.cos β =
        Real.cos (β / 2) ^ 2 - Real.sin (β / 2) ^ 2 := by
      rw [← Real.cos_two_mul' (β / 2), show 2 * (β / 2) = β by ring]
    rw [h]
    push_cast
    ring
  have hsin : (Real.sin β : ℂ) =
      2 * (Real.sin (β / 2) : ℂ) *
        (Real.cos (β / 2) : ℂ) := by
    have h : Real.sin β =
        2 * Real.sin (β / 2) * Real.cos (β / 2) := by
      rw [← Real.sin_two_mul, show 2 * (β / 2) = β by ring]
    rw [h]
    push_cast
    ring
  have hpyth :
      ((Real.cos (β * (1 / 2)) : ℝ) : ℂ) ^ 2 +
        ((Real.sin (β * (1 / 2)) : ℝ) : ℂ) ^ 2 = 1 := by
    rw [← Complex.ofReal_pow, ← Complex.ofReal_pow, ← Complex.ofReal_add,
      Real.cos_sq_add_sin_sq, Complex.ofReal_one]
  rw [sourceXMatrix_inv_adjugate]
  fin_cases B <;> fin_cases A <;>
    simp only [FCP.BFSSSU2.pauli, sourceXMatrix, sourceRotX,
      Matrix.adjugate_fin_two_of, Matrix.trace_fin_two,
      Matrix.mul_apply, Fin.sum_univ_two, Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.of_apply,
      Matrix.cons_val', Matrix.empty_val', Matrix.cons_val_fin_one,
      Matrix.head_fin_const, Matrix.cons_val_two, Matrix.tail_cons,
      Fin.reduceFinMk, Fin.zero_eta, Fin.mk_one, Fin.isValue,
      Complex.ofReal_zero, Complex.ofReal_one, Complex.ofReal_neg,
      neg_mul, mul_neg, neg_zero, mul_zero, zero_mul, add_zero,
      zero_add, mul_one, one_mul, hcos, hsin] <;>
    (ring_nf;
      (try (simp only [Complex.I_sq, Complex.I_pow_four]; ring_nf));
      (try linear_combination hpyth))

/-- The ACTUAL original BFSS SU(2) adjoint matrix of its native X generator
is the standard real positive X-axis rotation, with source row/column order. -/
theorem originalAdjointColorMatrix_sourceX_eq_rotX (β : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceXGauge β) =
      sourceRotX β := by
  ext B A
  let t : ℂ := Matrix.trace (FCP.BFSSSU2.pauli B *
    (sourceXMatrix β * FCP.BFSSSU2.pauli A *
      (sourceXMatrix β)⁻¹))
  calc
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceXGauge β)) B A =
        t.re / 2 := by
      simpa only [t, sourceXGauge_coe] using
        (originalAdjointColorMatrix_pauliInverseTrace
          (sourceXGauge β) B A)
    _ = (t / 2).re := (complex_re_div_two t).symm
    _ = sourceRotX β B A := by
      simpa only [t, Complex.ofReal_re] using
        congrArg Complex.re (sourceXPauli_trace_rotX β B A)

#print axioms sourceXPauli_trace_rotX
#print axioms originalAdjointColorMatrix_sourceX_eq_rotX

end
end FCP.BFSSIBIG0CXImage
