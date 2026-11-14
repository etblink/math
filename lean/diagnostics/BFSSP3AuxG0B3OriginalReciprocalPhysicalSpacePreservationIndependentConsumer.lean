import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B3OriginalReciprocalPhysicalSpacePreservation
set_option autoImplicit false
namespace BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservation

example {ε : ℝ} (hε : 0 < ε)
    {f : FullL2 2} (hf : f ∈ pairedGaugeData.physicalSpace) :
    originalReciprocalFullL2CLM hε f ∈ pairedGaugeData.physicalSpace :=
  originalReciprocalFullL2CLM_preserves_physicalSpace hε hf

#print axioms FCP.BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservation.originalReciprocalFullL2CLM_preserves_physicalSpace

end
end BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservationIndependentConsumer
