import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2G0OriginalPotentialBound

/-! MOL-L2H0: compact support potential multiplication on the literal
original FullL2 carrier, with a uniform Hilbert norm difference estimate.
No graph or essential self-adjointness conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2H0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2G0
open MeasureTheory

def potentialField {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u : Boson N → Fermion N) (x : Boson N) : Fermion N :=
  potentialOperator M a x (u x)

theorem potentialField_stronglyMeasurable {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u : Boson N → Fermion N) (hu : StronglyMeasurable u) :
    StronglyMeasurable (potentialField M a u) := by
  have hV : StronglyMeasurable (potentialOperator M a) :=
    (potentialOperator_continuous M a).stronglyMeasurable
  have he : Continuous (fun p : (Fermion N →L[ℂ] Fermion N) × Fermion N =>
      p.1 p.2) := isBoundedBilinearMap_apply.continuous
  exact he.comp_stronglyMeasurable (hV.prodMk hu)

theorem potentialField_pointwise_difference {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (R K : ℝ)
    (hb : ∀ x ∈ Metric.closedBall (0 : Boson N) R,
      ∀ v w : Fermion N,
        ‖potentialOperator M a x v - potentialOperator M a x w‖ ≤ K * ‖v - w‖)
    (u v : Boson N → Fermion N)
    (hu : tsupport u ⊆ Metric.closedBall 0 R)
    (hv : tsupport v ⊆ Metric.closedBall 0 R) (x : Boson N) :
    ‖potentialField M a u x - potentialField M a v x‖ ≤ K * ‖u x - v x‖ := by
  by_cases hx : x ∈ Metric.closedBall (0 : Boson N) R
  · exact hb x hx (u x) (v x)
  · have huz : u x = 0 := by
      by_contra hne
      exact hx (hu (subset_closure (show x ∈ Function.support u from hne)))
    have hvz : v x = 0 := by
      by_contra hne
      exact hx (hv (subset_closure (show x ∈ Function.support v from hne)))
    simp [potentialField, huz, hvz]

theorem potentialField_memLp {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (u : Boson N → Fermion N)
    (hsm : StronglyMeasurable u) (h2 : MemLp u 2 volume)
    (R : ℝ) (hs : tsupport u ⊆ Metric.closedBall 0 R) :
    MemLp (potentialField M a u) 2 volume := by
  obtain ⟨K, hK, hb⟩ := potentialOperator_ball_bound M a R
  have hscaled : MemLp (K • u) 2 volume := h2.const_smul K
  apply hscaled.of_le (potentialField_stronglyMeasurable M a u hsm).aestronglyMeasurable
  filter_upwards [] with x
  have he : ‖potentialField M a u x‖ ≤ K * ‖u x‖ := by
    by_cases hx : x ∈ Metric.closedBall (0 : Boson N) R
    · exact (potentialOperator M a x).le_of_opNorm_le (hb x hx) (u x)
    · have hz : u x = 0 := by
        by_contra hne
        exact hx (hs (subset_closure (show x ∈ Function.support u from hne)))
      simp [potentialField, hz]
  simpa only [Pi.smul_apply, norm_smul, Real.norm_eq_abs, abs_of_nonneg hK] using he

theorem potentialField_L2_difference {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (R : ℝ) :
    ∃ K : ℝ, 0 ≤ K ∧
      ∀ (u v : Boson N → Fermion N)
        (hu : MemLp u 2 volume) (hv : MemLp v 2 volume)
        (hVu : MemLp (potentialField M a u) 2 volume)
        (hVv : MemLp (potentialField M a v) 2 volume),
        tsupport u ⊆ Metric.closedBall 0 R →
        tsupport v ⊆ Metric.closedBall 0 R →
        ‖hVu.toLp (potentialField M a u) - hVv.toLp (potentialField M a v)‖ ≤
          K * ‖hu.toLp u - hv.toLp v‖ := by
  obtain ⟨K, hK, hb⟩ := potentialOperator_difference_bound M a R
  refine ⟨K, hK, ?_⟩
  intro u v hu hv hVu hVv hsu hsv
  rw [← MemLp.toLp_sub hVu hVv, ← MemLp.toLp_sub hu hv]
  apply Lp.norm_le_mul_norm_of_ae_le_mul
  filter_upwards [(hVu.sub hVv).coeFn_toLp, (hu.sub hv).coeFn_toLp] with x hx hy
  rw [hx, hy]
  exact potentialField_pointwise_difference M a R K hb u v hsu hsv x

#print axioms potentialField
#print axioms potentialField_stronglyMeasurable
#print axioms potentialField_pointwise_difference
#print axioms potentialField_memLp
#print axioms potentialField_L2_difference

end
end FCP.BFSSMOLL2H0
