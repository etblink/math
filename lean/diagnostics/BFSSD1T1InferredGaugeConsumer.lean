import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S1OriginalFrequencyGaugeTransportProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1T1/B — type inference test of exact source D1S1 theorem.

D1T0 previously failed at a FULLY RESTATED, explicit consumer proposition.
Here the type is inferred from the named source proof. This is a diagnostic
re-export and NOT an independently qualified public-name theorem.

No axioms, sorry, substitute model, or recursion-limit change.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1T1Consumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData

/-- Diagnostic A: infer the entire proposition of the already-compiled
source theorem instead of elaborating the full proposition again. -/
theorem inferred_source_reference : _ :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge

/-- Diagnostic B: infer the proposition after applying source theorem
to each literal original-carrier argument; still a re-export. -/
theorem inferred_source_application
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) : _ :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge g K v

/-- Retain the original real source matrix mapping as a small,
separate interface; avoid restating the large gauge proposition. -/
theorem exact_transport_reference
    (g : GaugeGroup 2) (K : FrequencyMatrix 2)
    (p q : FrequencyIndex 2) :
    FCP.BFSSHopfD1S1.sourceTransportFrequency g K p q =
      ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
        K (p.1,A) (q.1,B) *
          (M.adjointCoefficient g A p.2 *
            M.adjointCoefficient g B q.2) :=
  FCP.BFSSHopfD1S1.sourceTransportFrequency_apply g K p q

/-- Independently confirm that typed M/G still name literal BFSS. -/
theorem exact_original_gauge_name (g : GaugeGroup 2) :
    G.fermion g = pairedGaugeData.fermion g := rfl

theorem exact_original_quantizer_name (K : FrequencyMatrix 2) :
    M.quantizeFrequency K = pairedAlgebraData.quantizeFrequency K := rfl

#print axioms inferred_source_reference
#print axioms inferred_source_application
#print axioms exact_transport_reference
#print axioms exact_original_gauge_name
#print axioms exact_original_quantizer_name

end
end FCP.BFSSHopfD1T1Consumer
