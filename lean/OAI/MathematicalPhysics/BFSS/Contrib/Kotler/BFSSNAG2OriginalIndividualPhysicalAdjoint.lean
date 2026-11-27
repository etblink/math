import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG1OriginalIndividualPhysicalDomain
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6COriginalPhysicalWeakEquivalence
import Mathlib.Analysis.InnerProductSpace.LinearPMap

/-! NAG2: exact native adjoint graph of the literal original individual
physical closed operator. LOC6C weak equivalence and NAG1 density
supply the analytic premises. No Hamiltonian square or ESA claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG2
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG1 FCP.BFSSICDB0 FCP.BFSSICDC0 FCP.BFSSLOC6C
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

/-- Transport a weak equality from generators to their actual closed graph. -/
theorem weak_pairing_closed {D E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (J A : D → E) (u v : E)
    (h : ∀ f : D, inner ℂ (A f) u = inner ℂ (J f) v)
    (x y : E) (hp : (x, y) ∈ closure (Set.range (fun f => (J f, A f)))) :
    inner ℂ y u = inner ℂ x v := by
  let S : Set (E × E) := {p | inner ℂ p.2 u = inner ℂ p.1 v}
  have hs : IsClosed S := isClosed_eq
    (continuous_snd.inner continuous_const) (continuous_fst.inner continuous_const)
  have hr : Set.range (fun f => (J f, A f)) ⊆ S := by
    rintro p ⟨f, rfl⟩
    exact h f
  exact closure_minimal hr hs hp

theorem source_core_pair_mem {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) (f : G.invariantCore) :
    (coreToL2 f.val, coreToL2 (M.charge a f.val)) ∈
      originalIndividualClosedGraph M G a := by
  unfold originalIndividualClosedGraph
  exact subset_closure ⟨f, rfl⟩

/-- The adjoint test over every native graph point is exactly the
literal weak test over the original invariant smooth core. -/
theorem source_graph_pairing_iff_weak {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ x y : FullL2 N, x ∈ G.physicalSpace →
      (x, y) ∈ originalIndividualClosedGraph M G a → y ∈ G.physicalSpace)
    (u v : G.physicalSpace) :
    (∀ x y : G.physicalSpace,
      (x, y) ∈ (individualPhysicalOperator M G a).graph →
      inner ℂ y u = inner ℂ x v) ↔
    (∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) (u : FullL2 N) =
        inner ℂ (coreToL2 f.val) (v : FullL2 N)) := by
  rw [individualPhysicalOperator_graph_eq M G a h]
  constructor
  · intro ht f
    have hp := source_core_pair_mem M G a f
    let x : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
    let y : G.physicalSpace := ⟨coreToL2 (M.charge a f.val),
      hout (coreToL2 f.val) (coreToL2 (M.charge a f.val)) f.property hp⟩
    have hg : (x, y) ∈ individualPhysicalGraph M G a :=
      (individualPhysicalGraph_mem_iff M G a x y).mpr hp
    exact ht x y hg
  · intro ht x y hp
    have ha := (individualPhysicalGraph_mem_iff M G a x y).mp hp
    exact weak_pairing_closed
      (fun f : G.invariantCore => coreToL2 f.val)
      (fun f : G.invariantCore => coreToL2 (M.charge a f.val))
      (u : FullL2 N) (v : FullL2 N) ht (x : FullL2 N) (y : FullL2 N) ha

