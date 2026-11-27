import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC5OriginalHilbertWeakGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC4PhysicalGraphCoreIdentification
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDB0OriginalComponentGraphLifting

/-! LOC6: physical weak test extension and literal individual invariant
graph closure by the original SU2 Haar average. No native adjoint or
self-adjointness declaration. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData OAI.Laughlin.Rotation
open FCP.BFSSLOC5 FCP.BFSSUGC4 FCP.BFSSICDB0
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

theorem physical_weak_pair_ambient (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (h : ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v) :
    ∀ f : SmoothCore 2,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v := by
  intro f
  let g : G.invariantCore :=
    ⟨sourceHaarAverageCore M G f, sourceHaarAverageCore_mem_invariantCore M G f⟩
  have hg := h g
  change inner ℂ (coreToL2 (M.charge a (sourceHaarAverageCore M G f))) u =
    inner ℂ (coreToL2 (sourceHaarAverageCore M G f)) v at hg
  rw [← haar_individual_charge_commutes M G a f,
    ← sourceFullHaarAverageCLM_coreToL2_compat M G f,
    haar_inner_physical M G _ u hu, haar_inner_physical M G _ v hv] at hg
  exact hg

theorem physical_closed_graph_iff_weak (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v := by
  constructor
  · intro hp
    have hs : Set.range (fun f : G.invariantCore =>
        (coreToL2 f.val, coreToL2 (M.charge a f.val))) ⊆
        Set.range (fun f : SmoothCore 2 => (coreToL2 f, coreToL2 (M.charge a f))) := by
      rintro p ⟨f, rfl⟩
      exact ⟨f.val, rfl⟩
    have hp' : (u, v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
        (coreToL2 f, coreToL2 (M.charge a f)))) :=
      closure_mono hs hp
    intro f
    exact (closed_graph_iff_hilbert_pairing M a u v).mp hp' f.val
  · intro h
    have hp := hilbert_pairing_mem_closed_graph M a u v
      (physical_weak_pair_ambient M G a u v hu hv h)
    let P : FullL2 2 →L[ℂ] FullL2 2 := sourceFullHaarAverageCLM M G
    let S : Set (FullL2 2 × FullL2 2) :=
      {p | (P p.1, P p.2) ∈ originalIndividualClosedGraph M G a}
    have hc : IsClosed S := isClosed_closure.preimage
      ((P.continuous.comp continuous_fst).prodMk (P.continuous.comp continuous_snd))
    have hs : Set.range (fun f : SmoothCore 2 =>
        (coreToL2 f, coreToL2 (M.charge a f))) ⊆ S := by
      rintro p ⟨f, rfl⟩
      change (P (coreToL2 f), P (coreToL2 (M.charge a f))) ∈
        originalIndividualClosedGraph M G a
      change (sourceFullHaarAverageCLM M G (coreToL2 f),
        sourceFullHaarAverageCLM M G (coreToL2 (M.charge a f))) ∈
        originalIndividualClosedGraph M G a
      rw [sourceFullHaarAverageCLM_coreToL2_compat M G f,
        haar_individual_charge_commutes M G a f]
      exact subset_closure ⟨⟨sourceHaarAverageCore M G f,
        sourceHaarAverageCore_mem_invariantCore M G f⟩, rfl⟩
    have hm := closure_minimal hs hc hp
    change (sourceFullHaarAverageCLM M G u, sourceFullHaarAverageCLM M G v) ∈
      originalIndividualClosedGraph M G a at hm
    rw [sourceFullHaarAverageCLM_fixed_physical M G u hu,
      sourceFullHaarAverageCLM_fixed_physical M G v hv] at hm
    exact hm

#print axioms haar_inner_physical
#print axioms haar_individual_charge_commutes
#print axioms physical_weak_pair_ambient
#print axioms physical_closed_graph_iff_weak

end
end FCP.BFSSLOC6
