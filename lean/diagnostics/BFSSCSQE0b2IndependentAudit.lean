import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b2SingleOperatorTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b2Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

/-- Literal square equality for the actual original paired source. -/
theorem pairedCoordinateSquareOperatorAudit (a : SpinIndex) :
    sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) =
      pairedAlgebraData.charge a * pairedAlgebraData.charge a :=
  FCP.BFSSCSQE0b2.coordinateSquareOperator pairedAlgebraData a

/-- Literal evaluation on the actual invariant smooth core. -/
theorem pairedCoordinateSquareEvaluationAudit (a : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData (basisSpinor a) *
        sourceAllSpinorCharge pairedAlgebraData (basisSpinor a)) f.val) x =
      ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x :=
  FCP.BFSSCSQE0b2.coordinateSquareEvaluation pairedAlgebraData a f.val x

#print axioms pairedCoordinateSquareOperatorAudit
#print axioms pairedCoordinateSquareEvaluationAudit
end
end FCP.BFSSCSQE0b2Independent
