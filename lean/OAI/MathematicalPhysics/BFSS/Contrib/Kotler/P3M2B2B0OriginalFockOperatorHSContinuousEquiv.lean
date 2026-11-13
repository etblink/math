import Mathlib.Analysis.Normed.Operator.ContinuousLinearMap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2AOriginalFockOperatorHSNorm

/-!
# P3-M2B2B0 — bounded original-Fock operator/HS-fiber equivalence

The original source operator-norm carrier remains exactly
`Fermion 2 →L[ℂ] Fermion 2`, NOT an operator with an installed HS norm.
The separately normed finite Hilbert columns are the qualified M2A
`OriginalFockHSFiber`. M2B2A supplies bounds in both directions.
No operator-valued L² field, a.e. reconstruction, gauge, closed H,
or spectral conclusion is established here.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5AOriginalFockHilbertColumns
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm

variable {ι : Type*} [Fintype ι]

/-- Exact original Fock operator norm and separate HS Hilbert norm
are linked by a genuine continuous complex-linear equivalence,
using both independently qualified source-specific norm bounds. -/
noncomputable def originalFockOperatorHSContinuousEquiv
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    (Fermion 2 →L[ℂ] Fermion 2) ≃L[ℂ] OriginalFockHSFiber ι :=
  (originalFockOperatorToHSFiber b).toContinuousLinearEquivOfBounds
    (Real.sqrt (Fintype.card ι : ℝ)) 1
    (by
      intro T
      exact originalFockOperator_hs_le_sqrt_card_mul_norm b T)
    (by
      intro u
      have h := originalFockOperator_norm_le_hs b
        ((originalFockOperatorToHSFiber b).symm u)
      simpa only [(originalFockOperatorToHSFiber b).apply_symm_apply, one_mul] using h)

/-- Forward bounded source map really evaluates the ORIGINAL operator
at an actual original-Fock ONB vector. -/
theorem originalFockOperatorHSContinuousEquiv_apply_basis
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : Fermion 2 →L[ℂ] Fermion 2) (i : ι) :
    (originalFockOperatorHSContinuousEquiv b T) i = T (b i) := by
  change originalFockHilbertColumns b T i = T (b i)
  exact originalFockHilbertColumns_apply b T i

/-- Inverse bounded source map is the qualified original HS-to-operator
linear equivalence, not a surrogate reconstructed Fock operator. -/
theorem originalFockOperatorHSContinuousEquiv_symm_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) :
    (originalFockOperatorHSContinuousEquiv b).symm u =
      originalFockHSFiberToOperator b u := by
  rfl

#print axioms originalFockOperatorHSContinuousEquiv
#print axioms originalFockOperatorHSContinuousEquiv_apply_basis
#print axioms originalFockOperatorHSContinuousEquiv_symm_apply

end
end FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
