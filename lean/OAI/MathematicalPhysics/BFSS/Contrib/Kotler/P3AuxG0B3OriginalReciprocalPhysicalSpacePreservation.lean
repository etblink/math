import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B2OriginalReciprocalFermionGaugeCommutation

/-!
P3-AUX-G0B3 R1: original SU(2) Gauss-fixed physicalSpace preservation
under the original bounded FullL2 2 reciprocal multiplier.

This is a narrow compatibility theorem. It neither constructs a
sixteen-output multiplier nor asserts commutation with an orthogonal
projection, a weighted closed operator, or a spectral gap.
Strict source/independent-consumer qualification is required.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservation
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B1OriginalReciprocalBosonGaugeCommutation
open FCP.BFSSP3AuxG0B2OriginalReciprocalFermionGaugeCommutation

/-- On the genuine original FullL2 2 carrier, the reciprocal operator
preserves the literal Gauss physicalSpace intersection of kernels.
The proof uses exactly the separately qualified boson and fermion
commutation theorems, with the same source group parameter g. -/
theorem originalReciprocalFullL2CLM_preserves_physicalSpace
    {ε : ℝ} (hε : 0 < ε) {f : FullL2 2}
    (hf : f ∈ pairedGaugeData.physicalSpace) :
    originalReciprocalFullL2CLM hε f ∈ pairedGaugeData.physicalSpace := by
  apply (Submodule.mem_iInf _).2
  intro g
  have hphys :
      pairedGaugeData.bosonPullback g f =
        pairedGaugeData.fiberAction g f := by
    have hh := (Submodule.mem_iInf _).mp hf g
    exact sub_eq_zero.mp hh
  change (pairedGaugeData.bosonPullback g -
      pairedGaugeData.fiberAction g)
        (originalReciprocalFullL2CLM hε f) = 0
  rw [LinearMap.sub_apply]
  apply sub_eq_zero.mpr
  calc
    pairedGaugeData.bosonPullback g (originalReciprocalFullL2CLM hε f) =
        originalReciprocalFullL2CLM hε
          (pairedGaugeData.bosonPullback g f) :=
      (originalReciprocalFullL2CLM_bosonPullback_comm hε g f).symm
    _ = originalReciprocalFullL2CLM hε
          (pairedGaugeData.fiberAction g f) :=
      congrArg (fun v : FullL2 2 => originalReciprocalFullL2CLM hε v) hphys
    _ = pairedGaugeData.fiberAction g (originalReciprocalFullL2CLM hε f) :=
      originalReciprocalFullL2CLM_fiberAction_comm hε g f

#print axioms originalReciprocalFullL2CLM_preserves_physicalSpace

end
end FCP.BFSSP3AuxG0B3OriginalReciprocalPhysicalSpacePreservation
