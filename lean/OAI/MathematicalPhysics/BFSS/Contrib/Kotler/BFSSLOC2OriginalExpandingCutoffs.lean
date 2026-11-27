import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC1OriginalCutoffL2Bounds

/-! LOC2: concrete expanding smooth compact cutoffs on the original boson
space, with gradient scaling and a vanishing uniform gradient bound.
No Hilbert graph convergence or maximal-domain claim yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC2
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC1
open Filter Set
open scoped Topology

def baseCutoff (N : ℕ) : ContDiffBump (0 : Boson N) where
  rIn := 1
  rOut := 2
  rIn_pos := by norm_num
  rIn_lt_rOut := by norm_num

def cutoffScale (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)

theorem cutoffScale_pos (n : ℕ) : 0 < cutoffScale n := by
  unfold cutoffScale
  positivity

theorem cutoffScale_tendsto : Tendsto cutoffScale atTop (𝓝 0) :=
  tendsto_one_div_add_atTop_nhds_zero_nat

def expandingCutoff (N n : ℕ) (x : Boson N) : ℝ :=
  baseCutoff N (cutoffScale n • x)

theorem expandingCutoff_smooth (N n : ℕ) :
    ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (expandingCutoff N n) := by
  have hc : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (fun _ : Boson N => cutoffScale n) := contDiff_const
  have hi : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (id : Boson N → Boson N) := contDiff_id
  have hs : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞)
      (fun x : Boson N => cutoffScale n • x) := hc.smul hi
  exact (baseCutoff N).contDiff.comp hs

theorem expandingCutoff_bounds (N n : ℕ) (x : Boson N) :
    0 ≤ expandingCutoff N n x ∧ expandingCutoff N n x ≤ 1 :=
  ⟨(baseCutoff N).nonneg, (baseCutoff N).le_one⟩

theorem expandingCutoff_support (N n : ℕ) :
    tsupport (expandingCutoff N n) ⊆
      Metric.closedBall 0 (2 / cutoffScale n) := by
  apply closure_minimal _ Metric.isClosed_closedBall
  intro x hx
  by_contra hn
  have hh := cutoffScale_pos n
  have ht : 2 / cutoffScale n < ‖x‖ :=
    lt_of_not_ge (by simpa only [Metric.mem_closedBall, dist_zero_right] using hn)
  have hx' : (baseCutoff N).rOut ≤ ‖cutoffScale n • x‖ := by
    change 2 ≤ ‖cutoffScale n • x‖
    rw [norm_smul, Real.norm_eq_abs, abs_of_pos hh]
    exact ((div_lt_iff₀ hh).mp ht).le.trans_eq (mul_comm _ _)
  have hz : baseCutoff N (cutoffScale n • x) = 0 :=
    (baseCutoff N).zero_of_le_dist (by simpa only [dist_zero_right] using hx')
  exact hx hz

theorem expandingCutoff_compact (N n : ℕ) :
    HasCompactSupport (expandingCutoff N n) :=
  (isCompact_closedBall (0 : Boson N) (2 / cutoffScale n)).of_isClosed_subset
    isClosed_closure (expandingCutoff_support N n)

theorem expandingCutoff_eventually_one (N : ℕ) (x : Boson N) :
    ∀ᶠ n in atTop, expandingCutoff N n x = 1 := by
  have ht : Tendsto (fun n => cutoffScale n • x) atTop (𝓝 (0 : Boson N)) := by
    simpa only [zero_smul] using cutoffScale_tendsto.smul
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => x) atTop (𝓝 x))
  have hb : Metric.ball (0 : Boson N) (baseCutoff N).rIn ∈ 𝓝 0 :=
    Metric.ball_mem_nhds _ (baseCutoff N).rIn_pos
  filter_upwards [ht.eventually hb] with n hn
  exact (baseCutoff N).one_of_mem_closedBall (Metric.ball_subset_closedBall hn)

theorem expandingCutoff_gradient (N n : ℕ) (x : Boson N) :
    cutoffGradient (expandingCutoff N n) x =
      cutoffScale n • cutoffGradient (baseCutoff N) (cutoffScale n • x) := by
  let h := cutoffScale n
  let φ := baseCutoff N
  have hd : Differentiable ℝ (φ : Boson N → ℝ) :=
    (φ.contDiff : ContDiff ℝ 1 (φ : Boson N → ℝ)).differentiable (by norm_num)
  have hs : HasFDerivAt (fun y : Boson N => h • y)
      (h • ContinuousLinearMap.id ℝ (Boson N)) x :=
    (hasFDerivAt_id x).const_smul h
  have he : fderiv ℝ (expandingCutoff N n) x =
      (fderiv ℝ (φ : Boson N → ℝ) (h • x)).comp
        (h • ContinuousLinearMap.id ℝ (Boson N)) :=
    ((hd (h • x)).hasFDerivAt.comp x hs).fderiv
  apply PiLp.ext
  intro p
  change fderiv ℝ (expandingCutoff N n) x (EuclideanSpace.single p 1) =
    h • fderiv ℝ (φ : Boson N → ℝ) (h • x) (EuclideanSpace.single p 1)
  rw [he]
  change (fderiv ℝ (φ : Boson N → ℝ) (h • x)) (h • EuclideanSpace.single p 1) = _
  exact map_smul _ _ _

theorem baseCutoff_gradient_bound (N : ℕ) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ x : Boson N, ‖cutoffGradient (baseCutoff N) x‖ ≤ K := by
  have hs : HasCompactSupport (cutoffGradient (baseCutoff N)) := by
    apply (baseCutoff N).hasCompactSupport.of_isClosed_subset isClosed_closure
    apply closure_minimal _ isClosed_closure
    intro x hx
    by_contra hn
    exact hx (cutoffGradient_zero_off_support (baseCutoff N) x hn)
  have hc : Continuous (cutoffGradient (baseCutoff N)) :=
    cutoffGradient_continuous (baseCutoff N) (baseCutoff N).contDiff
  obtain ⟨K, hK⟩ := (hs.isCompact_range hc).isBounded.exists_norm_le
  exact ⟨max K 0, le_max_right _ _, fun x =>
    (hK _ (mem_range_self x)).trans (le_max_left _ _)⟩

theorem expandingCutoff_uniform_gradient (N : ℕ) :
    ∃ K : ℝ, 0 ≤ K ∧
      (∀ n x, ‖cutoffGradient (expandingCutoff N n) x‖ ≤ K * cutoffScale n) ∧
      Tendsto (fun n => K * cutoffScale n) atTop (𝓝 0) := by
  obtain ⟨K, hK, hb⟩ := baseCutoff_gradient_bound N
  refine ⟨K, hK, ?_, ?_⟩
  · intro n x
    rw [expandingCutoff_gradient, norm_smul, Real.norm_eq_abs,
      abs_of_pos (cutoffScale_pos n), mul_comm K]
    exact mul_le_mul_of_nonneg_left (hb _) (cutoffScale_pos n).le
  · simpa only [mul_zero] using cutoffScale_tendsto.const_mul K

#print axioms baseCutoff
#print axioms cutoffScale
#print axioms cutoffScale_pos
#print axioms cutoffScale_tendsto
#print axioms expandingCutoff
#print axioms expandingCutoff_smooth
#print axioms expandingCutoff_bounds
#print axioms expandingCutoff_support
#print axioms expandingCutoff_compact
#print axioms expandingCutoff_eventually_one
#print axioms expandingCutoff_gradient
#print axioms baseCutoff_gradient_bound
#print axioms expandingCutoff_uniform_gradient

end
end FCP.BFSSLOC2
