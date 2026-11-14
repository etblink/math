import OAI.MathematicalPhysics.BFSS.Core

/-! Diagnostic only. Actual all-vector covariance is not established here. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD1
noncomputable section
open OAI.BFSSQuantum

theorem variable_explicit_lift
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ ψ : Fermion 2, U (A ψ) = B (U ψ)) :
    (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2) := by
  apply ContinuousLinearMap.ext
  intro ψ
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe'']
  exact h ψ

theorem variable_explicit_evaluation
    (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2))
    (ψ : Fermion 2) : U (A ψ) = B (U ψ) := by
  have heval := congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ) h
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe''] at heval
  exact heval

#print axioms variable_explicit_lift
#print axioms variable_explicit_evaluation

end
end FCP.BFSSTDC1AD1
