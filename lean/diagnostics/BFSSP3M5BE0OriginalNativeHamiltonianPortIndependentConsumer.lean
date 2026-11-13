import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M5BE0OriginalNativeHamiltonianPort

/-!
P3-M5BE0 independent consumer: the actual original paired color SU(2),
48-Majorana Fock / 24-boson FullL2 physical Hilbert subtype, true
sixteen-charge natural adjoint square, not a surrogate Hamiltonian.
-/
set_option autoImplicit false

namespace BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort
open MeasureTheory
open LinearPMap

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example :
    originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData =
        (1 / 16 : ℂ) •
          originalMinimalPhysicalHilbertChargeAdjointSquare
            pairedAlgebraData pairedGaugeData :=
  originalPairedNormalizedH_eq_charge_square

example :
    (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).domain =
        (originalMinimalPhysicalHilbertChargeAdjointSquare
          pairedAlgebraData pairedGaugeData).domain :=
  originalPairedNormalizedH_naturalDomain

example :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    IsSelfAdjoint (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData) :=
  originalPairedNormalizedH_selfAdjoint

example :
    (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).IsClosed :=
  originalPairedNormalizedH_closed

example :
    Dense ((originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).domain :
        Set pairedGaugeData.physicalSpace) :=
  originalPairedNormalizedH_domain_dense

#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_eq_charge_square
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_naturalDomain
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_apply
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_selfAdjoint
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_closed
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_domain_dense
#print axioms FCP.BFSSP3M5BE0OriginalNativeHamiltonianPort.originalPairedNormalizedH_weakForm_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.weakRepresentative_iff_adjoint
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.weakRepresentative_iff_naturalAdjointSquare
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.sixteen_inner_smul
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.one_sixteenth_inner_smul
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.normalizedWeakRepresentative_iff_naturalAdjointSquare
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.adjoint_smul_of_dense
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.selfAdjoint_smul_real
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedWeakForm_associatedOperator_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_domain
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_apply
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_selfAdjoint
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_closed
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_domain_dense

end
end BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer
