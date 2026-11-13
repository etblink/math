import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B1OriginalReciprocalLpInfinity

/-!
P3-AUX-G0A: original pairedGaugeData, original Boson 2 source, radial
regularization and its L∞ reciprocal are gauge invariant.

PROSPECTIVE / UNQUALIFIED UNTIL EXACT STRICT GREEN.
Does not construct a Gauss generator, operator commutator, physical
projection commutator, weighted charge, auxiliary Hamiltonian or gap.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open MeasureTheory

theorem originalRadialWeight_gauge_invariant (ε : ℝ)
    (g : GaugeGroup 2) (x : Boson 2) :
    originalRadialWeight ε (pairedGaugeData.boson g x) =
      originalRadialWeight ε x := by
  unfold originalRadialWeight
  rw [(pairedGaugeData.boson g).norm_map x]

theorem originalReciprocalField_gauge_invariant (ε : ℝ)
    (g : GaugeGroup 2) (x : Boson 2) :
    originalReciprocalField ε (pairedGaugeData.boson g x) =
      originalReciprocalField ε x := by
  unfold originalReciprocalField
  rw [originalRadialWeight_gauge_invariant ε g x]

theorem originalReciprocalLpInf_ae_gauge {ε : ℝ} (hε : 0 < ε)
    (g : GaugeGroup 2) :
    (fun x : Boson 2 =>
      (originalReciprocalLpInf hε : Boson 2 → ℂ)
        (pairedGaugeData.boson g x)) =ᵐ[volume]
    (originalReciprocalLpInf hε : Boson 2 → ℂ) := by
  have hcompose := (originalReciprocalLpInf_ae hε).comp_tendsto
    ((pairedGaugeData.boson g).measurePreserving.quasiMeasurePreserving.tendsto_ae)
  filter_upwards [hcompose, originalReciprocalLpInf_ae hε] with x hx hy
  calc
    (originalReciprocalLpInf hε : Boson 2 → ℂ)
        (pairedGaugeData.boson g x) =
      originalReciprocalField ε (pairedGaugeData.boson g x) := hx
    _ = originalReciprocalField ε x :=
      originalReciprocalField_gauge_invariant ε g x
    _ = (originalReciprocalLpInf hε : Boson 2 → ℂ) x := hy.symm

#print axioms originalRadialWeight_gauge_invariant
#print axioms originalReciprocalField_gauge_invariant
#print axioms originalReciprocalLpInf_ae_gauge
end
end FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance
