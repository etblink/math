import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L0OriginalFockProductCommutator

/-!
# M4-LB1L0 — independent original Fock product commutator consumer

All operators are original Fermion 2 continuous linear maps.
Native original Source48Label and original K(A) are unchanged;
no surrogate Clifford model or synthetic scalar action.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1L0OriginalFockProductCommutatorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1L0OriginalFockProductCommutator

/-- Independent invocation of the true Fock noncommutative Leibniz rule. -/
theorem originalFock_commutator_product_consumer
    (T X Y : Fermion 2 →L[ℂ] Fermion 2) :
    T * (X * Y) - (X * Y) * T =
      (T * X - X * T) * Y + X * (T * Y - Y * T) :=
  originalFock_commutator_product T X Y

/-- Independent source-exact original 48-label product covariance. -/
theorem originalSource48_skew_K_gamma_product_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p))
    (p q : Source48Label) :
    originalSource48BivectorK A *
        (sourceNormalizedGamma p * sourceNormalizedGamma q) -
      (sourceNormalizedGamma p * sourceNormalizedGamma q) *
        originalSource48BivectorK A =
      (∑ r : Source48Label, (A r p : ℝ) • sourceNormalizedGamma r) *
        sourceNormalizedGamma q +
      sourceNormalizedGamma p *
        (∑ r : Source48Label,
          (A r q : ℝ) • sourceNormalizedGamma r) :=
  originalSource48BivectorK_skew_commutator_gamma_product A hA p q

/-- Native transpose-skew original matrix consumer, not an isomorphic model. -/
theorem originalSource48_skew_K_gamma_product_transpose_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A)
    (p q : Source48Label) :
    originalSource48BivectorK A *
        (sourceNormalizedGamma p * sourceNormalizedGamma q) -
      (sourceNormalizedGamma p * sourceNormalizedGamma q) *
        originalSource48BivectorK A =
      (∑ r : Source48Label, (A r p : ℝ) • sourceNormalizedGamma r) *
        sourceNormalizedGamma q +
      sourceNormalizedGamma p *
        (∑ r : Source48Label,
          (A r q : ℝ) • sourceNormalizedGamma r) :=
  originalSource48BivectorK_skew_commutator_gamma_product_of_transpose A hA p q

#print axioms originalFock_commutator_product_consumer
#print axioms originalSource48_skew_K_gamma_product_consumer
#print axioms originalSource48_skew_K_gamma_product_transpose_consumer

end
end FCP.BFSSP3M4LB1L0OriginalFockProductCommutatorIndependentConsumer
