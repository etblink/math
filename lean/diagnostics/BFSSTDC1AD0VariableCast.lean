import OAI.MathematicalPhysics.BFSS.Core

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum

theorem variable_cast
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2) (ψ : Fermion 2) :
    (U : Fermion 2 →L[ℂ] Fermion 2) ψ = U ψ := by
  exact congrFun (LinearIsometryEquiv.coe_coe'' U) ψ

#print axioms variable_cast

end
end FCP.BFSSTDC1AD0
