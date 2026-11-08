import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2aOriginalFockGaugeSource

/-! Independent source-exact original Fermion 2 unitary representation consumer. -/
set_option autoImplicit false
namespace FCP.BFSSOriginalFockGaugeOP2AIndependentAudit
noncomputable section
open OAI.BFSSQuantum

example : GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2) :=
  FCP.BFSSOriginalFockGaugeOP2A.originalFockGaugeUnitaryHom

example (g : GaugeGroup 2) (v : Fermion 2) :
    FCP.BFSSOriginalFockGaugeOP2A.originalFockGaugeUnitaryHom g v =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom g v := rfl

#print axioms FCP.BFSSOriginalFockGaugeOP2A.originalFockGaugeUnitaryHom_exact
end
end FCP.BFSSOriginalFockGaugeOP2AIndependentAudit
