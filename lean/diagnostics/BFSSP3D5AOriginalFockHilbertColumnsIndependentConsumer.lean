import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5AOriginalFockHilbertColumns

/-!
Independent P3-D5A consumer. Exercise actual source Fock bounded-operator
column evaluation, inverse reconstruction, and trace-Hilbert equality.
No invented operator Hilbert instance or substitute Fock carrier.
-/

set_option autoImplicit false

namespace BFSSP3D5AOriginalFockHilbertColumnsIndependentConsumer
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3D5AOriginalFockHilbertColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Actual Hilbert columns coincide with source-Fock operator values. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : OriginalFockOp) (i : ι) :
    originalFockHilbertColumns b T i = T (b i) :=
  originalFockHilbertColumns_apply b T i

/-- Genuine original Fock bounded operator can be reconstructed from columns. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : OriginalFockOp) :
    (originalFockHilbertColumns b).symm
      (originalFockHilbertColumns b T) = T :=
  (originalFockHilbertColumns b).symm_apply_apply T

/-- Source trace-star pairing equals the finite PiLp 2 Hilbert pairing. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S T : OriginalFockOp) :
    ⟪originalFockHilbertColumns b S,
      originalFockHilbertColumns b T⟫_ℂ =
      originalFockTracePairing S T :=
  (originalFockTracePairing_eq_hilbertColumns_inner b S T).symm

#print axioms FCP.BFSSP3D5AOriginalFockHilbertColumns.originalFockHilbertColumns
#print axioms FCP.BFSSP3D5AOriginalFockHilbertColumns.originalFockHilbertColumns_apply
#print axioms FCP.BFSSP3D5AOriginalFockHilbertColumns.originalFockTracePairing_eq_hilbertColumns_inner

end
end BFSSP3D5AOriginalFockHilbertColumnsIndependentConsumer
