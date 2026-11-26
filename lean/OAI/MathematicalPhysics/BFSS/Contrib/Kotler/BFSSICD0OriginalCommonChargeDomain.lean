import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0OriginalCoreEnergy
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe

/-! ICD0: lift a single original physical charge graph limit to the entire
original joint graph by exact core norm equality. This is a common-domain
result, not essential self-adjointness or a maximal-domain assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICD0
noncomputable section
open Filter Topology Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

section Generic

variable {D E F ι : Type*} [AddCommGroup D] [Module ℂ D]
  [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]

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
theorem component_graph_iff (J : D →ₗ[ℂ] E) (A : ι → D →ₗ[ℂ] F)
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
    have hu : Tendsto (fun n : ℕ => J (f n)) atTop (𝓝 u) := ht'.fst
    have ha : Tendsto (fun n : ℕ => A a (f n)) atTop (𝓝 v) := ht'.snd
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

/-- Dimension-generic source conversion, before specializing the Fock carrier. -/
theorem source_component_graph_iff {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : FullL2 N) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
      ∃ y : SpinIndex → FullL2 N, (u, y) ∈ originalMinimalClosedGraph M G ∧ y a = v := by
  exact component_graph_iff (coreToL2.comp G.invariantCore.subtype)
    (fun b : SpinIndex => (coreToL2.comp (M.charge b)).comp G.invariantCore.subtype)
    a h u v

/-- The AU ambient graph and AY native physical column have exactly the
same input membership on the actual physical Hilbert subtype. -/
private theorem source_joint_domain_iff {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (u : G.physicalSpace) :
    (∃ y : SpinIndex → FullL2 N, ((u : FullL2 N), y) ∈ originalMinimalClosedGraph M G) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  rw [originalMinimalPhysicalHilbertChargeColumn_domain_iff M G]
  rw [LinearPMap.mem_domain_iff]
  rw [originalMinimalClosedChargeColumn_graph_eq M G]

/-- Common individual/column domain, at arbitrary N under the literal
core norm identity. -/
theorem source_common_domain {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u : G.physicalSpace) :
    (∃ v : FullL2 N, ((u : FullL2 N), v) ∈ originalIndividualClosedGraph M G a) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  rw [← source_joint_domain_iff M G u]
  constructor
  · rintro ⟨v, hv⟩
    obtain ⟨y, hy, _⟩ := (source_component_graph_iff M G a h (u : FullL2 N) v).mp hv
    exact ⟨y, hy⟩
  · rintro ⟨y, hy⟩
    exact ⟨y a, (source_component_graph_iff M G a h (u : FullL2 N) (y a)).mpr
      ⟨y, hy, rfl⟩⟩

/-- Remove the squares using nonnegativity; the only physical premise is
the already qualified paired CSQE0 identity. -/
theorem paired_core_charge_norm (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    ‖coreToL2 (pairedAlgebraData.charge b f.val)‖ =
      ‖coreToL2 (pairedAlgebraData.charge a f.val)‖ := by
  have h := congrArg Real.sqrt (FCP.BFSSCSQE0.basisEnergyEqual b a f)
  simpa only [Real.sqrt_sq (norm_nonneg _)] using h

/-- Exact graph-level statement on the actual paired SU2 data. -/
theorem paired_component_graph_iff (a : SpinIndex) (u v : FullL2 2) :
    (u, v) ∈ originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a ↔
      ∃ y : SpinIndex → FullL2 2,
        (u, y) ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData ∧ y a = v :=
  source_component_graph_iff pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u v

/-- The individual graph-closure input domain is exactly the native
physical Hilbert charge column domain, for each original spin label. -/
theorem paired_common_domain (a : SpinIndex) (u : pairedGaugeData.physicalSpace) :
    (∃ v : FullL2 2, ((u : FullL2 2), v) ∈
      originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain :=
  source_common_domain pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u

#print axioms component_graph_iff
#print axioms source_component_graph_iff
#print axioms source_common_domain
#print axioms paired_core_charge_norm
#print axioms paired_component_graph_iff
#print axioms paired_common_domain

end
end FCP.BFSSICD0
