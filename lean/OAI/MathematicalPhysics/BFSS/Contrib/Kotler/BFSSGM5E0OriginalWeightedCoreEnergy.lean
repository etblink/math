import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5COriginalMasslessCoreMomentControl

/-! Exact original invariant smooth-core weighted energy estimate.
No global moment coercivity or arbitrary completed-domain claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E0
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5C

/-- The original kinetic-plus-bosonic core energy is bounded by the
native physical sixteen-charge form and the exact first radial moment. -/
theorem originalNativeCore_kineticPotential_le (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) :
    kineticPotentialCoreEnergy M f.val ≤
      (1 / 16 : ℝ) *
        ‖originalMinimalPhysicalHilbertChargeColumn M G
          (closedChargeCoreInput M G f)‖ ^ 2 +
        M.fermionGrowthConstant * coreRadialMoment f.val := by
  have h := (abs_le.mp (nativeCoreEnergy_difference_le M G f)).1
  linarith only [h]

#print axioms originalNativeCore_kineticPotential_le

end
end FCP.BFSSGM5E0
