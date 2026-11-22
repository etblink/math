import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4B1OriginalPhysicalMasslessDomainDense

/-!
GM4B1 independent import-only consumer of literal source
paired SU(2) physical massless Fock maximal-domain density.
This checks source physicalSpace, not an abstract proxy.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B1Independent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Set

theorem pairedSourcePhysicalMasslessDomainDense :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) :=
  FCP.BFSSGM4B1.pairedOriginalPhysicalMasslessDomain_dense

theorem pairedSourcePhysicalMasslessDomainDenseAndNonzero :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) ∧
    (∃ v : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace,
      v ∈ FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ∧
      v ≠ 0) :=
  FCP.BFSSGM4B1.pairedOriginalPhysicalMasslessDomain_dense_and_nonzero

#print axioms pairedSourcePhysicalMasslessDomainDense
#print axioms pairedSourcePhysicalMasslessDomainDenseAndNonzero

end FCP.BFSSGM4B1Independent
