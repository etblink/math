import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem direct_axis (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2) (a : ColorIndex 2)
    (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear (sourceBlockColorAxis (j, s) a)) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) := by
  trace_state
  exact FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward q j s a ψ

#print axioms direct_axis

end
end FCP.BFSSTDC1AD0
