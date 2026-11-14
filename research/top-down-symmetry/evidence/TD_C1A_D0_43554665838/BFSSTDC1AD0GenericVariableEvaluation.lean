import OAI.MathematicalPhysics.BFSS.Core
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4FockOperatorEvaluationInterface

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum

theorem generic_variable_evaluation
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) : U (A ψ) = B (U ψ) := by
  exact FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.pointwise_of_operator U A B h ψ

#print axioms generic_variable_evaluation

end
end FCP.BFSSTDC1AD0
