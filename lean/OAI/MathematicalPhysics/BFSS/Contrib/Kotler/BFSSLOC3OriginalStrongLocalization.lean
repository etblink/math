import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC2OriginalExpandingCutoffs

/-! LOC3: strong localization of original L2 fields and decay of the
literal commutator. Weak graph closure is a separate assembly gate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC3
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC0 FCP.BFSSLOC1 FCP.BFSSLOC2 FCP.BFSSMOLL2C0
open MeasureTheory Filter
open scoped Topology

theorem expandingField_memLp {N : ℕ} (n : ℕ) (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    MemLp (cutoffField (expandingCutoff N n) u) 2 volume := by
  apply cutoffField_memLp (expandingCutoff N n)
    (expandingCutoff_smooth N n).continuous u hu h2 1 (by norm_num)
  intro x
  rw [Real.norm_eq_abs, abs_of_nonneg (expandingCutoff_bounds N n x).1]
  exact (expandingCutoff_bounds N n x).2

def expandingFieldL2 {N : ℕ} (n : ℕ) (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) : FullL2 N :=
  (expandingField_memLp n u hu h2).toLp (cutoffField (expandingCutoff N n) u)

theorem expandingField_error_sq_tendsto {N : ℕ} (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    Tendsto (fun n => ∫ x, ‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2)
      atTop (𝓝 0) := by
  have hdom : Integrable (fun x => (4 : ℝ) * ‖u x‖ ^ 2) volume :=
    ((memLp_two_iff_integrable_sq_norm hu.aestronglyMeasurable).mp h2).const_mul 4
  have hmeas (n : ℕ) : AEStronglyMeasurable
      (fun x => ‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2) volume :=
    (((cutoffField_stronglyMeasurable (expandingCutoff N n)
      (expandingCutoff_smooth N n).continuous u hu).sub hu).norm.pow 2).aestronglyMeasurable
  have hb (n : ℕ) : ∀ᵐ x ∂volume,
      ‖‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2‖ ≤ 4 * ‖u x‖ ^ 2 := by
    filter_upwards [] with x
    have hχ : ∀ y : Boson N, ‖expandingCutoff N n y‖ ≤ 1 := by
      intro y
      rw [Real.norm_eq_abs, abs_of_nonneg (expandingCutoff_bounds N n y).1]
      exact (expandingCutoff_bounds N n y).2
    have hn : ‖cutoffField (expandingCutoff N n) u x - u x‖ ≤ 2 * ‖u x‖ := by
      calc
        _ ≤ ‖cutoffField (expandingCutoff N n) u x‖ + ‖u x‖ := norm_sub_le _ _
        _ ≤ 1 * ‖u x‖ + ‖u x‖ :=
          add_le_add_right (cutoffField_pointwise_bound (expandingCutoff N n) u 1 hχ x) _
        _ = _ := by ring
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
    calc
      _ ≤ (2 * ‖u x‖) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) hn 2
      _ = _ := by ring
  have hlim : ∀ᵐ x ∂volume,
      Tendsto (fun n => ‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2)
        atTop (𝓝 ((fun _ : Boson N => (0 : ℝ)) x)) := by
    filter_upwards [] with x
    apply tendsto_const_nhds.congr'
    filter_upwards [expandingCutoff_eventually_one N x] with n hn
    simp [cutoffField, hn]
  have ht := tendsto_integral_of_dominated_convergence
    (μ := (volume : Measure (Boson N))) (fun x => (4 : ℝ) * ‖u x‖ ^ 2)
    hmeas hdom hb hlim
  simpa only [integral_zero] using ht

theorem expandingFieldL2_tendsto {N : ℕ} (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    Tendsto (fun n => expandingFieldL2 n u hu h2) atTop (𝓝 (h2.toLp u)) := by
  have hn (n : ℕ) : ‖expandingFieldL2 n u hu h2 - h2.toLp u‖ ^ 2 =
      ∫ x, ‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2 := by
    let hc := expandingField_memLp n u hu h2
    change ‖hc.toLp (cutoffField (expandingCutoff N n) u) - h2.toLp u‖ ^ 2 = _
    rw [← MemLp.toLp_sub hc h2]
    exact toLp_norm_sq (cutoffField (expandingCutoff N n) u - u) (hc.sub h2)
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  obtain ⟨m, hm⟩ := Metric.tendsto_atTop.mp
    (expandingField_error_sq_tendsto u hu h2) (ε ^ 2) (by positivity)
  refine ⟨m, fun n hn' => ?_⟩
  rw [dist_eq_norm]
  have hlt : (∫ x, ‖cutoffField (expandingCutoff N n) u x - u x‖ ^ 2) < ε ^ 2 :=
    (le_abs_self _).trans_lt (by
      simpa only [dist_eq_norm, sub_zero, Real.norm_eq_abs] using hm n hn')
  have hs := (hn n).trans_lt hlt
  exact (le_abs_self _).trans_lt (abs_lt_of_sq_lt_sq hs hε.le)

theorem expandingError_memLp {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (n : ℕ) (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    MemLp (cutoffError M a (expandingCutoff N n) u) 2 volume := by
  obtain ⟨K, hK, hb, _⟩ := expandingCutoff_uniform_gradient N
  exact cutoffError_memLp M a (expandingCutoff N n) (expandingCutoff_smooth N n)
    u hu h2 (K * cutoffScale n) (mul_nonneg hK (cutoffScale_pos n).le) (hb n)

def expandingErrorL2 {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (n : ℕ) (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) : FullL2 N :=
  (expandingError_memLp M a n u hu h2).toLp (cutoffError M a (expandingCutoff N n) u)

theorem expandingErrorL2_tendsto {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u : Boson N → Fermion N) (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume) :
    Tendsto (fun n => expandingErrorL2 M a n u hu h2) atTop (𝓝 0) := by
  obtain ⟨K, hK, hb, ht⟩ := expandingCutoff_uniform_gradient N
  have hlim : Tendsto (fun n => (K * cutoffScale n) * ‖h2.toLp u‖) atTop (𝓝 0) := by
    simpa only [zero_mul] using ht.mul_const ‖h2.toLp u‖
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  obtain ⟨m, hm⟩ := Metric.tendsto_atTop.mp hlim ε hε
  refine ⟨m, fun n hn => ?_⟩
  rw [dist_eq_norm, sub_zero]
  have he : ‖expandingErrorL2 M a n u hu h2‖ ≤
      (K * cutoffScale n) * ‖h2.toLp u‖ :=
    cutoffError_L2_bound M a (expandingCutoff N n) u h2
      (expandingError_memLp M a n u hu h2) (K * cutoffScale n)
      (mul_nonneg hK (cutoffScale_pos n).le) (hb n)
  exact he.trans_lt ((le_abs_self _).trans_lt (by
    simpa only [dist_eq_norm, sub_zero, Real.norm_eq_abs] using hm n hn))

#print axioms expandingField_memLp
#print axioms expandingFieldL2
#print axioms expandingField_error_sq_tendsto
#print axioms expandingFieldL2_tendsto
#print axioms expandingError_memLp
#print axioms expandingErrorL2
#print axioms expandingErrorL2_tendsto

end
end FCP.BFSSLOC3
