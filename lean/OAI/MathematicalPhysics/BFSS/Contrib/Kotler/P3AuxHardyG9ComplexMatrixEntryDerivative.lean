import Mathlib

/-! Variable real-matrix CLM entry differentiation, before native BFSS data. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative
noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]

noncomputable def complexMatrixEntryCLM (L : E →L[ℝ] (ι → κ → ℝ))
    (a : ι) (b : κ) : E →L[ℝ] ℂ :=
  Complex.ofRealCLM.comp
    ((ContinuousLinearMap.proj b).comp ((ContinuousLinearMap.proj a).comp L))

theorem complexMatrixEntryCLM_apply (L : E →L[ℝ] (ι → κ → ℝ))
    (a : ι) (b : κ) (x : E) :
    complexMatrixEntryCLM L a b x = (L x a b : ℂ) := rfl

theorem complexMatrixEntry_fderiv_apply (L : E →L[ℝ] (ι → κ → ℝ))
    (a : ι) (b : κ) (x h : E) :
    fderiv ℝ (fun y : E => (L y a b : ℂ)) x h = (L h a b : ℂ) := by
  have hfun : (fun y : E => (L y a b : ℂ)) = ⇑(complexMatrixEntryCLM L a b) := by
    funext y
    rfl
  rw [hfun, ContinuousLinearMap.fderiv]

#print axioms FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative.complexMatrixEntryCLM
#print axioms FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative.complexMatrixEntryCLM_apply
#print axioms FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative.complexMatrixEntry_fderiv_apply

end
end FCP.BFSSP3AuxHardyG9ComplexMatrixEntryDerivative
