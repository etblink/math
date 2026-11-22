import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM2AOriginalMasslessMaximalDomainGaugePreservation

/-! GM2A imported independent consumer of the ORIGINAL paired SU(2)
FullL2 massless Fock maximal-domain membership under original gauge U(g).
No surrogate fermion or domain, and no original source recompilation bypass.
-/
set_option autoImplicit false

namespace FCP.BFSSGM2AIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem pairedSourceMaximalMasslessDomainGaugeMem
    (g : GaugeGroup 2) {ψ : FullL2 2}
    (hψ : ψ ∈ FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ) ∈
    FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :=
  FCP.BFSSGM2A.pairedOriginalMasslessDomain_gauge_mem g hψ

#print axioms pairedSourceMaximalMasslessDomainGaugeMem

end FCP.BFSSGM2AIndependent
