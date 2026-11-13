import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B1OriginalReciprocalBosonGaugeCommutation
set_option autoImplicit false
namespace BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation

example {ε : ℝ} (hε : 0 < ε)
    (g : GaugeGroup 2) (f : FullL2 2) :
    originalReciprocalFullL2CLM hε
        (pairedGaugeData.bosonPullback g f) =
      pairedGaugeData.bosonPullback g (originalReciprocalFullL2CLM hε f) :=
  originalReciprocalFullL2CLM_bosonPullback_comm hε g f

#print axioms FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation.originalReciprocalFullL2CLM_bosonPullback_comm

end
end BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutationIndependentConsumer
