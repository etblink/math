import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-! Diagnostic only. Actual all-vector covariance is not established here. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD1
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Evaluation assumes h; it does not prove all-vector operator covariance. -/
theorem explicit_conditional_evaluation
    (q : GaugeGroup 2) (v : Source48Vector)
    (h : (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear v =
      sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  have heval := congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ) h
  trace_state
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe''] at heval
  trace_state
  exact heval

#print axioms explicit_conditional_evaluation

end
end FCP.BFSSTDC1AD1
