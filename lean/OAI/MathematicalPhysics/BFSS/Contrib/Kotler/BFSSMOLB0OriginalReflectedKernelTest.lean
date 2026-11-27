import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLA0OriginalMollifiedCore

/-! MOL-B0: reflected kernel test on the original full smooth carrier and
the weak pairing for the entire literal kinetic charge. No separate weak
coordinate derivative assumptions or graph convergence conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLB0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0
open MeasureTheory

def reflectedCore {N : ℕ} (k : ScalarCore N) (x : Boson N) (z : Fermion N) :
    SmoothCore N where
  toFun := fun y => k (x - y) • z
  contDiff' := by
    have h : ContDiff ℝ ⊤ (fun y : Boson N => x - y) :=
      contDiff_const.sub contDiff_id
    exact (k.contDiff.comp h).smul_const z
  hasCompactSupport' := by
    refine (k.hasCompactSupport.comp_homeomorph (Homeomorph.subLeft x)).mono ?_
    intro y hy
    exact mt (fun hz : k (x - y) = 0 => by simp [hz]) hy
  tsupport_subset' := by
    intro y hy
    trivial

theorem reflectedCore_apply {N : ℕ} (k : ScalarCore N) (x y : Boson N)
    (z : Fermion N) : reflectedCore k x z y = k (x - y) • z := by
  rfl

theorem reflectedCore_coordinateDerivative {N : ℕ} (k : ScalarCore N)
    (x y : Boson N) (z : Fermion N) (i : SpaceIndex) (A : ColorIndex N) :
    coordinateDerivative i A (reflectedCore k x z) y =
      (-(fderiv ℝ (k : Boson N → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1))) • z := by
  have hk : HasFDerivAt (k : Boson N → ℝ)
      (fderiv ℝ (k : Boson N → ℝ) (x - y)) (x - y) :=
    (k.contDiff.differentiable (by simp)).differentiableAt.hasFDerivAt
  have hr := (hasFDerivAt_id y).const_sub x
  have hd := (hk.comp y hr).smul_const z
  rw [coordinateDerivative_apply]
  change fderiv ℝ (fun t : Boson N => k (x - t) • z) y
    (EuclideanSpace.single (i, A) 1) = _
  rw [hd.fderiv]
  simp

/-- Instantiate the weak pairing on the entire literal kinetic sum.
No individual derivative of the input field is postulated. -/
theorem reflected_kinetic_weak_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u w : Boson N → Fermion N)
    (h : ∀ f : SmoothCore N,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : ScalarCore N) (x : Boson N) (z : Fermion N) :
    (∫ y, inner ℂ
      (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
          ((-(fderiv ℝ (k : Boson N → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1))) • z)) (u y)) =
      ∫ y, inner ℂ (k (x - y) • z) (w y) := by
  simpa only [reflectedCore_coordinateDerivative, reflectedCore_apply] using
    h (reflectedCore k x z)

#print axioms reflectedCore
#print axioms reflectedCore_apply
#print axioms reflectedCore_coordinateDerivative
#print axioms reflected_kinetic_weak_pairing

end
end FCP.BFSSMOLB0