/-- Native adjoint membership as a pairing test on an abstract
complete Hilbert type, with no concrete let-bound target. -/
private theorem native_adjoint_graph_pairing {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    (Q : E →ₗ.[ℂ] E) (hd : Dense (Q.domain : Set E)) (u v : E) :
    (u, v) ∈ Q.adjoint.graph ↔
      ∀ x y : E, (x, y) ∈ Q.graph → inner ℂ y u = inner ℂ x v := by
  rw [LinearPMap.adjoint_graph_eq_graph_adjoint hd, Submodule.mem_adjoint_iff]
  simp only [sub_eq_zero]

theorem source_adjoint_graph_iff_weak (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : G.physicalSpace) :
    letI : CompleteSpace G.physicalSpace := G.physicalSpace_closed.isComplete.completeSpace_coe
    (u, v) ∈ (individualPhysicalOperator M G a).adjoint.graph ↔
      ∀ f : G.invariantCore,
        inner ℂ (coreToL2 (M.charge a f.val)) (u : FullL2 2) =
          inner ℂ (coreToL2 f.val) (v : FullL2 2) := by
  let : CompleteSpace G.physicalSpace := G.physicalSpace_closed.isComplete.completeSpace_coe
  exact (native_adjoint_graph_pairing (individualPhysicalOperator M G a)
    (source_native_domain_dense M G a h) u v).trans
    (source_graph_pairing_iff_weak M G a h
      (source_individual_output_physical M G a h) u v)

/-- Keep the source-graph rewrite dimension-parametric. -/
private theorem source_native_graph_mem_iff {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : G.physicalSpace) :
    (u, v) ∈ (individualPhysicalOperator M G a).graph ↔
      ((u : FullL2 N), (v : FullL2 N)) ∈ originalIndividualClosedGraph M G a := by
  rw [individualPhysicalOperator_graph_eq M G a h]
  exact individualPhysicalGraph_mem_iff M G a u v

/-- Extensionality at an abstract Hilbert type avoids reducing the concrete
source Hilbert carrier during the final native operator comparison. -/
private theorem selfAdjoint_of_common_graph_test {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    (Q : E →ₗ.[ℂ] E) (W : E → E → Prop)
    (hg : ∀ u v, (u, v) ∈ Q.graph ↔ W u v)
    (ha : ∀ u v, (u, v) ∈ Q.adjoint.graph ↔ W u v) :
    IsSelfAdjoint Q := by
  rw [LinearPMap.isSelfAdjoint_def]
  apply LinearPMap.eq_of_eq_graph
  apply Submodule.ext
  rintro ⟨u, v⟩
  exact (ha u v).trans (hg u v).symm

theorem source_native_selfAdjoint (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    letI : CompleteSpace G.physicalSpace := G.physicalSpace_closed.isComplete.completeSpace_coe
    IsSelfAdjoint (individualPhysicalOperator M G a) := by
  let : CompleteSpace G.physicalSpace := G.physicalSpace_closed.isComplete.completeSpace_coe
  let W : G.physicalSpace → G.physicalSpace → Prop := fun u v =>
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) (u : FullL2 2) =
        inner ℂ (coreToL2 f.val) (v : FullL2 2)
  have hg (u v : G.physicalSpace) :
      (u, v) ∈ (individualPhysicalOperator M G a).graph ↔ W u v :=
    (source_native_graph_mem_iff M G a h u v).trans
      (physical_closed_graph_iff_weak M G a (u : FullL2 2) (v : FullL2 2)
        u.property v.property)
  have ha (u v : G.physicalSpace) :
      (u, v) ∈ (individualPhysicalOperator M G a).adjoint.graph ↔ W u v :=
    source_adjoint_graph_iff_weak M G a h u v
  exact selfAdjoint_of_common_graph_test (individualPhysicalOperator M G a) W hg ha

theorem paired_native_selfAdjoint (a : SpinIndex) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    IsSelfAdjoint (individualPhysicalOperator pairedAlgebraData pairedGaugeData a) :=
  source_native_selfAdjoint pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)

#print axioms weak_pairing_closed
#print axioms source_core_pair_mem
#print axioms source_graph_pairing_iff_weak
#print axioms source_adjoint_graph_iff_weak
#print axioms source_native_selfAdjoint
#print axioms paired_native_selfAdjoint

end
end FCP.BFSSNAG2
