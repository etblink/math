import Mathlib.Analysis.InnerProductSpace.PiL2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D4OriginalFockCrossPairingColumns

/-!
# P3-D5A — original Fock finite Hilbert columns and source trace pairing

The accepted D3 exact original-operator column linear equivalence is
re-expressed in Mathlib's genuine finite Hilbert PiLp 2 carrier.
The accepted D4 source trace pairing becomes exactly that Hilbert inner
product. No change of norm or InnerProductSpace instance on original
operator-norm continuous endomorphisms is asserted.

This gate claims no original physical L² operator-valued field, gauge
intertwining, source Spin continuity, closed Hamiltonian, or eigenpair.
-/

set_option autoImplicit false

namespace FCP.BFSSP3D5AOriginalFockHilbertColumns
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3D3OriginalFockColumns
open FCP.BFSSP3D4OriginalFockCrossPairingColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Original bounded source Fock operators mapped to true finite
Hilbert columns, without replacing the operator norm on the source. -/
noncomputable def originalFockHilbertColumns
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockOp ≃ₗ[ℂ] PiLp 2 (fun _ : ι => Fermion 2) :=
  (originalFockColumns b).trans
    ((WithLp.linearEquiv 2 ℂ (ι → Fermion 2)).symm)

/-- The Hilbert column equivalence evaluates the genuine source
operator on the original orthonormal Fock basis. -/
@[simp] theorem originalFockHilbertColumns_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : OriginalFockOp) (i : ι) :
    originalFockHilbertColumns b T i = T (b i) := by
  rfl

/-- Exact pairing transfer: original trace-star pairing is the
PiLp 2 complex Hilbert inner product of the genuine Fock columns. -/
theorem originalFockTracePairing_eq_hilbertColumns_inner
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (S T : OriginalFockOp) :
    originalFockTracePairing S T =
      ⟪originalFockHilbertColumns b S,
        originalFockHilbertColumns b T⟫_ℂ := by
  simpa only [PiLp.inner_apply, originalFockHilbertColumns_apply,
    originalFockColumns_apply] using
      (originalFockTracePairing_eq_sum_columns b S T)

#print axioms originalFockHilbertColumns
#print axioms originalFockHilbertColumns_apply
#print axioms originalFockTracePairing_eq_hilbertColumns_inner

end
end FCP.BFSSP3D5AOriginalFockHilbertColumns
