import Mathlib.MeasureTheory.Function.Holder
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxR0B1OriginalReciprocalLpInfinity

/-!
P3-AUX-R0B2A, PROSPECTIVE. Genuine bounded complex-linear reciprocal
action on original FullL2 2. Not a 16-column action, inverse-graph
weighted charge, Hamiltonian, domain or spectral claim.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open MeasureTheory

noncomputable def originalReciprocalFullL2Linear {ε : ℝ} (hε : 0 < ε) :
    FullL2 2 →ₗ[ℂ] FullL2 2 where
  toFun f := originalReciprocalLpInf hε • f
  map_add' f g := by
    exact Lp.add_smul (originalReciprocalLpInf hε) f g
  map_smul' c f := by
    exact (Lp.smul_comm c (originalReciprocalLpInf hε) f).symm

theorem originalReciprocalFullL2Linear_apply {ε : ℝ} (hε : 0 < ε)
    (f : FullL2 2) :
    originalReciprocalFullL2Linear hε f =
      originalReciprocalLpInf hε • f := rfl

theorem originalReciprocalFullL2Linear_norm_le {ε : ℝ} (hε : 0 < ε)
    (f : FullL2 2) :
    ‖originalReciprocalFullL2Linear hε f‖ ≤
      ‖originalReciprocalLpInf hε‖ * ‖f‖ := by
  change ‖originalReciprocalLpInf hε • f‖ ≤
    ‖originalReciprocalLpInf hε‖ * ‖f‖
  exact Lp.norm_smul_le (originalReciprocalLpInf hε) f

noncomputable def originalReciprocalFullL2CLM {ε : ℝ} (hε : 0 < ε) :
    FullL2 2 →L[ℂ] FullL2 2 :=
  (originalReciprocalFullL2Linear hε).mkContinuous
    ‖originalReciprocalLpInf hε‖
    (originalReciprocalFullL2Linear_norm_le hε)

theorem originalReciprocalFullL2CLM_apply {ε : ℝ} (hε : 0 < ε)
    (f : FullL2 2) :
    originalReciprocalFullL2CLM hε f =
      originalReciprocalLpInf hε • f := rfl

#print axioms originalReciprocalFullL2Linear
#print axioms originalReciprocalFullL2Linear_apply
#print axioms originalReciprocalFullL2Linear_norm_le
#print axioms originalReciprocalFullL2CLM
#print axioms originalReciprocalFullL2CLM_apply
end
end FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
