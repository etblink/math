import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4EFermionHilbertUnitaryProbe

/-!
# OP2a-A: literal original SU(2) BFSS Fock gauge action source binding

This module intentionally re-exports the genuine G4-E source homomorphism
without constructing an alternate Fock carrier. The exact 26-file dependency
closure comes from the pinned contribution commit.
The bridge to OP0's Module.End and the gauge-fixed projection is still OPEN.
-/
set_option autoImplicit false
namespace FCP.BFSSOriginalFockGaugeOP2A
noncomputable section
open OAI.BFSSQuantum

/-- Source-faithful, not an independently invented representation. -/
def originalFockGaugeUnitaryHom :
    GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2) :=
  FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom

theorem originalFockGaugeUnitaryHom_exact :
    originalFockGaugeUnitaryHom =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom := rfl

#print axioms FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom
#print axioms originalFockGaugeUnitaryHom_exact
end
end FCP.BFSSOriginalFockGaugeOP2A
