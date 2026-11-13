import Mathlib.Topology.Closure
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M5BE0OriginalNativeHamiltonianPort
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3W0D0OriginalNonzeroPhysicalChargeDomain

/-!
# P3-M5BF0 — original SU2 source gauge graph and nonzero physical H-domain

PROSPECTIVE / UNQUALIFIED until strict current-source Lean/consumer
source-closure and allowed-axiom audit.

Reuses historical BF's EXACT source gauge restricted graph and literal
paired normalized H, previous strict M5BE0 original BE H, and strict
M3W0D0 genuine nonzero physical FullL2, not an auxiliary model.

This does not claim radialBumpL2 itself is in Dom(H), a nonzero
Hamiltonian eigenstate, spectral gap, or qualified BG/BH historical
operator equality.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2GaugeG4K2B
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSSU2PhysicalDomainL6H5E8BF
open FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort
open FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain
open Set

/-- Original AY charge graph is exactly the genuine source
gauge-restricted (1,0) closure, rebased to the actual physical L²
input and sixteen-component PiLp(2) output. -/
theorem originalPairedChargeGraph_eq_sourceRebased :
    (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).graph =
        (pairedGaugeData.deformedModelGraph 1 0).comap
          (pairedGaugeData.physicalSpace.subtype.prodMap
            (originalMinimalHilbertOutputEquiv (N := 2)).toLinearMap) :=
  originalMinimalPhysicalHilbertChargeColumn_graph_eq_sourceRebased
    pairedAlgebraData pairedGaugeData

/-- Original BF paired normalized H is definitionally the same
native paired source operator requalified in strict M5BE0. -/
theorem originalPairedH_eq_accepted_BE :
    pairedOriginalPhysicalNormalizedHamiltonian =
      originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData := by
  rfl

/-- Existence of a NONZERO original physical vector in the
literal paired normalized Hamiltonian's NATURAL operator domain.
This follows from source-Fock physical nontriviality (M3W0D0)
and exact native H-domain density (M5BE0 + BF) without identifying
that vector with the explicit radial profile or an eigenvector. -/
theorem originalPairedH_naturalDomain_has_nonzero :
    ∃ v : pairedGaugeData.physicalSpace,
      v ∈ pairedOriginalPhysicalNormalizedHamiltonian.domain ∧
      v ≠ 0 := by
  classical
  let w : pairedGaugeData.physicalSpace :=
    ⟨radialBumpL2, radialBumpL2_mem_physicalSpace⟩
  have hw : w ≠ 0 := originalPhysicalFullL2_witness_ne_zero
  let S : Set pairedGaugeData.physicalSpace :=
    pairedOriginalPhysicalNormalizedHamiltonian.domain
  have hd : Dense S := by
    exact originalPairedNormalizedH_domain_dense
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

#print axioms originalPairedChargeGraph_eq_sourceRebased
#print axioms originalPairedH_eq_accepted_BE
#print axioms originalPairedH_naturalDomain_has_nonzero

end
end FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain
