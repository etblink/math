import OAI.MathematicalPhysics.BFSS.FormCompactness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralCoreLinearMomentCompactness

/-! Linear radial confinement in the original weighted Sobolev closure.
These analysis statements assume the closure membership and norm bounds;
they do not identify a BFSS physical Hamiltonian or derive an energy estimate. -/

set_option autoImplicit false

namespace OAI.BFSSSliceSobolev
noncomputable section
open MeasureTheory Set Filter Topology
open scoped NNReal

variable {ι F : Type*} [Fintype ι] [NormedAddCommGroup F]
  [InnerProductSpace ℝ F] [CompleteSpace F] [FiniteDimensional ℝ F]
local notation "X" => EuclideanSpace ℝ ι
local notation "μ" => (volume : Measure X)
local notation "e" => (EuclideanSpace.basisFun ι ℝ)

theorem weightedClosure_linear_totallyBounded (w : X → ℝ) (hw : Continuous w)
    (c : ℝ) (hc : 0 < c) (hcw : ∀ x : X, c * ‖x‖ ≤ w x ^ 2)
    (u : ℕ → Lp F 2 μ) (v : ℕ → Gradient (F := F) μ (ι := ι))
    (m : ℕ → Lp F 2 μ) (A B C : ℝ≥0)
    (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure μ e w hw)
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) := by
  let ε : ℕ → ℝ := fun n => 1 / ((n : ℝ) + 1)
  have hε (n : ℕ) : 0 < ε n := one_div_pos.mpr (by positivity)
  have hε1 (n : ℕ) : ε n ≤ 1 := by
    apply (div_le_iff₀ (show 0 < (n : ℝ) + 1 by positivity)).2
    simp only [one_mul]
    linarith [Nat.cast_nonneg (α := ℝ) n]
  choose f hfu hfv hfm using (fun n => weightedClosure_approx w hw (hd n) (hε n))
  have hfA (n : ℕ) : ‖gradient μ e (f n)‖ ≤ (A + 1 : ℝ≥0) := by
    have hdist : dist (gradient μ e (f n)) (v n) ≤ 1 := by
      simpa only [dist_comm] using (hfv n).le.trans (hε1 n)
    have he := norm_le_norm_add_const_of_dist_le hdist
    change _ ≤ (A : ℝ) + 1
    linarith [hA n]
  have hfB (n : ℕ) : ‖toL2 μ (f n)‖ ≤ (B + 1 : ℝ≥0) := by
    have hdist : dist (toL2 μ (f n)) (u n) ≤ 1 := by
      simpa only [dist_comm] using (hfu n).le.trans (hε1 n)
    have he := norm_le_norm_add_const_of_dist_le hdist
    change _ ≤ (B : ℝ) + 1
    linarith [hB n]
  have hfC (n : ℕ) : ‖weightedToL2 μ w hw (f n)‖ ≤ (C : ℝ) + 1 := by
    have hdist : dist (weightedToL2 μ w hw (f n)) (m n) ≤ 1 := by
      simpa only [dist_comm] using (hfm n).le.trans (hε1 n)
    have he := norm_le_norm_add_const_of_dist_le hdist
    linarith [hC n]
  let D : ℝ≥0 := ⟨((C : ℝ) + 1)^2 / c, div_nonneg (sq_nonneg _) hc.le⟩
  have hmoment (n : ℕ) : (∫ x : X, ‖x‖ * ‖f n x‖^2) ≤ (D : ℝ) := by
    change _ ≤ ((C : ℝ) + 1)^2 / c
    apply (le_div_iff₀ hc).2
    rw [mul_comm, ←integral_const_mul]
    calc
      _ ≤ ∫ x : X, w x ^ 2 * ‖f n x‖^2 := by
        apply integral_mono
          (((continuous_norm.mul ((f n).continuous.norm.pow 2)).integrable_of_hasCompactSupport
            (norm_sq_compact (f n) (f n).hasCompactSupport).mul_left).const_mul c)
          (((hw.pow 2).mul ((f n).continuous.norm.pow 2)).integrable_of_hasCompactSupport
            (norm_sq_compact (f n) (f n).hasCompactSupport).mul_left)
        intro x
        change c * (‖x‖ * ‖f n x‖^2) ≤ w x ^ 2 * ‖f n x‖^2
        simpa only [mul_assoc] using mul_le_mul_of_nonneg_right (hcw x) (sq_nonneg ‖f n x‖)
      _ = ‖weightedToL2 μ w hw (f n)‖^2 := (weightedToL2_norm_sq w hw (f n)).symm
      _ ≤ ((C : ℝ) + 1)^2 := pow_le_pow_left₀ (norm_nonneg _) (hfC n) 2
  apply BFSSRellich.totallyBounded_asymptotic (fun n => toL2 μ (f n)) u
    (core_linear_moment_totallyBounded f (A + 1) (B + 1) D hfA hfB hmoment)
  have hdist (n : ℕ) : dist (toL2 μ (f n)) (u n) ≤ ε n := by
    simpa only [dist_comm] using (hfu n).le
  exact squeeze_zero (fun n => dist_nonneg) hdist tendsto_one_div_add_atTop_nhds_zero_nat

theorem weightedClosure_sqrt_radial_totallyBounded (u : ℕ → Lp F 2 μ)
    (v : ℕ → Gradient (F := F) μ (ι := ι))
    (m : ℕ → Lp F 2 μ) (A B C : ℝ≥0)
    (hd : ∀ n, (u n, v n, m n) ∈ weightedClosure μ e
      (fun x : X => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm))
    (hA : ∀ n, ‖v n‖ ≤ A) (hB : ∀ n, ‖u n‖ ≤ B) (hC : ∀ n, ‖m n‖ ≤ C) :
    TotallyBounded (range u) := by
  apply weightedClosure_linear_totallyBounded (fun x : X => Real.sqrt ‖x‖)
    (Real.continuous_sqrt.comp continuous_norm) 1 zero_lt_one _ u v m A B C hd hA hB hC
  intro x
  simpa only [one_mul] using (Real.sq_sqrt (norm_nonneg x)).ge

end
end OAI.BFSSSliceSobolev

#print axioms OAI.BFSSSliceSobolev.weightedClosure_linear_totallyBounded
#print axioms OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded
#eval IO.println "SPECTRAL_WEIGHTED_CLOSURE_SOURCE_OK"
