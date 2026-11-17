import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0AOriginalFockWeightedQuadraticCovariance

/-!
# BFSS M4 QTC0B — generic tensor-square coefficient contraction

For the actual original complex Fock endomorphism carrier, prove that the
weighted quadratic covariance expansion of QTC0A contracts into
a*b + b*a.transpose for ARBITRARY complex matrices a and b.
Fock products are ordered and noncommutative. No Clifford relation or
original real-source K(A) is assumed or unfolded.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0BOriginalFockQuadraticTensorContraction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Reindex the FIRST generator covariance, without commuting Fock factors. -/
private theorem originalFock_left_tensor_contract
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι,
      b i j • ((∑ p : ι, a p i • x p) * x j)) =
    (∑ p : ι, ∑ j : ι, (a * b) p j • (x p * x j)) := by
  classical
  calc
    _ = ∑ i : ι, ∑ j : ι, ∑ p : ι,
        (a p i * b i j) • (x p * x j) := by
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
          rw [mul_comm]
    _ = ∑ i : ι, ∑ p : ι, ∑ j : ι,
        (a p i * b i j) • (x p * x j) := by
      apply Finset.sum_congr rfl
      intro i hi
      exact Finset.sum_comm
    _ = ∑ p : ι, ∑ i : ι, ∑ j : ι,
        (a p i * b i j) • (x p * x j) := Finset.sum_comm
    _ = ∑ p : ι, ∑ j : ι, ∑ i : ι,
        (a p i * b i j) • (x p * x j) := by
      apply Finset.sum_congr rfl
      intro p hp
      exact Finset.sum_comm
    _ = ∑ p : ι, ∑ j : ι,
        (a * b) p j • (x p * x j) := by
      simp only [Matrix.mul_apply, Finset.sum_smul]

/-- Reindex the SECOND generator covariance; the right matrix is TRANSPOSED. -/
private theorem originalFock_right_tensor_contract
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι,
      b i j • (x i * (∑ p : ι, a p j • x p))) =
    (∑ i : ι, ∑ p : ι,
      (b * a.transpose) i p • (x i * x p)) := by
  classical
  calc
    _ = ∑ i : ι, ∑ j : ι, ∑ p : ι,
        (b i j * a p j) • (x i * x p) := by
      apply Finset.sum_congr rfl
      intro i hi
      apply Finset.sum_congr rfl
      intro j hj
      rw [Finset.mul_sum, Finset.smul_sum]
      apply Finset.sum_congr rfl
      intro p hp
      calc
        b i j • (x i * (a p j • x p)) =
          (b i j * a p j) • (x i * x p) := by
            rw [mul_smul_comm, smul_smul]
    _ = ∑ i : ι, ∑ p : ι, ∑ j : ι,
        (b i j * a p j) • (x i * x p) := by
      apply Finset.sum_congr rfl
      intro i hi
      exact Finset.sum_comm
    _ = ∑ i : ι, ∑ p : ι,
        (b * a.transpose) i p • (x i * x p) := by
      simp only [Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_smul]

/-- The tensor-square covariance law on the actual original Fock operator
carrier. The covariance hypothesis is explicit: this gate DOES NOT prove it
for a chosen source K(A). In particular a and b need not be skew. -/
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
      _ = (∑ i : ι, ∑ j : ι,
          (a * b) i j • (x i * x j)) +
          (∑ i : ι, ∑ j : ι,
          (b * a.transpose) i j • (x i * x j)) := by
            rw [originalFock_left_tensor_contract x a b,
              originalFock_right_tensor_contract x a b]
      _ = ∑ i : ι, ∑ j : ι,
          (a * b + b * a.transpose) i j • (x i * x j) := by
            simp only [Matrix.add_apply, add_smul, Finset.sum_add_distrib]
  exact congrArg (fun Z : Op => (1 / 4 : ℂ) • Z) hsum

/-- Specialization to skew a; b is still completely arbitrary. -/
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
end FCP.BFSSP3M4QTC0BOriginalFockQuadraticTensorContraction
