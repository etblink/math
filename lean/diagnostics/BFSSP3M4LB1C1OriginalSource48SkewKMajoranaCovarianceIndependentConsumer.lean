import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-!
# M4-LB1C1 independent original source 48 Majorana covariance

No surrogate Clifford/Fock model. All four original objects
K(A), Γ_k, paired source labels and the real 1/4 coefficient
come from the previously accepted genuine Fermion 2 sources.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovarianceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-- Independently consume the abstract real-skew double delta
contraction on the GENUINE original complex Fock operator type. -/
theorem originalFock_skew_delta_generic_consumer
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (a : ι → ι → ℝ)
    (x : ι → (Fermion 2 →L[ℂ] Fermion 2))
    (k : ι)
    (ha : ∀ p q : ι, a p q = -(a q p)) :
    (∑ p : ι, ∑ q : ι, (a p q / 4 : ℝ) •
      (((if q = k then (2 : ℂ) else 0) • x p) -
        ((if p = k then (2 : ℂ) else 0) • x q))) =
      ∑ p : ι, (a p k : ℝ) • x p :=
  originalFock_skew_delta_doubleSum_contract a x k ha

/-- Independent exact original Source48 24×2 paired gamma action.
No source changes; the theorem already uses the accepted K(A). -/
theorem originalSource48_skew_K_gamma_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p))
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (A p k : ℝ) • sourceNormalizedGamma p :=
  originalSource48BivectorK_skew_commutator_gamma A hA k

/-- Independently use the original real matrix transpose-skew
hypothesis instead of silently assuming an isomorphic matrix carrier. -/
theorem originalSource48_skew_K_gamma_native_transpose_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (A p k : ℝ) • sourceNormalizedGamma p :=
  originalSource48BivectorK_skew_commutator_gamma_of_transpose A hA k

#print axioms originalFock_skew_delta_generic_consumer
#print axioms originalSource48_skew_K_gamma_consumer
#print axioms originalSource48_skew_K_gamma_native_transpose_consumer

end
end FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovarianceIndependentConsumer
