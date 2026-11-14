import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC5AOriginalPositiveRegulatorRatio
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent native original SU2 scalar/L-infinity consumer. -/
set_option autoImplicit false
namespace BFSSP3AuxRADC5AOriginalPositiveRegulatorRatioIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (u : pairedGaugeData.physicalSpace) :
    (u : FullL2 2) = (u : FullL2 2) := rfl

example {δ ε : ℝ} (hδ : 0 < δ) (hδε : δ ≤ ε) (x : Boson 2) :
    originalRadialWeight δ x ≤ originalRadialWeight ε x :=
  originalRadialWeight_mono hδ hδε x

example {δ ε : ℝ} (hδ : 0 < δ) (hδε : δ ≤ ε) (x : Boson 2) :
    δ * originalRadialWeight ε x ≤ ε * originalRadialWeight δ x :=
  originalRadialWeight_scaled_le hδ hδε x

example (ε δ : ℝ) (x : Boson 2) :
    originalRegulatorRatioField ε δ x =
      (originalRadialWeight ε x : ℂ) / (originalRadialWeight δ x : ℂ) := rfl

example (ε : ℝ) {δ : ℝ} (hδ : 0 < δ) :
    Continuous (originalRegulatorRatioField ε δ) :=
  originalRegulatorRatioField_continuous ε hδ

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    ‖originalRegulatorRatioField ε δ x‖ ≤ max 1 (ε / δ) :=
  originalRegulatorRatioField_norm_le hε hδ x

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    originalRegulatorRatioField ε δ x *
      originalRegulatorRatioField δ ε x = 1 :=
  originalRegulatorRatioField_mul_reverse hε hδ x

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) (x : Boson 2) :
    originalReciprocalField ε x * originalRegulatorRatioField ε δ x =
      originalReciprocalField δ x :=
  originalReciprocalField_mul_ratio hε hδ x

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) :
    MemLp (originalRegulatorRatioField ε δ) (⊤ : ENNReal)
      (volume : Measure (Boson 2)) :=
  originalRegulatorRatioField_memLp_infty hε hδ

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) :
    Lp ℂ (⊤ : ENNReal) (volume : Measure (Boson 2)) :=
  originalRegulatorRatioLpInf hε hδ

example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) :
    (originalRegulatorRatioLpInf hε hδ : Boson 2 → ℂ) =ᵐ[volume]
      originalRegulatorRatioField ε δ :=
  originalRegulatorRatioLpInf_ae hε hδ

-- Equal-regulator cancellation is independently checked on the original field.
example {ε : ℝ} (hε : 0 < ε) (x : Boson 2) :
    originalRegulatorRatioField ε ε x = 1 := by
  change (originalRadialWeight ε x : ℂ) /
    (originalRadialWeight ε x : ℂ) = 1
  apply div_self
  exact_mod_cast (ne_of_gt (originalRadialWeight_pos hε x))

-- Origin checks the ratio orientation with two independently positive parameters.
example {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) :
    originalRegulatorRatioField ε δ (0 : Boson 2) = (ε : ℂ) / (δ : ℂ) := by
  have he : originalRadialWeight ε (0 : Boson 2) = ε := by
    simp only [originalRadialWeight, norm_zero, zero_pow, zero_add,
      Real.sqrt_sq_eq_abs, abs_of_pos hε]
  have hd : originalRadialWeight δ (0 : Boson 2) = δ := by
    simp only [originalRadialWeight, norm_zero, zero_pow, zero_add,
      Real.sqrt_sq_eq_abs, abs_of_pos hδ]
  change (originalRadialWeight ε (0 : Boson 2) : ℂ) /
    (originalRadialWeight δ (0 : Boson 2) : ℂ) = (ε : ℂ) / (δ : ℂ)
  rw [he, hd]

#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRadialWeight_mono
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRadialWeight_scaled_le
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioField
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioField_continuous
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioField_norm_le
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioField_mul_reverse
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalReciprocalField_mul_ratio
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioField_memLp_infty
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioLpInf
#print axioms FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio.originalRegulatorRatioLpInf_ae
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_sq
#print axioms FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_pos
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalRadialWeight_continuous
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalLpInf_ae

end
end BFSSP3AuxRADC5AOriginalPositiveRegulatorRatioIndependentConsumer
