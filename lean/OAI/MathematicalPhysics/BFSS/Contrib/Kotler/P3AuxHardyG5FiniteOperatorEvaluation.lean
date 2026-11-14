import Mathlib

/-! Isolated finite continuous-linear operator evaluation, independent of the BFSS model. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5FiniteOperatorEvaluation

theorem finiteOperatorAnticommutator_apply {ι E : Type*} [Fintype ι]
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (V T : ι → E →L[ℂ] E)
    (h : (∑ a : ι, (V a * T a + T a * V a)) = 0) (v : E) :
    (∑ a : ι, (V a (T a v) + T a (V a v))) = 0 := by
  have he := congrArg (fun L : E →L[ℂ] E => L v) h
  simpa only [sum_apply, IsAddApply.add_apply, mul_apply_eq_comp, zero_apply] using he

#print axioms FCP.BFSSP3AuxHardyG5FiniteOperatorEvaluation.finiteOperatorAnticommutator_apply

end FCP.BFSSP3AuxHardyG5FiniteOperatorEvaluation
