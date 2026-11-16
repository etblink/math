import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-!
# M4-LB1L2 — abstract covariance Leibniz on the genuine original Fock carrier
The failed LB1L0/D0/D1 native source-binding attempts are bypassed here.
These statements contain only opaque Fock operators and explicit
covariance hypotheses. They do NOT prove the original source adapter,
48-plane Lie bracket, global Spin9, gauge or physical spectral claims.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Noncommutative Leibniz for two explicit original Fock covariances. -/
theorem originalFock_product_covariance_from_two_hypotheses
    (T X Y U V : Op)
    (hX : T * X - X * T = U)
    (hY : T * Y - Y * T = V) :
    T * (X * Y) - (X * Y) * T = U * Y + X * V := by
  calc
    T * (X * Y) - (X * Y) * T =
        (T * X - X * T) * Y + X * (T * Y - Y * T) := by
          simp only [sub_mul, mul_sub, mul_assoc]
          abel
    _ = U * Y + X * V := by rw [hX, hY]

/-- Any finite-index family with assumed infinitesimal Fock covariance. -/
theorem originalFock_indexed_product_covariance
    {ι : Type*} [Fintype ι]
    (T : Op) (x : ι → Op) (a : ι → ι → ℝ)
    (hcov : ∀ k : ι, T * x k - x k * T =
      ∑ r : ι, (a r k : ℝ) • x r)
    (p q : ι) :
    T * (x p * x q) - (x p * x q) * T =
      (∑ r : ι, (a r p : ℝ) • x r) * x q +
      x p * (∑ r : ι, (a r q : ℝ) • x r) := by
  exact originalFock_product_covariance_from_two_hypotheses T
    (x p) (x q)
    (∑ r : ι, (a r p : ℝ) • x r)
    (∑ r : ι, (a r q : ℝ) • x r)
    (hcov p) (hcov q)

#print axioms originalFock_product_covariance_from_two_hypotheses
#print axioms originalFock_indexed_product_covariance

end
end FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz
