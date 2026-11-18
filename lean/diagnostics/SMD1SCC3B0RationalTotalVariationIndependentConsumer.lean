import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC3B0FiniteRationalTotalVariation

/-!
# Independent SCC3B0 rational probability consumer

Concrete synthetic two-outcome normalized probability distributions
with exact rational masses 1/0 and 1/2,1/2. No experimental data,
statistical likelihood, BFSS physics or original NFC SCC theorem.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC3B0Consumer

open FCP.StandardModel.SMD1SCC3B0

def pointMassZero : Categorical 2 where
  weight := fun i => if i = 0 then 1 else 0
  nonneg := by
    intro i
    fin_cases i <;> decide
  normalized := by
    norm_num [Fin.sum_univ_succ]

def pointMassOne : Categorical 2 where
  weight := fun i => if i = 1 then 1 else 0
  nonneg := by
    intro i
    fin_cases i <;> decide
  normalized := by
    norm_num [Fin.sum_univ_succ]

def uniformTwo : Categorical 2 where
  weight := fun _ => (1 / 2 : ℚ)
  nonneg := by
    intro i
    norm_num
  normalized := by
    norm_num [Fin.sum_univ_succ]

theorem positive_distinct_masses_consumer :
    0 < totalVariation pointMassZero pointMassOne := by
  apply totalVariation_pos_of_witness pointMassZero pointMassOne 0
  decide

theorem symmetry_consumer :
    totalVariation pointMassZero uniformTwo =
      totalVariation uniformTwo pointMassZero := by
  exact totalVariation_symm _ _

theorem self_zero_consumer :
    totalVariation uniformTwo uniformTwo = 0 := by
  exact totalVariation_self _

theorem zero_characterizes_equal_weights_consumer
    {n : ℕ} (p q : Categorical n) :
    totalVariation p q = 0 ↔ p.weight = q.weight := by
  exact totalVariation_eq_zero_iff p q

theorem every_normalized_pair_bounded_consumer
    {n : ℕ} (p q : Categorical n) :
    0 ≤ totalVariation p q ∧ totalVariation p q ≤ 1 := by
  exact ⟨totalVariation_nonneg p q, totalVariation_le_one p q⟩

/-- Unit separation between disjoint point masses (mathematical). -/
example : totalVariation pointMassZero pointMassOne = 1 := by
  norm_num [totalVariation, Fin.sum_univ_succ, pointMassZero, pointMassOne]

/-- Symmetric half separation from the balanced rational law. -/
example : totalVariation pointMassZero uniformTwo = 1 / 2 := by
  norm_num [totalVariation, Fin.sum_univ_succ, pointMassZero, uniformTwo]

#print axioms positive_distinct_masses_consumer
#print axioms symmetry_consumer
#print axioms self_zero_consumer
#print axioms zero_characterizes_equal_weights_consumer
#print axioms every_normalized_pair_bounded_consumer

end FCP.StandardModel.SMD1SCC3B0Consumer
