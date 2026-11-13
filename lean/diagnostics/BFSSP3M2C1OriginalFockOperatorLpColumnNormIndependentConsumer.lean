import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2C1OriginalFockOperatorLpColumnNorm

/-!
Independent consumer of original source Boson2-volume bounded Fermion2
operator-norm L² and separate real Fock vector L² output columns.
Verifies both exact bounds with an abstract source ONB AND concrete
original EuclideanSpace.basisFun, without enumerating 2^24 indices.
-/
set_option autoImplicit false

namespace BFSSP3M2C1OriginalFockOperatorLpColumnNormIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))

example (f : OriginalFockOperatorLp) :
    ‖originalFockOperatorLpColumnsEquiv b f‖ =
      ‖originalFockOperatorLpHSContinuousEquiv b f‖ :=
  originalFockOperatorLpColumnsEquiv_norm_eq_hs b f

example (f : OriginalFockOperatorLp) :
    ‖f‖ ≤ ‖originalFockOperatorLpColumnsEquiv b f‖ :=
  originalFockOperatorLp_norm_le_columns b f

example (f : OriginalFockOperatorLp) :
    ‖originalFockOperatorLpColumnsEquiv b f‖ ≤
      Real.sqrt (Fintype.card ι : ℝ) * ‖f‖ :=
  originalFockOperatorLp_columns_norm_le_sqrt_card_mul_norm b f

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example (f : OriginalFockOperatorLp) :
    ‖f‖ ≤
      ‖originalFockOperatorLpColumnsEquiv
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) f‖ :=
  originalFockOperatorLp_norm_le_columns
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) f

example (f : OriginalFockOperatorLp) :
    ‖originalFockOperatorLpColumnsEquiv
      (EuclideanSpace.basisFun OriginalFockIndex ℂ) f‖ ≤
        Real.sqrt (Fintype.card OriginalFockIndex : ℝ) * ‖f‖ :=
  originalFockOperatorLp_columns_norm_le_sqrt_card_mul_norm
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) f

#print axioms FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm.originalFockOperatorLpColumnsEquiv_norm_eq_hs
#print axioms FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm.originalFockOperatorLp_norm_le_columns
#print axioms FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm.originalFockOperatorLp_columns_norm_le_sqrt_card_mul_norm

end
end BFSSP3M2C1OriginalFockOperatorLpColumnNormIndependentConsumer
