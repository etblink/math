import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2A0OriginalNormalizedKernel

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2A0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0
open MeasureTheory

theorem originalSU2NormalizedKernelAudit (φ : ContDiffBump (0 : Boson 2)) :
    ∃ k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤,
      (∀ x : Boson 2, k x = φ.normed volume x) ∧
      (∀ x : Boson 2, 0 ≤ k x) ∧ (∫ x, k x) = 1 ∧
      tsupport (k : Boson 2 → ℝ) = Metric.closedBall 0 φ.rOut :=
  ⟨normalizedKernel φ, normalizedKernel_apply φ, normalizedKernel_properties φ⟩

theorem originalSU2SmoothMollifierErrorAudit
    (φ : ContDiffBump (0 : Boson 2)) (f : SmoothCore 2)
    (hf : LocallyIntegrable (f : Boson 2 → Fermion 2) volume) :
    (∫ x, ‖(∫ y, φ.normed volume (x - y) • f y) - f x‖ ^ 2) ≤
      φ.rOut ^ 2 * ∫ x, ‖fderiv ℝ (f : Boson 2 → Fermion 2) x‖ ^ 2 := by
  simpa only [mollifiedCore_apply, normalizedKernel_apply] using
    normalized_mollified_smooth_error φ f hf

#print axioms originalSU2NormalizedKernelAudit
#print axioms originalSU2SmoothMollifierErrorAudit
end
end FCP.BFSSMOLL2A0Independent
