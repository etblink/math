import SU2BFSSPhysicalDomainS3IActualFockPlaneFlowGaugeCommutationProbe

/-!
# S3K0 — true source Fock spin-plane flow lifted to the original FullL2 2

Uses the genuine S3H unitary and Mathlib's existing compLpL API.
Fock isometry packaging is definitionally identical to the S3H operator.
No physical-subspace, Hamiltonian, domain, or spectral claim.
-/

namespace FCP.BFSSSU2PhysicalDomainS3K0
noncomputable section
open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainS3H
open FCP.BFSSSU2PhysicalDomainS3I

/-- The exact S3H fermionic spin operator as a complex-linear isometry. -/
noncomputable def sourceSpinFockIsometry
    (i j : SpaceIndex) (t : ℝ) : Fermion 2 →ₗᵢ[ℂ] Fermion 2 where
  toLinearMap := (pairedFermionPlaneSpinFlow i j t).toLinearMap
  norm_map' := pairedFermionPlaneSpinFlow_norm i j t

theorem sourceSpinFockIsometry_apply
    (i j : SpaceIndex) (t : ℝ) (w : Fermion 2) :
    sourceSpinFockIsometry i j t w =
      pairedFermionPlaneSpinFlow i j t w := rfl

/-- Original Fock flow, applied pointwise on the original BFSS FullL2 2.
No auxiliary Hilbert space, alternate Fock representation, or axioms. -/
noncomputable def sourceSpinFullL2CLM
    (i j : SpaceIndex) (t : ℝ) : FullL2 2 →L[ℂ] FullL2 2 :=
  ((sourceSpinFockIsometry i j t).toContinuousLinearMap).compLpL
    2 (volume : Measure (Boson 2))

theorem sourceSpinFullL2CLM_apply
    (i j : SpaceIndex) (t : ℝ) (v : FullL2 2) :
    sourceSpinFullL2CLM i j t v =
      ((sourceSpinFockIsometry i j t).toContinuousLinearMap).compLp v := rfl

/-- The source spin flow is norm nonexpansive on ambient original FullL2. -/
theorem sourceSpinFullL2CLM_norm_le
    (i j : SpaceIndex) (t : ℝ) (v : FullL2 2) :
    ‖sourceSpinFullL2CLM i j t v‖ ≤ ‖v‖ := by
  change ‖((sourceSpinFockIsometry i j t).toContinuousLinearMap).compLp v‖ ≤ ‖v‖
  have hnorm :
      ‖(sourceSpinFockIsometry i j t).toContinuousLinearMap‖ ≤ (1 : ℝ) := by
    apply ContinuousLinearMap.opNorm_le_bound _ (by norm_num)
    intro w
    change ‖sourceSpinFockIsometry i j t w‖ ≤ (1 : ℝ) * ‖w‖
    simp only [LinearIsometry.norm_map, one_mul, le_refl]
  calc
    ‖((sourceSpinFockIsometry i j t).toContinuousLinearMap).compLp v‖ ≤
        ‖(sourceSpinFockIsometry i j t).toContinuousLinearMap‖ * ‖v‖ :=
      ((sourceSpinFockIsometry i j t).toContinuousLinearMap).norm_compLp_le v
    _ ≤ 1 * ‖v‖ :=
      mul_le_mul_of_nonneg_right hnorm (norm_nonneg v)
    _ = ‖v‖ := one_mul _

#print axioms sourceSpinFockIsometry_apply
#print axioms sourceSpinFullL2CLM_apply
#print axioms sourceSpinFullL2CLM_norm_le
end
end FCP.BFSSSU2PhysicalDomainS3K0
