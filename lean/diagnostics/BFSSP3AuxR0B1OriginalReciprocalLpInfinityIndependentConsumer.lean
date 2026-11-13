import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B1OriginalReciprocalLpInfinity
set_option autoImplicit false
namespace BFSSP3AuxR0B1OriginalReciprocalLpInfinityIndependentConsumer
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open MeasureTheory
example : OriginalChargeOutput = PiLp 2 (fun _ : SpinIndex => FullL2 2) := rfl
example {ε : ℝ} (hε : 0 < ε) :
    MemLp (originalReciprocalField ε) ∞
      (volume : Measure (Boson 2)) :=
  originalReciprocalField_memLp_infty hε
example {ε : ℝ} (hε : 0 < ε) :
    (originalReciprocalLpInf hε : Boson 2 → ℂ) =ᵐ[volume]
      originalReciprocalField ε :=
  originalReciprocalLpInf_ae hε
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalRadialWeight_continuous
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalField_continuous
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalField_norm_le
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalField_memLp_infty
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalLpInf
#print axioms FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalLpInf_ae
end BFSSP3AuxR0B1OriginalReciprocalLpInfinityIndependentConsumer
