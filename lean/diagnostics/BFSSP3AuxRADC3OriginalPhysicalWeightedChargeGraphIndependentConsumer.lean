import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3OriginalPhysicalWeightedChargeGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

set_option autoImplicit false
namespace BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraphIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph

example {ε : ℝ} (hε : 0 < ε)
    (p : pairedGaugeData.physicalSpace ×
      PiLp 2 (fun _ : SpinIndex => FullL2 2)) :
    p ∈ originalWeightedPhysicalChargeGraph
      pairedAlgebraData pairedGaugeData hε ↔
      (p.1, originalReciprocalHilbertOutputCLM hε p.2) ∈
        (originalMinimalPhysicalHilbertChargeColumn
          pairedAlgebraData pairedGaugeData).graph :=
  originalWeightedPhysicalChargeGraph_mem_iff
    pairedAlgebraData pairedGaugeData hε p

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).graph =
        originalWeightedPhysicalChargeGraph
          pairedAlgebraData pairedGaugeData hε :=
  originalWeightedPhysicalChargeColumn_graph_eq
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).IsClosed :=
  originalWeightedPhysicalChargeColumn_isClosed
    pairedAlgebraData pairedGaugeData hε

#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph_mem_iff
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_graph_eq
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_isClosed
end
end BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraphIndependentConsumer
