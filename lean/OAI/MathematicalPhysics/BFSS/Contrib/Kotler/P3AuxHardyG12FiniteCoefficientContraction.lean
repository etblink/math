import Mathlib

/-! Isolated finite coefficient contraction with ordered continuous-linear products. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction

theorem finiteOperatorCoefficientContraction {ι π ρ E : Type*}
    [Fintype ι] [Fintype π] [Fintype ρ]
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (c : ι → π → ρ → ℂ) (T : π → E →L[ℂ] E) (U : ρ → E →L[ℂ] E) :
    (∑ i : ι, ∑ p : π, ∑ q : ρ, c i p q • (T p * U q)) =
      ∑ p : π, ∑ q : ρ, (∑ i : ι, c i p q) • (T p * U q) := by
  classical
  calc
    (∑ i : ι, ∑ p : π, ∑ q : ρ, c i p q • (T p * U q)) =
        ∑ p : π, ∑ i : ι, ∑ q : ρ, c i p q • (T p * U q) := Finset.sum_comm
    _ = ∑ p : π, ∑ q : ρ, ∑ i : ι, c i p q • (T p * U q) := by
      apply Finset.sum_congr rfl
      intro p _
      exact Finset.sum_comm
    _ = ∑ p : π, ∑ q : ρ, (∑ i : ι, c i p q) • (T p * U q) := by
      simp only [Finset.sum_smul]

#print axioms FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction.finiteOperatorCoefficientContraction

end FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction
