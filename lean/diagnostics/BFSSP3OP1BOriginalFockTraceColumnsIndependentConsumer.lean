import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1BOriginalFockTraceColumns

/-!
Independent P3-OP1B consumer. Verifies the exact original-Fock trace
against arbitrary basis columns, and separately connects the accepted
OP1A trace pairing to the diagonal column formula. No replacement
Fock module, physical L² domain or new spectrum claim.
-/

set_option autoImplicit false

namespace BFSSP3OP1BOriginalFockTraceColumnsIndependentConsumer
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3OP1BOriginalFockTraceColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- An arbitrary source operator's ordinary trace really has basis columns. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    originalFockTrace T =
      ∑ i : ι, ⟪b i, T (b i)⟫_ℂ :=
  originalFockTrace_eq_sum_inner b T

/-- The genuine original OP1A pairing's diagonal is the column inner sum. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    originalFockTracePairing T T =
      ∑ i : ι, ⟪T (b i), T (b i)⟫_ℂ := by
  change originalFockTrace (star T * T) =
    ∑ i : ι, ⟪T (b i), T (b i)⟫_ℂ
  exact originalFockTrace_star_mul_eq_sum_inner b T

#print axioms FCP.BFSSP3OP1BOriginalFockTraceColumns.originalFockTrace_eq_sum_inner
#print axioms FCP.BFSSP3OP1BOriginalFockTraceColumns.originalFockTrace_star_mul_eq_sum_inner

end
end BFSSP3OP1BOriginalFockTraceColumnsIndependentConsumer
