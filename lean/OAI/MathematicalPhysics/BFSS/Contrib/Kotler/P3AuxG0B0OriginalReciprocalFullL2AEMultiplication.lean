import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B2AOriginalReciprocalFullL2BoundedAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0AOriginalRadialGaugeInvariance

/-!
P3-AUX-G0B0 — TRUE ORIGINAL FullL2 2 reciprocal bounded operator AE action.

PROSPECTIVE: not qualified until exact cold-source, independent consumer,
and allowed-axiom CI. This is NOT an original physicalSpace preservation
or bosonic/fiber gauge commutation, 16 PiLp lift, weighted charge,
auxiliary Hamiltonian or spectral claim.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0AOriginalRadialScalar
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open MeasureTheory

/-- The genuine bounded operator from R0B2A acts a.e. as the source L∞
reciprocal factor times the true Fock L² representative. -/
theorem originalReciprocalFullL2CLM_ae_factor {ε : ℝ} (hε : 0 < ε)
    (f : FullL2 2) :
    (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        (originalReciprocalLpInf hε : Boson 2 → ℂ) x •
          (f : Boson 2 → Fermion 2) x) := by
  rw [originalReciprocalFullL2CLM_apply]
  exact Lp.coeFn_lpSMul (originalReciprocalLpInf hε) f

/-- The same exact operator acts a.e. by the literal original reciprocal
field, without substituting a surrogate bosonic measure/Fock module. -/
theorem originalReciprocalFullL2CLM_ae_originalField {ε : ℝ}
    (hε : 0 < ε) (f : FullL2 2) :
    (originalReciprocalFullL2CLM hε f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        originalReciprocalField ε x • (f : Boson 2 → Fermion 2) x) := by
  filter_upwards [originalReciprocalFullL2CLM_ae_factor hε f,
    originalReciprocalLpInf_ae hε] with x hB hb
  simpa only [hb] using hB

#print axioms originalReciprocalFullL2CLM_ae_factor
#print axioms originalReciprocalFullL2CLM_ae_originalField

end
end FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
