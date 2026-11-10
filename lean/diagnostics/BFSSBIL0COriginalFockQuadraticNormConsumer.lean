import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0COriginalFockQuadraticGaugeInvariant

/-!
# BIL-0C independent original-Fock norm consumer

Consume both genuine G4E source Fock unitarity and the BIL-0C finite
weighted quadratic commutation theorem. This checks a physically
typed original-Fock norm consequence, not just a textual repeat of
the operator commutation equality. No physical L2 or Hamiltonian claim.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0COriginalFockQuadraticNormConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant

/-- Gauge transformation of the input leaves the original Fock norm
of any real-spinor-coefficient quadratic observable unchanged. -/
theorem originalColorQuadratic_norm_gauge_invariant
    (g : GaugeGroup 2) (J : Matrix SpinIndex SpinIndex ℝ)
    (v : Fermion 2) :
    ‖originalColorQuadratic J (fermionGaugeUnitaryHom g v)‖ =
      ‖originalColorQuadratic J v‖ := by
  calc
    _ = ‖fermionGaugeUnitaryHom g (originalColorQuadratic J v)‖ := by
      rw [originalColorQuadratic_gauge_commutes g J v]
    _ = ‖originalColorQuadratic J v‖ :=
      (fermionGaugeUnitaryHom g).norm_map (originalColorQuadratic J v)

#print axioms FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant.originalColorQuadratic_gauge_commutes
#print axioms originalColorQuadratic_norm_gauge_invariant

end
end FCP.BFSSBIL0COriginalFockQuadraticNormConsumer
