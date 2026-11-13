import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3W0D0OriginalNonzeroPhysicalChargeDomain

/-!
Independent strict consumer on the actual original paired SU(2)
Boson 2 / Fermion 2 / FullL2 2 / physical sixteen-charge domain.
Does not replace the source operator with an auxiliary model.
-/
set_option autoImplicit false

namespace BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomainIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2GaugeG4K2B
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain
open MeasureTheory

example : (radialBumpL2 : FullL2 2) ≠ 0 :=
  radialBumpL2_ne_zero

example : (⟨radialBumpL2, radialBumpL2_mem_physicalSpace⟩ :
    pairedGaugeData.physicalSpace) ≠ 0 :=
  originalPhysicalFullL2_witness_ne_zero

example :
    Dense ((originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).domain :
        Set pairedGaugeData.physicalSpace) :=
  originalPhysicalCharge_naturalDomain_dense

example :
    ∃ v : pairedGaugeData.physicalSpace,
      v ∈ (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).domain ∧ v ≠ 0 :=
  originalPhysicalCharge_naturalDomain_has_nonzero

example : FullL2 2 =
    Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

#print axioms FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain.originalPhysicalFullL2_witness_ne_zero
#print axioms FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain.originalPhysicalCharge_naturalDomain_dense
#print axioms FCP.BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomain.originalPhysicalCharge_naturalDomain_has_nonzero

end
end BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomainIndependentConsumer

#print axioms FCP.BFSSSU2GaugeG4K2B.radialBumpL2_ne_zero
#print axioms FCP.BFSSSU2GaugeG4K2B.radialBumpL2_mem_physicalSpace
#print axioms FCP.BFSSSU2GaugeG4K2B.pairedPhysicalSpace_ne_bot
#print axioms FCP.BFSSSU2PhysicalDomainD2B10C.sourceCoreNormClosure_eq_physical_unconditional
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BA.originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional
