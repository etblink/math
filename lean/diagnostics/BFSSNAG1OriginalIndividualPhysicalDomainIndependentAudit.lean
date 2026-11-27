import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG1OriginalIndividualPhysicalDomain

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG1Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG1
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem originalSU2IndividualDomainAudit (a : SpinIndex) :
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).domain =
      (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain :=
  paired_native_domain_eq a

theorem originalSU2IndividualDenseAudit (a : SpinIndex) :
    Dense ((individualPhysicalOperator pairedAlgebraData pairedGaugeData a).domain :
      Set pairedGaugeData.physicalSpace) :=
  paired_native_domain_dense a

#print axioms originalSU2IndividualDomainAudit
#print axioms originalSU2IndividualDenseAudit
end
end FCP.BFSSNAG1Independent
