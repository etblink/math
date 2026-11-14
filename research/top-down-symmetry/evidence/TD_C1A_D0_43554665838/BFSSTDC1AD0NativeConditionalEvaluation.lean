import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AD0NativeCarrierEvaluationInterface

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Conditional evaluation only: h is an assumption, not a covariance result. -/
theorem native_conditional_evaluation (q : GaugeGroup 2) (v : Source48Vector)
    (h : (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear v =
      sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  trace_state
  exact FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface.native_pointwise_of_operator
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q)
    (sourceGammaRealLinear v)
    (sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v)) h ψ

#print axioms native_conditional_evaluation

end
end FCP.BFSSTDC1AD0
