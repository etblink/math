import OAI.MathematicalPhysics.BFSS.Core

/-! Fixed original carrier; all operator data remain arbitrary. Diagnostic only. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface
noncomputable section
open OAI.BFSSQuantum

theorem native_operator_of_pointwise
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ ψ : Fermion 2, U (A ψ) = B (U ψ)) :
    (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2) := by
  apply ContinuousLinearMap.ext
  intro ψ
  exact h ψ

theorem native_pointwise_of_operator
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) : U (A ψ) = B (U ψ) := by
  exact congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ) h

#print axioms native_operator_of_pointwise
#print axioms native_pointwise_of_operator

end
end FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface
