import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S1OriginalFrequencyGaugeTransportProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-! D1S1 independent ORIGINAL source quantizer and GaugeData consumer. -/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S1Consumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

theorem original_frequency_transport
    (g : GaugeGroup 2) (K : FrequencyMatrix 2)
    (p q : FrequencyIndex 2) :
    FCP.BFSSHopfD1S1.sourceTransportFrequency g K p q =
      ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
        K (p.1, A) (q.1, B) *
          (pairedAlgebraData.adjointCoefficient g A p.2 *
            pairedAlgebraData.adjointCoefficient g B q.2) :=
  FCP.BFSSHopfD1S1.sourceTransportFrequency_apply g K p q

theorem original_frequency_gauge
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) :
    pairedGaugeData.fermion g
      ((pairedAlgebraData.quantizeFrequency K) v) =
      (pairedAlgebraData.quantizeFrequency
        (FCP.BFSSHopfD1S1.sourceTransportFrequency g K))
          (pairedGaugeData.fermion g v) :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge g K v

#print axioms original_frequency_transport
#print axioms original_frequency_gauge

end
end FCP.BFSSHopfD1S1Consumer
