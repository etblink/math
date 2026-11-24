import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b2SingleOperatorTransport

/-! E0b3: compose independently qualified E0b1 and E0b2 pointwise
equalities and recover the literal original basis-square core identity.
No energy, closure or spectral claim. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b3
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

/-- Literal original basis-square equality by pointwise equality chaining. -/
theorem basisSquarePoint (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x =
      ((pairedAlgebraData.charge b * pairedAlgebraData.charge b) f.val) x := by
  calc
    ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x =
        ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) *
          sourceAllSpinorCharge pairedAlgebraData (basisSpinor a)) f.val) x :=
      (FCP.BFSSCSQE0b2.coordinateSquareEvaluation pairedAlgebraData a f.val x).symm
    _ = ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor b) *
          sourceAllSpinorCharge pairedAlgebraData (basisSpinor b)) f.val) x :=
      FCP.BFSSCSQE0b1.coordinateWeightedSquare a b f x
    _ = ((pairedAlgebraData.charge b * pairedAlgebraData.charge b) f.val) x :=
      FCP.BFSSCSQE0b2.coordinateSquareEvaluation pairedAlgebraData b f.val x

/-- Recover equality of original smooth-core vectors from pointwise equality. -/
theorem basisSquareCore (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) := by
  apply DFunLike.ext
  intro x
  exact basisSquarePoint a b f x

#print axioms basisSquarePoint
#print axioms basisSquareCore
end
end FCP.BFSSCSQE0b3
