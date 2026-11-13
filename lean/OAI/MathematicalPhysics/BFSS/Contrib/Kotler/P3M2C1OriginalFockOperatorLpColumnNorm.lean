import Mathlib.MeasureTheory.Function.LpSpace.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2C0OriginalFockOperatorLpColumns

/-!
# P3-M2C1 — original operator-valued L² versus Fock-vector column L² norms

The source remains the literal original bounded operator-norm L²
on Boson 2 with Fermion 2 →L[ℂ] Fermion 2 values.
The codomain is finite genuine Fermion 2 vector-valued L² columns
with its SEPARATE HS/PiLp2 Hilbert norm.
Two-sided finite-dimensional norm bounds do NOT claim an isometry
or original Hamiltonian, gauge, Spin9 or spectral result.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
open FCP.BFSSP3M2B1OriginalFockHSFieldColumns
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- The M2C0 genuine Fock column L² norm is exactly the separate
HS-field L² norm of the accepted B2 source map, NEVER the original
operator-valued L² source norm. -/
theorem originalFockOperatorLpColumnsEquiv_norm_eq_hs
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    ‖originalFockOperatorLpColumnsEquiv b f‖ =
      ‖originalFockOperatorLpHSContinuousEquiv b f‖ := by
  change
    ‖originalFockHSFieldColumnsEquiv (volume : Measure (Boson 2))
      (originalFockOperatorLpHSContinuousEquiv b f)‖ =
      ‖originalFockOperatorLpHSContinuousEquiv b f‖
  exact originalFockHSFieldColumnsEquiv_norm
    (volume : Measure (Boson 2))
    (originalFockOperatorLpHSContinuousEquiv b f)

/-- The original bounded-operator norm L² never exceeds its genuine
Fock-vector output-column Hilbert L² norm. -/
theorem originalFockOperatorLp_norm_le_columns
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    ‖f‖ ≤ ‖originalFockOperatorLpColumnsEquiv b f‖ := by
  have hfield := originalFockOperatorLpHSContinuousEquiv_apply_ae b f
  have hpoint :
      ∀ᵐ x : Boson 2 ∂(volume : Measure (Boson 2)),
        ‖f x‖ ≤ ‖(originalFockOperatorLpHSContinuousEquiv b f) x‖ := by
    filter_upwards [hfield] with x hx
    rw [hx]
    change ‖f x‖ ≤ ‖originalFockOperatorToHSFiber b (f x)‖
    exact originalFockOperator_norm_le_hs b (f x)
  calc
    ‖f‖ ≤ ‖originalFockOperatorLpHSContinuousEquiv b f‖ :=
      Lp.norm_le_norm_of_ae_le hpoint
    _ = ‖originalFockOperatorLpColumnsEquiv b f‖ :=
      (originalFockOperatorLpColumnsEquiv_norm_eq_hs b f).symm

/-- For a finite actual original Fock ONB, its entire column L²
Hilbert norm is bounded by √(card ι) times the original bounded-
operator-norm L², with no norm equality or isometry assertion. -/
theorem originalFockOperatorLp_columns_norm_le_sqrt_card_mul_norm
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (f : OriginalFockOperatorLp) :
    ‖originalFockOperatorLpColumnsEquiv b f‖ ≤
      Real.sqrt (Fintype.card ι : ℝ) * ‖f‖ := by
  have hfield := originalFockOperatorLpHSContinuousEquiv_apply_ae b f
  have hpoint :
      ∀ᵐ x : Boson 2 ∂(volume : Measure (Boson 2)),
        ‖(originalFockOperatorLpHSContinuousEquiv b f) x‖ ≤
          Real.sqrt (Fintype.card ι : ℝ) * ‖f x‖ := by
    filter_upwards [hfield] with x hx
    rw [hx]
    change ‖originalFockOperatorToHSFiber b (f x)‖ ≤
      Real.sqrt (Fintype.card ι : ℝ) * ‖f x‖
    exact originalFockOperator_hs_le_sqrt_card_mul_norm b (f x)
  calc
    ‖originalFockOperatorLpColumnsEquiv b f‖ =
        ‖originalFockOperatorLpHSContinuousEquiv b f‖ :=
      originalFockOperatorLpColumnsEquiv_norm_eq_hs b f
    _ ≤ Real.sqrt (Fintype.card ι : ℝ) * ‖f‖ :=
      Lp.norm_le_mul_norm_of_ae_le_mul hpoint

#print axioms originalFockOperatorLpColumnsEquiv_norm_eq_hs
#print axioms originalFockOperatorLp_norm_le_columns
#print axioms originalFockOperatorLp_columns_norm_le_sqrt_card_mul_norm

end
end FCP.BFSSP3M2C1OriginalFockOperatorLpColumnNorm
