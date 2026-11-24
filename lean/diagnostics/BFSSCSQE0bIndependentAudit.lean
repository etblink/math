import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0bOriginalBasisSquare

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0bIndependent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Independent literal original weighted equality. -/
theorem pairedWeightedSquareAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x :=
  FCP.BFSSCSQE0b.weightedSquarePoint w z hn f x

/-- Independent literal original charges acting twice on the actual core. -/
theorem pairedBasisSquareAudit (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) :=
  FCP.BFSSCSQE0b.basisSquareCore a b f

#print axioms pairedWeightedSquareAudit
#print axioms pairedBasisSquareAudit
end
end FCP.BFSSCSQE0bIndependent
