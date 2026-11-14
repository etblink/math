import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-! Diagnostic only. Actual all-vector covariance is not established here. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD1
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem explicit_axis_lift
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2) (a : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear (sourceBlockColorAxis (j, s) a) =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) := by
  apply ContinuousLinearMap.ext
  intro ψ
  trace_state
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe'']
  trace_state
  exact FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward
    q j s a ψ

#print axioms explicit_axis_lift

end
end FCP.BFSSTDC1AD1
