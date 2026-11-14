import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import diagnostics.BFSSTDC1AD2R2ExpressionInspector

/-! Known-success original-axis literal source consumer with typed witness. -/
set_option autoImplicit false
set_option linter.unusedTactic false
namespace FCP.BFSSTDC1AD2R2
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem direct_axis_control (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (a : ColorIndex 2) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear (sourceBlockColorAxis (j, s) a)) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  have hw :
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear (sourceBlockColorAxis (j, s) a)) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) :=
    FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward
      q j s a ψ
  td_c1a_d2r2_compare hw
  exact hw

#print axioms direct_axis_control
end
end FCP.BFSSTDC1AD2R2
