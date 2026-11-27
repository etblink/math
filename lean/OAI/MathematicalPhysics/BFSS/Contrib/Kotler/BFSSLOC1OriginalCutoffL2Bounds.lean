import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC0OriginalWeakCutoffPairing

/-! LOC1: measurable compact localized fields, uniform L2 bounds for the
literal cutoff and commutator. No expanding cutoff or maximal-domain claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC1
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC0
open MeasureTheory Filter
open scoped Topology

theorem cutoffField_stronglyMeasurable {N : ℕ} (χ : Boson N → ℝ)
    (hc : Continuous χ) (u : Boson N → Fermion N) (hu : StronglyMeasurable u) :
    StronglyMeasurable (cutoffField χ u) := by
  have hχ : StronglyMeasurable (fun x => (χ x : ℂ)) :=
    (Complex.ofRealCLM.continuous.comp hc).stronglyMeasurable
  exact hχ.smul hu

theorem cutoffError_stronglyMeasurable {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (χ : Boson N → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (u : Boson N → Fermion N) (hu : StronglyMeasurable u) :
    StronglyMeasurable (cutoffError M a χ u) := by
  have hs : Continuous (M.principalSymbolLinear a) :=
    (M.principalSymbolLinear a).continuous_of_finiteDimensional
  have hS : StronglyMeasurable (fun x : Boson N =>
      M.principalSymbol (Pi.single a 1) (cutoffGradient χ x)) :=
    (hs.comp (cutoffGradient_continuous χ hχ)).stronglyMeasurable
  have he : Continuous (fun p : (Fermion N →L[ℂ] Fermion N) × Fermion N =>
      p.1 p.2) := isBoundedBilinearMap_apply.continuous
  have hm := he.comp_stronglyMeasurable (hS.prodMk hu)
  exact hm.const_smul (-Complex.I)

theorem cutoffGradient_zero_off_support {N : ℕ} (χ : Boson N → ℝ)
    (x : Boson N) (hx : x ∉ tsupport χ) : cutoffGradient χ x = 0 := by
  have hn : (tsupport χ)ᶜ ∈ 𝓝 x := isClosed_closure.isOpen_compl.mem_nhds hx
  have he : χ =ᶠ[𝓝 x] (fun _ : Boson N => (0 : ℝ)) := by
    filter_upwards [hn] with y hy
    by_contra hne
    exact hy (subset_closure (show y ∈ Function.support χ from hne))
  have hd : fderiv ℝ χ x = 0 := by
    rw [he.fderiv_eq]
    simp
  unfold cutoffGradient
  rw [hd]
  apply PiLp.ext
  intro p
  rfl

theorem cutoffField_support {N : ℕ} (χ : Boson N → ℝ)
    (u : Boson N → Fermion N) : tsupport (cutoffField χ u) ⊆ tsupport χ := by
  apply closure_mono
  intro x hx
  change cutoffField χ u x ≠ 0 at hx
  change χ x ≠ 0
  intro hz
  exact hx (by simp [cutoffField, hz])

theorem cutoffError_support {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (χ : Boson N → ℝ) (u : Boson N → Fermion N) :
    tsupport (cutoffError M a χ u) ⊆ tsupport χ := by
  apply closure_minimal
  · intro x hx
    by_contra hout
    have hn := cutoffError_norm_sq M a χ u x
    rw [cutoffGradient_zero_off_support χ x hout, norm_zero] at hn
    have hz : ‖cutoffError M a χ u x‖ = 0 := by nlinarith
    exact (show cutoffError M a χ u x ≠ 0 from hx) (norm_eq_zero.mp hz)
  · exact isClosed_closure

theorem cutoffField_pointwise_bound {N : ℕ} (χ : Boson N → ℝ)
    (u : Boson N → Fermion N) (K : ℝ) (hK : ∀ x, ‖χ x‖ ≤ K) (x : Boson N) :
    ‖cutoffField χ u x‖ ≤ K * ‖u x‖ := by
  rw [cutoffField, norm_smul, Complex.norm_real]
  exact mul_le_mul_of_nonneg_right (hK x) (norm_nonneg _)

theorem cutoffError_pointwise_bound {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (χ : Boson N → ℝ) (u : Boson N → Fermion N)
    (G : ℝ) (hG : 0 ≤ G) (hb : ∀ x, ‖cutoffGradient χ x‖ ≤ G) (x : Boson N) :
    ‖cutoffError M a χ u x‖ ≤ G * ‖u x‖ := by
  have hg : ‖cutoffGradient χ x‖ ^ 2 ≤ G ^ 2 := by
    nlinarith [mul_nonneg (sub_nonneg.mpr (hb x))
      (add_nonneg hG (norm_nonneg (cutoffGradient χ x)))]
  have hp := mul_le_mul_of_nonneg_right hg (sq_nonneg ‖u x‖)
  have hn := cutoffError_norm_sq M a χ u x
  apply le_of_sq_le_sq _ (mul_nonneg hG (norm_nonneg _))
  rw [mul_pow]
  nlinarith only [hp, hn, mul_nonneg (sq_nonneg ‖cutoffGradient χ x‖)
    (sq_nonneg ‖u x‖)]

theorem cutoffField_memLp {N : ℕ} (χ : Boson N → ℝ)
    (hc : Continuous χ) (u : Boson N → Fermion N)
    (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume)
    (K : ℝ) (hK : 0 ≤ K) (hb : ∀ x, ‖χ x‖ ≤ K) :
    MemLp (cutoffField χ u) 2 volume := by
  have hs : MemLp (K • u) 2 volume := h2.const_smul K
  apply hs.of_le (cutoffField_stronglyMeasurable χ hc u hu).aestronglyMeasurable
  filter_upwards [] with x
  simpa only [Pi.smul_apply, norm_smul, Real.norm_eq_abs, abs_of_nonneg hK] using
    cutoffField_pointwise_bound χ u K hb x

theorem cutoffError_memLp {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (χ : Boson N → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (u : Boson N → Fermion N) (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume)
    (G : ℝ) (hG : 0 ≤ G) (hb : ∀ x, ‖cutoffGradient χ x‖ ≤ G) :
    MemLp (cutoffError M a χ u) 2 volume := by
  have hs : MemLp (G • u) 2 volume := h2.const_smul G
  apply hs.of_le (cutoffError_stronglyMeasurable M a χ hχ u hu).aestronglyMeasurable
  filter_upwards [] with x
  simpa only [Pi.smul_apply, norm_smul, Real.norm_eq_abs, abs_of_nonneg hG] using
    cutoffError_pointwise_bound M a χ u G hG hb x

theorem cutoffError_L2_bound {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (χ : Boson N → ℝ) (u : Boson N → Fermion N)
    (h2 : MemLp u 2 volume) (he : MemLp (cutoffError M a χ u) 2 volume)
    (G : ℝ) (hG : 0 ≤ G) (hb : ∀ x, ‖cutoffGradient χ x‖ ≤ G) :
    ‖he.toLp (cutoffError M a χ u)‖ ≤ G * ‖h2.toLp u‖ := by
  apply Lp.norm_le_mul_norm_of_ae_le_mul
  filter_upwards [he.coeFn_toLp, h2.coeFn_toLp] with x hx hy
  rw [hx, hy]
  exact cutoffError_pointwise_bound M a χ u G hG hb x

#print axioms cutoffField_stronglyMeasurable
#print axioms cutoffError_stronglyMeasurable
#print axioms cutoffGradient_zero_off_support
#print axioms cutoffField_support
#print axioms cutoffError_support
#print axioms cutoffField_pointwise_bound
#print axioms cutoffError_pointwise_bound
#print axioms cutoffField_memLp
#print axioms cutoffError_memLp
#print axioms cutoffError_L2_bound

end
end FCP.BFSSLOC1
