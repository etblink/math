import SU2BFSSPhysicalDomainS3HActualFockPlaneUnitaryFlowProbe

/-!
# BFSS SU(2) S3I — gauge compatibility of actual fermionic plane flows

The source G4E SU(2) linear-isometric automorphism becomes a continuous
complex-linear endomorphism via *the same* source operator.
Use the Gate-155 exact pointwise quadratic gauge commutation together
with Mathlib's SemiconjBy exponential functoriality. No alternate
fermion representation and no extra physical assumption.

This is a prospective proof candidate. It does not establish the full
Spin(9) group representation or the physical Hamiltonian's spectral
reduction.
-/

namespace FCP.BFSSSU2PhysicalDomainS3I
noncomputable section

-- The literal source 24-mode Fock operator can exhaust default
-- Lean elaboration depth when concrete expressions are unfolded.
-- We use a small exact coercion lemma instead of expanding K_ij.
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSSU2PhysicalDomainS3D
open FCP.BFSSSU2PhysicalDomainS3G3
open FCP.BFSSSU2PhysicalDomainS3H

private abbrev FermionOp := Fermion 2 →L[ℂ] Fermion 2

local instance fockRationalNormedAlgebra : NormedAlgebra ℚ FermionOp :=
  .restrictScalars ℚ ℂ FermionOp

/-- The gauge action is the literal accepted G4E unitary viewed
as a bounded source Fock operator, not a replacement representation. -/
noncomputable def pairedFermionGaugeOperator (g : GaugeGroup 2) : FermionOp :=
  (fermionGaugeUnitaryHom g).toLinearIsometry.toContinuousLinearMap

/-- The bounded-operator view is definitionally the identical
accepted G4E source fermionic gauge action on every Fock vector. -/
private theorem pairedFermionGaugeOperator_apply
    (g : GaugeGroup 2) (w : Fermion 2) :
    pairedFermionGaugeOperator g w = fermionGaugeUnitaryHom g w := rfl

/-- The accepted full source bilinear K commutes with G4E gauge
unitaries in the literal Fock bounded-operator algebra. -/
theorem pairedFermionGaugeOperator_comm_spinGenerator
    (g : GaugeGroup 2) (i j : SpaceIndex) :
    Commute (pairedFermionGaugeOperator g)
      (pairedFermionPlaneSpinGenerator i j) := by
  change pairedFermionGaugeOperator g * pairedFermionPlaneSpinGenerator i j =
    pairedFermionPlaneSpinGenerator i j * pairedFermionGaugeOperator g
  apply ContinuousLinearMap.ext
  intro v
  simpa only [ContinuousLinearMap.mul_apply,
    pairedFermionGaugeOperator_apply] using
      (pairedFermionPlaneSpinGenerator_gauge_commutes g i j v)

/-- Each exact source fermionic one-parameter plane rotation
also commutes with the actual SU(2) fermionic gauge action. -/
theorem pairedFermionGaugeOperator_comm_spinFlow
    (g : GaugeGroup 2) (i j : SpaceIndex) (t : ℝ) :
    Commute (pairedFermionGaugeOperator g)
      (pairedFermionPlaneSpinFlow i j t) := by
  unfold pairedFermionPlaneSpinFlow
  exact
    ((pairedFermionGaugeOperator_comm_spinGenerator g i j).smul_right (t : ℂ)).exp_right

/-- Pointwise form of the same exact source fact, for all Fock states. -/
theorem pairedFermionPlaneSpinFlow_gauge_commutes
    (g : GaugeGroup 2) (i j : SpaceIndex) (t : ℝ) (v : Fermion 2) :
    fermionGaugeUnitaryHom g (pairedFermionPlaneSpinFlow i j t v) =
      pairedFermionPlaneSpinFlow i j t
        (fermionGaugeUnitaryHom g v) := by
  have h :
      pairedFermionGaugeOperator g * pairedFermionPlaneSpinFlow i j t =
        pairedFermionPlaneSpinFlow i j t * pairedFermionGaugeOperator g :=
    pairedFermionGaugeOperator_comm_spinFlow g i j t
  have hv := congrArg (fun T : FermionOp => T v) h
  simpa only [ContinuousLinearMap.mul_apply,
    pairedFermionGaugeOperator_apply] using hv

#print axioms pairedFermionGaugeOperator_comm_spinGenerator
#print axioms pairedFermionGaugeOperator_comm_spinFlow
#print axioms pairedFermionPlaneSpinFlow_gauge_commutes

end
end FCP.BFSSSU2PhysicalDomainS3I
