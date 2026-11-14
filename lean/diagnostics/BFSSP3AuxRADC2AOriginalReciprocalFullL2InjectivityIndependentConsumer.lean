import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC2AOriginalReciprocalFullL2Injectivity
set_option autoImplicit false
namespace BFSSP3AuxRADC2AOriginalReciprocalFullL2InjectivityIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity

example {ε : ℝ} (hε : 0 < ε) (f g : FullL2 2)
    (hfg : originalReciprocalFullL2CLM hε f =
      originalReciprocalFullL2CLM hε g) : f = g :=
  originalReciprocalFullL2CLM_injective hε hfg

#print axioms FCP.BFSSP3AuxRADC2AOriginalReciprocalFullL2Injectivity.originalReciprocalFullL2CLM_injective
end
end BFSSP3AuxRADC2AOriginalReciprocalFullL2InjectivityIndependentConsumer
