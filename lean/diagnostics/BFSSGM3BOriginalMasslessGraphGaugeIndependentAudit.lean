import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3BOriginalMasslessGraphGaugeInvariant

/-!
Independent exact original paired BFSS Fock algebraic graph-gauge
invariance consumer. No domain proxies, no unproved analytic inputs.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3BIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem pairedSourceMasslessGraphGaugeMem
    (g : GaugeGroup 2) (z : FullL2 2 × FullL2 2)
    (hz : z ∈ FCP.BFSSMasslessD0c0.originalMasslessGraph
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.1),
     FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.2)) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :=
  FCP.BFSSGM3B.pairedOriginalMasslessGraph_gauge_mem g z hz

#print axioms pairedSourceMasslessGraphGaugeMem

end FCP.BFSSGM3BIndependent
