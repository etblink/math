import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG4OriginalIndividualCoreESA

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG4Independent
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG3 FCP.BFSSNAG4 FCP.BFSSICDC0
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem originalSU2LiteralCoreESAAudit (a : SpinIndex) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    Dense ((nativeCoreOperator pairedAlgebraData pairedGaugeData a).domain :
      Set pairedGaugeData.physicalSpace) ∧
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).IsFormalAdjoint
      (nativeCoreOperator pairedAlgebraData pairedGaugeData a) ∧
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).IsClosable ∧
    IsSelfAdjoint (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure :=
  paired_native_core_esa a

theorem originalSU2ESALiteralGraphAudit (a : SpinIndex)
    (u v : pairedGaugeData.physicalSpace) :
    (u, v) ∈ (nativeCoreOperator pairedAlgebraData pairedGaugeData a).graph ↔
      ∃ f : pairedGaugeData.invariantCore, coreToL2 f.val = (u : FullL2 2) ∧
        coreToL2 (pairedAlgebraData.charge a f.val) = (v : FullL2 2) := by
  rw [nativeCoreOperator_graph_eq pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)]
  exact nativeCoreGraph_mem_iff pairedAlgebraData pairedGaugeData a u v

#print axioms originalSU2LiteralCoreESAAudit
#print axioms originalSU2ESALiteralGraphAudit
end
end FCP.BFSSNAG4Independent
