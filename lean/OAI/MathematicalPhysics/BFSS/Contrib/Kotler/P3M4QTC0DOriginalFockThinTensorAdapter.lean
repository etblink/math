import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0AOriginalFockWeightedQuadraticCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0CAbstractCoefficientContraction

/-!
# QTC0D — thin original Fock adapter for qualified abstract coefficient transport

Preserves the original noncommutative Fermion 2 continuous-linear operator
carrier, the exact QTC0A factor 1/4, and the GENERIC b*a.transpose formula.
The matrix reindex is exclusively delegated to strictly qualified QTC0C.
The conditional hcov is NOT yet proved for an original physical K(A).
Never import stopped QTC0B.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0DOriginalFockThinTensorAdapter
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
open FCP.BFSSP3M4QTC0CAbstractCoefficientContraction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Local product/sum distributivity only: NO matrix multiplication reindexing. -/
private theorem originalFock_left_local_expansion
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι,
      b i j • ((∑ p : ι, a p i • x p) * x j)) =
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (a p i * b i j) • (x p * x j)) := by
  classical
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  rw [Finset.sum_mul, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro p hp
  calc
    b i j • ((a p i • x p) * x j) =
      (b i j * a p i) • (x p * x j) := by
        rw [smul_mul_assoc, smul_smul]
    _ = (a p i * b i j) • (x p * x j) := by
      exact congrArg (fun c : ℂ => c • (x p * x j))
        (mul_comm (b i j) (a p i))

/-- Local product/sum distributivity only: keeps the order x_i*x_p. -/
private theorem originalFock_right_local_expansion
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι,
      b i j • (x i * (∑ p : ι, a p j • x p))) =
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (b i j * a p j) • (x i * x p)) := by
  classical
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  calc
    b i j • (x i * (∑ p : ι, a p j • x p)) =
      b i j • (∑ p : ι, x i * (a p j • x p)) := by
        rw [Finset.mul_sum]
    _ = ∑ p : ι, b i j • (x i * (a p j • x p)) := by
        rw [Finset.smul_sum]
    _ = ∑ p : ι, (b i j * a p j) • (x i * x p) := by
        apply Finset.sum_congr rfl
        intro p hp
        calc
          b i j • (x i * (a p j • x p)) =
            b i j • (a p j • (x i * x p)) := by
              rw [mul_smul_comm]
          _ = (b i j * a p j) • (x i * x p) := by
            rw [smul_smul]

/-- The first *source-exact original Fock carrier* quadratic tensor
contraction, conditional on generator covariance. Coefficient reindexing
is supplied exclusively by qualified QTC0C, not by the stopped QTC0B. -/
theorem originalFock_quadratic_covariance_tensor
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a b : Matrix ι ι ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b + b * a.transpose) := by
  rw [originalFock_quadratic_covariance_expanded T x a b hcov]
  unfold originalFockQuadratic
  have hsum :
      (∑ i : ι, ∑ j : ι,
        b i j • ((∑ p : ι, a p i • x p) * x j +
          x i * (∑ p : ι, a p j • x p))) =
      (∑ i : ι, ∑ j : ι,
        (a * b + b * a.transpose) i j • (x i * x j)) := by
    calc
      _ = (∑ i : ι, ∑ j : ι,
          b i j • ((∑ p : ι, a p i • x p) * x j)) +
          (∑ i : ι, ∑ j : ι,
          b i j • (x i * (∑ p : ι, a p j • x p))) := by
            simp only [smul_add, Finset.sum_add_distrib]
      _ = (∑ i : ι, ∑ j : ι, ∑ p : ι,
          (a p i * b i j) • (x p * x j)) +
          (∑ i : ι, ∑ j : ι, ∑ p : ι,
          (b i j * a p j) • (x i * x p)) := by
            rw [originalFock_left_local_expansion x a b,
              originalFock_right_local_expansion x a b]
      _ = ∑ i : ι, ∑ j : ι,
          (a * b + b * a.transpose) i j • (x i * x j) :=
            coefficient_both (fun i j => x i * x j) a b
  exact congrArg (fun Z : Op => (1 / 4 : ℂ) • Z) hsum

/-- Only a is assumed skew, and b stays arbitrary. -/
theorem originalFock_quadratic_covariance_skew
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a b : Matrix ι ι ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p)
    (hskew : a.transpose = -a) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b - b * a) := by
  rw [originalFock_quadratic_covariance_tensor T x a b hcov, hskew]
  simp only [mul_neg, sub_eq_add_neg]

#print axioms originalFock_quadratic_covariance_tensor
#print axioms originalFock_quadratic_covariance_skew

end
end FCP.BFSSP3M4QTC0DOriginalFockThinTensorAdapter
