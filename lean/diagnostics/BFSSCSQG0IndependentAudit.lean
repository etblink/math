import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQG0OriginalPhysicalSquare

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSCSQG0Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G6K

/-- Direct independent consumption of the actual physical color constraint. -/
theorem pairedGaussAudit (u : ColorVector 2)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    (-Complex.I) • fderiv ℝ (f.val : Boson 2 → Fermion 2) x
        (pairedAlgebraData.gaugeTangent x u) +
      (∑ c : ColorIndex 2, (u c : ℂ) •
        sourceFiberFermionColorCurrent pairedAlgebraData c (f.val x)) = 0 :=
  FCP.BFSSCSQG0.physicalGaussCancel u f x

/-- Pointwise equality of actual weighted charge squares, not an
assumed physical Hamiltonian identity. -/
theorem pairedSquareAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x :=
  sub_eq_zero.mp (FCP.BFSSCSQG0.physicalSquareDifference w z hn f x)

#print axioms pairedGaussAudit
#print axioms pairedSquareAudit
end
end FCP.BFSSCSQG0Independent
