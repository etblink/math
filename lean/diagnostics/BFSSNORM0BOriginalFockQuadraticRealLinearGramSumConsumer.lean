import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum

/-!
# NORM-0B independent downstream consumer

Only the genuine NORM-0B source module is imported. The two distinct
consumers exercise real coefficient oddness and the complete 81-term
original Gram-index decomposition on zero source coefficient input.

All operators act on literal Fermion 2; no FullL2 or Hamiltonian claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSumConsumer
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum

/-- A downstream consequence of NEW real-linearity, previously
strict-tested as a separate private B2 proof but not source-importable. -/
theorem originalColorQuadratic_neg_from_real_smul
    (J : GammaMatrix) :
    originalColorQuadratic (-J) =
      -originalColorQuadratic J := by
  calc
    originalColorQuadratic (-J) =
        originalColorQuadratic ((-1 : ℝ) • J) := by
          rw [neg_one_smul ℝ J]
    _ = ((-1 : ℝ) : ℂ) • originalColorQuadratic J :=
          originalColorQuadratic_real_smul (-1 : ℝ) J
    _ = (-1 : ℂ) • originalColorQuadratic J := by
          have hc : ((-1 : ℝ) : ℂ) = (-1 : ℂ) := by norm_num
          rw [hc]
    _ = -originalColorQuadratic J :=
          neg_one_smul ℂ (originalColorQuadratic J)

/-- The new 81-term source decomposition correctly vanishes for a
zero real source spinor coefficient matrix on true Fermion 2. -/
theorem originalFockGramObservable_zero_B
    (x : Boson 2) :
    originalFockGramObservable x (0 : GammaMatrix) = 0 := by
  rw [originalFockGramObservable_sum]
  simp only [mul_zero, zero_mul, originalColorQuadratic_zero]
  apply Finset.sum_eq_zero
  intro i _
  apply Finset.sum_eq_zero
  intro j _
  change ((originalSpatialGram x i j : ℝ) : ℂ) •
    (0 : Fermion 2 →L[ℂ] Fermion 2) = 0
  rw [smul_zero]

#print axioms FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum.originalColorQuadratic_add
#print axioms FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum.originalColorQuadratic_real_smul
#print axioms FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum.originalColorQuadratic_zero
#print axioms FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSum.originalFockGramObservable_sum
#print axioms originalColorQuadratic_neg_from_real_smul
#print axioms originalFockGramObservable_zero_B

end
end FCP.BFSSNORM0BOriginalFockQuadraticRealLinearGramSumConsumer
