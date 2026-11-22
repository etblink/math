import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3AOriginalMasslessMultiplierGaugeIntertwining

/-!
GM3A independent imported exact original-SU(2) massless Fock
partial-operator intertwining consumer; full original FullL2 carrier.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3AIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem pairedSourceMasslessMultiplierGaugeIntertwines
    (g : GaugeGroup 2)
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
        ⟨FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
           (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ.val),
         FCP.BFSSGM2A.pairedOriginalMasslessDomain_gauge_mem g ψ.property⟩ =
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹
        (FCP.BFSSMasslessD0c0.originalMasslessMultiplier
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ)) :=
  FCP.BFSSGM3A.pairedOriginalMasslessMultiplier_gauge_intertwines g ψ

#print axioms pairedSourceMasslessMultiplierGaugeIntertwines

end FCP.BFSSGM3AIndependent
