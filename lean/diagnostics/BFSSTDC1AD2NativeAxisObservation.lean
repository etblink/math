import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import diagnostics.BFSSTDC1AD2ExpressionInspector

/-! D2 observational leaf, deliberately stopped before any native proof retry. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD2
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem native_axis_observation
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2) (a : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear (sourceBlockColorAxis (j, s) a) =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) := by
  apply ContinuousLinearMap.ext
  intro ψ
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe'']
  have hsource :=
    FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward q j s a ψ
  td_c1a_d2_compare hsource
  td_c1a_d2_stop

end
end FCP.BFSSTDC1AD2
