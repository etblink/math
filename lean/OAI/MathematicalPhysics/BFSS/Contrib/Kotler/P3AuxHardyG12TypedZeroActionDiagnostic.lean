import Mathlib

/-! G12 D0: isolated typed complex zero action; no original source imports. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic

theorem complexZeroOperatorProduct {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E] (T U : E →L[ℂ] E) :
    (0 : ℂ) • (T * U) = 0 :=
  _root_.zero_smul ℂ (T * U)

theorem complexSelectedColorSum {ι E : Type*} [Fintype ι] [DecidableEq ι]
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (b : ι) (c : ℂ) (T : ι → E →L[ℂ] E) :
    (∑ a : ι, (if b = a then c else 0) • T a) = c • T b := by
  classical
  rw [Finset.sum_eq_single b]
  · rw [ite_eq_left rfl]
  · intro a _ hab
    rw [ite_eq_right (Ne.symm hab)]
    exact _root_.zero_smul ℂ (T a)
  · intro hb
    exact False.elim (hb (Finset.mem_univ b))

#check zero_smul
#check _root_.zero_smul
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic.complexZeroOperatorProduct
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic.complexSelectedColorSum

end FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic
