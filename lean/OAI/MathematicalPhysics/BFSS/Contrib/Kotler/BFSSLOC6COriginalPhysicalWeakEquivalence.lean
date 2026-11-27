import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC5OriginalHilbertWeakGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6BOriginalHaarGraphTransfer

/-! LOC6C: assemble the literal original physical individual closed
graph iff weak Hilbert tests using qualified LOC5 and LOC6B.
No native adjoint or self-adjointness assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6C
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC5 FCP.BFSSLOC6B FCP.BFSSICDB0

theorem individual_graph_subset_ambient {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) :
    originalIndividualClosedGraph M G a ⊆
      closure (Set.range (fun f : SmoothCore N =>
        (coreToL2 f, coreToL2 (M.charge a f)))) := by
  unfold originalIndividualClosedGraph
  apply closure_mono
  rintro p ⟨f, rfl⟩
  exact ⟨f.val, rfl⟩

theorem physical_graph_weak_pairing {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex) (u v : FullL2 N)
    (hp : (u, v) ∈ originalIndividualClosedGraph M G a) :
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v := by
  have ha : (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f)))) :=
    individual_graph_subset_ambient M G a hp
  have h := (closed_graph_iff_hilbert_pairing M a u v).mp ha
  intro f
  exact h f.val

theorem physical_weak_pairing_mem_graph (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (h : ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v) :
    (u, v) ∈ originalIndividualClosedGraph M G a :=
  ambient_to_physical_graph M G a u v hu hv
    (hilbert_pairing_mem_closed_graph (N := 2) M a u v
      (physical_weak_pair_ambient M G a u v hu hv h))

theorem physical_closed_graph_iff_weak (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v :=
  ⟨physical_graph_weak_pairing (N := 2) M G a u v,
    physical_weak_pairing_mem_graph M G a u v hu hv⟩

#print axioms individual_graph_subset_ambient
#print axioms physical_graph_weak_pairing
#print axioms physical_weak_pairing_mem_graph
#print axioms physical_closed_graph_iff_weak

end
end FCP.BFSSLOC6C
