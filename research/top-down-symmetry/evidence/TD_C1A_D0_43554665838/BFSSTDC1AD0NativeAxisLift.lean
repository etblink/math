import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AD0NativeCarrierEvaluationInterface

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

theorem native_axis_lift
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2) (a : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) *
        sourceGammaRealLinear (sourceBlockColorAxis (j, s) a) =
      sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j, s) a)) *
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q : Fermion 2 →L[ℂ] Fermion 2) := by
  let U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2 :=
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
  let A : Fermion 2 →L[ℂ] Fermion 2 :=
    sourceGammaRealLinear (sourceBlockColorAxis (j, s) a)
  let B : Fermion 2 →L[ℂ] Fermion 2 :=
    sourceGammaRealLinear
      ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
        (sourceBlockColorAxis (j, s) a))
  have hs : ∀ ψ : Fermion 2, U (A ψ) = B (U ψ) := by
    intro ψ
    trace_state
    exact FCP.BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.originalGaugeUnitary_S1J_gamma_axis_forward q j s a ψ
  trace_state
  exact FCP.BFSSTDC1AD0NativeCarrierEvaluationInterface.native_operator_of_pointwise U A B hs

#print axioms native_axis_lift

end
end FCP.BFSSTDC1AD0
