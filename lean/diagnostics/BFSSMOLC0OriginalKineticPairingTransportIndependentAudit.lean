import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLC0OriginalKineticPairingTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLC0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLC0
open MeasureTheory

theorem originalSU2ThetaPairingAudit (M : AlgebraData 2)
    (b : SpinIndex) (A : ColorIndex 2) (g d : ℝ) (z v : Fermion 2) :
    inner ℂ ((-Complex.I * (g : ℂ)) • M.theta b A ((-d) • z)) v =
      inner ℂ z ((-Complex.I * (g : ℂ)) • M.theta b A (d • v)) :=
  theta_reflected_pairing M b A g d z v

theorem originalSU2TransportedWeakPairingAudit (M : AlgebraData 2) (a : SpinIndex)
    (u w : Boson 2 → Fermion 2)
    (h : ∀ f : SmoothCore 2,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (x : Boson 2) (z : Fermion 2) :
    (∫ y, inner ℂ z
      (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) • M.theta b A
          ((fderiv ℝ (k : Boson 2 → ℝ) (x - y)
            (EuclideanSpace.single (i, A) 1)) • u y))) =
      ∫ y, inner ℂ z (k (x - y) • w y) :=
  transported_kinetic_weak_pairing M a u w h k x z

#print axioms originalSU2ThetaPairingAudit
#print axioms originalSU2TransportedWeakPairingAudit
end
end FCP.BFSSMOLC0Independent
