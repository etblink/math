import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2bOriginalGaugeProjectionBridge

/-!
# OP2c: a nonzero original SU(2) BFSS gauge-fixed Fock vector

Reuses the pinned original G4-B vacuum fockAlgebraToBFSS (1 : Space 23),
the qualified G4-E SU(2) unitary action, and OP2b's exact original
orthogonal projection on Fermion 2.

No artificial vacuum, no extra G4-K2A radial imports, no Spin(9) action,
no physical bosonic wavefunction or spectral/mass-gap conclusion.
-/

set_option autoImplicit false
-- Finite-dimensional fixed-subspace completeness is a local instance.
set_option linter.style.haveILetI false

namespace FCP.BFSSOriginalGaugeVacuumOP2C
noncomputable section

open OAI.BFSSQuantum
open OAI.Laughlin.Fock
open FCP.BFSSSU2GaugeG4B
open FCP.BFSSOriginalGaugeProjectionOP2B
open FCP.BFSSGaugeFixedProjectionOP0

/-- The original 24-orbital Fock vacuum is not zero after exact
linear-equivalence transport into the original Fermion 2 Hilbert carrier. -/
theorem originalFermionVacuum_ne_zero :
    fermionVacuum ≠ (0 : Fermion 2) := by
  change fockAlgebraToBFSS (1 : Space 23) ≠ (0 : Fermion 2)
  intro hz
  have h1 : (1 : Space 23) = 0 := by
    apply fockAlgebraToBFSS.injective
    simpa only [map_zero] using hz
  exact one_ne_zero h1

/-- Exact invariance under the G4-E original unitary action,
expressed through OP2b's linear operator interface. -/
theorem originalFermionVacuum_fixed (g : GaugeGroup 2) :
    originalGaugeLinearAction g fermionVacuum = fermionVacuum := by
  change FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom g fermionVacuum =
    fermionVacuum
  change fermionGaugeLinearEquiv g fermionVacuum = fermionVacuum
  exact fermionGaugeLinearEquiv_vacuum g

/-- The original nonzero source vacuum lies in the literal fixed subspace. -/
theorem originalFermionVacuum_mem_fixed :
    fermionVacuum ∈ originalFermionGaugeFixed := by
  change fermionVacuum ∈ gaugeFixedSubspace originalGaugeLinearAction
  exact (mem_gaugeFixedSubspace_iff originalGaugeLinearAction fermionVacuum).mpr
    originalFermionVacuum_fixed

/-- The original orthogonal gauge projection fixes the genuine vacuum. -/
theorem originalFermionGaugeProjection_vacuum :
    originalFermionGaugeProjection fermionVacuum = fermionVacuum := by
  haveI : CompleteSpace (gaugeFixedSubspace originalGaugeLinearAction) :=
    FiniteDimensional.complete ℂ (gaugeFixedSubspace originalGaugeLinearAction)
  change (gaugeFixedSubspace originalGaugeLinearAction).starProjection fermionVacuum =
    fermionVacuum
  exact Submodule.starProjection_eq_self_iff.mpr originalFermionVacuum_mem_fixed

/-- This exact original fermionic SU(2) gauge-fixed projection is nonzero. -/
theorem originalFermionGaugeProjection_ne_zero :
    originalFermionGaugeProjection ≠ 0 := by
  intro hZero
  have hv := congrArg
    (fun T : Fermion 2 →L[ℂ] Fermion 2 => T fermionVacuum) hZero
  rw [originalFermionGaugeProjection_vacuum,
    ContinuousLinearMap.zero_apply] at hv
  exact originalFermionVacuum_ne_zero hv

#print axioms originalFermionVacuum_ne_zero
#print axioms originalFermionVacuum_fixed
#print axioms originalFermionVacuum_mem_fixed
#print axioms originalFermionGaugeProjection_vacuum
#print axioms originalFermionGaugeProjection_ne_zero

end
end FCP.BFSSOriginalGaugeVacuumOP2C
