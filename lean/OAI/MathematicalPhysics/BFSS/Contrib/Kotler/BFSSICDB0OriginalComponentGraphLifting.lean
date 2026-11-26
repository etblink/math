import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDA0OriginalJointGraphAdapter

/-! ICD-B0: conditional selected-component graph lifting, using the
qualified literal joint graph adapter. Physical specialization is separate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDB0
noncomputable section
open Filter Topology Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU

section Generic

variable {D E F ι : Type*} [AddCommGroup D] [Module ℂ D]
  [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup F] [NormedSpace ℂ F]

/-- For a linear core, identical output norms on differences give identical
Cauchy control. No topology or completeness on the core D is needed. -/
private theorem other_cauchy (A : ι → D →ₗ[ℂ] F)
    (a b : ι) (h : ∀ d : D, ‖A b d‖ = ‖A a d‖) (f : ℕ → D)
    (ha : CauchySeq (fun n => A a (f n))) :
    CauchySeq (fun n => A b (f n)) := by
  apply Metric.cauchySeq_iff.mpr
  intro ε hε
  obtain ⟨N, hN⟩ := Metric.cauchySeq_iff.mp ha ε hε
  refine ⟨N, fun m hm n hn => ?_⟩
  calc
    dist (A b (f m)) (A b (f n)) = ‖A b (f m - f n)‖ := by
      rw [map_sub, dist_eq_norm]
    _ = ‖A a (f m - f n)‖ := h _
    _ = dist (A a (f m)) (A a (f n)) := by rw [map_sub, dist_eq_norm]
    _ < ε := hN m hm n hn

/-- The closed individual graph is exactly the coordinate projection of
the closed joint graph when every component has the same core norm.
In particular the projection loses no graph limit. -/
theorem component_graph_iff [CompleteSpace F] (J : D →ₗ[ℂ] E) (A : ι → D →ₗ[ℂ] F)
    (a : ι) (h : ∀ (d : D) (b : ι), ‖A b d‖ = ‖A a d‖)
    (u : E) (v : F) :
    (u, v) ∈ closure (Set.range (fun d : D => (J d, A a d))) ↔
      ∃ y : ι → F, (u, y) ∈ closure
        (Set.range (fun d : D => (J d, fun b : ι => A b d))) ∧ y a = v := by
  constructor
  · intro hv
    obtain ⟨z, hz, ht⟩ := mem_closure_iff_seq_limit.mp hv
    change ∀ n : ℕ, ∃ d : D, (J d, A a d) = z n at hz
    choose f hf using hz
    have he : (fun n : ℕ => (J (f n), A a (f n))) = z := funext hf
    have ht' : Tendsto (fun n : ℕ => (J (f n), A a (f n))) atTop
        (𝓝 (u, v)) := by
      rw [he]
      exact ht
    have hfst : Tendsto (Prod.fst : E × F → E) (𝓝 (u, v)) (𝓝 u) :=
      continuous_fst.continuousAt
    have hsnd : Tendsto (Prod.snd : E × F → F) (𝓝 (u, v)) (𝓝 v) :=
      continuous_snd.continuousAt
    have hu : Tendsto (fun n : ℕ => J (f n)) atTop (𝓝 u) :=
      hfst.comp ht'
    have ha : Tendsto (fun n : ℕ => A a (f n)) atTop (𝓝 v) :=
      hsnd.comp ht'
    have hlim (b : ι) : ∃ w : F, Tendsto (fun n : ℕ => A b (f n))
        atTop (𝓝 w) :=
      cauchySeq_tendsto_of_complete
        (other_cauchy A a b (fun d => h d b) f ha.cauchySeq)
    choose y hy using hlim
    have hcol : Tendsto (fun n : ℕ => fun b : ι => A b (f n)) atTop
        (𝓝 y) := tendsto_pi_nhds.mpr hy
    have hp : Tendsto (fun n : ℕ => (J (f n), fun b : ι => A b (f n)))
        atTop (𝓝 (u, y)) := hu.prodMk_nhds hcol
    refine ⟨y, ?_, tendsto_nhds_unique (hy a) ha⟩
    exact mem_closure_of_tendsto hp (Eventually.of_forall
      (fun n => Set.mem_range_self (f := fun d : D =>
        (J d, fun b : ι => A b d)) (f n)))
  · rintro ⟨y, hy, hva⟩
    let p : E × (ι → F) → E × F := fun q => (q.1, q.2 a)
    have hc : Continuous p :=
      continuous_fst.prodMk ((continuous_apply a).comp continuous_snd)
    have hs : IsClosed {q | p q ∈ closure
        (Set.range (fun d : D => (J d, A a d)))} :=
      isClosed_closure.preimage hc
    have hsub : Set.range (fun d : D => (J d, fun b : ι => A b d)) ⊆
        {q | p q ∈ closure (Set.range (fun d : D => (J d, A a d)))} := by
      rintro q ⟨d, rfl⟩
      exact subset_closure (Set.mem_range_self (f := fun d : D => (J d, A a d)) d)
    have hmem := closure_minimal hsub hs hy
    change (u, y a) ∈ closure (Set.range (fun d : D => (J d, A a d))) at hmem
    rw [hva] at hmem
    exact hmem

end Generic

/-- The closure of the literal individual invariant smooth-core graph
in the original ambient Hilbert pair. No extension is assumed. -/
def originalIndividualClosedGraph {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex) : Set (FullL2 N × FullL2 N) :=
  closure (Set.range (fun f : G.invariantCore =>
    (coreToL2 f.val, coreToL2 (M.charge a f.val))))

/-- First specialize only the literal core generators. The AU graph
and its closure implementation do not participate in elaborating this proof. -/
theorem source_literal_component_graph_iff {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : FullL2 N) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
      ∃ y : SpinIndex → FullL2 N,
        (u, y) ∈ closure (Set.range (fun f : G.invariantCore =>
          (coreToL2 f.val, fun b : SpinIndex => coreToL2 (M.charge b f.val)))) ∧
        y a = v := by
  let J : G.invariantCore →ₗ[ℂ] FullL2 N :=
    coreToL2.comp G.invariantCore.subtype
  let A : SpinIndex → (G.invariantCore →ₗ[ℂ] FullL2 N) :=
    fun b => (coreToL2.comp (M.charge b)).comp G.invariantCore.subtype
  have hnorm : ∀ (f : G.invariantCore) (b : SpinIndex), ‖A b f‖ = ‖A a f‖ := by
    intro f b
    exact h f b
  have hgen := component_graph_iff J A a hnorm u v
  simpa only [originalIndividualClosedGraph, J, A, LinearMap.comp_apply,
    Submodule.subtype_apply] using hgen

/-- Use the frozen ICD-A0 theorem, without reducing the source AU graph
or reproving its generator equality in the lifting theorem. -/
theorem source_component_graph_iff {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : FullL2 N) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
      ∃ y : SpinIndex → FullL2 N, (u, y) ∈ originalMinimalClosedGraph M G ∧ y a = v := by
  change _ ↔ ∃ y : SpinIndex → FullL2 N,
    (u, y) ∈ (originalMinimalClosedGraph M G :
      Set (FullL2 N × (SpinIndex → FullL2 N))) ∧ y a = v
  rw [FCP.BFSSICDA0.source_joint_closed_graph_eq M G]
  exact source_literal_component_graph_iff M G a h u v

#print axioms component_graph_iff
#print axioms source_literal_component_graph_iff
#print axioms source_component_graph_iff

end
end FCP.BFSSICDB0
