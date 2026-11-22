import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM1AOriginalMasslessFockGaugeAETransport

/-!
GM1A independent source-exact original paired BFSS FullL2 consumer.
Checks actual massless Fock a.e. gauge-transport root only.
-/
set_option autoImplicit false
namespace FCP.BFSSGM1AIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

theorem pairedSourceMasslessActionGaugeAETransport
    (g : GaugeGroup 2) (ψ : FullL2 2) :
    FCP.BFSSMasslessD0b0.originalMasslessAction
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ ψ)) =ᵐ[volume]
    (fun x : Boson 2 =>
      FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g
        (FCP.BFSSMasslessD0b0.originalMasslessAction
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ
            (FCP.BFSSSU2GaugeG4J.pairedGaugeData.boson g⁻¹ x))) :=
  FCP.BFSSGM1A.pairedOriginalMasslessAction_gauge_ae_transport g ψ

#print axioms pairedSourceMasslessActionGaugeAETransport
end FCP.BFSSGM1AIndependent
