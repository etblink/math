import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B1OriginalFockJacobiCovarianceAction

/-!
# W0C2B1 R1 — independently importing original Fock Jacobi/covariance consumer

Four source-exact theorem consumers on Fermion 2 bounded ℂ-linear operators,
with four separate original-carrier controls. Conditional covariance hypotheses
are retained; no original K(A) bracket or all-48 gamma centrality is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceAction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_commutator_sum_consumer
    {ι : Type*} [Fintype ι] (T : Op) (f : ι → Op) :
    T * (∑ i : ι, f i) - (∑ i : ι, f i) * T =
      ∑ i : ι, (T * f i - f i * T) :=
  originalFock_commutator_sum T f

theorem originalFock_commutator_weighted_sum_consumer
    {ι : Type*} [Fintype ι] (T : Op)
    (c : ι → ℂ) (x : ι → Op) :
    T * (∑ i : ι, c i • x i) -
      (∑ i : ι, c i • x i) * T =
    ∑ i : ι, c i • (T * x i - x i * T) :=
  originalFock_commutator_weighted_sum T c x

theorem originalFock_commutator_jacobi_consumer (T U X : Op) :
    (T * U - U * T) * X - X * (T * U - U * T) =
    (T * (U * X - X * U) - (U * X - X * U) * T) -
    (U * (T * X - X * T) - (T * X - X * T) * U) :=
  originalFock_commutator_jacobi T U X

theorem originalFock_commutator_covariance_bracket_consumer
    {ι : Type*} [Fintype ι] (T U : Op)
    (x : ι → Op) (A B : Matrix ι ι ℂ)
    (hT : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, A p k • x p)
    (hU : ∀ k : ι, U * x k - x k * U =
      ∑ p : ι, B p k • x p)
    (k : ι) :
    (T * U - U * T) * x k - x k * (T * U - U * T) =
      ∑ q : ι, (A * B - B * A) q k • x q :=
  originalFock_commutator_covariance_bracket T U x A B hT hU k

-- Four independently typechecked original Fermion 2 controls.
example {ι : Type*} [Fintype ι] (T : Op) (f : ι → Op) :
    T * (∑ i : ι, f i) - (∑ i : ι, f i) * T =
      ∑ i : ι, (T * f i - f i * T) :=
  originalFock_commutator_sum_consumer T f

example {ι : Type*} [Fintype ι] (T : Op)
    (c : ι → ℂ) (x : ι → Op) :
    T * (∑ i : ι, c i • x i) -
      (∑ i : ι, c i • x i) * T =
    ∑ i : ι, c i • (T * x i - x i * T) :=
  originalFock_commutator_weighted_sum_consumer T c x

example (T U X : Op) :
    (T * U - U * T) * X - X * (T * U - U * T) =
    (T * (U * X - X * U) - (U * X - X * U) * T) -
    (U * (T * X - X * T) - (T * X - X * T) * U) :=
  originalFock_commutator_jacobi_consumer T U X

example {ι : Type*} [Fintype ι] (T U : Op)
    (x : ι → Op) (A B : Matrix ι ι ℂ)
    (hT : ∀ k : ι, T * x k - x k * T =
      ∑ p : ι, A p k • x p)
    (hU : ∀ k : ι, U * x k - x k * U =
      ∑ p : ι, B p k • x p)
    (k : ι) :
    (T * U - U * T) * x k - x k * (T * U - U * T) =
      ∑ q : ι, (A * B - B * A) q k • x q :=
  originalFock_commutator_covariance_bracket_consumer T U x A B hT hU k

#print axioms originalFock_commutator_sum_consumer
#print axioms originalFock_commutator_weighted_sum_consumer
#print axioms originalFock_commutator_jacobi_consumer
#print axioms originalFock_commutator_covariance_bracket_consumer

end
end FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceIndependentConsumer
