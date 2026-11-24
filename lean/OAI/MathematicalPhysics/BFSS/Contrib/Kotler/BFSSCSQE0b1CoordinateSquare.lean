import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b0WeightedSquareTransport

/-! E0b1: isolate coordinate-spinor specialization of the accepted weighted
square identity. No operator rewriting or basis-energy claim. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b1
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

/-- Coordinate-spinor norm equality, separately from operator evaluation. -/
theorem coordinateNormEqual (a b : SpinIndex) :
    spinorSquareNorm (basisSpinor a) = spinorSquareNorm (basisSpinor b) :=
  (basisSpinor_norm a).trans (basisSpinor_norm b).symm

/-- Specialize the qualified weighted square without any basis-charge rewrite. -/
theorem coordinateWeightedSquare (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor a)) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor b) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor b)) f.val) x :=
  FCP.BFSSCSQE0b0.weightedSquarePoint (basisSpinor a) (basisSpinor b)
    (coordinateNormEqual a b) f x

#print axioms coordinateNormEqual
#print axioms coordinateWeightedSquare
end
end FCP.BFSSCSQE0b1
