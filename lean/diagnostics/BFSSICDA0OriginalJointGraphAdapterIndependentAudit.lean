import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDA0OriginalJointGraphAdapter

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDA0Independent
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU

/-- Independently spell out membership in the actual source closed graph,
at arbitrary N, without an invented operator or graph alias. -/
theorem originalJointGraphMembershipAudit {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (u : FullL2 N) (y : SpinIndex → FullL2 N) :
    (u, y) ∈ originalMinimalClosedGraph M G ↔
      (u, y) ∈ closure (Set.range (fun f : G.invariantCore =>
        (coreToL2 f.val, fun b : SpinIndex => coreToL2 (M.charge b f.val)))) := by
  change (u, y) ∈ (originalMinimalClosedGraph M G :
    Set (FullL2 N × (SpinIndex → FullL2 N))) ↔ _
  rw [FCP.BFSSICDA0.source_joint_closed_graph_eq M G]

#print axioms originalJointGraphMembershipAudit
end
end FCP.BFSSICDA0Independent
