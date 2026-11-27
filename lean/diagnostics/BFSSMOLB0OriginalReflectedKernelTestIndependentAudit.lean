import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLB0OriginalReflectedKernelTest

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLB0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLB0
open MeasureTheory

theorem originalReflectedTestAudit {N : ℕ}
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson N)) ℝ ⊤)
    (x : Boson N) (z : Fermion N) :
    ∃ f : SmoothCore N, (∀ y : Boson N, f y = k (x - y) • z) ∧
      ∀ (i : SpaceIndex) (A : ColorIndex N) (y : Boson N),
        coordinateDerivative i A f y =
          (-(fderiv ℝ (k : Boson N → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1))) • z :=
  ⟨reflectedCore k x z, fun y => reflectedCore_apply k x y z,
    fun i A y => reflectedCore_coordinateDerivative k x y z i A⟩

theorem originalSU2KineticWeakTestAudit (M : AlgebraData 2) (a : SpinIndex)
    (u w : Boson 2 → Fermion 2)
    (h : ∀ f : SmoothCore 2,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (x : Boson 2) (z : Fermion 2) :
    (∫ y, inner ℂ
      (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
          ((-(fderiv ℝ (k : Boson 2 → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1))) • z)) (u y)) =
      ∫ y, inner ℂ (k (x - y) • z) (w y) :=
  reflected_kinetic_weak_pairing M a u w h k x z

#print axioms originalReflectedTestAudit
#print axioms originalSU2KineticWeakTestAudit
end
end FCP.BFSSMOLB0Independent
