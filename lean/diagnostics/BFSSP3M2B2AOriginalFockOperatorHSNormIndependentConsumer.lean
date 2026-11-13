import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2AOriginalFockOperatorHSNorm

/-!
Independent exact source consumer: genuine original Fermion 2 continuous
operators, abstract source ONB, and canonical 2^24-dimensional Fock basis.
No transported norm instance on original operator carrier.
-/
set_option autoImplicit false

namespace BFSSP3M2B2AOriginalFockOperatorHSNormIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))
variable (T : Fermion 2 →L[ℂ] Fermion 2)

example : ‖originalFockOperatorToHSFiber b T‖ ^ 2 =
    ∑ i : ι, ‖T (b i)‖ ^ 2 :=
  originalFockOperatorHS_norm_sq b T

example : ‖T‖ ≤ ‖originalFockOperatorToHSFiber b T‖ :=
  originalFockOperator_norm_le_hs b T

example : ‖originalFockOperatorToHSFiber b T‖ ≤
    Real.sqrt (Fintype.card ι : ℝ) * ‖T‖ :=
  originalFockOperator_hs_le_sqrt_card_mul_norm b T

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example (T : Fermion 2 →L[ℂ] Fermion 2) :
    ‖T‖ ≤
    ‖originalFockOperatorToHSFiber
      (EuclideanSpace.basisFun OriginalFockIndex ℂ) T‖ :=
  originalFockOperator_norm_le_hs
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) T

example (T : Fermion 2 →L[ℂ] Fermion 2) :
    ‖originalFockOperatorToHSFiber
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) T‖ ≤
      Real.sqrt (Fintype.card OriginalFockIndex : ℝ) * ‖T‖ :=
  originalFockOperator_hs_le_sqrt_card_mul_norm
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) T

#print axioms FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm.originalFockOperatorHS_norm_sq
#print axioms FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm.originalFockOperator_norm_le_hs
#print axioms FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm.originalFockOperator_hs_le_sqrt_card_mul_norm

end
end BFSSP3M2B2AOriginalFockOperatorHSNormIndependentConsumer
