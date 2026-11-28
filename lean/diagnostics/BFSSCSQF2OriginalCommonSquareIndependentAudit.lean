import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF2OriginalCommonSquare
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF2Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSNAG0 FCP.BFSSNAG3 FCP.BFSSCSQF2
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE

theorem originalSU2NativeCommonSquareAudit (a : SpinIndex) :
    naturalComp (individualPhysicalOperator pairedAlgebraData pairedGaugeData a)
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a) =
    originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData :=
  paired_native_common_square a

theorem originalSU2CoreClosureCommonSquareAudit (a : SpinIndex) :
    naturalComp (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure
      (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure =
    originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData :=
  paired_core_closure_common_square a

#print axioms originalSU2NativeCommonSquareAudit
#print axioms originalSU2CoreClosureCommonSquareAudit
end
end FCP.BFSSCSQF2Independent
