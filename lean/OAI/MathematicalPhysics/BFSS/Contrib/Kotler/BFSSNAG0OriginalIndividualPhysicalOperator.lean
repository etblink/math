import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDC0OriginalPhysicalCommonDomain

/-! NAG0: native individual closed partial operator on the literal original
physical Hilbert subtype. Exact graph, not an adjoint or ESA assertion.
Keep source graph reductions dimension-parametric. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSICDB0 FCP.BFSSICDC0
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

def individualCoreSubmodule {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    Submodule ℂ (FullL2 N × FullL2 N) :=
  LinearMap.range
    ((coreToL2.comp G.invariantCore.subtype).prod
      ((coreToL2.comp (M.charge a)).comp G.invariantCore.subtype))

def individualClosedSubmodule {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    Submodule ℂ (FullL2 N × FullL2 N) :=
  (individualCoreSubmodule M G a).topologicalClosure

theorem individualClosedSubmodule_set_eq {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    (individualClosedSubmodule M G a : Set (FullL2 N × FullL2 N)) =
      originalIndividualClosedGraph M G a := by
  rfl

def individualPhysicalGraph {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    Submodule ℂ (G.physicalSpace × G.physicalSpace) :=
  (individualClosedSubmodule M G a).comap
    (G.physicalSpace.subtype.prodMap G.physicalSpace.subtype)

theorem individualPhysicalGraph_mem_iff {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) (u v : G.physicalSpace) :
    (u, v) ∈ individualPhysicalGraph M G a ↔
      ((u : FullL2 N), (v : FullL2 N)) ∈ originalIndividualClosedGraph M G a := by
  change ((u : FullL2 N), (v : FullL2 N)) ∈ individualClosedSubmodule M G a ↔ _
  rw [← individualClosedSubmodule_set_eq M G a]
  rfl

private theorem individualPhysicalGraph_vertical {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    ∀ p : G.physicalSpace × G.physicalSpace,
      p ∈ individualPhysicalGraph M G a → p.1 = 0 → p.2 = 0 := by
  rintro ⟨u,v⟩ hp hu
  dsimp at hu
  subst u
  have hi := (individualPhysicalGraph_mem_iff M G a 0 v).mp hp
  have hi' : (0, (v : FullL2 N)) ∈ originalIndividualClosedGraph M G a := hi
  obtain ⟨y,hy,he⟩ :=
    (source_component_graph_iff M G a h 0 (v : FullL2 N)).mp hi'
  have hz : y = 0 :=
    M.fullClosedGraph_vertical (originalMinimalClosedGraph_le_full M G hy)
  apply Subtype.ext
  rw [← he, hz]
  rfl

def individualPhysicalOperator {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    G.physicalSpace →ₗ.[ℂ] G.physicalSpace :=
  (individualPhysicalGraph M G a).toLinearPMap

theorem individualPhysicalOperator_graph_eq {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    (individualPhysicalOperator M G a).graph = individualPhysicalGraph M G a :=
  Submodule.toLinearPMap_graph_eq _ (individualPhysicalGraph_vertical M G a h)

theorem individualPhysicalOperator_isClosed {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    (individualPhysicalOperator M G a).IsClosed := by
  change IsClosed ((individualPhysicalOperator M G a).graph :
    Set (G.physicalSpace × G.physicalSpace))
  rw [individualPhysicalOperator_graph_eq M G a h]
  change IsClosed {p : G.physicalSpace × G.physicalSpace |
    ((p.1 : FullL2 N), (p.2 : FullL2 N)) ∈ individualClosedSubmodule M G a}
  exact (individualCoreSubmodule M G a).isClosed_topologicalClosure.preimage
    ((continuous_subtype_val.comp continuous_fst).prodMk
      (continuous_subtype_val.comp continuous_snd))

/-- The concrete graph uses the independently qualified equal core
norms, rather than a new single-valuedness assumption. -/
theorem paired_individual_graph_iff (a : SpinIndex)
    (u v : pairedGaugeData.physicalSpace) :
    (u, v) ∈ (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).graph ↔
      ((u : FullL2 2), (v : FullL2 2)) ∈
        originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a := by
  rw [individualPhysicalOperator_graph_eq pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)]
  exact individualPhysicalGraph_mem_iff pairedAlgebraData pairedGaugeData a u v

theorem paired_individual_isClosed (a : SpinIndex) :
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).IsClosed :=
  individualPhysicalOperator_isClosed pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)

#print axioms individualClosedSubmodule_set_eq
#print axioms individualPhysicalGraph_mem_iff
#print axioms individualPhysicalOperator_graph_eq
#print axioms individualPhysicalOperator_isClosed
#print axioms paired_individual_graph_iff
#print axioms paired_individual_isClosed

end
end FCP.BFSSNAG0
