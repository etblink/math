import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG3OriginalIndividualCoreClosure

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG3Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG3 FCP.BFSSICDC0
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem originalSU2CoreLiteralGraphAudit (a : SpinIndex)
    (u v : pairedGaugeData.physicalSpace) :
    (u, v) ∈ (nativeCoreOperator pairedAlgebraData pairedGaugeData a).graph ↔
      ∃ f : pairedGaugeData.invariantCore, coreToL2 f.val = (u : FullL2 2) ∧
        coreToL2 (pairedAlgebraData.charge a f.val) = (v : FullL2 2) := by
  rw [nativeCoreOperator_graph_eq pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)]
  exact nativeCoreGraph_mem_iff pairedAlgebraData pairedGaugeData a u v

theorem originalSU2CoreClosureAudit (a : SpinIndex) :
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure =
      individualPhysicalOperator pairedAlgebraData pairedGaugeData a :=
  paired_native_core_closure a

#print axioms originalSU2CoreLiteralGraphAudit
#print axioms originalSU2CoreClosureAudit
end
end FCP.BFSSNAG3Independent
