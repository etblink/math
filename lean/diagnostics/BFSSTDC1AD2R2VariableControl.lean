import OAI.MathematicalPhysics.BFSS.Core
import diagnostics.BFSSTDC1AD2R2ExpressionInspector

/-! Known-success original Fock carrier control. No native physical operator. -/
set_option autoImplicit false
set_option linter.unusedTactic false

namespace FCP.BFSSTDC1AD2R2
noncomputable section
open OAI.BFSSQuantum

theorem variable_control (U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
    (A B : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ ψ : Fermion 2, U (A ψ) = B (U ψ)) :
    (U : Fermion 2 →L[ℂ] Fermion 2) * A =
      B * (U : Fermion 2 →L[ℂ] Fermion 2) := by
  apply ContinuousLinearMap.ext
  intro ψ
  simp only [ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply,
    LinearIsometryEquiv.coe_coe'']
  have hw : U (A ψ) = B (U ψ) := h ψ
  td_c1a_d2r2_compare hw
  exact hw

#print axioms variable_control
end
end FCP.BFSSTDC1AD2R2
