import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0AOriginalFockWeightedQuadraticCovariance

/-!
# QTC0A independent consumer
Imports only the complete source module, restates both theorem roots,
and checks empty, singleton, two-label and three-label controls
under the fully explicit generator covariance premise.
No CAR, source48 K(A), hidden skewness, or new instance.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_complex_scalar_consumer
    (T X : Op) (c : ℂ) :
    T * (c • X) - (c • X) * T =
      c • (T * X - X * T) :=
  originalFock_commutator_complex_smul T X c

theorem originalFock_quadratic_covariance_consumer
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a b : ι → ι → ℂ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : ι, ∑ j : ι, b i j •
          ((∑ p : ι, a p i • x p) * x j +
            x i * (∑ p : ι, a p j • x p))) :=
  originalFock_quadratic_covariance_expanded T x a b hcov

-- Original Fock noncommutative operators with an empty finite label.
example (T : Op) (x : Fin 0 → Op) (a b : Fin 0 → Fin 0 → ℂ)
    (hcov : ∀ k : Fin 0, T * x k - x k * T =
      ∑ p : Fin 0, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : Fin 0, ∑ j : Fin 0, b i j •
          ((∑ p : Fin 0, a p i • x p) * x j +
            x i * (∑ p : Fin 0, a p j • x p))) :=
  originalFock_quadratic_covariance_expanded T x a b hcov

-- Singleton label: identical/repeated quadratic index.
example (T : Op) (x : Fin 1 → Op) (a b : Fin 1 → Fin 1 → ℂ)
    (hcov : ∀ k : Fin 1, T * x k - x k * T =
      ∑ p : Fin 1, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : Fin 1, ∑ j : Fin 1, b i j •
          ((∑ p : Fin 1, a p i • x p) * x j +
            x i * (∑ p : Fin 1, a p j • x p))) :=
  originalFock_quadratic_covariance_expanded T x a b hcov

-- Two-label coefficients are arbitrary, including NONSKEW matrices.
example (T : Op) (x : Fin 2 → Op) (a b : Fin 2 → Fin 2 → ℂ)
    (hcov : ∀ k : Fin 2, T * x k - x k * T =
      ∑ p : Fin 2, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : Fin 2, ∑ j : Fin 2, b i j •
          ((∑ p : Fin 2, a p i • x p) * x j +
            x i * (∑ p : Fin 2, a p j • x p))) :=
  originalFock_quadratic_covariance_expanded T x a b hcov

-- Three-label arbitrary input, no repeated-index restrictions.
example (T : Op) (x : Fin 3 → Op) (a b : Fin 3 → Fin 3 → ℂ)
    (hcov : ∀ k : Fin 3, T * x k - x k * T =
      ∑ p : Fin 3, a p k • x p) :
    T * originalFockQuadratic x b -
      originalFockQuadratic x b * T =
      (1 / 4 : ℂ) •
        (∑ i : Fin 3, ∑ j : Fin 3, b i j •
          ((∑ p : Fin 3, a p i • x p) * x j +
            x i * (∑ p : Fin 3, a p j • x p))) :=
  originalFock_quadratic_covariance_expanded T x a b hcov

#print axioms originalFock_complex_scalar_consumer
#print axioms originalFock_quadratic_covariance_consumer

end
end FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticIndependentConsumer
