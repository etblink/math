import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6AOriginalParametricGraphTransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC4PhysicalGraphCoreIdentification

/-! LOC6B: specialize the qualified dimension-parametric graph transport
to the actual source SU2 Haar average. Recover clean weak-test extension
from LOC6 R2 without importing the failed module. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6B
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData OAI.Laughlin.Rotation
open FCP.BFSSLOC6A FCP.BFSSUGC4 FCP.BFSSICDB0
open FCP.BFSSSU2PhysicalDomainD2B4 FCP.BFSSSU2PhysicalDomainD2B6
open FCP.BFSSSU2PhysicalDomainD2B7 FCP.BFSSSU2PhysicalDomainD2B9A
open FCP.BFSSSU2PhysicalDomainD2B9B FCP.BFSSSU2PhysicalDomainD2B10C
open MeasureTheory
open scoped InnerProductSpace

variable (M : AlgebraData 2) (G : M.GaugeData)

theorem haar_inner_physical (w u : FullL2 2) (hu : u ∈ G.physicalSpace) :
    inner ℂ (sourceFullHaarAverageCLM M G w) u = inner ℂ w u := by
  have hpoint (g : GaugeGroup 2) :
      inner ℂ u (sourceFullGaugePairCLM M G g w) = inner ℂ u w := by
    let T : FullL2 2 →ₗᵢ[ℂ] FullL2 2 :=
      { toLinearMap := (sourceFullGaugePairCLM M G g).toLinearMap
        norm_map' := sourceFullGaugePairCLM_norm_map M G g }
    have ht : inner ℂ (sourceFullGaugePairCLM M G g u)
        (sourceFullGaugePairCLM M G g w) = inner ℂ u w :=
      T.inner_map_map u w
    rw [sourceFullGaugePairCLM_fixed_physical M G g u hu] at ht
    exact ht
  have hright : inner ℂ u (sourceFullHaarAverageCLM M G w) = inner ℂ u w := by
    rw [sourceFullHaarAverageCLM_apply]
    unfold sourceFullHaarAverage
    calc
      _ = ∫ g : GaugeGroup 2, inner ℂ u (sourceFullGaugePairCLM M G g w) ∂sourceHaar :=
        (integral_inner (sourceFullHaarIntegrand_integrable M G w) u).symm
      _ = _ := by simp only [hpoint]; simp
  calc
    _ = starRingEnd ℂ (inner ℂ u (sourceFullHaarAverageCLM M G w)) :=
      (inner_conj_symm (𝕜 := ℂ) _ _).symm
    _ = inner ℂ w u := by rw [hright, inner_conj_symm]

theorem haar_individual_charge_commutes (a : SpinIndex) (f : SmoothCore 2) :
    sourceFullHaarAverageCLM M G (coreToL2 (M.charge a f)) =
      coreToL2 (M.charge a (sourceHaarAverageCore M G f)) :=
  congrFun (core_haar_charge_commutes M G f) a

private def haarInvariant (f : SmoothCore 2) : G.invariantCore :=
  ⟨sourceHaarAverageCore M G f, sourceHaarAverageCore_mem_invariantCore M G f⟩

private theorem haarInvariant_val (f : SmoothCore 2) :
    (haarInvariant M G f).val = sourceHaarAverageCore M G f := rfl

private theorem invariant_test_haar (a : SpinIndex) (u v : FullL2 2)
    (h : ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v)
    (f : SmoothCore 2) :
    inner ℂ (coreToL2 (M.charge a (sourceHaarAverageCore M G f))) u =
      inner ℂ (coreToL2 (sourceHaarAverageCore M G f)) v := by
  have hh := h (haarInvariant M G f)
  simpa only [haarInvariant_val] using hh

theorem physical_weak_pair_ambient (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (h : ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v) :
    ∀ f : SmoothCore 2,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v := by
  intro f
  calc
    _ = inner ℂ (sourceFullHaarAverageCLM M G (coreToL2 (M.charge a f))) u :=
      (haar_inner_physical M G (coreToL2 (M.charge a f)) u hu).symm
    _ = inner ℂ (coreToL2 (M.charge a (sourceHaarAverageCore M G f))) u :=
      congrArg (fun z : FullL2 2 => inner ℂ z u)
        (haar_individual_charge_commutes M G a f)
    _ = inner ℂ (coreToL2 (sourceHaarAverageCore M G f)) v :=
      invariant_test_haar M G a u v h f
    _ = inner ℂ (sourceFullHaarAverageCLM M G (coreToL2 f)) v :=
      congrArg (fun z : FullL2 2 => inner ℂ z v)
        (sourceFullHaarAverageCLM_coreToL2_compat M G f).symm
    _ = _ := haar_inner_physical M G (coreToL2 f) v hv

private theorem haar_embedded_core (f : SmoothCore 2) :
    sourceFullHaarAverageCLM M G (coreToL2 f) =
      coreToL2 (haarInvariant M G f).val := by
  rw [haarInvariant_val]
  exact sourceFullHaarAverageCLM_coreToL2_compat M G f

private theorem haar_embedded_charge (a : SpinIndex) (f : SmoothCore 2) :
    sourceFullHaarAverageCLM M G (coreToL2 (M.charge a f)) =
      coreToL2 (M.charge a (haarInvariant M G f).val) := by
  rw [haarInvariant_val]
  exact haar_individual_charge_commutes M G a f

theorem ambient_to_physical_graph (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (u, v) ∈ originalIndividualClosedGraph M G a :=
  source_fixed_graph_mem (N := 2) M G a
    (sourceFullHaarAverageCLM M G) (haarInvariant M G)
    (haar_embedded_core M G) (haar_embedded_charge M G a)
    u v (sourceFullHaarAverageCLM_fixed_physical M G u hu)
    (sourceFullHaarAverageCLM_fixed_physical M G v hv) hp

#print axioms haar_inner_physical
#print axioms haar_individual_charge_commutes
#print axioms physical_weak_pair_ambient
#print axioms ambient_to_physical_graph

end
end FCP.BFSSLOC6B
