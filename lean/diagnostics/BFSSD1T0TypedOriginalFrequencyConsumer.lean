import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S1OriginalFrequencyGaugeTransportProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1T0 — typed independent consumer recovery for the accepted native-source
D1S1 real 48-index quantizeFrequency gauge covariance theorem.

No D1S1 source edit and no D1S1 R3 retry. Match the exact typed original
AlgebraData/GaugeData interfaces before checking the original theorem;
prove the connection to literal original source names in separate small
definitional tests. This file is PROSPECTIVE until strict CI qualifies.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1T0Consumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData

/-- Independently consume the exact real original frequency-index map. -/
theorem typed_frequency_transport
    (g : GaugeGroup 2) (K : FrequencyMatrix 2)
    (p q : FrequencyIndex 2) :
    FCP.BFSSHopfD1S1.sourceTransportFrequency g K p q =
      ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
        K (p.1, A) (q.1, B) *
          (M.adjointCoefficient g A p.2 *
            M.adjointCoefficient g B q.2) :=
  FCP.BFSSHopfD1S1.sourceTransportFrequency_apply g K p q

/-- The same ORIGINAL source operator and unitary theorem, with
small typed names rather than fully expanded source structures. -/
theorem typed_original_frequency_gauge
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) :
    G.fermion g ((M.quantizeFrequency K) v) =
      (M.quantizeFrequency
        (FCP.BFSSHopfD1S1.sourceTransportFrequency g K))
          (G.fermion g v) :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge g K v

/-- The typed G is definitionally the *literal original* G4J action. -/
theorem exact_original_fermion_alias (g : GaugeGroup 2) :
    G.fermion g = pairedGaugeData.fermion g := rfl

/-- The typed M is definitionally the *literal original* quantizer. -/
theorem exact_original_quantizer_alias (K : FrequencyMatrix 2) :
    M.quantizeFrequency K =
      pairedAlgebraData.quantizeFrequency K := rfl

#print axioms typed_frequency_transport
#print axioms typed_original_frequency_gauge
#print axioms exact_original_fermion_alias
#print axioms exact_original_quantizer_alias

end
end FCP.BFSSHopfD1T0Consumer
