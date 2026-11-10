import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-!
# C48-1A1d0 independent downstream consumer: exact Fermion 2 norm transport

Consume the new, separately compiled original Fock-unitary axis
intertwiner to derive a distinct norm equality using the actual
G4E LinearIsometryEquiv, not a made-up Clifford implementer.
The original Hamiltonian, full-gauge Hilbert space and spectral
confinement remain beyond this source-level theorem.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisNormConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Genuine G4E isometric transport preserves the norm of an original
normalized Gamma axis after the *same source* S1J gauge matrix action. -/
theorem originalGaugeUnitary_S1J_gamma_axis_norm
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) (ψ : Fermion 2) :
    ‖(sourceGammaRealLinear
      ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
        (sourceBlockColorAxis (j,s) A)))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)‖ =
      ‖(sourceGammaRealLinear (sourceBlockColorAxis (j,s) A)) ψ‖ := by
  rw [← FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward]
  exact LinearIsometryEquiv.norm_map
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q)
    ((sourceGammaRealLinear (sourceBlockColorAxis (j,s) A)) ψ)

#print axioms FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward
#print axioms originalGaugeUnitary_S1J_gamma_axis_norm

end
end FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisNormConsumer
