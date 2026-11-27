import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLE0OriginalKineticMollifierCommutation

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLE0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLE0
open MeasureTheory

theorem originalSU2KineticMollifierAudit (M : AlgebraData 2) (a : SpinIndex)
    (u w : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (hw : LocallyIntegrable w volume) (hsu : HasCompactSupport u)
    (hsw : HasCompactSupport w)
    (h : ∀ f : SmoothCore 2,
      (∫ y, inner ℂ
        (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
          (-Complex.I * (M.gamma i a b : ℂ)) •
            M.theta b A (coordinateDerivative i A f y)) (u y)) =
      ∫ y, inner ℂ (f y) (w y))
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤) (x : Boson 2) :
    (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
      (-Complex.I * (M.gamma i a b : ℂ)) •
        M.theta b A (coordinateDerivative i A (mollifiedCore k u hu hsu) x)) =
      ∫ y, k (x - y) • w y := by
  calc
    _ = mollifiedCore k w hw hsw x := mollified_kinetic_eq M a u w hu hw hsu hsw h k x
    _ = _ := mollifiedCore_apply k w hw hsw x

#print axioms originalSU2KineticMollifierAudit
end
end FCP.BFSSMOLE0Independent
