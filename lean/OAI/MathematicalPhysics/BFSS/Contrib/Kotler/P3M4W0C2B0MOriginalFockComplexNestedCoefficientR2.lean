import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0AOriginalFockWeightedQuadraticCovariance

/-!
# W0C2B0M R2 — original Fock complex nested coefficient action

New architecture after two stopped native real-coefficient REDs. The exact
source operator carrier is original Fermion 2 complex-linear bounded operators.
No real-to-complex cast, Source48Label specialization, CAR, or original K(A)
Lie-bracket claim. No operator products are permuted. QTC0C/QTC0D are
qualified related donors, not substitutes for these single-index identities.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Two successive left-column coefficient actions on the genuine original
complex Fock operator space compose in the order A * B. -/
theorem originalFock_complex_nested_coefficient_compose
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) =
    ∑ q : ι, (A * B) q k • x q := by
  classical
  calc
    _ = ∑ p : ι, ∑ q : ι, (B p k * A q p) • x q := by
      apply Finset.sum_congr rfl
      intro p hp
      rw [Finset.smul_sum]
      apply Finset.sum_congr rfl
      intro q hq
      rw [smul_smul]
    _ = ∑ q : ι, ∑ p : ι, (A q p * B p k) • x q := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro q hq
      apply Finset.sum_congr rfl
      intro p hp
      rw [mul_comm (B p k) (A q p)]
    _ = ∑ q : ι, (A * B) q k • x q := by
      apply Finset.sum_congr rfl
      intro q hq
      rw [Matrix.mul_apply]
      exact (Finset.sum_smul).symm

/-- The original complex Fock carrier realizes the matrix commutator on
nested coefficient actions. This is NOT a K(A) or Majorana commutator. -/
theorem originalFock_complex_nested_coefficient_bracket
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) -
    (∑ p : ι, A p k • (∑ q : ι, B q p • x q)) =
    ∑ q : ι, (A * B - B * A) q k • x q := by
  rw [originalFock_complex_nested_coefficient_compose x A B k,
      originalFock_complex_nested_coefficient_compose x B A k]
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro q hq
  rw [Matrix.sub_apply]
  exact (sub_smul _ _ _).symm

#print axioms originalFock_complex_nested_coefficient_compose
#print axioms originalFock_complex_nested_coefficient_bracket

end
end FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientR2
