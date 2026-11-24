import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0b3BasisSquareComposition

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b3Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Independent literal original pointwise basis-square control. -/
theorem pairedBasisSquarePointAudit (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x =
      ((pairedAlgebraData.charge b * pairedAlgebraData.charge b) f.val) x :=
  FCP.BFSSCSQE0b3.basisSquarePoint a b f x

/-- Independent literal original twice-applied charge, not a weighted proxy. -/
theorem pairedBasisSquareCoreAudit (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) :=
  FCP.BFSSCSQE0b3.basisSquareCore a b f

#print axioms pairedBasisSquarePointAudit
#print axioms pairedBasisSquareCoreAudit
end
end FCP.BFSSCSQE0b3Independent
