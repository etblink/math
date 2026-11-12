import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D3OriginalFockColumns
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1BOriginalFockTraceColumns

/-!
# P3-D4 — original Fock cross-trace pairing as finite columns

Extend qualified OP1B diagonal trace columns to two arbitrary original
Fermion 2 bounded operators, then identify the pairing with qualified
D3 original-Fock columns. This is the source physical-star trace, not
an operator-norm/HS Hilbert instance, alternate Fock representation,
physical L² or closed-Hamiltonian domain/spectral theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D4OriginalFockCrossPairingColumns
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3OP1BOriginalFockTraceColumns
open FCP.BFSSP3D3OriginalFockColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Genuine original-Fock trace pairing of two operators is a finite
sum of inner products of their columns, in any original ONB. -/
theorem originalFockTrace_star_mul_eq_sum_cross
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S T : OriginalFockOp) :
    originalFockTrace (star S * T) =
      ∑ i : ι, ⟪S (b i), T (b i)⟫_ℂ := by
  calc
    originalFockTrace (star S * T) =
        ∑ i : ι, ⟪b i, (star S * T) (b i)⟫_ℂ :=
      originalFockTrace_eq_sum_inner b (star S * T)
    _ = ∑ i : ι, ⟪S (b i), T (b i)⟫_ℂ := by
      apply Finset.sum_congr rfl
      intro i _
      change ⟪b i, (star S) (T (b i))⟫_ℂ =
        ⟪S (b i), T (b i)⟫_ℂ
      rw [ContinuousLinearMap.star_eq_adjoint]
      exact ContinuousLinearMap.adjoint_inner_right S (b i) (T (b i))

/-- The accepted original trace pairing is precisely the inner-column
sum from the independent D3 genuine-Fock linear equivalence. -/
theorem originalFockTracePairing_eq_sum_columns
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S T : OriginalFockOp) :
    originalFockTracePairing S T =
      ∑ i : ι, ⟪originalFockColumns b S i,
                  originalFockColumns b T i⟫_ℂ := by
  rw [originalFockTracePairing]
  rw [originalFockTrace_star_mul_eq_sum_cross b S T]
  simp only [originalFockColumns_apply]

#print axioms originalFockTrace_star_mul_eq_sum_cross
#print axioms originalFockTracePairing_eq_sum_columns

end
end FCP.BFSSP3D4OriginalFockCrossPairingColumns
