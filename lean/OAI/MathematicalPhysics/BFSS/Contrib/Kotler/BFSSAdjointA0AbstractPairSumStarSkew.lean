import Mathlib.Algebra.Star.BigOperators

/-!
FCP BFSS ADJ-A0 — coefficient-independent finite pair-sum star lemma.

This is a genuinely new, generic mathematical interface. It does NOT import,
modify, or retry the frozen D1S4 original-source proofs. In particular the
source real matrix K and original Fock operator theta are absent.

The qualified goal is only that a pairwise star-skew family has a skew-adjoint
double sum. A later distinct adapter must bind original matrix coefficients
and original Fock operators to this theorem.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA0

/-- Abstract finite double-sum skew-adjointness. The adjoint interchanges
the two indices and contributes a minus sign for each summand. -/
theorem finitePairSum_star_skew
    {ι A : Type*} [Fintype ι]
    [AddCommGroup A] [StarAddMonoid A]
    (U : ι → ι → A)
    (hpair : ∀ r s : ι, star (U r s) = -(U s r)) :
    star (∑ r : ι, ∑ s : ι, U r s) =
      -(∑ r : ι, ∑ s : ι, U r s) := by
  classical
  calc
    star (∑ r : ι, ∑ s : ι, U r s) =
        ∑ r : ι, star (∑ s : ι, U r s) :=
      star_sum Finset.univ (fun r : ι => ∑ s : ι, U r s)
    _ = ∑ r : ι, ∑ s : ι, star (U r s) := by
      apply Finset.sum_congr rfl
      intro r _
      exact star_sum Finset.univ (fun s : ι => U r s)
    _ = ∑ r : ι, ∑ s : ι, -(U s r) := by
      apply Finset.sum_congr rfl
      intro r _
      apply Finset.sum_congr rfl
      intro s _
      exact hpair r s
    _ = -(∑ r : ι, ∑ s : ι, U s r) := by
      simp only [Finset.sum_neg_distrib]
    _ = -(∑ r : ι, ∑ s : ι, U r s) := by
      rw [Finset.sum_comm]

#print axioms finitePairSum_star_skew

end FCP.BFSSAdjointA0
