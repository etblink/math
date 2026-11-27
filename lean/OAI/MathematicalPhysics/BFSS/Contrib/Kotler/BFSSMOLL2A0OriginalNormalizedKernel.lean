import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLE0OriginalKineticMollifierCommutation
import OAI.MathematicalPhysics.BFSS.RellichSmoothing

/-! MOL-L2A0: normalized centered bump in the original scalar test carrier,
exact orientation to the existing Rellich smoothing, and the smooth-core
error estimate. No arbitrary L2 contraction or strong approximation yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2A0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0
open MeasureTheory

def normalizedKernel {N : ℕ} (φ : ContDiffBump (0 : Boson N)) : ScalarCore N where
  toFun := φ.normed volume
  contDiff' := φ.contDiff_normed
  hasCompactSupport' := φ.hasCompactSupport_normed
  tsupport_subset' := by
    intro x hx
    trivial

theorem normalizedKernel_apply {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (x : Boson N) : normalizedKernel φ x = φ.normed volume x := rfl

theorem normalizedKernel_properties {N : ℕ} (φ : ContDiffBump (0 : Boson N)) :
    (∀ x : Boson N, 0 ≤ normalizedKernel φ x) ∧
    (∫ x, normalizedKernel φ x) = 1 ∧
    tsupport (normalizedKernel φ : Boson N → ℝ) = Metric.closedBall 0 φ.rOut := by
  refine ⟨?_, ?_, ?_⟩
  · exact φ.nonneg_normed (μ := volume)
  · exact φ.integral_normed (μ := volume)
  · exact φ.tsupport_normed_eq (μ := volume)

/-- The two integral orientations agree because the centered bump is even. -/
theorem normalized_mollified_eq_kernelAverage {N : ℕ}
    (φ : ContDiffBump (0 : Boson N)) (u : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) (x : Boson N) :
    mollifiedCore (normalizedKernel φ) u hu hs x =
      BFSSRellich.kernelAverage (φ.normed volume) u x := by
  rw [mollifiedCore_apply]
  change (∫ y, φ.normed volume (x - y) • u y) =
    ∫ y, φ.normed volume (y - x) • u y
  apply integral_congr_ae
  filter_upwards [] with y
  have he : φ.normed volume (x - y) = φ.normed volume (y - x) := by
    rw [show x - y = -(y - x) by abel]
    exact ContDiffBump.normed_neg (μ := volume) φ (y - x)
  rw [he]

theorem normalized_mollified_eq_smoothAverage {N : ℕ}
    (φ : ContDiffBump (0 : Boson N)) (u : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) (x : Boson N) :
    mollifiedCore (normalizedKernel φ) u hu hs x =
      BFSSRellich.smoothAverage (BFSSRellich.bumpMeasure φ) u x := by
  rw [normalized_mollified_eq_kernelAverage]
  exact BFSSRellich.kernelAverage_eq_smoothAverage φ u x

/-- Reuse the original Rellich estimate only for smooth compact input. -/
theorem normalized_mollified_smooth_error {N : ℕ}
    (φ : ContDiffBump (0 : Boson N)) (f : SmoothCore N)
    (hf : LocallyIntegrable (f : Boson N → Fermion N) volume) :
    (∫ x, ‖mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport x - f x‖ ^ 2) ≤
      φ.rOut ^ 2 * ∫ x, ‖fderiv ℝ (f : Boson N → Fermion N) x‖ ^ 2 := by
  have h : ContDiff ℝ 1 (f : Boson N → Fermion N) := f.contDiff.of_le (by simp)
  simp only [normalized_mollified_eq_kernelAverage]
  exact BFSSRellich.kernelAverage_error φ h f.hasCompactSupport

#print axioms normalizedKernel
#print axioms normalizedKernel_apply
#print axioms normalizedKernel_properties
#print axioms normalized_mollified_eq_kernelAverage
#print axioms normalized_mollified_eq_smoothAverage
#print axioms normalized_mollified_smooth_error

end
end FCP.BFSSMOLL2A0
