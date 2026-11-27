import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC5OriginalHilbertWeakGraph

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC5Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC5

theorem originalSU2HilbertWeakGraphAudit (M : AlgebraData 2) (a : SpinIndex)
    (u v : FullL2 2) :
    (u, v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f)))) ↔
    ∀ f : SmoothCore 2,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v :=
  closed_graph_iff_hilbert_pairing M a u v

#print axioms originalSU2HilbertWeakGraphAudit
end
end FCP.BFSSLOC5Independent
