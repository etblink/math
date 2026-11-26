import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC1FullCoreGaugeAction

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC1Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSUGC1 FCP.BFSSSU2PhysicalDomainD2B6

theorem originalSU2CoreGaugeChargeAudit (M : AlgebraData 2) (G : M.GaugeData)
    (g : GaugeGroup 2) (α : SpinIndex) (f : SmoothCore 2) :
    coreToL2 (M.charge α (core_action M G g f)) =
      G.fiberAction g (G.bosonPullback g⁻¹ (coreToL2 (M.charge α f))) := by
  rw [core_action_commutes M G g α f, core_toL2_intertwines,
    sourceFullGaugePairCLM_apply]

#print axioms originalSU2CoreGaugeChargeAudit
end
end FCP.BFSSUGC1Independent
