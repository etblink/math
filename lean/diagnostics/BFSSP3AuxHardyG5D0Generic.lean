import Mathlib

/-! Diagnostic calibration only; no strict BFSS qualification. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

theorem finiteComplexZeroSum {ι E : Type*} [Fintype ι]
    [NormedAddCommGroup E] [NormedSpace ℂ E] (T : ι → E →L[ℂ] E) :
    (∑ p : ι, (0 : ℂ) • T p) = (0 : E →L[ℂ] E) := by
  apply Finset.sum_eq_zero
  intro p _
  exact zero_smul ℂ (T p)

#print axioms FCP.BFSSP3AuxHardyG5D0.finiteComplexZeroSum

end
end FCP.BFSSP3AuxHardyG5D0
