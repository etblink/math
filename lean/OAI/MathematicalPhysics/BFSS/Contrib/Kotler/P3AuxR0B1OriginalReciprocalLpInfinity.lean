import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0AOriginalRadialScalar

/-!
P3-AUX-R0B1 - PROSPECTIVE, NOT QUALIFIED.
An original Boson 2 reciprocal field in genuine complex L-infty.
No L2 multiplication operator, weighted charge, auxiliary H, or gap.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open MeasureTheory

def originalReciprocalField (ε : ℝ) (x : Boson 2) : ℂ :=
  (originalRadialWeight ε x : ℂ)⁻¹

theorem originalRadialWeight_continuous (ε : ℝ) :
    Continuous (originalRadialWeight ε) := by
  unfold originalRadialWeight
  fun_prop

theorem originalReciprocalField_continuous {ε : ℝ} (hε : 0 < ε) :
    Continuous (originalReciprocalField ε) := by
  unfold originalReciprocalField
  have hc : Continuous (fun x : Boson 2 => (originalRadialWeight ε x : ℂ)) :=
    Complex.continuous_ofReal.comp (originalRadialWeight_continuous ε)
  exact Continuous.inv₀ hc (fun x => by
    exact_mod_cast (ne_of_gt (originalRadialWeight_pos hε x)))

theorem originalReciprocalField_norm_le {ε : ℝ} (hε : 0 < ε)
    (x : Boson 2) : ‖originalReciprocalField ε x‖ ≤ ε⁻¹ := by
  unfold originalReciprocalField
  simpa only [norm_inv, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (originalRadialWeight_pos hε x)] using
    (originalRadialWeight_inv_le hε x)

theorem originalReciprocalField_memLp_infty {ε : ℝ} (hε : 0 < ε) :
    MemLp (originalReciprocalField ε) (⊤ : ℝ≥0∞)
      (volume : Measure (Boson 2)) := by
  exact memLp_top_of_bound
    (originalReciprocalField_continuous hε).aestronglyMeasurable
    ε⁻¹ (Filter.Eventually.of_forall (originalReciprocalField_norm_le hε))

noncomputable def originalReciprocalLpInf {ε : ℝ} (hε : 0 < ε) :
    Lp ℂ (⊤ : ℝ≥0∞) (volume : Measure (Boson 2)) :=
  (originalReciprocalField_memLp_infty hε).toLp (originalReciprocalField ε)

theorem originalReciprocalLpInf_ae {ε : ℝ} (hε : 0 < ε) :
    (originalReciprocalLpInf hε : Boson 2 → ℂ) =ᵐ[volume]
      originalReciprocalField ε :=
  MemLp.coeFn_toLp (originalReciprocalField_memLp_infty hε)

#print axioms originalRadialWeight_continuous
#print axioms originalReciprocalField_continuous
#print axioms originalReciprocalField_norm_le
#print axioms originalReciprocalField_memLp_infty
#print axioms originalReciprocalLpInf
#print axioms originalReciprocalLpInf_ae
end
end FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
