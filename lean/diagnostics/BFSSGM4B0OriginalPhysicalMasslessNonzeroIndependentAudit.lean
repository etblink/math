import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4B0OriginalPhysicalMasslessNonzeroDomainWitness

/-!
Independent original paired physical massless domain NONZERO consumer.
This checks literal source Gauss submodule and true Fock field,
not a proxy physical sector or a supercharge/Hamiltonian eigenstate.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B0Independent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem originalPhysicalMasslessNaturalDomainNonzero :
    ∃ v : FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace,
      v ∈ FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ∧
      v ≠ 0 :=
  FCP.BFSSGM4B0.pairedOriginalPhysicalMasslessDomain_has_nonzero

theorem originalPhysicalMasslessDomainNotBottom :
    FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain ≠ ⊥ :=
  FCP.BFSSGM4B0.pairedOriginalPhysicalMasslessDomain_ne_bot

#print axioms originalPhysicalMasslessNaturalDomainNonzero
#print axioms originalPhysicalMasslessDomainNotBottom

end FCP.BFSSGM4B0Independent
