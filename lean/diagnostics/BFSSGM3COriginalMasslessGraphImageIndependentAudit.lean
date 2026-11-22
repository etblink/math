import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3COriginalMasslessGraphTwoSidedGaugeInvariance

/-!
GM3C independent exact original graph Set.image equality consumer.
No new gauge representation, operator, carrier or premise.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3CIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem pairedSourceMasslessGraphExactGaugeImageEq
    (g : GaugeGroup 2) :
    Set.image (FCP.BFSSGM3C.pairedOriginalDiagonalGauge g)
      (FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
        Set (FullL2 2 × FullL2 2)) =
      (FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
        Set (FullL2 2 × FullL2 2)) :=
  FCP.BFSSGM3C.pairedOriginalMasslessGraph_gauge_image_eq g

#print axioms pairedSourceMasslessGraphExactGaugeImageEq

end FCP.BFSSGM3CIndependent
