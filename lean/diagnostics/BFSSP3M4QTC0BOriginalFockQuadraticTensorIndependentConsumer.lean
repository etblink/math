import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0BOriginalFockQuadraticTensorContraction

/-!
# QTC0B independent original Fock consumer
Restates the generic and skew source roots and checks four finite-index
cases. A separate non-skew 2×2 identity/coordinate example detects the
incorrect replacement of a*b+b*a.transpose by a*b-b*a.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0BOriginalFockQuadraticTensorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
open FCP.BFSSP3M4QTC0BOriginalFockQuadraticTensorContraction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_tensor_covariance_consumer
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a b : Matrix ι ι ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b + b * a.transpose) :=
  originalFock_quadratic_covariance_tensor T x a b hcov

theorem originalFock_skew_covariance_consumer
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a b : Matrix ι ι ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p)
    (hskew : a.transpose = -a) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b - b * a) :=
  originalFock_quadratic_covariance_skew T x a b hcov hskew

example (T : Op) (x : Fin 0 → Op)
    (a b : Matrix (Fin 0) (Fin 0) ℂ)
    (hcov : ∀ k : Fin 0, T * x k - x k * T =
      ∑ p : Fin 0, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b + b * a.transpose) :=
  originalFock_quadratic_covariance_tensor T x a b hcov

example (T : Op) (x : Fin 1 → Op)
    (a b : Matrix (Fin 1) (Fin 1) ℂ)
    (hcov : ∀ k : Fin 1, T * x k - x k * T =
      ∑ p : Fin 1, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b + b * a.transpose) :=
  originalFock_quadratic_covariance_tensor T x a b hcov

example (T : Op) (x : Fin 2 → Op)
    (a b : Matrix (Fin 2) (Fin 2) ℂ)
    (hcov : ∀ k : Fin 2, T * x k - x k * T =
      ∑ p : Fin 2, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b + b * a.transpose) :=
  originalFock_quadratic_covariance_tensor T x a b hcov

example (T : Op) (x : Fin 3 → Op)
    (a b : Matrix (Fin 3) (Fin 3) ℂ)
    (hcov : ∀ k : Fin 3, T * x k - x k * T =
      ∑ p : Fin 3, a p k • x p)
    (hskew : a.transpose = -a) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
    originalFockQuadratic x (a * b - b * a) :=
  originalFock_quadratic_covariance_skew T x a b hcov hskew

private def matrixE00 : Matrix (Fin 2) (Fin 2) ℂ :=
  fun i j => if i = 0 ∧ j = 0 then 1 else 0

-- Adversarial non-skew control: a=I and B=E00 gives 2B, NOT [I,B]=0.
example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * matrixE00 +
      matrixE00 * (1 : Matrix (Fin 2) (Fin 2) ℂ).transpose =
    matrixE00 + matrixE00 := by
  simp

example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * matrixE00 -
      matrixE00 * (1 : Matrix (Fin 2) (Fin 2) ℂ) = 0 := by
  simp

example : matrixE00 (0 : Fin 2) (0 : Fin 2) = 1 := by
  simp [matrixE00]

#print axioms originalFock_tensor_covariance_consumer
#print axioms originalFock_skew_covariance_consumer

end
end FCP.BFSSP3M4QTC0BOriginalFockQuadraticTensorIndependentConsumer
