import Mathlib.Tactic

/-!
# SM-D1-SCC3B0: exact rational finite categorical distributions

A finite categorical distribution has nonnegative rational outcome weights
with total mass one. Total variation is half the finite L1 difference.
These are mathematics, NOT observed frequencies, a likelihood, or actual
Standard Model/BFSS predictions. The outcome type is Fin n and n may be
zero syntactically, but no normalized distribution exists when n = 0.

No original NFC/SCC theorem or physical map is imported.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC3B0

/-- An exactly normalized finite rational categorical predictive law. -/
structure Categorical (n : ℕ) where
  weight : Fin n → ℚ
  nonneg : ∀ i, 0 ≤ weight i
  normalized : (∑ i : Fin n, weight i) = 1

/-- Conventional total variation, not the unhalved L1 norm. -/
def totalVariation {n : ℕ} (p q : Categorical n) : ℚ :=
  (∑ i : Fin n, |p.weight i - q.weight i|) / 2

theorem totalVariation_nonneg {n : ℕ} (p q : Categorical n) :
    0 ≤ totalVariation p q := by
  unfold totalVariation
  apply div_nonneg
  · apply Finset.sum_nonneg
    intro i _
    exact abs_nonneg _
  · norm_num

theorem totalVariation_self {n : ℕ} (p : Categorical n) :
    totalVariation p p = 0 := by
  simp [totalVariation]

theorem totalVariation_symm {n : ℕ} (p q : Categorical n) :
    totalVariation p q = totalVariation q p := by
  unfold totalVariation
  congr 1
  apply Finset.sum_congr rfl
  intro i _
  exact abs_sub_comm (p.weight i) (q.weight i)

/-- A zero exact distance detects equality of every named outcome weight. -/
theorem totalVariation_eq_zero_iff {n : ℕ} (p q : Categorical n) :
    totalVariation p q = 0 ↔ p.weight = q.weight := by
  constructor
  · intro h
    have hsum : (∑ i : Fin n, |p.weight i - q.weight i|) = 0 := by
      unfold totalVariation at h
      linarith
    have hnonneg :
        ∀ i ∈ (Finset.univ : Finset (Fin n)),
          (0 : ℚ) ≤ |p.weight i - q.weight i| := by
      intro i _
      exact abs_nonneg _
    have hparts :
        ∀ i ∈ (Finset.univ : Finset (Fin n)),
          |p.weight i - q.weight i| = 0 :=
      (Finset.sum_eq_zero_iff_of_nonneg hnonneg).mp hsum
    funext i
    have hz := hparts i (Finset.mem_univ i)
    exact sub_eq_zero.mp (abs_eq_zero.mp hz)
  · intro heq
    have hpoint : ∀ i, p.weight i = q.weight i :=
      fun i => congrFun heq i
    simp [totalVariation, hpoint]

theorem totalVariation_pos_iff {n : ℕ} (p q : Categorical n) :
    0 < totalVariation p q ↔ p.weight ≠ q.weight := by
  constructor
  · intro hneq heq
    exact (ne_of_gt hneq) ((totalVariation_eq_zero_iff p q).2 heq)
  · intro hneq
    have hnotzero : totalVariation p q ≠ 0 := by
      intro hzero
      exact hneq ((totalVariation_eq_zero_iff p q).1 hzero)
    rcases lt_or_eq_of_le (totalVariation_nonneg p q) with hpos | hzero
    · exact hpos
    · exact False.elim (hnotzero hzero.symm)

/-- A single valid differing marginal outcome is a positive exact witness.
It does not imply experimentally detectable finite-sample separation. -/
theorem totalVariation_pos_of_witness {n : ℕ} (p q : Categorical n)
    (i : Fin n) (hne : p.weight i ≠ q.weight i) :
    0 < totalVariation p q := by
  apply (totalVariation_pos_iff p q).2
  intro heq
  exact hne (congrFun heq i)

/-- Probability normalization gives the conventional [0,1] distance bound. -/
theorem totalVariation_le_one {n : ℕ} (p q : Categorical n) :
    totalVariation p q ≤ 1 := by
  have hbound (i : Fin n) :
      |p.weight i - q.weight i| ≤ p.weight i + q.weight i := by
    apply abs_le.mpr
    constructor <;> linarith [p.nonneg i, q.nonneg i]
  have hsum :
      (∑ i : Fin n, |p.weight i - q.weight i|) ≤ 2 := by
    calc
      (∑ i : Fin n, |p.weight i - q.weight i|)
          ≤ ∑ i : Fin n, (p.weight i + q.weight i) := by
              apply Finset.sum_le_sum
              intro i _
              exact hbound i
      _ = 2 := by
        rw [Finset.sum_add_distrib, p.normalized, q.normalized]
        norm_num
  unfold totalVariation
  linarith

#print axioms totalVariation_nonneg
#print axioms totalVariation_self
#print axioms totalVariation_symm
#print axioms totalVariation_eq_zero_iff
#print axioms totalVariation_pos_iff
#print axioms totalVariation_pos_of_witness
#print axioms totalVariation_le_one

end FCP.StandardModel.SMD1SCC3B0
