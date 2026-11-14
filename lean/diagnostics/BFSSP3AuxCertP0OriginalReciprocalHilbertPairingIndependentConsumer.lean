import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxCertP0OriginalReciprocalHilbertPairing
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent actual original SU2 FullL2/PiLp and physical-domain graph consumer. -/
set_option autoImplicit false
namespace BFSSP3AuxCertP0OriginalReciprocalHilbertPairingIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (ε : ℝ) (x : Boson 2) :
    starRingEnd ℂ (originalReciprocalField ε x) =
      originalReciprocalField ε x :=
  originalReciprocalField_conj ε x

example {ε : ℝ} (hε : 0 < ε) (f g : FullL2 2) :
    inner ℂ (originalReciprocalFullL2CLM hε f) g =
      inner ℂ f (originalReciprocalFullL2CLM hε g) :=
  originalReciprocalFullL2CLM_inner hε f g

example {ε : ℝ} (hε : 0 < ε)
    (f g : PiLp 2 (fun _ : SpinIndex => FullL2 2)) :
    inner ℂ (originalReciprocalHilbertOutputCLM hε f) g =
      inner ℂ f (originalReciprocalHilbertOutputCLM hε g) :=
  originalReciprocalHilbertOutputCLM_inner hε f g

example {ε : ℝ} (hε : 0 < ε) (f g : pairedGaugeData.physicalSpace) :
    inner ℂ (originalReciprocalFullL2CLM hε (f : FullL2 2)) (g : FullL2 2) =
      inner ℂ (f : FullL2 2) (originalReciprocalFullL2CLM hε (g : FullL2 2)) :=
  originalReciprocalFullL2CLM_inner hε (f : FullL2 2) (g : FullL2 2)

example {ε : ℝ} (hε : 0 < ε)
    (t : (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain)
    (z y : PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (hz : ((t : pairedGaugeData.physicalSpace), z) ∈
      (originalWeightedPhysicalChargeColumn pairedAlgebraData pairedGaugeData hε).graph) :
    inner ℂ (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData t) y =
      inner ℂ z (originalReciprocalHilbertOutputCLM hε y) :=
  originalWeightedChargeGraph_pairing pairedAlgebraData pairedGaugeData hε t z y hz

#print axioms FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing.originalReciprocalField_conj
#print axioms FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing.originalReciprocalFullL2CLM_inner
#print axioms FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing.originalReciprocalHilbertOutputCLM_inner
#print axioms FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing.originalWeightedChargeGraph_pairing
#print axioms FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication.originalReciprocalFullL2CLM_ae_originalField
#print axioms FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM_coordinate
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_graph_eq
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph_mem_iff

end
end BFSSP3AuxCertP0OriginalReciprocalHilbertPairingIndependentConsumer
