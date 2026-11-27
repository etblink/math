import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG0OriginalIndividualPhysicalOperator

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSICDB0
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem originalSU2IndividualGraphAudit (a : SpinIndex)
    (u v : pairedGaugeData.physicalSpace) :
    (u, v) ∈ (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).graph ↔
      ((u : FullL2 2), (v : FullL2 2)) ∈
        originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a :=
  paired_individual_graph_iff a u v

theorem originalSU2IndividualClosedAudit (a : SpinIndex) :
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).IsClosed :=
  paired_individual_isClosed a

#print axioms originalSU2IndividualGraphAudit
#print axioms originalSU2IndividualClosedAudit
end
end FCP.BFSSNAG0Independent
