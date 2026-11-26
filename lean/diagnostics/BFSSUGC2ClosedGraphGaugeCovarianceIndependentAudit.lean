import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC2ClosedGraphGaugeCovariance

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSUGC2Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSUGC2 FCP.BFSSSU2PhysicalDomainD2B6

theorem originalSU2ClosedGraphAudit (M : AlgebraData 2) (G : M.GaugeData)
    (g : GaugeGroup 2) (v : FullL2 2) (y : SpinIndex → FullL2 2) :
    (G.fiberAction g (G.bosonPullback g⁻¹ v),
      fun α => G.fiberAction g (G.bosonPullback g⁻¹ (y α))) ∈
        M.fullClosedGraph ↔ (v, y) ∈ M.fullClosedGraph := by
  simpa only [graph_action, sourceFullGaugePairCLM_apply] using
    graph_action_closed_iff M G g (v, y)

theorem originalSU2PhysicalOutputAudit (M : AlgebraData 2) (G : M.GaugeData)
    (v : FullL2 2) (y : SpinIndex → FullL2 2)
    (hp : (v, y) ∈ M.fullClosedGraph) (hv : v ∈ G.physicalSpace) :
    ∀ α : SpinIndex, y α ∈ G.physicalSpace :=
  closed_graph_physical_output M G hp hv

#print axioms originalSU2ClosedGraphAudit
#print axioms originalSU2PhysicalOutputAudit
end
end FCP.BFSSUGC2Independent
