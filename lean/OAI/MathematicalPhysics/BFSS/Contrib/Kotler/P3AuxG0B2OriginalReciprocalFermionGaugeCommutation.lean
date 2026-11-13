import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B1OriginalReciprocalBosonGaugeCommutation

/-!
P3-AUX-G0B2 — original FullL2 2 reciprocal bounded operator commutes
with the exact pairedGaugeData FERMIONIC fiber SU(2) gauge action.

PROSPECTIVE/UNQUALIFIED until exact strict source, native consumer and
standard proof audit pass. Does not assert physicalSpace preservation, combined
gauge action, Haar, infinitesimal Gauss, weighted H or spectral gap.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open MeasureTheory

/-- The TRUE original BFSS Fock-fiber action is complex linear, and
therefore commutes with scalar reciprocal multiplication at every point
up to the exact source L² AE representative equations. -/
theorem originalReciprocalFullL2CLM_fiberAction_comm
    {ε : ℝ} (hε : 0 < ε) (g : GaugeGroup 2) (f : FullL2 2) :
    originalReciprocalFullL2CLM hε
        (pairedGaugeData.fiberAction g f) =
      pairedGaugeData.fiberAction g
        (originalReciprocalFullL2CLM hε f) := by
  apply Lp.ext
  have hLeft :=
    originalReciprocalFullL2CLM_ae_originalField hε
      (pairedGaugeData.fiberAction g f)
  have hFiberF :=
    ContinuousLinearMap.coeFn_compLp
      (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap f
  have hFiberB :=
    ContinuousLinearMap.coeFn_compLp
      (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
      (originalReciprocalFullL2CLM hε f)
  have hRight := originalReciprocalFullL2CLM_ae_originalField hε f
  filter_upwards [hLeft, hFiberF, hFiberB, hRight] with x hl hf hb hr
  calc
    (originalReciprocalFullL2CLM hε
        (pairedGaugeData.fiberAction g f) : Boson 2 → Fermion 2) x =
      originalReciprocalField ε x •
        (pairedGaugeData.fiberAction g f : Boson 2 → Fermion 2) x := hl
    _ = originalReciprocalField ε x •
        pairedGaugeData.fermion g ((f : Boson 2 → Fermion 2) x) := by
          exact congrArg
            (fun v : Fermion 2 => originalReciprocalField ε x • v) hf
    _ = pairedGaugeData.fermion g
        (originalReciprocalField ε x • (f : Boson 2 → Fermion 2) x) := by
          rw [map_smul]
    _ = pairedGaugeData.fermion g
        ((originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) x) :=
          congrArg (pairedGaugeData.fermion g) hr.symm
    _ = (pairedGaugeData.fiberAction g
        (originalReciprocalFullL2CLM hε f) : Boson 2 → Fermion 2) x := hb.symm

#print axioms originalReciprocalFullL2CLM_fiberAction_comm

end
end FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation
