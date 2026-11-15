import Mathlib

/-! Mathlib-only real-coefficient finite-sum diagnostic. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic
noncomputable section

theorem realCoefficient_sum_smul {I V : Type*} [Fintype I]
    [AddCommMonoid V] [Module ℂ V] (a : I → ℝ) (v : V) :
    (∑ t : I, (a t : ℂ) • v) = ((∑ t : I, a t : ℝ) : ℂ) • v := by
  calc
    _ = (∑ t : I, (a t : ℂ)) • v := by rw [Finset.sum_smul]
    _ = _ := by rw [Complex.ofReal_sum]

theorem realCoefficient_doubleSum {I J V : Type*} [Fintype I] [Fintype J]
    [AddCommMonoid V] [Module ℂ V] (a : I → J → ℝ) (T : J → V) :
    (∑ t : I, ∑ p : J, (a t p : ℂ) • T p) =
      ∑ p : J, ((∑ t : I, a t p : ℝ) : ℂ) • T p := by
  calc
    _ = ∑ p : J, ∑ t : I, (a t p : ℂ) • T p := Finset.sum_comm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro p _
      exact realCoefficient_sum_smul (fun t => a t p) (T p)

#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic.realCoefficient_sum_smul
#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic.realCoefficient_doubleSum

end
end FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic
