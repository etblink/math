import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2G0OriginalPotentialBound

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2G0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2G0

theorem originalSU2PotentialActionAudit (M : AlgebraData 2) (a : SpinIndex)
    (x : Boson 2) (v : Fermion 2) :
    potentialOperator M a x v =
      ∑ i : SpaceIndex, ∑ j : SpaceIndex, ∑ A : ColorIndex 2,
        ∑ B : ColorIndex 2, ∑ C : ColorIndex 2, ∑ b : SpinIndex,
        (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
          M.theta b A ((coordinate i B x : ℂ) • ((coordinate j C x : ℂ) • v)) :=
  potentialOperator_apply M a x v

theorem originalSU2PotentialBoundAudit (M : AlgebraData 2) (a : SpinIndex) (R : ℝ) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ x ∈ Metric.closedBall (0 : Boson 2) R,
      ∀ v w : Fermion 2,
        ‖potentialOperator M a x v - potentialOperator M a x w‖ ≤ K * ‖v - w‖ :=
  potentialOperator_difference_bound M a R

#print axioms originalSU2PotentialActionAudit
#print axioms originalSU2PotentialBoundAudit
end
end FCP.BFSSMOLL2G0Independent
