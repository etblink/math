import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDC0OriginalPhysicalCommonDomain

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDC0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSICDB0 FCP.BFSSICDC0 FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AU FCP.BFSSSU2PhysicalDomainL6H5E8AY
open Set

/-- Audit the original individual closure, not a substitute operator. -/
theorem originalSU2ComponentGraphAudit (a : SpinIndex) (u v : FullL2 2) :
    (u, v) ∈ closure (Set.range (fun f : pairedGaugeData.invariantCore =>
      (coreToL2 f.val, coreToL2 (pairedAlgebraData.charge a f.val)))) ↔
      ∃ y : SpinIndex → FullL2 2,
        (u, y) ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData ∧ y a = v :=
  paired_component_graph_iff a u v

/-- The domain conclusion references AY's actual native partial map. -/
theorem originalSU2CommonDomainAudit (a : SpinIndex) (u : pairedGaugeData.physicalSpace) :
    (∃ v : FullL2 2, ((u : FullL2 2), v) ∈
      originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain :=
  paired_common_domain a u

#print axioms originalSU2ComponentGraphAudit
#print axioms originalSU2CommonDomainAudit
end
end FCP.BFSSICDC0Independent
