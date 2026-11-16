import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L2AbstractOriginalFockCovarianceLeibniz

/-! Independent source-import consumer; true Fermion 2 Fock operator carrier.
No source-specific original K(A) identity follows from these statements. -/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibnizIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_product_covariance_from_two_hypotheses_consumer
    (T X Y U V : Op)
    (hX : T * X - X * T = U)
    (hY : T * Y - Y * T = V) :
    T * (X * Y) - (X * Y) * T = U * Y + X * V :=
  originalFock_product_covariance_from_two_hypotheses T X Y U V hX hY

theorem originalFock_indexed_product_covariance_consumer
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a : ι → ι → ℝ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ r : ι, (a r k : ℝ) • x r)
    (p q : ι) :
    T * (x p * x q) - (x p * x q) * T =
      (∑ r : ι, (a r p : ℝ) • x r) * x q +
      x p * (∑ r : ι, (a r q : ℝ) • x r) :=
  originalFock_indexed_product_covariance T x a hcov p q

#print axioms originalFock_product_covariance_from_two_hypotheses_consumer
#print axioms originalFock_indexed_product_covariance_consumer

end
end FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibnizIndependentConsumer
