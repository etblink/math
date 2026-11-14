import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B1OriginalReciprocalLpInfinity

/-!
C5A R1: original positive-regulator scalar ratio and genuine L-infinity class.
PROSPECTIVE until exact strict source and independent native consumer audit.
No FullL2/PiLp ratio action, common charge domain, form or spectral claim.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open MeasureTheory

theorem originalRadialWeight_mono {δ ε : ℝ}
    (hδ : 0 < δ) (hδε : δ ≤ ε) (x : Boson 2) :
    originalRadialWeight δ x ≤ originalRadialWeight ε x := by
  have hε : 0 < ε := lt_of_lt_of_le hδ hδε
  have hs : δ ^ 2 ≤ ε ^ 2 := by
    simpa only [pow_two] using mul_self_le_mul_self hδ.le hδε
  apply (sq_le_sq₀
    (originalRadialWeight_pos hδ x).le
    (originalRadialWeight_pos hε x).le).mp
  rw [originalRadialWeight_sq, originalRadialWeight_sq]
  linarith

theorem originalRadialWeight_scaled_le {δ ε : ℝ}
    (hδ : 0 < δ) (hδε : δ ≤ ε) (x : Boson 2) :
    δ * originalRadialWeight ε x ≤ ε * originalRadialWeight δ x := by
  have hε : 0 < ε := lt_of_lt_of_le hδ hδε
  have hs : δ ^ 2 ≤ ε ^ 2 := by
    simpa only [pow_two] using mul_self_le_mul_self hδ.le hδε
  have hp : 0 ≤ (ε ^ 2 - δ ^ 2) * ‖x‖ ^ 2 :=
    mul_nonneg (sub_nonneg.mpr hs) (sq_nonneg ‖x‖)
  apply (sq_le_sq₀
    (mul_nonneg hδ.le (originalRadialWeight_pos hε x).le)
    (mul_nonneg hε.le (originalRadialWeight_pos hδ x).le)).mp
  calc
    (δ * originalRadialWeight ε x) ^ 2 =
        δ ^ 2 * (‖x‖ ^ 2 + ε ^ 2) := by
      rw [mul_pow, originalRadialWeight_sq]
    _ ≤ ε ^ 2 * (‖x‖ ^ 2 + δ ^ 2) := by nlinarith
    _ = (ε * originalRadialWeight δ x) ^ 2 := by
      rw [mul_pow, originalRadialWeight_sq]

def originalRegulatorRatioField (ε δ : ℝ) (x : Boson 2) : ℂ :=
  (originalRadialWeight ε x : ℂ) / (originalRadialWeight δ x : ℂ)

theorem originalRegulatorRatioField_continuous (ε : ℝ)
    {δ : ℝ} (hδ : 0 < δ) :
    Continuous (originalRegulatorRatioField ε δ) := by
  unfold originalRegulatorRatioField
  exact (Complex.continuous_ofReal.comp
    (originalRadialWeight_continuous ε)).div
      (Complex.continuous_ofReal.comp (originalRadialWeight_continuous δ))
      (fun x => by
        exact_mod_cast (ne_of_gt (originalRadialWeight_pos hδ x)))

theorem originalRegulatorRatioField_norm_le {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    ‖originalRegulatorRatioField ε δ x‖ ≤ max 1 (ε / δ) := by
  simp only [originalRegulatorRatioField, norm_div, Complex.norm_real,
    Real.norm_eq_abs, abs_of_pos (originalRadialWeight_pos hε x),
    abs_of_pos (originalRadialWeight_pos hδ x)]
  by_cases hδε : δ ≤ ε
  · have hr : originalRadialWeight ε x / originalRadialWeight δ x ≤ ε / δ :=
      (div_le_div_iff₀ (originalRadialWeight_pos hδ x) hδ).mpr
        (by simpa only [mul_comm] using originalRadialWeight_scaled_le hδ hδε x)
    exact hr.trans (le_max_right 1 (ε / δ))
  · have heδ : ε ≤ δ := le_of_lt (lt_of_not_ge hδε)
    have hr : originalRadialWeight ε x / originalRadialWeight δ x ≤ 1 :=
      (div_le_iff₀ (originalRadialWeight_pos hδ x)).mpr
        (by simpa only [one_mul] using originalRadialWeight_mono hε heδ x)
    exact hr.trans (le_max_left 1 (ε / δ))

theorem originalRegulatorRatioField_mul_reverse {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    originalRegulatorRatioField ε δ x *
      originalRegulatorRatioField δ ε x = 1 := by
  have he : (originalRadialWeight ε x : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hε x))
  have hd : (originalRadialWeight δ x : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hδ x))
  unfold originalRegulatorRatioField
  field_simp [he, hd]

theorem originalReciprocalField_mul_ratio {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    originalReciprocalField ε x * originalRegulatorRatioField ε δ x =
      originalReciprocalField δ x := by
  have he : (originalRadialWeight ε x : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hε x))
  have hd : (originalRadialWeight δ x : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hδ x))
  unfold originalReciprocalField originalRegulatorRatioField
  field_simp [he, hd]

theorem originalRegulatorRatioField_memLp_infty {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) :
    MemLp (originalRegulatorRatioField ε δ) (⊤ : ENNReal)
      (volume : Measure (Boson 2)) := by
  exact memLp_top_of_bound
    (originalRegulatorRatioField_continuous ε hδ).aestronglyMeasurable
    (max 1 (ε / δ))
    (Filter.Eventually.of_forall (originalRegulatorRatioField_norm_le hε hδ))

noncomputable def originalRegulatorRatioLpInf {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) :
    Lp ℂ (⊤ : ENNReal) (volume : Measure (Boson 2)) :=
  (originalRegulatorRatioField_memLp_infty hε hδ).toLp
    (originalRegulatorRatioField ε δ)

theorem originalRegulatorRatioLpInf_ae {ε δ : ℝ}
    (hε : 0 < ε) (hδ : 0 < δ) :
    (originalRegulatorRatioLpInf hε hδ : Boson 2 → ℂ) =ᵐ[volume]
      originalRegulatorRatioField ε δ :=
  MemLp.coeFn_toLp (originalRegulatorRatioField_memLp_infty hε hδ)

#print axioms originalRadialWeight_mono
#print axioms originalRadialWeight_scaled_le
#print axioms originalRegulatorRatioField
#print axioms originalRegulatorRatioField_continuous
#print axioms originalRegulatorRatioField_norm_le
#print axioms originalRegulatorRatioField_mul_reverse
#print axioms originalReciprocalField_mul_ratio
#print axioms originalRegulatorRatioField_memLp_infty
#print axioms originalRegulatorRatioLpInf
#print axioms originalRegulatorRatioLpInf_ae

end
end FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio
