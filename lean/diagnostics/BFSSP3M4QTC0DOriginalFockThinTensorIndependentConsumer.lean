import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0DOriginalFockThinTensorAdapter

/-!
# QTC0D independent consumer on the actual original Fock carrier

Source root hcov stays an explicit hypothesis. Four finite-index consumers
and three nonskew matrix controls distinguish generic tensor covariance
from an unjustified commutator shortcut. Never import QTC0B.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0DOriginalFockThinTensorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
open FCP.BFSSP3M4QTC0DOriginalFockThinTensorAdapter

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

private def e00 : Matrix (Fin 2) (Fin 2) ℂ :=
  fun i j => if i = 0 ∧ j = 0 then 1 else 0

example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * e00 +
      e00 * (1 : Matrix (Fin 2) (Fin 2) ℂ).transpose =
    e00 + e00 := by
  simp

example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * e00 -
      e00 * (1 : Matrix (Fin 2) (Fin 2) ℂ) = 0 := by
  simp

example : e00 (0 : Fin 2) (0 : Fin 2) = 1 := by
  simp [e00]

#print axioms originalFock_tensor_covariance_consumer
#print axioms originalFock_skew_covariance_consumer

end
end FCP.BFSSP3M4QTC0DOriginalFockThinTensorIndependentConsumer
