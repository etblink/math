import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CInversePauli

/-!
# IBI-G0C native Z generator: genuine BFSS SU(2) element

G0C-Z-GEN0 microgate. Construct a source-native special-unitary family
using the diagonal complex exponentials with the standard Pauli z-axis
half-angle convention. No source SU(2) substitution, no assertion of its
SO(3) image, and no global cover/surjectivity theorem.

The finite special-unitarity proof pattern is adapted from the public
LionSR/QICLean SpinCover/EulerAngles.lean at 603fc408b9f4
(Apache-2.0), whose Lean version is different. This implementation must
compile independently against the original pinned BFSS 4.34.1 source.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CNativeZGenerator
noncomputable section

open OAI.BFSSQuantum
open Matrix

/-- Explicit diagonal SU(2) z-axis witness in the original ColorMatrix 2. -/
def sourceZMatrix (θ : ℝ) : ColorMatrix 2 :=
  !![Complex.exp (-(θ / 2) * Complex.I), 0;
     0, Complex.exp (θ / 2 * Complex.I)]

/-- The literal BFSS special-unitary membership certificate. -/
theorem sourceZMatrix_mem_specialUnitary (θ : ℝ) :
    sourceZMatrix θ ∈ Matrix.specialUnitaryGroup (Fin 2) ℂ := by
  rw [Matrix.mem_specialUnitaryGroup_iff]
  refine ⟨?_, ?_⟩
  · rw [Matrix.mem_unitaryGroup_iff]
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [sourceZMatrix, Matrix.mul_apply, Fin.sum_univ_two,
        Matrix.star_apply, Matrix.one_apply, Complex.star_def,
        Fin.mk_zero, Fin.mk_one, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.of_apply, Matrix.cons_val',
        Matrix.empty_val', Matrix.cons_val_fin_one, ← Complex.exp_conj,
        ← Complex.exp_add, map_zero, mul_zero, zero_mul, add_zero,
        zero_add, Fin.isValue, Fin.reduceEq, ite_true, ite_false] <;>
      first
        | rfl
        | (rw [← Complex.exp_zero]; congr 1
           simp only [map_mul, Complex.conj_I, Complex.conj_ofReal,
             map_div₀, map_neg, map_ofNat]
           ring)
  · rw [sourceZMatrix, Matrix.det_fin_two_of, mul_zero, sub_zero,
      ← Complex.exp_add]
    rw [show -(θ / 2) * Complex.I + θ / 2 * Complex.I = 0 by ring,
      Complex.exp_zero]

/-- The constructed element belongs to the ACTUAL upstream GaugeGroup 2. -/
noncomputable def sourceZGauge (θ : ℝ) : GaugeGroup 2 :=
  ⟨sourceZMatrix θ, sourceZMatrix_mem_specialUnitary θ⟩

theorem sourceZGauge_coe (θ : ℝ) :
    ((sourceZGauge θ : GaugeGroup 2) : ColorMatrix 2) = sourceZMatrix θ := rfl

/-- Z(0) is the exact native gauge identity, not a new group identity. -/
theorem sourceZGauge_zero : sourceZGauge 0 = 1 := by
  apply Subtype.ext
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sourceZGauge, sourceZMatrix, Matrix.one_apply]

#print axioms sourceZMatrix_mem_specialUnitary
#print axioms sourceZGauge_coe
#print axioms sourceZGauge_zero

end
end FCP.BFSSIBIG0CNativeZGenerator
