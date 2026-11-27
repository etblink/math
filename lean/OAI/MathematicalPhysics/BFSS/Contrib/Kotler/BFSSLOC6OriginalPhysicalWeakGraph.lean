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

/-- Keep closure transport independent of the large concrete Fock carrier. -/
private theorem projected_closed_range {D I E : Type*} [TopologicalSpace E]
    (A : D → E) (B : I → E) (P : E → E) (j : D → I)
    (hP : Continuous P) (hj : ∀ f, P (A f) = B (j f))
    (x : E) (hx : x ∈ closure (Set.range A)) :
    P x ∈ closure (Set.range B) := by
  let S : Set E := P ⁻¹' closure (Set.range B)
  have hc : IsClosed S := isClosed_closure.preimage hP
  have hs : Set.range A ⊆ S := by
    rintro y ⟨f, rfl⟩
    change P (A f) ∈ closure (Set.range B)
    rw [hj f]
    exact subset_closure (Set.mem_range_self (j f))
  exact closure_minimal hs hc hx

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

private theorem individual_graph_subset_ambient (a : SpinIndex) :
    originalIndividualClosedGraph M G a ⊆
      closure (Set.range (fun f : SmoothCore 2 =>
        (coreToL2 f, coreToL2 (M.charge a f)))) := by
  unfold originalIndividualClosedGraph
  apply closure_mono
  rintro p ⟨f, rfl⟩
  exact ⟨f.val, rfl⟩

private theorem individual_ambient_to_physical (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (u, v) ∈ originalIndividualClosedGraph M G a := by
  let A : SmoothCore 2 → FullL2 2 × FullL2 2 :=
    fun f => (coreToL2 f, coreToL2 (M.charge a f))
  let B : G.invariantCore → FullL2 2 × FullL2 2 :=
    fun f => (coreToL2 f.val, coreToL2 (M.charge a f.val))
  let P : FullL2 2 × FullL2 2 → FullL2 2 × FullL2 2 :=
    fun p => (sourceFullHaarAverageCLM M G p.1, sourceFullHaarAverageCLM M G p.2)
  have hP : Continuous P :=
    ((sourceFullHaarAverageCLM M G).continuous.comp continuous_fst).prodMk
      ((sourceFullHaarAverageCLM M G).continuous.comp continuous_snd)
  have hj (f : SmoothCore 2) : P (A f) = B (haarInvariant M G f) := by
    apply Prod.ext
    · exact (sourceFullHaarAverageCLM_coreToL2_compat M G f).trans
        (congrArg (fun g : SmoothCore 2 => coreToL2 g) (haarInvariant_val M G f).symm)
    · exact (haar_individual_charge_commutes M G a f).trans
        (congrArg (fun g : SmoothCore 2 => coreToL2 (M.charge a g))
          (haarInvariant_val M G f).symm)
  have hmem : P (u, v) ∈ closure (Set.range B) :=
    projected_closed_range A B P (haarInvariant M G) hP hj (u, v) hp
  have hfix : P (u, v) = (u, v) :=
    Prod.ext (sourceFullHaarAverageCLM_fixed_physical M G u hu)
      (sourceFullHaarAverageCLM_fixed_physical M G v hv)
  rw [hfix] at hmem
  unfold originalIndividualClosedGraph
  exact hmem

theorem physical_closed_graph_iff_weak (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v := by
  constructor
  · intro hp f
    exact (closed_graph_iff_hilbert_pairing M a u v).mp
      (individual_graph_subset_ambient M G a hp) f.val
  · intro h
    exact individual_ambient_to_physical M G a u v hu hv
      (hilbert_pairing_mem_closed_graph M a u v
        (physical_weak_pair_ambient M G a u v hu hv h))

#print axioms haar_inner_physical
#print axioms haar_individual_charge_commutes
#print axioms physical_weak_pair_ambient
#print axioms physical_closed_graph_iff_weak

end
end FCP.BFSSLOC6
