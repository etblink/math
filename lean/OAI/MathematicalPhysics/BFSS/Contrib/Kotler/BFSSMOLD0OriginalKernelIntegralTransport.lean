import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLC0OriginalKineticPairingTransport

/-! MOL-D0: literal kernel integrability and original coefficient integral
transport. Only local integrability is needed for the kernel products;
compact support of the input is needed to bundle its smoothed source core. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLD0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0
open MeasureTheory

theorem kernel_integrable {N : ℕ} (k : ScalarCore N)
    (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume) (x : Boson N) :
    Integrable (fun y => k (x - y) • u y) volume :=
  k.hasCompactSupport.convolutionExists_right (kernelBilin N) hu k.continuous x

theorem kernelDerivative_integrable {N : ℕ} (k : ScalarCore N)
    (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (i : SpaceIndex) (A : ColorIndex N) (x : Boson N) :
    Integrable (fun y => (fderiv ℝ (k : Boson N → ℝ) (x - y)
      (EuclideanSpace.single (i, A) 1)) • u y) volume := by
  let e : Boson N := EuclideanSpace.single (i, A) 1
  let d : Boson N → ℝ := fun y => fderiv ℝ (k : Boson N → ℝ) y e
  have hk : ContDiff ℝ 1 (k : Boson N → ℝ) := k.contDiff.of_le (by simp)
  have hd : Continuous d :=
    (ContinuousLinearMap.apply ℝ ℝ e).continuous.comp (hk.continuous_fderiv one_ne_zero)
  have hs : HasCompactSupport d := by
    refine (k.hasCompactSupport.fderiv ℝ).mono ?_
    intro y hy
    exact mt (fun hz : fderiv ℝ (k : Boson N → ℝ) y = 0 => by simp [d, hz]) hy
  exact hs.convolutionExists_right (kernelBilin N) hu hd x

theorem kineticTerm_integrable {N : ℕ} (M : AlgebraData N)
    (a b : SpinIndex) (i : SpaceIndex) (A : ColorIndex N)
    (k : ScalarCore N) (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (x : Boson N) :
    Integrable (fun y => (-Complex.I * (M.gamma i a b : ℂ)) •
      M.theta b A ((fderiv ℝ (k : Boson N → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y)) volume := by
  let L : Fermion N →L[ℂ] Fermion N :=
    (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
  exact L.integrable_comp (kernelDerivative_integrable k u hu i A x)

theorem kineticTerm_integral {N : ℕ} (M : AlgebraData N)
    (a b : SpinIndex) (i : SpaceIndex) (A : ColorIndex N)
    (k : ScalarCore N) (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (x : Boson N) :
    (∫ y, (-Complex.I * (M.gamma i a b : ℂ)) •
      M.theta b A ((fderiv ℝ (k : Boson N → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y)) =
      (-Complex.I * (M.gamma i a b : ℂ)) •
        M.theta b A (coordinateDerivative i A (mollifiedCore k u hu hs) x) := by
  let L : Fermion N →L[ℂ] Fermion N :=
    (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
  rw [mollifiedCore_coordinateDerivative]
  exact L.integral_comp_comm (kernelDerivative_integrable k u hu i A x)

/-- Pull a fixed-left inner product through the Bochner integral. -/
theorem fixedInner_integral {N : ℕ} (z : Fermion N) (f : Boson N → Fermion N)
    (hf : Integrable f volume) :
    (∫ y, inner ℂ z (f y)) = inner ℂ z (∫ y, f y) :=
  (innerSL ℂ z).integral_comp_comm hf

#print axioms kernel_integrable
#print axioms kernelDerivative_integrable
#print axioms kineticTerm_integrable
#print axioms kineticTerm_integral
#print axioms fixedInner_integral

end
end FCP.BFSSMOLD0
