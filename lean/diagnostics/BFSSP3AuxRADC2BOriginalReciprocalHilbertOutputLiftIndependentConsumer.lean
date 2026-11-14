import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC2BOriginalReciprocalHilbertOutputLift
set_option autoImplicit false
namespace BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLiftIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift

example {ε : ℝ} (hε : 0 < ε)
    (y : PiLp 2 (fun _ : SpinIndex => FullL2 2)) (α : SpinIndex) :
    (originalMinimalHilbertOutputEquiv (N := 2)
      (originalReciprocalHilbertOutputCLM hε y)) α =
    originalReciprocalFullL2CLM hε
      ((originalMinimalHilbertOutputEquiv (N := 2) y) α) :=
  originalReciprocalHilbertOutputCLM_coordinate hε y α

example {ε : ℝ} (hε : 0 < ε)
    (y z : PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (hyz : originalReciprocalHilbertOutputCLM hε y =
      originalReciprocalHilbertOutputCLM hε z) : y = z :=
  originalReciprocalHilbertOutputCLM_injective hε hyz

#print axioms FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM
#print axioms FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM_coordinate
#print axioms FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM_injective
end
end BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLiftIndependentConsumer
