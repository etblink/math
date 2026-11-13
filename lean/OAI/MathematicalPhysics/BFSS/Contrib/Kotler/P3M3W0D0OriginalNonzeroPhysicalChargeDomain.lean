import Mathlib.Topology.Closure
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4K2BNonzeroPhysicalL2Probe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe

/-!
# P3-M3W0D0 — nonzero original physical L² meets the genuine physical charge domain

PROSPECTIVE: not independently Lean-qualified until strict source,
independent original Fock consumer, exact imported-source closure and
permitted-axiom audit pass.

Source-faithful join of historical G4K2B (nonzero compactly supported
original physical FullL2 2 wavepacket) and H5E8BA (unconditional
density of the exact native closed sixteen-charge operator's domain
inside the literal pairedGaugeData.physicalSpace).

This proves no supersymmetric zero mode, original Hamiltonian eigenvector,
original Hamiltonian port, positive point spectrum or mass gap.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2GaugeG4K2B
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BA
open Set

/-- The historical radial witness is nonzero in the literal
paired source physical Hilbert subtype, not merely in the ambient L². -/
theorem originalPhysicalFullL2_witness_ne_zero :
    (⟨radialBumpL2, radialBumpL2_mem_physicalSpace⟩ :
      pairedGaugeData.physicalSpace) ≠ 0 := by
  intro hz
  apply radialBumpL2_ne_zero
  have h := congrArg
    (fun v : pairedGaugeData.physicalSpace => (v : FullL2 2)) hz
  simpa using h

/-- The source AY physical sixteen-charge operator has dense
natural domain in the genuine paired physical Hilbert space.
This specializes the historical Haar + AZ + BA chain, and
asserts no closed-Hamiltonian equality or spectrum. -/
theorem originalPhysicalCharge_naturalDomain_dense :
    Dense ((originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain :
        Set pairedGaugeData.physicalSpace) :=
  originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional
    pairedAlgebraData pairedGaugeData

/-- A first original-domain existence bridge:
the *actual* native physical charge operator has a NONZERO vector
in its NATURAL domain. Derived only from original L² nontriviality
and exact unconditional physical charge-domain density.
This vector is not claimed to be a radial smooth-core state,
eigenvector or ground state. -/
theorem originalPhysicalCharge_naturalDomain_has_nonzero :
    ∃ v : pairedGaugeData.physicalSpace,
      v ∈ (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).domain ∧ v ≠ 0 := by
  classical
  let w : pairedGaugeData.physicalSpace :=
    ⟨radialBumpL2, radialBumpL2_mem_physicalSpace⟩
  have hw : w ≠ 0 := originalPhysicalFullL2_witness_ne_zero
  let S : Set pairedGaugeData.physicalSpace :=
    (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain
  have hd : Dense S := originalPhysicalCharge_naturalDomain_dense
  by_contra hn
  have hsub : S ⊆ ({0} : Set pairedGaugeData.physicalSpace) := by
    intro v hv
    have hvzero : v = 0 := by
      by_contra hvne
      exact hn ⟨v, hv, hvne⟩
    simpa using hvzero
  have hcl : closure S ⊆ ({0} : Set pairedGaugeData.physicalSpace) :=
    closure_minimal hsub isClosed_singleton
  have hzero : w = 0 := by
    have hmem : w ∈ ({0} : Set pairedGaugeData.physicalSpace) :=
      hcl (hd w)
    simpa using hmem
  exact hw hzero

#print axioms originalPhysicalFullL2_witness_ne_zero
#print axioms originalPhysicalCharge_naturalDomain_dense
#print axioms originalPhysicalCharge_naturalDomain_has_nonzero

end
end FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain
