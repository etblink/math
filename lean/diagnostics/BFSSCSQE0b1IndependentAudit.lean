import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b1CoordinateSquare

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b1Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

theorem coordinateNormAudit (a b : SpinIndex) :
    spinorSquareNorm (basisSpinor a) = spinorSquareNorm (basisSpinor b) :=
  FCP.BFSSCSQE0b1.coordinateNormEqual a b

theorem coordinateWeightedSquareAudit (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor a)) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor b) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor b)) f.val) x :=
  FCP.BFSSCSQE0b1.coordinateWeightedSquare a b f x

#print axioms coordinateNormAudit
#print axioms coordinateWeightedSquareAudit
end
end FCP.BFSSCSQE0b1Independent
