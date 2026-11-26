import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC3GraphHaarProjection
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe

/-! UGC4: identify the original restricted closed graph with the physical-input
slice of the original unrestricted graph. No replacement graph or norm-density
assumption. Smooth Haar compatibility and graph uniqueness identify the outputs. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC4
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSUGC3 FCP.BFSSSU2PhysicalDomainD1 FCP.BFSSSU2PhysicalDomainD2A
open FCP.BFSSSU2PhysicalDomainD2B4 FCP.BFSSSU2PhysicalDomainD2B9B
open FCP.BFSSSU2PhysicalDomainD2B10C
open MeasureTheory Set

variable (M : AlgebraData 2) (G : M.GaugeData)

theorem core_haar_charge_commutes (f : SmoothCore 2) :
    (fun α : SpinIndex => sourceFullHaarAverageCLM M G (M.chargeVector f α)) =
      M.chargeVector (sourceHaarAverageCore M G f) := by
  have hf : (coreToL2 f, M.chargeVector f) ∈ M.fullClosedGraph :=
    Submodule.le_topologicalClosure _ (show (coreToL2 f, M.chargeVector f) ∈
      M.fullCoreGraph from ⟨f, rfl⟩)
  have ha : (coreToL2 (sourceHaarAverageCore M G f),
      M.chargeVector (sourceHaarAverageCore M G f)) ∈ M.fullClosedGraph :=
    Submodule.le_topologicalClosure _
      (show (coreToL2 (sourceHaarAverageCore M G f),
        M.chargeVector (sourceHaarAverageCore M G f)) ∈ M.fullCoreGraph from
          ⟨sourceHaarAverageCore M G f, rfl⟩)
  have hp := graph_haar_closed_mem M G hf
  change (sourceFullHaarAverageCLM M G (coreToL2 f),
    fun α => sourceFullHaarAverageCLM M G (M.chargeVector f α)) ∈
      M.fullClosedGraph at hp
  rw [sourceFullHaarAverageCLM_coreToL2_compat M G f] at hp
  exact M.fullClosedGraph_unique hp ha

theorem graph_haar_core_mem (p : FullL2 2 × (SpinIndex → FullL2 2))
    (hp : p ∈ M.fullCoreGraph) :
    graph_haar M G p ∈ LinearMap.range
      ((coreToL2.comp G.invariantCore.subtype).prod
        (M.chargeVector.comp G.invariantCore.subtype)) := by
  obtain ⟨f, rfl⟩ := hp
  refine ⟨⟨sourceHaarAverageCore M G f,
    sourceHaarAverageCore_mem_invariantCore M G f⟩, ?_⟩
  apply Prod.ext
  · exact (sourceFullHaarAverageCLM_coreToL2_compat M G f).symm
  · funext α
    change M.chargeVector (sourceHaarAverageCore M G f) α =
      sourceFullHaarAverageCLM M G (M.chargeVector f α)
    exact (congrFun (core_haar_charge_commutes M G f) α).symm

theorem graph_haar_restricted_mem {p : FullL2 2 × (SpinIndex → FullL2 2)}
    (hp : p ∈ M.fullClosedGraph) :
    graph_haar M G p ∈ originalRestrictedClosedGraph M G := by
  let X := FullL2 2 × (SpinIndex → FullL2 2)
  let R : Submodule ℂ X := LinearMap.range
    ((coreToL2.comp G.invariantCore.subtype).prod
      (M.chargeVector.comp G.invariantCore.subtype))
  let S : Set X := {q | graph_haar M G q ∈ originalRestrictedClosedGraph M G}
  have hc : IsClosed (originalRestrictedClosedGraph M G : Set X) := by
    change IsClosed (closure (R : Set X))
    exact isClosed_closure
  have hs : IsClosed S := hc.preimage (graph_haar_continuous M G)
  have hcore : (M.fullCoreGraph : Set X) ⊆ S := by
    intro q hq
    change graph_haar M G q ∈ closure (R : Set X)
    have hr : graph_haar M G q ∈ R := graph_haar_core_mem M G q hq
    have hsub : (R : Set X) ⊆ closure (R : Set X) := subset_closure
    exact hsub hr
  exact closure_minimal hcore hs hp

theorem original_restricted_graph_iff (v : FullL2 2) (y : SpinIndex → FullL2 2) :
    (v, y) ∈ originalRestrictedClosedGraph M G ↔
      (v, y) ∈ M.fullClosedGraph ∧ v ∈ G.physicalSpace := by
  constructor
  · intro hp
    have hsource : (v, y) ∈ G.deformedModelGraph 1 0 := by
      rw [sourceGaugeRestrictedClosedGraph_equal M G]
      exact hp
    exact ⟨sourceGaugeRestrictedGraph_le_full M G hsource,
      (sourceOriginalRestrictedClosedGraph_all_physical M G hp).1⟩
  · rintro ⟨hp, hv⟩
    have h := graph_haar_restricted_mem M G hp
    rw [graph_haar_fixed M G hp hv] at h
    exact h

theorem upstream_physical_graph_iff (v : FullL2 2) (y : SpinIndex → FullL2 2) :
    (v, y) ∈ G.deformedModelGraph 1 0 ↔
      (v, y) ∈ M.fullClosedGraph ∧ v ∈ G.physicalSpace := by
  rw [sourceGaugeRestrictedClosedGraph_equal M G]
  exact original_restricted_graph_iff M G v y

#print axioms core_haar_charge_commutes
#print axioms graph_haar_core_mem
#print axioms graph_haar_restricted_mem
#print axioms original_restricted_graph_iff
#print axioms upstream_physical_graph_iff

end
end FCP.BFSSUGC4
