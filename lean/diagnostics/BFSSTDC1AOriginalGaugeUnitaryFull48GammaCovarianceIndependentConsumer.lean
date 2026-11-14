import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AOriginalGaugeUnitaryFull48GammaCovariance

/-! Native independent original Fock-vector consumer; no proxy action. -/
set_option autoImplicit false
namespace BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovarianceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovariance

example (q : GaugeGroup 2) (v : Source48Vector) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        ((sourceGammaRealLinear v) ψ) =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ) :=
  originalGaugeUnitary_S1J_gamma_allVector_forward q v ψ

#print axioms FCP.BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovariance.originalGaugeUnitary_S1J_gamma_allVector_forward

end
end BFSSTDC1AOriginalGaugeUnitaryFull48GammaCovarianceIndependentConsumer
