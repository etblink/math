import OAI.MathematicalPhysics.BFSS.Core

/-!
# P3-AUX-R0A — original BFSS radial scalar lower-bound contract

PROSPECTIVE / UNQUALIFIED until an exact strict source/independent
consumer/allowed-axiom gate passes. This is the original Boson 2
configuration space (nine spatial by three SU2 color coordinates).

This first *scalar* gate is deliberately NOT a multiplication operator
on L², NOT a claim that the weighted charge has dense domain, and NOT
an auxiliary Hamiltonian or spectral result.
-/

set_option autoImplicit false

namespace FCP.BFSSP3AuxR0AOriginalRadialScalar
noncomputable section

open OAI.BFSSQuantum

/-- Actual original sixteen-component charge-output carrier.
    This is a type anchor, not a weighted operator. -/
abbrev OriginalChargeOutput :=
  PiLp 2 (fun _ : SpinIndex => FullL2 2)

/-- Positive radial regularization on the literal original SU2 boson space. -/
def originalRadialWeight (ε : ℝ) (x : Boson 2) : ℝ :=
  Real.sqrt (‖x‖ ^ 2 + ε ^ 2)

/-- Exact scalar identity used in the regularized weight domain calculation. -/
theorem originalRadialWeight_sq (ε : ℝ) (x : Boson 2) :
    originalRadialWeight ε x ^ 2 = ‖x‖ ^ 2 + ε ^ 2 := by
  unfold originalRadialWeight
  exact Real.sq_sqrt (add_nonneg (sq_nonneg _) (sq_nonneg _))

/-- This is strict positivity for every bosonic configuration. -/
theorem originalRadialWeight_pos {ε : ℝ} (hε : 0 < ε)
    (x : Boson 2) : 0 < originalRadialWeight ε x := by
  unfold originalRadialWeight
  apply Real.sqrt_pos.2
  have hnorm : 0 ≤ ‖x‖ ^ 2 := sq_nonneg _
  have hεsq : 0 < ε ^ 2 := pow_pos hε _
  linarith

/-- Pointwise uniform lower bound without an upper radial cutoff. -/
theorem originalRadialWeight_ge {ε : ℝ} (hε : 0 < ε)
    (x : Boson 2) : ε ≤ originalRadialWeight ε x := by
  have hw : 0 ≤ originalRadialWeight ε x := le_of_lt
    (originalRadialWeight_pos hε x)
  have hs : originalRadialWeight ε x ^ 2 = ‖x‖ ^ 2 + ε ^ 2 :=
    originalRadialWeight_sq ε x
  have hn : 0 ≤ ‖x‖ ^ 2 := sq_nonneg _
  nlinarith

/-- Reciprocal weight bounded above by the constant 1/ε. -/
theorem originalRadialWeight_inv_le {ε : ℝ} (hε : 0 < ε)
    (x : Boson 2) :
    (originalRadialWeight ε x)⁻¹ ≤ ε⁻¹ := by
  simpa only [one_div] using
    (one_div_le_one_div_of_le hε (originalRadialWeight_ge hε x))

/-- The complex scalar multiplier and its reciprocal cancel pointwise. -/
theorem originalRadialWeight_complex_mul_inv {ε : ℝ}
    (hε : 0 < ε) (x : Boson 2) :
    (originalRadialWeight ε x : ℂ) *
      (originalRadialWeight ε x : ℂ)⁻¹ = 1 := by
  have hw : (originalRadialWeight ε x : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hε x))
  exact mul_inv_cancel₀ hw

#print axioms originalRadialWeight_sq
#print axioms originalRadialWeight_pos
#print axioms originalRadialWeight_ge
#print axioms originalRadialWeight_inv_le
#print axioms originalRadialWeight_complex_mul_inv

end
end FCP.BFSSP3AuxR0AOriginalRadialScalar
