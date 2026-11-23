import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E1OriginalRadialWeightedGradientControl

set_option autoImplicit false

namespace FCP.BFSSGM5E1Independent
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5C FCP.BFSSGM5D FCP.BFSSGM5E1

/-- Radial weight on literal paired Fock data. -/
theorem pairedRadialWeightedCore_norm_sq (f : pairedGaugeData.invariantCore) :
    ‖radialWeightedCore f.val‖ ^ 2 = coreRadialMoment f.val :=
  radialWeightedCore_norm_sq f.val

/-- Exact original paired native charge-to-weighted-gradient inequality. -/
theorem pairedWeightedCoreGradient_sq_le (f : pairedGaugeData.invariantCore) :
    ‖sourceCoreGradient f.val‖ ^ 2 ≤
      (1 / 8 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData
        (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 +
      (2 * pairedAlgebraData.fermionGrowthConstant) * ‖radialWeightedCore f.val‖ ^ 2 :=
  weightedCoreGradient_sq_le pairedAlgebraData pairedGaugeData f

#print axioms pairedRadialWeightedCore_norm_sq
#print axioms pairedWeightedCoreGradient_sq_le

end
end FCP.BFSSGM5E1Independent
