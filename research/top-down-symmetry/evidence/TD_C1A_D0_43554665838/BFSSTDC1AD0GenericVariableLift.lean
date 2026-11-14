import OAI.MathematicalPhysics.BFSS.Core
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4FockOperatorEvaluationInterface

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum

theorem generic_variable_lift
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ ψ : Fermion 2, U (A ψ) = B (U ψ)) :
    (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2) := by
  exact FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.operator_of_pointwise U A B h

#print axioms generic_variable_lift

end
end FCP.BFSSTDC1AD0
