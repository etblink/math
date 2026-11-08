import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2bOriginalGaugeProjectionBridge

/-! OP2b independently consumes the literal original-source operator bridge. -/
set_option autoImplicit false

namespace FCP.BFSSOriginalGaugeProjectionOP2BIndependentAudit
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSOriginalGaugeProjectionOP2B

example : GaugeGroup 2 →* Module.End ℂ (Fermion 2) :=
  originalGaugeLinearAction

example (g : GaugeGroup 2) (v : Fermion 2) :
    originalGaugeContinuousAction g v = originalGaugeLinearAction g v :=
  originalGaugeOperators_exact g v

example (g : GaugeGroup 2) (v : Fermion 2) :
    originalGaugeLinearAction g v =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom g v :=
  originalGaugeLinearAction_source g v

example : Fermion 2 →L[ℂ] Fermion 2 :=
  originalFermionGaugeProjection

example (g : GaugeGroup 2) (v : Fermion 2) :
    FCP.BFSSOriginalFockGaugeOP2A.originalFockGaugeUnitaryHom g
      (originalFermionGaugeProjection v) = originalFermionGaugeProjection v :=
  originalFermionGaugeProjection_fixed g v

example : IsStarProjection originalFermionGaugeProjection :=
  originalFermionGaugeProjection_star

#print axioms FCP.BFSSOriginalGaugeProjectionOP2B.originalGaugeOperators_exact
#print axioms FCP.BFSSOriginalGaugeProjectionOP2B.originalFermionGaugeProjection_star

end
end FCP.BFSSOriginalGaugeProjectionOP2BIndependentAudit
