import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
set_option autoImplicit false
namespace BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensityIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
open Set

example {ε : ℝ} (hε : 0 < ε)
    (hd : pairedGaugeData.coreNormClosure = pairedGaugeData.physicalSpace) :
    Dense ((originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).domain :
      Set pairedGaugeData.physicalSpace) :=
  originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
    pairedAlgebraData pairedGaugeData hε hd

example {ε : ℝ} (hε : 0 < ε) :
    Dense ((originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).domain :
      Set pairedGaugeData.physicalSpace) :=
  originalWeightedPhysicalChargeColumn_domain_dense_unconditional
    pairedAlgebraData pairedGaugeData hε

#print axioms FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
#print axioms FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_unconditional
end
end BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensityIndependentConsumer
