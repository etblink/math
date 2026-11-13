import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B2OriginalReciprocalFermionGaugeCommutation
set_option autoImplicit false
namespace BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation

example {ε : ℝ} (hε : 0 < ε)
    (g : GaugeGroup 2) (f : FullL2 2) :
    originalReciprocalFullL2CLM hε
        (pairedGaugeData.fiberAction g f) =
      pairedGaugeData.fiberAction g
        (originalReciprocalFullL2CLM hε f) :=
  originalReciprocalFullL2CLM_fiberAction_comm hε g f

#print axioms FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation.originalReciprocalFullL2CLM_fiberAction_comm

end
end BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutationIndependentConsumer
