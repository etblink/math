import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF0OriginalFierzDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSCSQF0Independent
noncomputable section
open scoped Matrix BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5W
open FCP.BFSSSU2PhysicalDomainL6G6H

/-- Exact paired-source coefficient difference, arbitrary equal-norm real spinors. -/
theorem pairedCoefficientAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (p q : FermionLabel 2) (x : Boson 2) :
    sourceFierzChannelsReal pairedAlgebraData w p q x -
      sourceFierzChannelsReal pairedAlgebraData z p q x =
      -(if p.1 = q.1 then
        ∑ c : ColorIndex 2, pairedAlgebraData.structureConstant p.2 q.2 c *
          (sourceSpinorWeightedColor pairedAlgebraData w x c -
           sourceSpinorWeightedColor pairedAlgebraData z x c)
        else 0) :=
  FCP.BFSSCSQF0.originalFierzDifference pairedAlgebraData w z hn p q x

/-- Negative control: off-diagonal spin labels have zero difference. -/
theorem offDiagonalAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (p q : FermionLabel 2) (x : Boson 2) (hne : p.1 ≠ q.1) :
    sourceFierzChannelsReal pairedAlgebraData w p q x -
      sourceFierzChannelsReal pairedAlgebraData z p q x = 0 := by
  rw [pairedCoefficientAudit w z hn p q x]
  simp only [hne, ite_false, neg_zero]

#print axioms pairedCoefficientAudit
#print axioms offDiagonalAudit
end
end FCP.BFSSCSQF0Independent
