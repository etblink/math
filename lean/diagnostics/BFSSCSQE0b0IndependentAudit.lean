import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b0WeightedSquareTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b0Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Independent original fermion carrier control. -/
theorem fermionDifferenceAudit (u v : Fermion 2) (h : u - v = 0) :
    u = v :=
  FCP.BFSSCSQE0b0.fermionDifferenceToEquality u v h

/-- Independent original weighted-square equality without basis specialization. -/
theorem pairedWeightedSquareAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x :=
  FCP.BFSSCSQE0b0.weightedSquarePoint w z hn f x

/-- Independent original operator transport with symbolic operators. -/
theorem squarePointTransportAudit (A B C D : SourceEnd 2)
    (f : SmoothCore 2) (x : Boson 2) (ha : A = C) (hb : B = D)
    (h : ((A * A) f) x = ((B * B) f) x) :
    ((C * C) f) x = ((D * D) f) x :=
  FCP.BFSSCSQE0b0.squarePointTransport A B C D f x ha hb h

#print axioms fermionDifferenceAudit
#print axioms pairedWeightedSquareAudit
#print axioms squarePointTransportAudit
end
end FCP.BFSSCSQE0b0Independent
