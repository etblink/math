import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Operator.LinearIsometry

/-!
# TD-C1A R4: generic evaluation boundaries before Fock specialization

Convert pointwise and continuous-operator intertwiners over a variable
normed complex module. No original BFSS Fock definitions are imported.
-/
set_option autoImplicit false

namespace FCP.BFSSTDC1AR4FockOperatorEvaluationInterface

variable {𝕜 E : Type*} [NormedField 𝕜]
  [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-- Lift a pointwise intertwiner before substituting the native Fock carrier. -/
theorem operator_of_pointwise
    (U : E ≃ₗᵢ[𝕜] E) (A B : E →L[𝕜] E)
    (h : ∀ ψ : E, U (A ψ) = B (U ψ)) :
    U.toContinuousLinearMap * A = B * U.toContinuousLinearMap := by
  apply ContinuousLinearMap.ext
  intro ψ
  exact h ψ

/-- Evaluate a sourced operator identity through the same generic boundary. -/
theorem pointwise_of_operator
    (U : E ≃ₗᵢ[𝕜] E) (A B : E →L[𝕜] E)
    (h : U.toContinuousLinearMap * A = B * U.toContinuousLinearMap)
    (ψ : E) :
    U (A ψ) = B (U ψ) := by
  exact congrArg (fun T : E →L[𝕜] E => T ψ) h

#print axioms operator_of_pointwise
#print axioms pointwise_of_operator

end FCP.BFSSTDC1AR4FockOperatorEvaluationInterface
