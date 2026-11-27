import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC4OriginalGlobalWeakGraph

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC4Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2L0 FCP.BFSSMOLA0 FCP.BFSSLOC4
open MeasureTheory

theorem originalSU2GlobalWeakGraphAudit (M : AlgebraData 2) (a : SpinIndex)
    (u v : Boson 2 → Fermion 2)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (h : ChargeWeakPair M a u v) :
    (h2u.toLp u, h2v.toLp v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f)))) :=
  fullWeak_mem_closed_graph M a u v hsmu hsmv h2u h2v h

#print axioms originalSU2GlobalWeakGraphAudit
end
end FCP.BFSSLOC4Independent
