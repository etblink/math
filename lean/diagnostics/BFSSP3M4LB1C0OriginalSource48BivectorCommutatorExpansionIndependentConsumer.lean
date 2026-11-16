import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C0OriginalSource48BivectorCommutatorExpansion

/-!
# LB1C0 — independent original Source48 K(A) commutator consumer

All statements use the GENUINE 24×2 original paired Majorana label
type and ACTUAL original Fermion 2 Fock operators. The literal
qualified K(A) definition and real 1/4 coefficient are preserved.
No global Spin9 Fock-vector unitary or charge-domain claims.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansionIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansion

/-- The qualified exact original source K(A) expands its
commutator across both REAL source coefficient sums. -/
theorem originalSource48K_doubleSum_commutator_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          ((sourceNormalizedGamma p * sourceNormalizedGamma q) *
              sourceNormalizedGamma k -
            sourceNormalizedGamma k *
              (sourceNormalizedGamma p * sourceNormalizedGamma q)) :=
  originalSource48BivectorK_commutator_doubleSum A k

/-- Qualified LB0 original triple CAR substituted into both real
coefficient sums, without suppressing the still-open delta collapse. -/
theorem originalSource48K_CAR_sum_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          ((if q = k then (2 : ℂ) else 0) •
              sourceNormalizedGamma p -
            (if p = k then (2 : ℂ) else 0) •
              sourceNormalizedGamma q) :=
  originalSource48BivectorK_commutator_CAR_sum A k

/-- K(0)=0 in the actual original source Fock algebra, so its
commutator with every genuine Majorana vanishes. -/
theorem originalSource48K_zero_commutator_consumer
    (k : Source48Label) :
    originalSource48BivectorK
        (0 : Matrix Source48Label Source48Label ℝ) *
          sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        originalSource48BivectorK
          (0 : Matrix Source48Label Source48Label ℝ) =
          (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  originalSource48BivectorK_zero_commutator k

#print axioms originalSource48K_doubleSum_commutator_consumer
#print axioms originalSource48K_CAR_sum_consumer
#print axioms originalSource48K_zero_commutator_consumer

end
end FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansionIndependentConsumer
