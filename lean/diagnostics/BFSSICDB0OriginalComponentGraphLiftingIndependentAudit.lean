import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDB0OriginalComponentGraphLifting

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDB0Independent
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU

/-- Literal individual graph and AU graph, for arbitrary dimension and
explicit core norm premise. No paired or maximal-domain claim. -/
theorem originalComponentGraphAudit {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : FullL2 N) :
    (u, v) ∈ closure (Set.range (fun f : G.invariantCore =>
      (coreToL2 f.val, coreToL2 (M.charge a f.val)))) ↔
      ∃ y : SpinIndex → FullL2 N, (u, y) ∈ originalMinimalClosedGraph M G ∧ y a = v :=
  FCP.BFSSICDB0.source_component_graph_iff M G a h u v

#print axioms originalComponentGraphAudit
end
end FCP.BFSSICDB0Independent
