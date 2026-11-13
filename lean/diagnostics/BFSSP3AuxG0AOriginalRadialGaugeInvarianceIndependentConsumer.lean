import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0AOriginalRadialGaugeInvariance
set_option autoImplicit false
namespace BFSSP3AuxG0AOriginalRadialGaugeInvarianceIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance
open MeasureTheory

example (ε : ℝ) (g : GaugeGroup 2) (x : Boson 2) :
    originalRadialWeight ε (pairedGaugeData.boson g x) =
      originalRadialWeight ε x :=
  originalRadialWeight_gauge_invariant ε g x

example (ε : ℝ) (g : GaugeGroup 2) (x : Boson 2) :
    originalReciprocalField ε (pairedGaugeData.boson g x) =
      originalReciprocalField ε x :=
  originalReciprocalField_gauge_invariant ε g x

example {ε : ℝ} (hε : 0 < ε) (g : GaugeGroup 2) :
    (fun x : Boson 2 =>
      (originalReciprocalLpInf hε : Boson 2 → ℂ)
        (pairedGaugeData.boson g x)) =ᵐ[volume]
      (originalReciprocalLpInf hε : Boson 2 → ℂ) :=
  originalReciprocalLpInf_ae_gauge hε g

#print axioms FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalRadialWeight_gauge_invariant
#print axioms FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalReciprocalField_gauge_invariant
#print axioms FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalReciprocalLpInf_ae_gauge

end
end BFSSP3AuxG0AOriginalRadialGaugeInvarianceIndependentConsumer
