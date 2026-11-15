import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CPauliTrace

/-!
# IBI-G0C-INV-PAULI — source-exact matrix inverse / Pauli trace interface

No new gauge model, spin cover, or Euler surjectivity assumption. The original
BFSS gauge group is the native special-unitary matrix subtype. This gate
identifies the original complex matrix inverse with the star operation and
transfers the already qualified G0C Pauli trace formula to inverse notation.
-/ 

set_option autoImplicit false

namespace FCP.BFSSIBIG0CInversePauli
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CPauliTrace

/-- Matrix inverse of the actual original BFSS SU(2) gauge matrix is its star.
This uses the *source* special-unitary membership proof, not a surrogate GL(2). -/
theorem sourceGaugeMatrix_inverse_eq_star (g : GaugeGroup 2) :
    (g : ColorMatrix 2)⁻¹ = star (g : ColorMatrix 2) := by
  have hu : (g : ColorMatrix 2) ∈ Matrix.unitaryGroup (Fin 2) ℂ :=
    (Matrix.mem_specialUnitaryGroup_iff.mp g.prop).1
  exact Matrix.inv_eq_left_inv (Matrix.mem_unitaryGroup_iff'.mp hu)

/-- Source-exact adjoint trace in inverse notation. This changes only the
notation for the original unitary inverse, not Pauli basis or index order. -/
theorem originalAdjointColorMatrix_pauliInverseTrace
    (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2)⁻¹))).re / 2 := by
  rw [sourceGaugeMatrix_inverse_eq_star]
  exact originalAdjointColorMatrix_pauliTrace g B A

#print axioms sourceGaugeMatrix_inverse_eq_star
#print axioms originalAdjointColorMatrix_pauliInverseTrace

end
end FCP.BFSSIBIG0CInversePauli
