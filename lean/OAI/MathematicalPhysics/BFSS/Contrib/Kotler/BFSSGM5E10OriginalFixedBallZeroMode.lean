import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E9OriginalCutoffZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E10
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5C FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E7 FCP.BFSSGM5E9
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open Filter MeasureTheory Topology

private theorem realCutoff_norm_sq (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ) (f : SmoothCore 2) (x : Boson 2) :
    ‖realCutoff χ hχ f x‖ ^ 2 = χ x ^ 2 * ‖f x‖ ^ 2 := by
  change ‖(χ x : ℂ) • f x‖ ^ 2 = _
  rw [norm_smul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs]

private theorem coreCutoff_norm_le (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (hunit : ∀ x, χ x ^ 2 ≤ 1) (f : SmoothCore 2) :
    ‖coreToL2 (realCutoff χ hχ f)‖ ≤ ‖coreToL2 f‖ := by
  apply (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
  rw [coreToL2_norm_sq, coreToL2_norm_sq]
  apply integral_mono (coreNormSq_integrable _) (coreNormSq_integrable _)
  intro x
  change ‖realCutoff χ hχ f x‖ ^ 2 ≤ ‖f x‖ ^ 2
  rw [realCutoff_norm_sq]
  exact (mul_le_mul_of_nonneg_right (hunit x) (sq_nonneg ‖f x‖)).trans_eq (one_mul _)

private theorem ballMass_le_coreCutoff_norm_sq (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ) (R : ℝ)
    (hone : ∀ x : Boson 2, ‖x‖ ≤ R → χ x = 1) (f : SmoothCore 2) :
    (∫ x in Metric.closedBall (0 : Boson 2) R, ‖f x‖ ^ 2) ≤
      ‖coreToL2 (realCutoff χ hχ f)‖ ^ 2 := by
  let s := Metric.closedBall (0 : Boson 2) R
  have hs : MeasurableSet s := Metric.isClosed_closedBall.measurableSet
  change (∫ x in s, ‖f x‖ ^ 2) ≤ _
  rw [← integral_indicator hs, coreToL2_norm_sq]
  apply integral_mono ((coreNormSq_integrable f).indicator hs) (coreNormSq_integrable _)
  intro x
  change s.indicator (fun y => ‖f y‖ ^ 2) x ≤ ‖realCutoff χ hχ f x‖ ^ 2
  by_cases hx : x ∈ s
  · have hnorm : ‖x‖ ≤ R := by
      simpa only [s, Metric.mem_closedBall, dist_zero_right] using hx
    rw [Set.indicator_of_mem hx, realCutoff_norm_sq, hone x hnorm, one_pow, one_mul]
  · rw [Set.indicator_of_notMem hx]
    exact sq_nonneg _

private theorem radialWeight_sq_le_of_support (f : SmoothCore 2) (S : ℝ)
    (hzero : ∀ x : Boson 2, S < ‖x‖ → f x = 0) :
    ‖radialWeightedCore f‖ ^ 2 ≤ S * ‖coreToL2 f‖ ^ 2 := by
  rw [radialWeightedCore_norm_sq, coreRadialMoment, coreToL2_norm_sq, ← integral_const_mul]
  apply integral_mono (weighted_core_square_integrable _ continuous_norm f)
    ((coreNormSq_integrable f).const_mul S)
  intro x
  change ‖x‖ * ‖f x‖ ^ 2 ≤ S * ‖f x‖ ^ 2
  by_cases hx : ‖x‖ ≤ S
  · exact mul_le_mul_of_nonneg_right hx (sq_nonneg _)
  · rw [hzero x (lt_of_not_ge hx)]
    simp

private theorem cutoffError_le (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ) (f : SmoothCore 2)
    (D : ℝ) (hD : ∀ x, ‖cutoffGradient χ x‖ ^ 2 ≤ D) :
    (∫ x, ‖cutoffGradient χ x‖ ^ 2 * ‖f x‖ ^ 2) ≤ D * ‖coreToL2 f‖ ^ 2 := by
  rw [coreToL2_norm_sq, ← integral_const_mul]
  apply integral_mono (cutoffError_integrable χ hχ f) ((coreNormSq_integrable f).const_mul D)
  exact fun x => mul_le_mul_of_nonneg_right (hD x) (sq_nonneg _)

/-- The original IMS identity bounds any one localized native charge by the
uncut charge and the total gradient error of the fixed finite partition. -/
theorem nativeCoreCutoff_charge_sq_le
    (M : AlgebraData 2) (G : M.GaugeData) {ι : Type*} [Fintype ι]
    (χ : ι → Boson 2 → ℝ) (hχ : ∀ j, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (χ j))
    (hg : ∀ j g x, χ j (G.boson g x) = χ j x) (hpart : ∀ x, ∑ j, χ j x ^ 2 = 1)
    (j₀ : ι) (D : ℝ) (hD : ∀ j x, ‖cutoffGradient (χ j) x‖ ^ 2 ≤ D)
    (f : G.invariantCore) :
    ‖nativeCoreChargeValue M G (gaugeInvariantRealCutoff M G (χ j₀) (hχ j₀) (hg j₀) f)‖ ^ 2 ≤
      ‖nativeCoreChargeValue M G f‖ ^ 2 +
        8 * ((Fintype.card ι : ℝ) * D) * ‖coreToL2 f.val‖ ^ 2 := by
  classical
  let q : ι → ℝ := fun j =>
    (1 / 16 : ℝ) * ‖nativeCoreChargeValue M G
      (gaugeInvariantRealCutoff M G (χ j) (hχ j) (hg j) f)‖ ^ 2
  have hsingle : q j₀ ≤ ∑ j, q j :=
    Finset.single_le_sum (fun j _ => by dsimp only [q]; positivity) (Finset.mem_univ _)
  have hims : (∑ j, q j) = (1 / 16 : ℝ) * ‖nativeCoreChargeValue M G f‖ ^ 2 +
      (1 / 2 : ℝ) * ∑ j, ∫ x, ‖cutoffGradient (χ j) x‖ ^ 2 * ‖f.val x‖ ^ 2 :=
    nativeCoreCutoff_ims M G χ hχ hg hpart f
  have herr : (∑ j, ∫ x, ‖cutoffGradient (χ j) x‖ ^ 2 * ‖f.val x‖ ^ 2) ≤
      ((Fintype.card ι : ℝ) * D) * ‖coreToL2 f.val‖ ^ 2 := by
    calc
      _ ≤ ∑ _j : ι, D * ‖coreToL2 f.val‖ ^ 2 :=
        Finset.sum_le_sum (fun j _ => cutoffError_le (χ j) (hχ j) f.val D (hD j))
      _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_assoc]
  rw [hims] at hsingle
  dsimp only [q] at hsingle
  linarith

/-- A fixed-ball probability lower bound gives an original physical zero
mode when the native charge vanishes and a fixed gauge-invariant smooth
IMS partition with the indicated inner member is supplied. -/
theorem originalZeroMode_of_fixedBallMass
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore)
    {ι : Type*} [Fintype ι] (χ : ι → Boson 2 → ℝ)
    (hχ : ∀ j, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (χ j))
    (hg : ∀ j g x, χ j (G.boson g x) = χ j x) (hpart : ∀ x, ∑ j, χ j x ^ 2 = 1)
    (j₀ : ι) (R S D : ℝ)
    (hS : 0 ≤ S) (hD : ∀ j x, ‖cutoffGradient (χ j) x‖ ^ 2 ≤ D)
    (hone : ∀ x : Boson 2, ‖x‖ ≤ R → χ j₀ x = 1)
    (hzero : ∀ x : Boson 2, S < ‖x‖ → χ j₀ x = 0)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 0))
    (m : ℝ) (hm : 0 < m)
    (hmass : ∀ n, m ≤ ∫ x in Metric.closedBall (0 : Boson 2) R, ‖(f n).val x‖ ^ 2) :
    ∃ (u : G.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian M G ⟨u, hu⟩ = 0 := by
  classical
  let g : ℕ → G.invariantCore := fun n => gaugeInvariantRealCutoff M G (χ j₀) (hχ j₀) (hg j₀) (f n)
  have hunit (x : Boson 2) : χ j₀ x ^ 2 ≤ 1 := by
    rw [← hpart x]
    exact Finset.single_le_sum (fun j _ => sq_nonneg (χ j x)) (Finset.mem_univ _)
  have hB (n : ℕ) : ‖coreToL2 (g n).val‖ ≤ 1 :=
    (coreCutoff_norm_le (χ j₀) (hχ j₀) hunit (f n).val).trans (hbounded n)
  have hretain (n : ℕ) : Real.sqrt m ≤ ‖coreToL2 (g n).val‖ := by
    apply (sq_le_sq₀ (Real.sqrt_nonneg m) (norm_nonneg _)).mp
    rw [Real.sq_sqrt hm.le]
    exact (hmass n).trans (ballMass_le_coreCutoff_norm_sq (χ j₀) (hχ j₀) R hone (f n).val)
  have hW (n : ℕ) : ‖radialWeightedCore (g n).val‖ ≤ Real.sqrt S := by
    apply (sq_le_sq₀ (norm_nonneg _) (Real.sqrt_nonneg S)).mp
    rw [Real.sq_sqrt hS]
    have hsupport (x : Boson 2) (hx : S < ‖x‖) : (g n).val x = 0 := by
      change (χ j₀ x : ℂ) • (f n).val x = 0
      rw [hzero x hx, Complex.ofReal_zero, zero_smul]
    have hb := (sq_le_sq₀ (norm_nonneg (coreToL2 (g n).val)) zero_le_one).mpr (hB n)
    simpa only [one_pow, mul_one] using
      (radialWeight_sq_le_of_support (g n).val S hsupport).trans
        (mul_le_mul_of_nonneg_left hb hS)
  obtain ⟨A, hA⟩ := (Metric.isBounded_range_of_tendsto _ hcharge).exists_norm_le
  have hA₀ : 0 ≤ A := (norm_nonneg _).trans (hA _ (Set.mem_range_self 0))
  have hD₀ : 0 ≤ D := (sq_nonneg _).trans (hD j₀ 0)
  let C : ℝ := 8 * ((Fintype.card ι : ℝ) * D)
  have hC : 0 ≤ C := by dsimp only [C]; positivity
  have hQ (n : ℕ) : ‖nativeCoreChargeValue M G (g n)‖ ≤ Real.sqrt (A ^ 2 + C) := by
    apply (sq_le_sq₀ (norm_nonneg _) (Real.sqrt_nonneg _)).mp
    rw [Real.sq_sqrt (add_nonneg (sq_nonneg _) hC)]
    have hAn := (sq_le_sq₀ (norm_nonneg _) hA₀).mpr (hA _ (Set.mem_range_self n))
    have hbn := (sq_le_sq₀ (norm_nonneg _) zero_le_one).mpr (hbounded n)
    have hCn : C * ‖coreToL2 (f n).val‖ ^ 2 ≤ C := by
      simpa only [one_pow, mul_one] using mul_le_mul_of_nonneg_left hbn hC
    exact (nativeCoreCutoff_charge_sq_le M G χ hχ hg hpart j₀ D hD (f n)).trans
      (add_le_add hAn hCn)
  exact originalZeroMode_of_localizedCoreSequence M G f (χ j₀) (hχ j₀) (hg j₀)
    hbounded hcharge 1 ⟨Real.sqrt (A ^ 2 + C), Real.sqrt_nonneg _⟩
    ⟨Real.sqrt S, Real.sqrt_nonneg _⟩ (Real.sqrt m) (Real.sqrt_pos.2 hm)
    hretain hB hQ hW

#print axioms nativeCoreCutoff_charge_sq_le
#print axioms originalZeroMode_of_fixedBallMass

end
end FCP.BFSSGM5E10
