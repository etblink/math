import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B0OriginalReciprocalFullL2AEMultiplication

/-!
P3-AUX-G0B1: genuine original FullL2 2 reciprocal bounded operator
commutes with the exact pairedGaugeData BOSONIC gauge pullback.

PROSPECTIVE / UNQUALIFIED. No fermion fiber-action commutation,
physicalSpace theorem, Haar projection or spectral conclusion is asserted.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open MeasureTheory

/-- For the true source SU(2) bosonic action, its inverse convention is
handled by the source bosonPullback g rather than inventing another action. -/
theorem originalReciprocalFullL2CLM_bosonPullback_comm
    {ε : ℝ} (hε : 0 < ε) (g : GaugeGroup 2) (f : FullL2 2) :
    originalReciprocalFullL2CLM hε
        (pairedGaugeData.bosonPullback g f) =
      pairedGaugeData.bosonPullback g
        (originalReciprocalFullL2CLM hε f) := by
  apply Lp.ext
  have hBleft :=
    originalReciprocalFullL2CLM_ae_originalField hε
      (pairedGaugeData.bosonPullback g f)
  have hPullF :=
    Lp.coeFn_compMeasurePreserving f
      (pairedGaugeData.boson g).measurePreserving
  have hPullB :=
    Lp.coeFn_compMeasurePreserving (originalReciprocalFullL2CLM hε f)
      (pairedGaugeData.boson g).measurePreserving
  have hBright := (originalReciprocalFullL2CLM_ae_originalField hε f).comp_tendsto
    ((pairedGaugeData.boson g).measurePreserving.quasiMeasurePreserving.tendsto_ae)
  filter_upwards [hBleft, hPullF, hPullB, hBright] with x hb hf hp hbr
  calc
    (originalReciprocalFullL2CLM hε
        (pairedGaugeData.bosonPullback g f) : Boson 2 → Fermion 2) x =
      originalReciprocalField ε x •
        (pairedGaugeData.bosonPullback g f : Boson 2 → Fermion 2) x := hb
    _ = originalReciprocalField ε x •
        (f : Boson 2 → Fermion 2) (pairedGaugeData.boson g x) := by rw [hf]
    _ = originalReciprocalField ε (pairedGaugeData.boson g x) •
        (f : Boson 2 → Fermion 2) (pairedGaugeData.boson g x) := by
          rw [originalReciprocalField_gauge_invariant ε g x]
    _ = (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2)
        (pairedGaugeData.boson g x) := hbr.symm
    _ = (pairedGaugeData.bosonPullback g
        (originalReciprocalFullL2CLM hε f) : Boson 2 → Fermion 2) x := hp.symm

#print axioms originalReciprocalFullL2CLM_bosonPullback_comm

end
end FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation
