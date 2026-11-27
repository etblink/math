import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDB0OriginalComponentGraphLifting

/-! LOC6A: dimension-parametric transport of the literal original
individual closed graph. Haar specialization and physical weak
equivalence remain separate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6A
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSICDB0

theorem projected_closed_range {D I E : Type*} [TopologicalSpace E]
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

/-- Keep N symbolic throughout source graph transport. The only
inputs are continuous projection and literal generator compatibility. -/
theorem source_projected_graph_mem {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (P : FullL2 N →L[ℂ] FullL2 N)
    (j : SmoothCore N → G.invariantCore)
    (hJ : ∀ f : SmoothCore N, P (coreToL2 f) = coreToL2 (j f).val)
    (hQ : ∀ f : SmoothCore N,
      P (coreToL2 (M.charge a f)) = coreToL2 (M.charge a (j f).val))
    (u v : FullL2 N)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (P u, P v) ∈ originalIndividualClosedGraph M G a := by
  let A : SmoothCore N → FullL2 N × FullL2 N :=
    fun f => (coreToL2 f, coreToL2 (M.charge a f))
  let B : G.invariantCore → FullL2 N × FullL2 N :=
    fun f => (coreToL2 f.val, coreToL2 (M.charge a f.val))
  let T : FullL2 N × FullL2 N → FullL2 N × FullL2 N :=
    fun p => (P p.1, P p.2)
  have ht : Continuous T :=
    (P.continuous.comp continuous_fst).prodMk (P.continuous.comp continuous_snd)
  have hj (f : SmoothCore N) : T (A f) = B (j f) :=
    Prod.ext (hJ f) (hQ f)
  have hm := projected_closed_range A B T j ht hj (u, v) hp
  unfold originalIndividualClosedGraph
  exact hm

/-- Fixed input and output transport with no source unfolding at a
concrete dimension. -/
theorem source_fixed_graph_mem {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (P : FullL2 N →L[ℂ] FullL2 N)
    (j : SmoothCore N → G.invariantCore)
    (hJ : ∀ f : SmoothCore N, P (coreToL2 f) = coreToL2 (j f).val)
    (hQ : ∀ f : SmoothCore N,
      P (coreToL2 (M.charge a f)) = coreToL2 (M.charge a (j f).val))
    (u v : FullL2 N) (hu : P u = u) (hv : P v = v)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (u, v) ∈ originalIndividualClosedGraph M G a := by
  have hm := source_projected_graph_mem M G a P j hJ hQ u v hp
  rw [hu, hv] at hm
  exact hm

#print axioms projected_closed_range
#print axioms source_projected_graph_mem
#print axioms source_fixed_graph_mem

end
end FCP.BFSSLOC6A
