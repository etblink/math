import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6COriginalPhysicalWeakEquivalence

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6CIndependent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC6C FCP.BFSSICDB0

theorem originalSU2PhysicalWeakGraphAudit (M : AlgebraData 2) (G : M.GaugeData)
    (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace) :
    (u, v) ∈ originalIndividualClosedGraph M G a ↔
    ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v :=
  physical_closed_graph_iff_weak M G a u v hu hv

#print axioms originalSU2PhysicalWeakGraphAudit
end
end FCP.BFSSLOC6CIndependent
