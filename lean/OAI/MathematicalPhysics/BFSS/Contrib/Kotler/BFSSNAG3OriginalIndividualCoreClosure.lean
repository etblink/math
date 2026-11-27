import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG2OriginalIndividualPhysicalAdjoint

/-! NAG3: the literal unclosed original invariant smooth-core operator
on the physical Hilbert subtype and its native graph closure.
No new core, operator extension hypothesis or spectral assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG3
noncomputable section
open Set Topology
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG1 FCP.BFSSNAG2 FCP.BFSSICDB0 FCP.BFSSICDC0
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

/-- Pullback of graph closure along the genuine pair inclusion.
The range premise concerns every literal unclosed graph point. -/
theorem physical_pair_closure {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (P : Submodule ℂ E) (A : Submodule ℂ (E × E))
    (h : ∀ p : E × E, p ∈ A → p.1 ∈ P ∧ p.2 ∈ P) :
    (A.comap (P.subtype.prodMap P.subtype)).topologicalClosure =
      A.topologicalClosure.comap (P.subtype.prodMap P.subtype) := by
  let j : P × P → E × E := Prod.map Subtype.val Subtype.val
  have hi : Isometry (Subtype.val : P → E) := isometry_subtype_coe
  have hj : Isometry j := hi.prodMap hi
  have himage : j '' (j ⁻¹' (A : Set (E × E))) = (A : Set (E × E)) := by
    ext p
    constructor
    · rintro ⟨q, hq, rfl⟩
      exact hq
    · intro hp
      obtain ⟨h1, h2⟩ := h p hp
      exact ⟨(⟨p.1, h1⟩, ⟨p.2, h2⟩), hp, Prod.ext rfl rfl⟩
  apply SetLike.ext'
  change closure (j ⁻¹' (A : Set (E × E))) = j ⁻¹' closure (A : Set (E × E))
  rw [hj.isEmbedding.closure_eq_preimage_closure_image, himage]

def nativeCoreGraph {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) : Submodule ℂ (G.physicalSpace × G.physicalSpace) :=
  (individualCoreSubmodule M G a).comap (G.physicalSpace.subtype.prodMap G.physicalSpace.subtype)

def nativeCoreOperator {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) : G.physicalSpace →ₗ.[ℂ] G.physicalSpace :=
  (nativeCoreGraph M G a).toLinearPMap

theorem nativeCoreGraph_mem_iff {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) (u v : G.physicalSpace) :
    (u, v) ∈ nativeCoreGraph M G a ↔
      ∃ f : G.invariantCore, coreToL2 f.val = (u : FullL2 N) ∧
        coreToL2 (M.charge a f.val) = (v : FullL2 N) := by
  change (∃ f : G.invariantCore,
    (coreToL2 f.val, coreToL2 (M.charge a f.val)) =
      ((u : FullL2 N), (v : FullL2 N))) ↔ _
  constructor
  · rintro ⟨f, hf⟩
    exact ⟨f, congrArg Prod.fst hf, congrArg Prod.snd hf⟩
  · rintro ⟨f, h1, h2⟩
    exact ⟨f, Prod.ext h1 h2⟩

private theorem nativeCoreGraph_le {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    nativeCoreGraph M G a ≤ individualPhysicalGraph M G a := by
  intro p hp
  exact (individualCoreSubmodule M G a).le_topologicalClosure hp

theorem nativeCoreOperator_graph_eq {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    (nativeCoreOperator M G a).graph = nativeCoreGraph M G a := by
  apply Submodule.toLinearPMap_graph_eq
  intro p hp hz
  have hp' := nativeCoreGraph_le M G a hp
  rw [← individualPhysicalOperator_graph_eq M G a h] at hp'
  exact (individualPhysicalOperator M G a).graph_fst_eq_zero_snd hp' hz

/-- Compose graph equalities abstractly, without rewriting through the
concrete physical Hilbert carrier. -/
private theorem graph_closure_transport {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (A B : E →ₗ.[ℂ] E) (P R : Submodule ℂ (E × E))
    (hA : A.graph = P) (hB : B.graph = R)
    (hC : P.topologicalClosure = R) :
    A.graph.topologicalClosure = B.graph :=
  (congrArg (fun S : Submodule ℂ (E × E) => S.topologicalClosure) hA).trans
    (hC.trans hB.symm)

theorem source_native_core_graph_closure {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ x y : FullL2 N, x ∈ G.physicalSpace →
      (x, y) ∈ originalIndividualClosedGraph M G a → y ∈ G.physicalSpace) :
    (nativeCoreOperator M G a).graph.topologicalClosure =
      (individualPhysicalOperator M G a).graph := by
  have hall (p : FullL2 N × FullL2 N) (hp : p ∈ individualCoreSubmodule M G a) :
      p.1 ∈ G.physicalSpace ∧ p.2 ∈ G.physicalSpace := by
    obtain ⟨f, hf⟩ := hp
    change (coreToL2 f.val, coreToL2 (M.charge a f.val)) = p at hf
    subst p
    exact ⟨f.property, hout _ _ f.property (source_core_pair_mem M G a f)⟩
  have hC : (nativeCoreGraph M G a).topologicalClosure =
      individualPhysicalGraph M G a :=
    physical_pair_closure G.physicalSpace (individualCoreSubmodule M G a) hall
  exact graph_closure_transport (nativeCoreOperator M G a)
    (individualPhysicalOperator M G a) (nativeCoreGraph M G a)
    (individualPhysicalGraph M G a) (nativeCoreOperator_graph_eq M G a h)
    (individualPhysicalOperator_graph_eq M G a h) hC

private theorem closure_eq_of_graph_eq {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (A B : E →ₗ.[ℂ] E) (h : A.graph.topologicalClosure = B.graph) :
    A.closure = B := by
  have hc : A.IsClosable := ⟨B, h⟩
  apply LinearPMap.eq_of_eq_graph
  rw [← hc.graph_closure_eq_closure_graph]
  exact h

theorem source_native_core_closure {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ x y : FullL2 N, x ∈ G.physicalSpace →
      (x, y) ∈ originalIndividualClosedGraph M G a → y ∈ G.physicalSpace) :
    (nativeCoreOperator M G a).closure = individualPhysicalOperator M G a :=
  closure_eq_of_graph_eq _ _ (source_native_core_graph_closure M G a h hout)

theorem paired_native_core_closure (a : SpinIndex) :
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure =
      individualPhysicalOperator pairedAlgebraData pairedGaugeData a :=
  source_native_core_closure pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)
    (source_individual_output_physical pairedAlgebraData pairedGaugeData a
      (fun f b => paired_core_charge_norm a b f))

#print axioms physical_pair_closure
#print axioms nativeCoreGraph_mem_iff
#print axioms nativeCoreOperator_graph_eq
#print axioms source_native_core_graph_closure
#print axioms source_native_core_closure
#print axioms paired_native_core_closure

end
end FCP.BFSSNAG3
