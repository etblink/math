import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain

/-!
Independent consumer for actual original SU2 source gauge graph and
NATIVE normalized physical Hamiltonian, with original boson/Fock
FullL2 carrier and nonzero natural Hamiltonian-domain witness.
-/
set_option autoImplicit false
namespace BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomainIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSSU2PhysicalDomainL6H5E8BF
open FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort
open FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain
open FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example :
    (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).graph =
        (pairedGaugeData.deformedModelGraph 1 0).comap
          (pairedGaugeData.physicalSpace.subtype.prodMap
            (originalMinimalHilbertOutputEquiv (N := 2)).toLinearMap) :=
  originalPairedChargeGraph_eq_sourceRebased

example :
    pairedOriginalPhysicalNormalizedHamiltonian =
      originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData :=
  originalPairedH_eq_accepted_BE

example :
    ∃ v : pairedGaugeData.physicalSpace,
      v ∈ pairedOriginalPhysicalNormalizedHamiltonian.domain ∧
      v ≠ 0 :=
  originalPairedH_naturalDomain_has_nonzero

#print axioms FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.originalPairedChargeGraph_eq_sourceRebased
#print axioms FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.originalPairedH_eq_accepted_BE
#print axioms FCP.BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.originalPairedH_naturalDomain_has_nonzero
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.originalMinimalClosedGraph_eq_exactSourceGaugeGraph
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.originalMinimalPhysicalHilbertChargeGraph_mem_source_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.originalMinimalPhysicalHilbertChargeGraph_eq_sourceRebased
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.originalMinimalPhysicalHilbertChargeColumn_graph_eq_sourceRebased
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.pairedOriginalPhysicalNormalizedHamiltonian
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.pairedOriginalPhysicalSpace_ne_bot
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.pairedOriginalPhysicalNormalizedHamiltonian_selfAdjoint
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.pairedOriginalPhysicalNormalizedHamiltonian_domain
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BF.pairedOriginalPhysicalNormalizedHamiltonian_weakForm_iff
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_domain_dense
#print axioms FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain.originalPhysicalFullL2_witness_ne_zero

end
end BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomainIndependentConsumer
