import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b1CoordinateSquare

/-! E0b2: single-operator square transport via qualified E0a, separately
from E0b1 coordinate common-square equality. No basis-energy claim. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b2
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

/-- Transport one square at the original operator level, with symbolic data. -/
theorem coordinateSquareOperator (M : AlgebraData 2) (a : SpinIndex) :
    sourceAllSpinorCharge M (basisSpinor a) *
        sourceAllSpinorCharge M (basisSpinor a) =
      M.charge a * M.charge a :=
  congrArg (fun T : SourceEnd 2 => T * T) (basisCharge M a)

/-- Evaluate the operator equality only after the square has been transported. -/
theorem coordinateSquareEvaluation (M : AlgebraData 2) (a : SpinIndex)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceAllSpinorCharge M (basisSpinor a) *
        sourceAllSpinorCharge M (basisSpinor a)) f) x =
      ((M.charge a * M.charge a) f) x :=
  congrArg (fun T : SourceEnd 2 => (T f) x) (coordinateSquareOperator M a)

#print axioms coordinateSquareOperator
#print axioms coordinateSquareEvaluation
end
end FCP.BFSSCSQE0b2
