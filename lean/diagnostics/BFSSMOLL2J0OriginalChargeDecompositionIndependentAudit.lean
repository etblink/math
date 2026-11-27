import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2J0OriginalChargeDecomposition

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2J0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2H0 FCP.BFSSMOLL2I0 FCP.BFSSMOLL2J0
open MeasureTheory

theorem originalSU2ChargePointAudit (M : AlgebraData 2)
    (a : SpinIndex) (f : SmoothCore 2) (x : Boson 2) :
    M.charge a f x =
      (∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ b : SpinIndex,
        (-Complex.I * (M.gamma i a b : ℂ)) •
          M.theta b A (coordinateDerivative i A f x)) + potentialField M a f x := by
  rw [charge_apply_split, kineticCore_apply]

theorem originalSU2ChargeL2Audit (M : AlgebraData 2) (a : SpinIndex)
    (f : SmoothCore 2) (R : ℝ)
    (hs : tsupport (f : Boson 2 → Fermion 2) ⊆ Metric.closedBall 0 R) :
    coreToL2 (M.charge a f) =
      coreToL2 (kineticCore M a f) + corePotentialL2 M a f R hs :=
  chargeL2_split M a f R hs

#print axioms originalSU2ChargePointAudit
#print axioms originalSU2ChargeL2Audit
end
end FCP.BFSSMOLL2J0Independent
