import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem actual_cast (q : GaugeGroup 2) (ψ : Fermion 2) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) ψ =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ := by
  exact congrFun (LinearIsometryEquiv.coe_coe'' (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q)) ψ

#print axioms actual_cast

end
end FCP.BFSSTDC1AD0
