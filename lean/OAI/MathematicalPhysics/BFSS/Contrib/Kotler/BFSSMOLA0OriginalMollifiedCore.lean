import OAI.MathematicalPhysics.BFSS.Core

/-! MOL-A0: source-typed smoothing of a compactly supported locally integrable
field by a literal smooth scalar test kernel. No weak-graph, approximation,
adjoint or essential self-adjointness conclusion yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLA0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open scoped Convolution

abbrev ScalarCore (N : ℕ) :=
  TestFunction (⊤ : TopologicalSpace.Opens (Boson N)) ℝ ⊤

/-- The right kernel convention is integral of k(x-y) times u(y). -/
def kernelBilin (N : ℕ) : Fermion N →L[ℝ] ℝ →L[ℝ] Fermion N :=
  (ContinuousLinearMap.lsmul ℝ ℝ :
    ℝ →L[ℝ] Fermion N →L[ℝ] Fermion N).flip

/-- The actual original full test carrier, not a substitute smoothing space. -/
def mollifiedCore {N : ℕ} (k : ScalarCore N) (u : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) : SmoothCore N where
  toFun := MeasureTheory.convolution u (k : Boson N → ℝ) (kernelBilin N) volume
  contDiff' := k.hasCompactSupport.contDiff_convolution_right (kernelBilin N) hu k.contDiff
  hasCompactSupport' := hs.convolution (L := kernelBilin N) k.hasCompactSupport
  tsupport_subset' := by
    intro x hx
    trivial

theorem mollifiedCore_apply {N : ℕ} (k : ScalarCore N) (u : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) (x : Boson N) :
    mollifiedCore k u hu hs x = ∫ y, k (x - y) • u y := by
  rfl

/-- Literal source coordinate derivative of the smoothed original field.
The derivative is on the right kernel, not the locally integrable input. -/
theorem mollifiedCore_coordinateDerivative {N : ℕ} (k : ScalarCore N)
    (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (i : SpaceIndex) (A : ColorIndex N) (x : Boson N) :
    coordinateDerivative i A (mollifiedCore k u hu hs) x =
      ∫ y, (fderiv ℝ (k : Boson N → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y := by
  have hk : ContDiff ℝ 1 (k : Boson N → ℝ) := k.contDiff.of_le (by simp)
  have hd := k.hasCompactSupport.hasFDerivAt_convolution_right (kernelBilin N) hu hk x
  rw [coordinateDerivative_apply]
  change fderiv ℝ (MeasureTheory.convolution u (k : Boson N → ℝ)
    (kernelBilin N) volume) x (EuclideanSpace.single (i, A) 1) = _
  rw [hd.fderiv]
  rw [convolution_precompR_apply (kernelBilin N) hu
    (k.hasCompactSupport.fderiv ℝ) (hk.continuous_fderiv one_ne_zero)]
  rfl

#print axioms mollifiedCore
#print axioms mollifiedCore_apply
#print axioms mollifiedCore_coordinateDerivative

end
end FCP.BFSSMOLA0
