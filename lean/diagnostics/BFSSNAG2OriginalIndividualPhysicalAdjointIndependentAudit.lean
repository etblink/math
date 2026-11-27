import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG2OriginalIndividualPhysicalAdjoint

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG2Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG2 FCP.BFSSICDC0
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem originalSU2IndividualAdjointWeakAudit (a : SpinIndex)
    (u v : pairedGaugeData.physicalSpace) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    (u, v) ∈ (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).adjoint.graph ↔
      ∀ f : pairedGaugeData.invariantCore,
        inner ℂ (coreToL2 (pairedAlgebraData.charge a f.val)) (u : FullL2 2) =
          inner ℂ (coreToL2 f.val) (v : FullL2 2) :=
  source_adjoint_graph_iff_weak pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u v

theorem originalSU2IndividualSelfAdjointAudit (a : SpinIndex) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    IsSelfAdjoint (individualPhysicalOperator pairedAlgebraData pairedGaugeData a) :=
  paired_native_selfAdjoint a

#print axioms originalSU2IndividualAdjointWeakAudit
#print axioms originalSU2IndividualSelfAdjointAudit
end
end FCP.BFSSNAG2Independent
