import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC1FullCoreGaugeAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B9CGenuineGaugeHaarProjectionProbe

/-! UGC2: bounded diagonal action on the exact original full joint-charge
graph. No new gauge representation, graph closure definition or Haar map. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC2
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSUGC1 FCP.BFSSSU2PhysicalDomainD2B6
open FCP.BFSSSU2PhysicalDomainD2B8A FCP.BFSSSU2PhysicalDomainD2B9C
open MeasureTheory Set

variable (M : AlgebraData 2) (G : M.GaugeData)

def graph_action (g : GaugeGroup 2)
    (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    FullL2 2 × (SpinIndex → FullL2 2) :=
  (sourceFullGaugePairCLM M G g p.1,
    fun α => sourceFullGaugePairCLM M G g (p.2 α))

theorem graph_action_continuous (g : GaugeGroup 2) :
    Continuous (graph_action M G g) := by
  exact ((sourceFullGaugePairCLM M G g).continuous.comp continuous_fst).prodMk
    (continuous_pi fun α =>
      (sourceFullGaugePairCLM M G g).continuous.comp
        ((continuous_apply α).comp continuous_snd))

theorem graph_action_core_mem (g : GaugeGroup 2)
    {p : FullL2 2 × (SpinIndex → FullL2 2)}
    (hp : p ∈ M.fullCoreGraph) :
    graph_action M G g p ∈ M.fullCoreGraph := by
  obtain ⟨f, rfl⟩ := hp
  refine ⟨core_action M G g f, ?_⟩
  apply Prod.ext
  · exact core_toL2_intertwines M G g f
  · funext α
    change coreToL2 (M.charge α (core_action M G g f)) =
      sourceFullGaugePairCLM M G g (coreToL2 (M.charge α f))
    rw [core_action_commutes M G g α f, core_toL2_intertwines]

theorem graph_action_closed_mem (g : GaugeGroup 2)
    {p : FullL2 2 × (SpinIndex → FullL2 2)}
    (hp : p ∈ M.fullClosedGraph) :
    graph_action M G g p ∈ M.fullClosedGraph := by
  let X := FullL2 2 × (SpinIndex → FullL2 2)
  let S : Set X := {q | graph_action M G g q ∈ M.fullClosedGraph}
  have hc : IsClosed (M.fullClosedGraph : Set X) := by
    change IsClosed (closure (M.fullCoreGraph : Set X))
    exact isClosed_closure
  have hs : IsClosed S := hc.preimage (graph_action_continuous M G g)
  have hcore : (M.fullCoreGraph : Set X) ⊆ S := by
    intro q hq
    change graph_action M G g q ∈ M.fullClosedGraph
    exact subset_closure (graph_action_core_mem M G g hq)
  exact closure_minimal hcore hs hp

theorem source_gauge_one (v : FullL2 2) :
    sourceFullGaugePairCLM M G (1 : GaugeGroup 2) v = v := by
  apply Lp.ext
  filter_upwards [sourceFullGaugePairCLM_ae M G (1 : GaugeGroup 2) v] with x hx
  simpa using hx

theorem graph_action_inv (g : GaugeGroup 2)
    (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    graph_action M G g⁻¹ (graph_action M G g p) = p := by
  apply Prod.ext
  · change sourceFullGaugePairCLM M G g⁻¹
      (sourceFullGaugePairCLM M G g p.1) = p.1
    rw [sourceFullGaugePairCLM_mul, inv_mul_cancel, source_gauge_one]
  · funext α
    change sourceFullGaugePairCLM M G g⁻¹
      (sourceFullGaugePairCLM M G g (p.2 α)) = p.2 α
    rw [sourceFullGaugePairCLM_mul, inv_mul_cancel, source_gauge_one]

theorem graph_action_closed_iff (g : GaugeGroup 2)
    (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    graph_action M G g p ∈ M.fullClosedGraph ↔ p ∈ M.fullClosedGraph := by
  constructor
  · intro hp
    have h := graph_action_closed_mem M G g⁻¹ hp
    rw [graph_action_inv M G g p] at h
    exact h
  · exact graph_action_closed_mem M G g

/-- Uniqueness of the original closed graph output forces physical
outputs whenever its input is already physical. -/
theorem closed_graph_physical_output
    {v : FullL2 2} {y : SpinIndex → FullL2 2}
    (hp : (v, y) ∈ M.fullClosedGraph) (hv : v ∈ G.physicalSpace)
    (α : SpinIndex) : y α ∈ G.physicalSpace := by
  apply (sourceFullGaugePairCLM_fixed_iff_physical M G (y α)).mp
  intro g
  have h := graph_action_closed_mem M G g hp
  change (sourceFullGaugePairCLM M G g v,
    fun β => sourceFullGaugePairCLM M G g (y β)) ∈ M.fullClosedGraph at h
  rw [(sourceFullGaugePairCLM_fixed_iff_physical M G v).mpr hv g] at h
  exact congrFun (M.fullClosedGraph_unique h hp) α

#print axioms graph_action
#print axioms graph_action_continuous
#print axioms graph_action_core_mem
#print axioms graph_action_closed_mem
#print axioms source_gauge_one
#print axioms graph_action_inv
#print axioms graph_action_closed_iff
#print axioms closed_graph_physical_output

end
end FCP.BFSSUGC2
