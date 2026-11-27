import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2M0OriginalCompactFullGraph

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2M0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open FCP.BFSSMOLL2L0 FCP.BFSSMOLL2M0
open MeasureTheory Filter
open scoped Topology

theorem originalSU2FullWeakGraphConvergenceAudit (M : AlgebraData 2)
    (a : SpinIndex) (u v : Boson 2 → Fermion 2)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hu : LocallyIntegrable u volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    Tendsto (fun n =>
      (coreToL2 (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hsu),
       coreToL2 (M.charge a
        (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hsu))))
      atTop (𝓝 (h2u.toLp u, h2v.toLp v)) :=
  concrete_fullWeak_graph_tendsto M a u v hsmu hsmv h2u h2v hu hsu hsv R hR h

theorem originalSU2CompactClosedGraphAudit (M : AlgebraData 2)
    (a : SpinIndex) (u v : Boson 2 → Fermion 2)
    (hsmu : StronglyMeasurable u) (hsmv : StronglyMeasurable v)
    (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    (h2u.toLp u, h2v.toLp v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f)))) :=
  compact_fullWeak_mem_closed_graph M a u v hsmu hsmv h2u h2v hsu hsv R hR h

#print axioms originalSU2FullWeakGraphConvergenceAudit
#print axioms originalSU2CompactClosedGraphAudit
end
end FCP.BFSSMOLL2M0Independent
