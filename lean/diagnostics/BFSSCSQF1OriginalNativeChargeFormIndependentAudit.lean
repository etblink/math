import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF1OriginalNativeChargeForm
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF1Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSNAG0 FCP.BFSSCSQF1
open FCP.BFSSSU2PhysicalDomainL6H5E8AY

theorem originalSU2NativeOutputAudit (a : SpinIndex)
    (u : (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain) :
    originalMinimalHilbertOutputEquiv
      (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData u) a =
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a
        (pairedIndividualInput a u) : FullL2 2) :=
  paired_native_output a u

theorem originalSU2NormalizedFormAudit (a : SpinIndex)
    (u v : (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain) :
    inner ℂ (individualPhysicalOperator pairedAlgebraData pairedGaugeData a (pairedIndividualInput a u))
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a (pairedIndividualInput a v)) =
      (1 / 16 : ℂ) * inner ℂ
        (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData u)
        (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData v) :=
  paired_normalized_form a u v

#print axioms originalSU2NativeOutputAudit
#print axioms originalSU2NormalizedFormAudit
end
end FCP.BFSSCSQF1Independent
