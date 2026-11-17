import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L2AbstractOriginalFockCovarianceLeibniz

/-!
# BFSS M4 QTC0A — weighted quadratic covariance on actual original Fock operators

Bounded first tensor-covariance proof atom. Proves the explicit weighted
double-sum commutator expansion under an ASSUMED finite-index generator
covariance law. The matrix coefficient reindexing to a*b+b*aᵀ,
real-to-complex source bridge, and native K(A) join are separate gates.

Actual Fermion 2 complex Fock operator multiplication stays
noncommutative. No Clifford CAR, arbitrary K(A), new axioms, fake scalar
tower, increased resource limits, or claimed physical result.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Scalar transport for an opaque ORIGINAL noncommutative Fock operator
commutator. Unlike real scalar actions, complex scalar multiplication is
already central in the native continuous-linear endomorphism algebra. -/
theorem originalFock_commutator_complex_smul
    (T X : Op) (c : ℂ) :
    T * (c • X) - (c • X) * T =
      c • (T * X - X * T) := by
  simp only [mul_smul_comm, smul_mul_assoc, smul_sub]

private theorem originalFock_commutator_sum
    {ι : Type*} [Fintype ι] (T : Op) (f : ι → Op) :
    T * (∑ i : ι, f i) - (∑ i : ι, f i) * T =
      ∑ i : ι, (T * f i - f i * T) := by
  classical
  rw [Finset.mul_sum, Finset.sum_mul, Finset.sum_sub_distrib]

private theorem originalFock_commutator_doubleSum
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (T : Op) (f : ι → κ → Op) :
    T * (∑ i : ι, ∑ j : κ, f i j) -
        (∑ i : ι, ∑ j : κ, f i j) * T =
      ∑ i : ι, ∑ j : κ, (T * f i j - f i j * T) := by
  classical
  calc
    T * (∑ i : ι, ∑ j : κ, f i j) -
        (∑ i : ι, ∑ j : κ, f i j) * T =
      ∑ i : ι, (T * (∑ j : κ, f i j) -
        (∑ j : κ, f i j) * T) :=
          originalFock_commutator_sum T
            (fun i : ι => ∑ j : κ, f i j)
    _ = ∑ i : ι, ∑ j : κ,
        (T * f i j - f i j * T) := by
          apply Finset.sum_congr rfl
          intro i hi
          exact originalFock_commutator_sum T (f i)

/-- The generic weighted double sum satisfies ordinary Leibniz
covariance on the genuine original Fock carrier, assuming (not
inventing) the generator covariance. Distinctness and CAR are unused. -/
private theorem originalFock_weighted_doubleSum_covariance
    {ι : Type*} [Fintype ι] (T : Op)
    (x : ι → Op) (a b : ι → ι → ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p) :
    T * (∑ i : ι, ∑ j : ι, b i j • (x i * x j)) -
      (∑ i : ι, ∑ j : ι, b i j • (x i * x j)) * T =
      ∑ i : ι, ∑ j : ι,
        b i j • ((∑ p : ι, a p i • x p) * x j +
          x i * (∑ p : ι, a p j • x p)) := by
  classical
  rw [originalFock_commutator_doubleSum T
    (fun i j => b i j • (x i * x j))]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  rw [originalFock_commutator_complex_smul]
  rw [originalFock_product_covariance_from_two_hypotheses
    T (x i) (x j)
    (∑ p : ι, a p i • x p)
    (∑ p : ι, a p j • x p)
    (hcov i) (hcov j)]

/-- A source-normalization-compatible generic quadratic finite sum.
The coefficient field is ℂ only at this abstract stage. The original
real-source 1/4 and Source48Label bind only in a future QTC1 gate. -/
noncomputable def originalFockQuadratic
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (b : ι → ι → ℂ) : Op :=
  (1 / 4 : ℂ) •
    (∑ i : ι, ∑ j : ι, b i j • (x i * x j))

/-- Exact weighted quadratic commutator Leibniz expansion.

This is NOT YET the contraction to Q(a*b+b*aᵀ).
The two covariance hypotheses in the accepted LB1L2 donor are supplied
locally from the single explicit hcov generator hypothesis.
-/
theorem originalFock_quadratic_covariance_expanded
    {ι : Type*} [Fintype ι] (T : Op)
    (x : ι → Op) (a b : ι → ι → ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : ι, ∑ j : ι, b i j •
          ((∑ p : ι, a p i • x p) * x j +
            x i * (∑ p : ι, a p j • x p))) := by
  unfold originalFockQuadratic
  rw [originalFock_commutator_complex_smul]
  exact congrArg (fun Z : Op => (1 / 4 : ℂ) • Z)
    (originalFock_weighted_doubleSum_covariance T x a b hcov)

#print axioms originalFock_commutator_complex_smul
#print axioms originalFock_quadratic_covariance_expanded

end
end FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
