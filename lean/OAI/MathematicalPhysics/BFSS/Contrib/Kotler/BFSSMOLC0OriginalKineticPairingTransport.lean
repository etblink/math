import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLB0OriginalReflectedKernelTest

/-! MOL-C0: transport the reflected kinetic weak pairing to a fixed
left test vector using the original Hermitian theta coefficients.
No integral interchange, convergence, or adjoint conclusion yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLC0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLB0
open MeasureTheory
open scoped ComplexConjugate

theorem theta_reflected_pairing {N : ℕ} (M : AlgebraData N)
    (b : SpinIndex) (A : ColorIndex N) (g d : ℝ) (z v : Fermion N) :
    inner ℂ ((-Complex.I * (g : ℂ)) • M.theta b A ((-d) • z)) v =
      inner ℂ z ((-Complex.I * (g : ℂ)) • M.theta b A (d • v)) := by
  have hsym (p q : Fermion N) :
      inner ℂ (M.theta b A p) q = inner ℂ p (M.theta b A q) :=
    (M.theta_selfAdjoint b A).isSymmetric p q
  calc
    _ = conj (-Complex.I * (g : ℂ)) *
          ((-d) • inner ℂ z (M.theta b A v)) := by
        rw [inner_smul_left]
        rw [hsym ((-d) • z) v, inner_smul_left_eq_smul]
    _ = (-Complex.I * (g : ℂ)) *
          (d • inner ℂ z (M.theta b A v)) := by
        simp only [map_mul, map_neg, Complex.conj_I, Complex.conj_ofReal,
          neg_neg, neg_smul, mul_neg, neg_mul]
    _ = _ := by
        rw [inner_smul_right, ← hsym z (d • v), inner_smul_right_eq_smul,
          hsym z v]

theorem kinetic_reflected_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (d : SpaceIndex → ColorIndex N → ℝ) (z v : Fermion N) :
    inner ℂ
      (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A ((-d i A) • z)) v =
      inner ℂ z
        (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A (d i A • v)) := by
  simp only [sum_inner, inner_sum]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro A hA
  apply Finset.sum_congr rfl
  intro b hb
  exact theta_reflected_pairing M b A (M.gamma i a b) (d i A) z v

/-- A weak equation of the whole kinetic sum yields a fixed-left-vector
integral identity; no separate weak coordinate derivative is assumed. -/
theorem transported_kinetic_weak_pairing {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (u w : Boson N → Fermion N)
    (h : ∀ f : SmoothCore N,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : ScalarCore N) (x : Boson N) (z : Fermion N) :
    (∫ y, inner ℂ z
      (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
          ((fderiv ℝ (k : Boson N → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1)) • u y))) =
      ∫ y, inner ℂ z (k (x - y) • w y) := by
  have hr := reflected_kinetic_weak_pairing M a u w h k x z
  calc
    _ = ∫ y, inner ℂ
      (∑ i : SpaceIndex, ∑ A : ColorIndex N, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
          ((-(fderiv ℝ (k : Boson N → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1))) • z)) (u y) := by
        apply integral_congr_ae
        filter_upwards [] with y
        exact (kinetic_reflected_pairing M a
          (fun i A => fderiv ℝ (k : Boson N → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1)) z (u y)).symm
    _ = ∫ y, inner ℂ (k (x - y) • z) (w y) := hr
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [] with y
      rw [inner_smul_left_eq_smul, inner_smul_right_eq_smul]

#print axioms theta_reflected_pairing
#print axioms kinetic_reflected_pairing
#print axioms transported_kinetic_weak_pairing

end
end FCP.BFSSMOLC0
