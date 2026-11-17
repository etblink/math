import Mathlib.Tactic

/-!
# BFSS M4 QTC0C — abstract coefficient contraction for ordered words

No Fock, Clifford, topology, source operator, or real-source normalization.
The w i j are arbitrary module elements and never internally permuted.
Independent mathematical donor for a future source-exact adapter.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0CAbstractCoefficientContraction
noncomputable section

/-- Purely additive left coefficient reindexing. The ordered word w p j
is an opaque module value, not a commuting operator product. -/
theorem coefficient_left
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (a p i * b i j) • w p j) =
    (∑ p : ι, ∑ j : ι, (a * b) p j • w p j) := by
  classical
  calc
    _ = ∑ i : ι, ∑ p : ι, ∑ j : ι,
        (a p i * b i j) • w p j := by
      apply Finset.sum_congr rfl
      intro i hi
      exact Finset.sum_comm
    _ = ∑ p : ι, ∑ i : ι, ∑ j : ι,
        (a p i * b i j) • w p j := Finset.sum_comm
    _ = ∑ p : ι, ∑ j : ι, ∑ i : ι,
        (a p i * b i j) • w p j := by
      apply Finset.sum_congr rfl
      intro p hp
      exact Finset.sum_comm
    _ = ∑ p : ι, ∑ j : ι, (a * b) p j • w p j := by
      apply Finset.sum_congr rfl
      intro p hp
      apply Finset.sum_congr rfl
      intro j hj
      simp only [Matrix.mul_apply, Finset.sum_smul]

/-- Purely additive right coefficient reindexing. The right coefficient
is b * a.transpose, not a skew-specialized replacement. -/
theorem coefficient_right
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (b i j * a p j) • w i p) =
    (∑ i : ι, ∑ p : ι, (b * a.transpose) i p • w i p) := by
  classical
  calc
    _ = ∑ i : ι, ∑ p : ι, ∑ j : ι,
        (b i j * a p j) • w i p := by
      apply Finset.sum_congr rfl
      intro i hi
      exact Finset.sum_comm
    _ = ∑ i : ι, ∑ p : ι, (b * a.transpose) i p • w i p := by
      apply Finset.sum_congr rfl
      intro i hi
      apply Finset.sum_congr rfl
      intro p hp
      simp only [Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_smul]

/-- Infinitesimal rank-two tensor covariance, generic in the target
complex module and without skew hypotheses. -/
theorem coefficient_both
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (a p i * b i j) • w p j) +
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (b i j * a p j) • w i p) =
    ∑ i : ι, ∑ j : ι,
      (a * b + b * a.transpose) i j • w i j := by
  rw [coefficient_left w a b, coefficient_right w a b]
  simp only [Matrix.add_apply, add_smul, Finset.sum_add_distrib]

#print axioms coefficient_left
#print axioms coefficient_right
#print axioms coefficient_both

end
end FCP.BFSSP3M4QTC0CAbstractCoefficientContraction
