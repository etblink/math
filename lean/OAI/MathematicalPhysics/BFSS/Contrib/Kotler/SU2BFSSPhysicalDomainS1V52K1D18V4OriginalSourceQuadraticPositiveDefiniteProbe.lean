import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V52K1D18V3OriginalSourceRankOneQuadraticIsometryProbe

/-!
K1D18V4 — original all-one-weight 48-real source quadratic form
is a sum of squares and positive on every nonzero original vector.

This SOURCE-EXACT stage uses the pinned S1V0 weightedSumSquares
definition and Fin 24 × Fin 2 indexing without introducing a
substitute norm, Euclidean basis, or different Clifford representation.
It discharges positivity before attempting to normalize real vectors.

CANDIDATE pending exact independent warning-as-error Lean and axiom CI.
No normalized Clifford generator, Pin/Spin element, surjectivity,
topological covering, global Spin9 or BFSS spectrum is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSS1V52K1D18V4
noncomputable section
open FCP.BFSSS1V0

private abbrev Q : QuadraticForm ℝ Source48Vector := source48Quadratic

/-- Exactly the original unit-weight source quadratic value is the
sum of all 48 original coordinate squares. -/
theorem source48Quadratic_eq_sum_mul_self (a : Source48Vector) :
    Q a = ∑ j : Source48Label, a j * a j := by
  change (QuadraticMap.weightedSumSquares ℝ
    (fun _ : Source48Label => (1 : ℝ))) a =
      ∑ j : Source48Label, a j * a j
  simp only [QuadraticMap.weightedSumSquares_apply, one_smul]

/-- The true original real quadratic source is nonnegative on all
48-coordinate input vectors. -/
theorem source48Quadratic_nonneg (a : Source48Vector) :
    0 ≤ Q a := by
  rw [source48Quadratic_eq_sum_mul_self]
  exact Finset.sum_nonneg (fun j _ => mul_self_nonneg (a j))

/-- Every nonzero actual original 48-label source vector has strictly
positive value for that same source quadratic form. -/
theorem source48Quadratic_pos_of_ne_zero (a : Source48Vector)
    (ha : a ≠ 0) : 0 < Q a := by
  obtain ⟨j, hj⟩ : ∃ j : Source48Label, a j ≠ 0 := by
    by_contra h
    push_neg at h
    apply ha
    funext j
    exact h j
  rw [source48Quadratic_eq_sum_mul_self]
  exact Finset.sum_pos'
    (fun k _ => mul_self_nonneg (a k))
    ⟨j, Finset.mem_univ j, (mul_self_pos).2 hj⟩

/-- The original all-one source quadratic is positive definite,
not merely nondegenerate. This is the positivity prerequisite for a
future genuine source unit-vector construction. -/
theorem source48Quadratic_posDef :
    source48Quadratic.PosDef := by
  intro a ha
  exact source48Quadratic_pos_of_ne_zero a ha

#print axioms source48Quadratic_eq_sum_mul_self
#print axioms source48Quadratic_nonneg
#print axioms source48Quadratic_pos_of_ne_zero
#print axioms source48Quadratic_posDef

end
end FCP.BFSSS1V52K1D18V4
