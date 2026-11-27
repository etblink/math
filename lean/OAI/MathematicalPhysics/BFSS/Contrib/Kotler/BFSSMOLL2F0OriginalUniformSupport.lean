import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2E0OriginalStrongApproximation

/-! MOL-L2F0: one closed ball supports every member of the literal shrinking
normalized mollifier sequence. No potential or charge graph conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2F0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open MeasureTheory

theorem shrinkingBump_radius_le_one (N n : ℕ) :
    (shrinkingBump N n).rOut ≤ 1 := by
  change 1 / ((n : ℝ) + 1) ≤ 1
  have hn : 0 ≤ (n : ℝ) := by positivity
  exact (div_le_iff₀ (by positivity : 0 < (n : ℝ) + 1)).2 (by linarith)

theorem normalized_mollified_support {N : ℕ}
    (φ : ContDiffBump (0 : Boson N)) (u : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R) :
    tsupport (mollifiedCore (normalizedKernel φ) u hu hs : Boson N → Fermion N) ⊆
      Metric.closedBall 0 (R + φ.rOut) := by
  change closure (Function.support
    (mollifiedCore (normalizedKernel φ) u hu hs : Boson N → Fermion N)) ⊆ _
  apply closure_minimal
  · intro x hx
    by_contra hout
    have hxn : R + φ.rOut < ‖x‖ := by
      apply lt_of_not_ge
      intro h
      exact hout (by simpa only [Metric.mem_closedBall, dist_zero_right] using h)
    have hz : mollifiedCore (normalizedKernel φ) u hu hs x = 0 := by
      rw [mollifiedCore_apply]
      have hfun : (fun y : Boson N => normalizedKernel φ (x - y) • u y) =
          (fun _ : Boson N => (0 : Fermion N)) := by
        funext y
        by_cases hy : u y = 0
        · rw [hy, smul_zero]
        · have hyb := hR (subset_closure (show y ∈ Function.support u from hy))
          have hyn : ‖y‖ ≤ R := by
            simpa only [Metric.mem_closedBall, dist_zero_right] using hyb
          have hk : normalizedKernel φ (x - y) = 0 := by
            by_contra hne
            have hks : x - y ∈ tsupport (normalizedKernel φ : Boson N → ℝ) :=
              subset_closure (show x - y ∈ Function.support
                (normalizedKernel φ : Boson N → ℝ) from hne)
            rw [(normalizedKernel_properties φ).2.2] at hks
            have hkn : ‖x - y‖ ≤ φ.rOut := by
              simpa only [Metric.mem_closedBall, dist_zero_right] using hks
            have ht := norm_add_le (x - y) y
            rw [sub_add_cancel] at ht
            linarith
          rw [hk, zero_smul]
      rw [hfun, integral_zero]
    exact (show mollifiedCore (normalizedKernel φ) u hu hs x ≠ 0 from hx) hz
  · exact Metric.isClosed_closedBall

theorem concrete_mollified_uniform_support {N : ℕ}
    (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (R : ℝ)
    (hR : tsupport u ⊆ Metric.closedBall 0 R) (n : ℕ) :
    tsupport (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hs :
      Boson N → Fermion N) ⊆ Metric.closedBall 0 (R + 1) := by
  intro x hx
  have h := normalized_mollified_support (shrinkingBump N n) u hu hs R hR hx
  have hb : ‖x‖ ≤ R + (shrinkingBump N n).rOut := by
    simpa only [Metric.mem_closedBall, dist_zero_right] using h
  have hle : ‖x‖ ≤ R + 1 := by
    linarith [shrinkingBump_radius_le_one N n]
  simpa only [Metric.mem_closedBall, dist_zero_right] using hle

#print axioms shrinkingBump_radius_le_one
#print axioms normalized_mollified_support
#print axioms concrete_mollified_uniform_support

end
end FCP.BFSSMOLL2F0
