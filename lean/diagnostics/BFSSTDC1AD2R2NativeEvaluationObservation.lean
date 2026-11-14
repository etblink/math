import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import diagnostics.BFSSTDC1AD2R2ExpressionInspector

/-! Conditional original-Fock evaluation: operator identity h is ASSUMED. -/
set_option autoImplicit false
set_option linter.unusedTactic false
namespace FCP.BFSSTDC1AD2R2
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem native_evaluation_observation
    (q : GaugeGroup 2) (v : Source48Vector)
    (h : (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear v =
      sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  have heval :
      (((FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
          sourceGammaRealLinear v) ψ) =
        ((sourceGammaRealLinear
          ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v) *
          (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2)) ψ) :=
    congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ) h
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe''] at heval
  td_c1a_d2r2_compare heval
  td_c1a_d2r2_stop

end
end FCP.BFSSTDC1AD2R2
