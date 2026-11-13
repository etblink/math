import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B2AOriginalReciprocalFullL2BoundedAction
set_option autoImplicit false
namespace BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedActionIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl
example : OriginalChargeOutput =
    PiLp 2 (fun _ : SpinIndex => FullL2 2) := rfl
example {ε : ℝ} (hε : 0 < ε) :
    FullL2 2 →L[ℂ] FullL2 2 :=
  originalReciprocalFullL2CLM hε
example {ε : ℝ} (hε : 0 < ε) (f : FullL2 2) :
    ‖originalReciprocalFullL2Linear hε f‖ ≤
      ‖originalReciprocalLpInf hε‖ * ‖f‖ :=
  originalReciprocalFullL2Linear_norm_le hε f
example {ε : ℝ} (hε : 0 < ε) (f : FullL2 2) :
    originalReciprocalFullL2CLM hε f =
      originalReciprocalLpInf hε • f :=
  originalReciprocalFullL2CLM_apply hε f

#print axioms FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction.originalReciprocalFullL2Linear
#print axioms FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction.originalReciprocalFullL2Linear_apply
#print axioms FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction.originalReciprocalFullL2Linear_norm_le
#print axioms FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction.originalReciprocalFullL2CLM
#print axioms FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction.originalReciprocalFullL2CLM_apply
end BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedActionIndependentConsumer
