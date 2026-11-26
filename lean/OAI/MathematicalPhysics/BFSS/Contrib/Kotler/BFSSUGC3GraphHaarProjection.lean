import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC2ClosedGraphGaugeCovariance
import Mathlib.Analysis.Convex.Integral
import Mathlib.MeasureTheory.SpecificCodomains.Pi

/-! UGC3: genuine source Haar projection on the original closed joint-charge
graph. The graph is the closed complex submodule from Core, not a surrogate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC3
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData OAI.Laughlin.Rotation
open FCP.BFSSUGC2 FCP.BFSSSU2PhysicalDomainD2B6
open FCP.BFSSSU2PhysicalDomainD2B9A FCP.BFSSSU2PhysicalDomainD2B9B
open FCP.BFSSSU2PhysicalDomainD2B9C
open MeasureTheory Set

variable (M : AlgebraData 2) (G : M.GaugeData)

def graph_haar (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    FullL2 2 × (SpinIndex → FullL2 2) :=
  (sourceFullHaarAverageCLM M G p.1,
    fun α => sourceFullHaarAverageCLM M G (p.2 α))

theorem graph_haar_continuous : Continuous (graph_haar M G) := by
  exact ((sourceFullHaarAverageCLM M G).continuous.comp continuous_fst).prodMk
    (continuous_pi fun α =>
      (sourceFullHaarAverageCLM M G).continuous.comp
        ((continuous_apply α).comp continuous_snd))

theorem graph_orbit_integrable (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    Integrable (fun g : GaugeGroup 2 => graph_action M G g p) sourceHaar := by
  change Integrable (fun g : GaugeGroup 2 =>
    (sourceFullGaugePairCLM M G g p.1,
      fun α => sourceFullGaugePairCLM M G g (p.2 α))) sourceHaar
  exact (sourceFullHaarIntegrand_integrable M G p.1).prodMk
    (Integrable.of_eval fun α => sourceFullHaarIntegrand_integrable M G (p.2 α))

theorem graph_haar_integral (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    graph_haar M G p = ∫ g : GaugeGroup 2, graph_action M G g p ∂sourceHaar := by
  apply Prod.ext
  · exact (fst_integral (graph_orbit_integrable M G p)).symm
  · funext α
    change (∫ g : GaugeGroup 2, sourceFullGaugePairCLM M G g (p.2 α) ∂sourceHaar) =
      (∫ g : GaugeGroup 2, graph_action M G g p ∂sourceHaar).2 α
    rw [snd_integral (graph_orbit_integrable M G p)]
    exact (eval_integral
      (fun β : SpinIndex => sourceFullHaarIntegrand_integrable M G (p.2 β)) α).symm

theorem graph_haar_closed_mem {p : FullL2 2 × (SpinIndex → FullL2 2)}
    (hp : p ∈ M.fullClosedGraph) : graph_haar M G p ∈ M.fullClosedGraph := by
  rw [graph_haar_integral]
  have hc : IsClosed (M.fullClosedGraph : Set (FullL2 2 × (SpinIndex → FullL2 2))) := by
    change IsClosed (closure (M.fullCoreGraph : Set (FullL2 2 × (SpinIndex → FullL2 2))))
    exact isClosed_closure
  have hv : Convex ℝ (M.fullClosedGraph : Set (FullL2 2 × (SpinIndex → FullL2 2))) :=
    (M.fullClosedGraph.restrictScalars ℝ).convex
  exact hv.integral_mem hc
    (Filter.Eventually.of_forall fun g => graph_action_closed_mem M G g hp)
    (graph_orbit_integrable M G p)

theorem graph_haar_physical (p : FullL2 2 × (SpinIndex → FullL2 2)) :
    (graph_haar M G p).1 ∈ G.physicalSpace ∧
      ∀ α : SpinIndex, (graph_haar M G p).2 α ∈ G.physicalSpace :=
  ⟨sourceFullHaarAverageCLM_mem_physical M G p.1,
    fun α => sourceFullHaarAverageCLM_mem_physical M G (p.2 α)⟩

theorem graph_haar_fixed {v : FullL2 2} {y : SpinIndex → FullL2 2}
    (hp : (v, y) ∈ M.fullClosedGraph) (hv : v ∈ G.physicalSpace) :
    graph_haar M G (v, y) = (v, y) := by
  apply Prod.ext
  · exact sourceFullHaarAverageCLM_fixed_physical M G v hv
  · funext α
    exact sourceFullHaarAverageCLM_fixed_physical M G (y α)
      (closed_graph_physical_output M G hp hv α)

#print axioms graph_haar
#print axioms graph_haar_continuous
#print axioms graph_orbit_integrable
#print axioms graph_haar_integral
#print axioms graph_haar_closed_mem
#print axioms graph_haar_physical
#print axioms graph_haar_fixed

end
end FCP.BFSSUGC3
