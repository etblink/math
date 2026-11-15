import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CNativeZGenerator

/-!
# G0C-Z-IMAGE: source-exact original SU(2) Z-axis adjoint image

This is an independent new proof gate, not a change to the qualified
native Z generator, Pauli trace, or inverse interface. All matrices use
the *original* GaugeGroup 2 and FCP.BFSSSU2.pauli, with output B/input A.
Adapt only finite-matrix arithmetic techniques from QICLean EulerAngles
at public pinned 603fc408b9f4, not its version-specific package imports.
No assumption or declaration of global SO(3) surjectivity.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CZImage
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeZGenerator
open FCP.BFSSIBIG0CInversePauli
open Matrix

/-- Target real Z-axis rotation in source output-row/input-column order. -/
def sourceRotZ (θ : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![Real.cos θ, -Real.sin θ, 0;
     Real.sin θ, Real.cos θ, 0;
     0, 0, 1]

private theorem sourceZMatrix_inv_adjugate (θ : ℝ) :
    (sourceZMatrix θ)⁻¹ = (sourceZMatrix θ).adjugate := by
  have hdet : (sourceZMatrix θ).det = 1 :=
    (Matrix.mem_specialUnitaryGroup_iff.mp (sourceZMatrix_mem_specialUnitary θ)).2
  rw [Matrix.inv_def, hdet]
  simp

private theorem complex_re_div_two (z : ℂ) :
    (z / 2).re = z.re / 2 := by
  norm_num [div_eq_mul_inv, Complex.mul_re]

/-- Matrix-level Pauli trace for the exact original diagonal source gauge matrix.
The complex-valued finite calculation is kept separate from the real BFSS
coefficient interpretation, preventing hidden sign/index swaps. -/
theorem sourceZPauli_trace_rotZ
    (θ : ℝ) (B A : Fin 3) :
    (Matrix.trace (FCP.BFSSSU2.pauli B *
      (sourceZMatrix θ * FCP.BFSSSU2.pauli A *
        (sourceZMatrix θ)⁻¹))) / 2 =
        (sourceRotZ θ B A : ℂ) := by
  have hexpP : Complex.exp ((θ : ℂ) / 2 * Complex.I) =
      (Real.cos (θ / 2) : ℂ) +
        (Real.sin (θ / 2) : ℂ) * Complex.I := by
    rw [show (θ : ℂ) / 2 = ((θ / 2 : ℝ) : ℂ) by push_cast; ring,
      Complex.exp_ofReal_mul_I]
  have hexpN : Complex.exp (-((θ : ℂ) / 2 * Complex.I)) =
      (Real.cos (θ / 2) : ℂ) -
        (Real.sin (θ / 2) : ℂ) * Complex.I := by
    have harg : -((θ : ℂ) / 2 * Complex.I) =
        ((-(θ / 2) : ℝ) : ℂ) * Complex.I := by
      push_cast
      ring
    rw [harg, Complex.exp_ofReal_mul_I, Real.cos_neg, Real.sin_neg]
    simp only [Complex.ofReal_neg]
    ring
  have hcos : (Real.cos θ : ℂ) =
      (Real.cos (θ / 2) : ℂ) ^ 2 -
        (Real.sin (θ / 2) : ℂ) ^ 2 := by
    have h : Real.cos θ =
        Real.cos (θ / 2) ^ 2 - Real.sin (θ / 2) ^ 2 := by
      rw [← Real.cos_two_mul' (θ / 2), show 2 * (θ / 2) = θ by ring]
    rw [h]
    push_cast
    ring
  have hsin : (Real.sin θ : ℂ) =
      2 * (Real.sin (θ / 2) : ℂ) *
        (Real.cos (θ / 2) : ℂ) := by
    have h : Real.sin θ =
        2 * Real.sin (θ / 2) * Real.cos (θ / 2) := by
      rw [← Real.sin_two_mul, show 2 * (θ / 2) = θ by ring]
    rw [h]
    push_cast
    ring
  have hpyth :
      ((Real.cos (θ * (1 / 2)) : ℝ) : ℂ) ^ 2 +
        ((Real.sin (θ * (1 / 2)) : ℝ) : ℂ) ^ 2 = 1 := by
    rw [← Complex.ofReal_pow, ← Complex.ofReal_pow, ← Complex.ofReal_add,
      Real.cos_sq_add_sin_sq, Complex.ofReal_one]
  rw [sourceZMatrix_inv_adjugate]
  fin_cases B <;> fin_cases A <;>
    simp only [FCP.BFSSSU2.pauli, sourceZMatrix, sourceRotZ,
      Matrix.adjugate_fin_two_of, Matrix.trace_fin_two,
      Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.of_apply, Matrix.cons_val', Matrix.empty_val',
      Matrix.cons_val_fin_one, Matrix.head_fin_const,
      Matrix.cons_val_two, Matrix.tail_cons, Fin.reduceFinMk, Fin.zero_eta,
      Fin.mk_one, Fin.isValue, Complex.ofReal_zero, Complex.ofReal_one,
      Complex.ofReal_neg, neg_mul, mul_neg, neg_zero, mul_zero,
      zero_mul, add_zero, zero_add, mul_one, one_mul,
      hexpP, hexpN, hcos, hsin] <;>
    (ring_nf;
      (try (simp only [Complex.I_sq, Complex.I_pow_four]; ring_nf));
      (try linear_combination hpyth))

/-- The ACTUAL source BFSS SU(2) adjoint color matrix of the native
Z-generator equals the standard positive Z-axis real rotation. -/
theorem originalAdjointColorMatrix_sourceZ_eq_rotZ (θ : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceZGauge θ) =
      sourceRotZ θ := by
  ext B A
  let t : ℂ := Matrix.trace (FCP.BFSSSU2.pauli B *
    (sourceZMatrix θ * FCP.BFSSSU2.pauli A *
      (sourceZMatrix θ)⁻¹))
  calc
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceZGauge θ)) B A =
        t.re / 2 := by
      simpa only [t, sourceZGauge_coe] using
        (originalAdjointColorMatrix_pauliInverseTrace
          (sourceZGauge θ) B A)
    _ = (t / 2).re := (complex_re_div_two t).symm
    _ = sourceRotZ θ B A := by
      simpa only [t, Complex.ofReal_re] using
        congrArg Complex.re (sourceZPauli_trace_rotZ θ B A)

#print axioms sourceZPauli_trace_rotZ
#print axioms originalAdjointColorMatrix_sourceZ_eq_rotZ

end
end FCP.BFSSIBIG0CZImage
