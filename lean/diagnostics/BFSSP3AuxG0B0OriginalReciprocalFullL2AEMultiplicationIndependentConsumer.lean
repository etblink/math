import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B0OriginalReciprocalFullL2AEMultiplication
set_option autoImplicit false
namespace BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplicationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example : OriginalChargeOutput =
    PiLp 2 (fun _ : SpinIndex => FullL2 2) := rfl

example {ε : ℝ} (hε : 0 < ε) (f : FullL2 2) :
    (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        (originalReciprocalLpInf hε : Boson 2 → ℂ) x •
          (f : Boson 2 → Fermion 2) x) :=
  originalReciprocalFullL2CLM_ae_factor hε f

example {ε : ℝ} (hε : 0 < ε) (f : FullL2 2) :
    (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        originalReciprocalField ε x • (f : Boson 2 → Fermion 2) x) :=
  originalReciprocalFullL2CLM_ae_originalField hε f

#print axioms FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication.originalReciprocalFullL2CLM_ae_factor
#print axioms FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication.originalReciprocalFullL2CLM_ae_originalField

end
end BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplicationIndependentConsumer
