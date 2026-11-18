import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0MOriginalFockComplexNestedCoefficientR2

/-!
# BFSS W0C2B1 R2 — original Fock Jacobi and conditional coefficient covariance

Original Fermion 2 bounded ℂ-linear Fock operators only. The finite-sum
commutator proof follows the accepted private QTC0A donor; the scalar
commutator follows its public qualified theorem. Jacobi is noncommutative.
The final coefficient closure assumes, but does not invent, both covariance
laws. No Source48 gamma centrality or original K(A) Lie-bracket claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceActionR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
open FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientR2

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Exact finite-sum commutator linearity on the original noncommutative
Fock operator algebra. The analogous QTC0A donor was private. -/
theorem originalFock_commutator_sum
    {ι : Type*} [Fintype ι] (T : Op) (f : ι → Op) :
    T * (∑ i : ι, f i) - (∑ i : ι, f i) * T =
      ∑ i : ι, (T * f i - f i * T) := by
  classical
  rw [Finset.mul_sum, Finset.sum_mul, Finset.sum_sub_distrib]

/-- Arbitrary complex coefficients commute with the original Fock
commutator action. No real scalar tower or modified source operator. -/
theorem originalFock_commutator_weighted_sum
    {ι : Type*} [Fintype ι] (T : Op)
    (c : ι → ℂ) (x : ι → Op) :
    T * (∑ i : ι, c i • x i) -
      (∑ i : ι, c i • x i) * T =
    ∑ i : ι, c i • (T * x i - x i * T) := by
  classical
  rw [originalFock_commutator_sum T (fun i : ι => c i • x i)]
  apply Finset.sum_congr rfl
  intro i hi
  exact originalFock_commutator_complex_smul T (x i) (c i)

/-- Jacobi expressed as the true commutator action on original bounded
Fock operators. This uses noncommutative ring algebra, never T*U=U*T. -/
theorem originalFock_commutator_jacobi (T U X : Op) :
    (T * U - U * T) * X - X * (T * U - U * T) =
    (T * (U * X - X * U) - (U * X - X * U) * T) -
    (U * (T * X - X * T) - (T * X - X * T) * U) := by
  simp only [sub_mul, mul_sub, mul_assoc]
  abel

/-- Conditional matrix-bracket covariance on the genuine original Fock
operator algebra. Both generator covariance laws are explicit hypotheses.
The coefficient ordering A*B-B*A matches column action composition
qualified by W0C2B0M; this is NOT the original K(A) Lie bracket. -/
theorem originalFock_commutator_covariance_bracket
    {ι : Type*} [Fintype ι] (T U : Op)
    (x : ι → Op) (A B : Matrix ι ι ℂ)
    (hT : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, A p k • x p)
    (hU : ∀ k : ι, U * x k - x k * U =
      ∑ p : ι, B p k • x p)
    (k : ι) :
    (T * U - U * T) * x k - x k * (T * U - U * T) =
      ∑ q : ι, (A * B - B * A) q k • x q := by
  classical
  calc
    _ = (T * (U * x k - x k * U) -
          (U * x k - x k * U) * T) -
        (U * (T * x k - x k * T) -
          (T * x k - x k * T) * U) :=
      originalFock_commutator_jacobi T U (x k)
    _ = (T * (∑ p : ι, B p k • x p) -
          (∑ p : ι, B p k • x p) * T) -
        (U * (∑ p : ι, A p k • x p) -
          (∑ p : ι, A p k • x p) * U) := by
      rw [hU k, hT k]
    _ = (∑ p : ι, B p k • (T * x p - x p * T)) -
        (∑ p : ι, A p k • (U * x p - x p * U)) := by
      rw [originalFock_commutator_weighted_sum T (fun p => B p k) x,
          originalFock_commutator_weighted_sum U (fun p => A p k) x]
    _ = (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) -
        (∑ p : ι, A p k • (∑ q : ι, B q p • x q)) := by
      have hLeft :
          (∑ p : ι, B p k • (T * x p - x p * T)) =
          (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) := by
        apply Finset.sum_congr rfl
        intro p hp
        rw [hT p]
      have hRight :
          (∑ p : ι, A p k • (U * x p - x p * U)) =
          (∑ p : ι, A p k • (∑ q : ι, B q p • x q)) := by
        apply Finset.sum_congr rfl
        intro p hp
        rw [hU p]
      rw [hLeft, hRight]
    _ = ∑ q : ι, (A * B - B * A) q k • x q :=
      originalFock_complex_nested_coefficient_bracket x A B k

#print axioms originalFock_commutator_sum
#print axioms originalFock_commutator_weighted_sum
#print axioms originalFock_commutator_jacobi
#print axioms originalFock_commutator_covariance_bracket

end
end FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceActionR2
