import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
set_option autoImplicit false
namespace BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraphIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph

example (ε : ℝ) (f : SmoothCore 2) :
    PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
  originalWeightedChargeCoreOutput pairedAlgebraData ε f

example {ε : ℝ} (hε : 0 < ε) (f : SmoothCore 2) :
    originalReciprocalHilbertOutputCLM hε
      (originalWeightedChargeCoreOutput pairedAlgebraData ε f) =
        WithLp.toLp 2 (pairedAlgebraData.chargeVector f) :=
  originalWeightedChargeCoreOutput_reciprocal pairedAlgebraData hε f

example {ε : ℝ} (hε : 0 < ε) (f : pairedGaugeData.invariantCore) :
    ((⟨coreToL2 f.val, f.property⟩ : pairedGaugeData.physicalSpace),
      originalWeightedChargeCoreOutput pairedAlgebraData ε f.val) ∈
      (originalWeightedPhysicalChargeColumn
        pairedAlgebraData pairedGaugeData hε).graph :=
  originalWeightedChargeCoreGraph_mem
    pairedAlgebraData pairedGaugeData hε f

example {ε : ℝ} (hε : 0 < ε) (f : pairedGaugeData.invariantCore) :
    (⟨coreToL2 f.val, f.property⟩ : pairedGaugeData.physicalSpace) ∈
      (originalWeightedPhysicalChargeColumn
        pairedAlgebraData pairedGaugeData hε).domain :=
  originalWeightedChargeCore_mem_domain
    pairedAlgebraData pairedGaugeData hε f

#print axioms FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreOutput
#print axioms FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreOutput_reciprocal
#print axioms FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCoreGraph_mem
#print axioms FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.originalWeightedChargeCore_mem_domain
end
end BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraphIndependentConsumer
