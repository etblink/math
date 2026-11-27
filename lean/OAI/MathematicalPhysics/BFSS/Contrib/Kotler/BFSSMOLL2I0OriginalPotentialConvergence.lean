import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2H0OriginalPotentialL2Bound

/-! MOL-L2I0: strong convergence of the literal original potential applied
to the shrinking mollifier sequence, via the qualified common support and
Hilbert norm estimate. No charge graph or essential self-adjointness yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2I0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0 FCP.BFSSMOLL2F0
open FCP.BFSSMOLL2H0
open MeasureTheory Filter
open scoped Topology

def potentialL2 {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (R : ℝ)
    (hs : tsupport u ⊆ Metric.closedBall 0 R) : FullL2 N :=
  (potentialField_memLp M a u hsm h2 R hs).toLp (potentialField M a u)

def corePotentialL2 {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (f : SmoothCore N) (R : ℝ)
    (hs : tsupport (f : Boson N → Fermion N) ⊆ Metric.closedBall 0 R) : FullL2 N :=
  potentialL2 M a f f.continuous.stronglyMeasurable
    (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport) R hs

theorem potentialL2_ae {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (R : ℝ)
    (hs : tsupport u ⊆ Metric.closedBall 0 R) :
    (potentialL2 M a u hsm h2 R hs : Boson N → Fermion N) =ᵐ[volume]
      potentialField M a u :=
  (potentialField_memLp M a u hsm h2 R hs).coeFn_toLp

theorem corePotentialL2_tendsto {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (R : ℝ)
    (hs : tsupport u ⊆ Metric.closedBall 0 R)
    (f : ℕ → SmoothCore N)
    (hfs : ∀ n, tsupport (f n : Boson N → Fermion N) ⊆ Metric.closedBall 0 R)
    (ht : Tendsto (fun n => coreToL2 (f n)) atTop (𝓝 (h2.toLp u))) :
    Tendsto (fun n => corePotentialL2 M a (f n) R (hfs n)) atTop
      (𝓝 (potentialL2 M a u hsm h2 R hs)) := by
  obtain ⟨K, hK, hb⟩ := potentialField_L2_difference M a R
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  have hpos : 0 < K + 1 := by linarith
  obtain ⟨m, hm⟩ := Metric.tendsto_atTop.mp ht (ε / (K + 1)) (div_pos hε hpos)
  refine ⟨m, fun n hn => ?_⟩
  rw [dist_eq_norm]
  have hsmall := hm n hn
  rw [dist_eq_norm] at hsmall
  have hmul := (lt_div_iff₀ hpos).mp hsmall
  have hfn : MemLp (f n : Boson N → Fermion N) 2 volume :=
    (f n).continuous.memLp_of_hasCompactSupport (f n).hasCompactSupport
  have hVfn : MemLp (potentialField M a (f n)) 2 volume :=
    potentialField_memLp M a (f n) (f n).continuous.stronglyMeasurable hfn R (hfs n)
  have hVu : MemLp (potentialField M a u) 2 volume :=
    potentialField_memLp M a u hsm h2 R hs
  have hbound := hb (f n) u hfn h2 hVfn hVu (hfs n) hs
  change ‖corePotentialL2 M a (f n) R (hfs n) -
    potentialL2 M a u hsm h2 R hs‖ ≤ K * ‖coreToL2 (f n) - h2.toLp u‖ at hbound
  calc
    _ ≤ K * ‖coreToL2 (f n) - h2.toLp u‖ := hbound
    _ ≤ (K + 1) * ‖coreToL2 (f n) - h2.toLp u‖ :=
      mul_le_mul_of_nonneg_right (by linarith) (norm_nonneg _)
    _ < ε := by simpa only [mul_comm] using hmul

theorem input_support_enlarged {N : ℕ} (u : Boson N → Fermion N) (R : ℝ)
    (hs : tsupport u ⊆ Metric.closedBall 0 R) :
    tsupport u ⊆ Metric.closedBall 0 (R + 1) := by
  intro x hx
  have h : ‖x‖ ≤ R := by
    simpa only [Metric.mem_closedBall, dist_zero_right] using hs hx
  have h' : ‖x‖ ≤ R + 1 := by linarith
  simpa only [Metric.mem_closedBall, dist_zero_right] using h'

theorem concrete_mollified_potential_tendsto {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (R : ℝ)
    (hR : tsupport u ⊆ Metric.closedBall 0 R) :
    Tendsto (fun n => corePotentialL2 M a
      (mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hs) (R + 1)
      (concrete_mollified_uniform_support u hu hs R hR n)) atTop
      (𝓝 (potentialL2 M a u hsm h2 (R + 1) (input_support_enlarged u R hR))) :=
  corePotentialL2_tendsto M a u hsm h2 (R + 1) (input_support_enlarged u R hR)
    (fun n => mollifiedCore (normalizedKernel (shrinkingBump N n)) u hu hs)
    (concrete_mollified_uniform_support u hu hs R hR)
    (concrete_mollified_tendsto u hsm h2 hu hs)

#print axioms potentialL2
#print axioms corePotentialL2
#print axioms potentialL2_ae
#print axioms corePotentialL2_tendsto
#print axioms input_support_enlarged
#print axioms concrete_mollified_potential_tendsto

end
end FCP.BFSSMOLL2I0
