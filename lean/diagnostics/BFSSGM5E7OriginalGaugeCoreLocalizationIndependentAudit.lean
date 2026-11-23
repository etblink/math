import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E7OriginalGaugeCoreLocalization

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E7Independent
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSGM5B FCP.BFSSGM5E7
open MeasureTheory

/-- Check the two-region identity on the literal paired charge graph. -/
theorem pairedNativeCoreCutoff_ims
    (χ : Fin 2 → Boson 2 → ℝ)
    (hχ : ∀ j, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (χ j))
    (hg : ∀ j g x, χ j (pairedGaugeData.boson g x) = χ j x)
    (hpart : ∀ x, ∑ j, χ j x ^ 2 = 1) (f : pairedGaugeData.invariantCore) :
    (∑ j, (1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData (closedChargeCoreInput pairedAlgebraData pairedGaugeData
        (gaugeInvariantRealCutoff pairedAlgebraData pairedGaugeData (χ j) (hχ j) (hg j) f))‖ ^ 2) =
      (1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 +
      (1 / 2 : ℝ) * ∑ j, ∫ x, ‖cutoffGradient (χ j) x‖ ^ 2 * ‖f.val x‖ ^ 2 :=
  nativeCoreCutoff_ims pairedAlgebraData pairedGaugeData χ hχ hg hpart f

#print axioms pairedNativeCoreCutoff_ims

end
end FCP.BFSSGM5E7Independent
