import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5COriginalMasslessCoreMomentControl

set_option autoImplicit false

namespace FCP.BFSSGM5CIndependent
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B
open FCP.BFSSGM5C
open MeasureTheory

/-- Restate the first-moment bound on the exact paired charge and core data. -/
theorem pairedNativeCoreEnergy_difference_le (f : pairedGaugeData.invariantCore) :
    |(1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 -
        kineticPotentialCoreEnergy pairedAlgebraData f.val| ≤
      pairedAlgebraData.fermionGrowthConstant *
        (∫ x : Boson 2, ‖x‖ * ‖f.val x‖ ^ 2) :=
  nativeCoreEnergy_difference_le pairedAlgebraData pairedGaugeData f

/-- Restate the unweighted estimate for paired core vectors with fixed support. -/
theorem pairedNativeCoreEnergy_difference_le_of_support
    (f : pairedGaugeData.invariantCore) (R : ℝ)
    (hzero : ∀ x : Boson 2, R < ‖x‖ → f.val x = 0) :
    |(1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 -
        kineticPotentialCoreEnergy pairedAlgebraData f.val| ≤
      pairedAlgebraData.fermionGrowthConstant * (R * ‖coreToL2 f.val‖ ^ 2) :=
  nativeCoreEnergy_difference_le_of_support pairedAlgebraData pairedGaugeData f R hzero

#print axioms pairedNativeCoreEnergy_difference_le
#print axioms pairedNativeCoreEnergy_difference_le_of_support

end
end FCP.BFSSGM5CIndependent
