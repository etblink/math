import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E0OriginalWeightedCoreEnergy

set_option autoImplicit false

namespace FCP.BFSSGM5E0Independent
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5C FCP.BFSSGM5E0

/-- Independently restate the source-exact weighted core energy inequality
using the literal paired SU(2) Fock/gauge representation and native charges. -/
theorem pairedOriginalNativeCore_kineticPotential_le
    (f : pairedGaugeData.invariantCore) :
    kineticPotentialCoreEnergy pairedAlgebraData f.val ≤
      (1 / 16 : ℝ) *
        ‖originalMinimalPhysicalHilbertChargeColumn
          pairedAlgebraData pairedGaugeData
          (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 +
        pairedAlgebraData.fermionGrowthConstant * coreRadialMoment f.val :=
  originalNativeCore_kineticPotential_le pairedAlgebraData pairedGaugeData f

#print axioms pairedOriginalNativeCore_kineticPotential_le

end
end FCP.BFSSGM5E0Independent
