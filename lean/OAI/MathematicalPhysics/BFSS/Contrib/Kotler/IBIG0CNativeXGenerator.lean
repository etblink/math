import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CInversePauli

/-!
# IBI-G0C native X generator — source-exact BFSS SU(2) witness

New bounded microgate after G0C-Z-IMAGE GREEN. Construct an element of the
genuine original GaugeGroup 2, prove exact special-unitary membership and
zero-angle identity only. Not yet an SO(3) X-image or surjectivity theorem.
Finite matrix proof adapted from public LionSR/QICLean EulerAngles.lean at
603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac; no QICLean package imported.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CNativeXGenerator
noncomputable section

open OAI.BFSSQuantum
open Matrix

/-- Explicit original native 2×2 matrix with negative-i X half-angle sign. -/
def sourceXMatrix (β : ℝ) : ColorMatrix 2 :=
  !![(Real.cos (β / 2) : ℂ), -Complex.I * (Real.sin (β / 2) : ℂ);
     -Complex.I * (Real.sin (β / 2) : ℂ), (Real.cos (β / 2) : ℂ)]

/-- Special-unitary membership in the exact upstream BFSS matrix type. -/
theorem sourceXMatrix_mem_specialUnitary (β : ℝ) :
    sourceXMatrix β ∈ Matrix.specialUnitaryGroup (Fin 2) ℂ := by
  have hp : ((Real.cos (β / 2) : ℂ)) ^ 2 +
      ((Real.sin (β / 2) : ℂ)) ^ 2 = 1 := by
    rw [← Complex.ofReal_pow, ← Complex.ofReal_pow, ← Complex.ofReal_add,
      Real.cos_sq_add_sin_sq, Complex.ofReal_one]
  rw [Matrix.mem_specialUnitaryGroup_iff]
  refine ⟨?_, ?_⟩
  · rw [Matrix.mem_unitaryGroup_iff]
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [sourceXMatrix, Matrix.mul_apply, Fin.sum_univ_two,
        Matrix.star_apply, Matrix.one_apply, Fin.mk_zero, Fin.mk_one,
        Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.of_apply,
        Matrix.cons_val', Matrix.empty_val', Matrix.cons_val_fin_one,
        Complex.star_def, map_neg, map_mul, Complex.conj_I,
        Complex.conj_ofReal, Fin.isValue, Fin.reduceEq,
        ite_true, ite_false] <;>
      first
        | linear_combination hp -
            (Real.sin (β / 2) : ℂ) ^ 2 * Complex.I_sq
        | ring
  · rw [sourceXMatrix, Matrix.det_fin_two_of]
    linear_combination hp -
      (Real.sin (β / 2) : ℂ) ^ 2 * Complex.I_sq

/-- Native source BFSS gauge element, not a separate SU(2) model. -/
noncomputable def sourceXGauge (β : ℝ) : GaugeGroup 2 :=
  ⟨sourceXMatrix β, sourceXMatrix_mem_specialUnitary β⟩

theorem sourceXGauge_coe (β : ℝ) :
    ((sourceXGauge β : GaugeGroup 2) : ColorMatrix 2) = sourceXMatrix β := rfl

/-- Identity at zero angle in original source GaugeGroup 2. -/
theorem sourceXGauge_zero : sourceXGauge 0 = 1 := by
  apply Subtype.ext
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sourceXGauge, sourceXMatrix, Matrix.one_apply]

#print axioms sourceXMatrix_mem_specialUnitary
#print axioms sourceXGauge_coe
#print axioms sourceXGauge_zero

end
end FCP.BFSSIBIG0CNativeXGenerator
