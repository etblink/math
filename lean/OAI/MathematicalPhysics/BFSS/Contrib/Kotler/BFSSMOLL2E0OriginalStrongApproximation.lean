import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2D0OriginalMollifierDifference

/-! MOL-L2E0: strong original FullL2 approximation by shrinking normalized
kernels, first on the original smooth core, then by density and contraction.
No charge graph or essential self-adjointness conclusion yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2E0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2C0 FCP.BFSSMOLL2D0
open MeasureTheory Filter
open scoped Topology

def shrinkingBump (N n : ℕ) : ContDiffBump (0 : Boson N) where
  rIn := (1 / ((n : ℝ) + 1)) / 2
  rOut := 1 / ((n : ℝ) + 1)
  rIn_pos := by positivity
  rIn_lt_rOut := by
    have h : 0 < 1 / ((n : ℝ) + 1) := by positivity
    linarith

theorem shrinkingBump_radius (N : ℕ) :
    Tendsto (fun n => (shrinkingBump N n).rOut) atTop (𝓝 0) :=
  tendsto_one_div_add_atTop_nhds_zero_nat

theorem smooth_mollified_tendsto {N : ℕ}
    (φ : ℕ → ContDiffBump (0 : Boson N))
    (hr : Tendsto (fun n => (φ n).rOut) atTop (𝓝 0))
    (f : SmoothCore N) (hf : LocallyIntegrable (f : Boson N → Fermion N) volume) :
    Tendsto (fun n => coreToL2
      (mollifiedCore (normalizedKernel (φ n)) f hf f.hasCompactSupport))
      atTop (𝓝 (coreToL2 f)) := by
  let C : ℝ := ∫ x, ‖fderiv ℝ (f : Boson N → Fermion N) x‖ ^ 2
  have ht : Tendsto (fun n => (φ n).rOut ^ 2 * C) atTop (𝓝 0) := by
    simpa only [zero_pow (by decide : (2 : ℕ) ≠ 0), zero_mul] using
      (hr.pow 2).mul_const C
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  obtain ⟨m, hm⟩ := Metric.tendsto_atTop.mp ht (ε ^ 2) (by positivity)
  refine ⟨m, fun n hn => ?_⟩
  rw [dist_eq_norm]
  have hb := normalized_mollified_core_error (φ n) f hf
  have hlt : (φ n).rOut ^ 2 * C < ε ^ 2 :=
    (le_abs_self _).trans_lt (by
      simpa only [dist_eq_norm, sub_zero, Real.norm_eq_abs] using hm n hn)
  have hsq : ‖coreToL2 (mollifiedCore (normalizedKernel (φ n)) f hf
      f.hasCompactSupport) - coreToL2 f‖ ^ 2 < ε ^ 2 := hb.trans_lt hlt
  exact (le_abs_self _).trans_lt (abs_lt_of_sq_lt_sq hsq hε.le)

theorem normalized_mollified_tendsto {N : ℕ}
    (φ : ℕ → ContDiffBump (0 : Boson N))
    (hr : Tendsto (fun n => (φ n).rOut) atTop (𝓝 0))
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    Tendsto (fun n => coreToL2 (mollifiedCore (normalizedKernel (φ n)) u hu hs))
      atTop (𝓝 (h2.toLp u)) := by
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  obtain ⟨f, hclose⟩ := Metric.denseRange_iff.mp (coreToL2_dense (N := N))
    (h2.toLp u) (ε / 4) (by positivity)
  have hf : LocallyIntegrable (f : Boson N → Fermion N) volume :=
    (f.continuous.integrable_of_hasCompactSupport f.hasCompactSupport).locallyIntegrable
  obtain ⟨m, hm⟩ := Metric.tendsto_atTop.mp
    (smooth_mollified_tendsto φ hr f hf) (ε / 2) (by positivity)
  refine ⟨m, fun n hn => ?_⟩
  rw [dist_eq_norm] at hclose ⊢
  have hsmall :
      ‖coreToL2 (mollifiedCore (normalizedKernel (φ n)) f hf f.hasCompactSupport) -
        coreToL2 f‖ < ε / 2 := by
    simpa only [dist_eq_norm] using hm n hn
  have hb := normalized_mollified_density_bound (φ n) u hsm h2 hu hs f hf
  linarith only [hb, hclose, hsmall]

theorem concrete_mollified_tendsto {N : ℕ}
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    Tendsto (fun n => coreToL2 (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hs))
      atTop (𝓝 (h2.toLp u)) :=
  normalized_mollified_tendsto (shrinkingBump N) (shrinkingBump_radius N) u hsm h2 hu hs

#print axioms shrinkingBump
#print axioms shrinkingBump_radius
#print axioms smooth_mollified_tendsto
#print axioms normalized_mollified_tendsto
#print axioms concrete_mollified_tendsto

end
end FCP.BFSSMOLL2E0
