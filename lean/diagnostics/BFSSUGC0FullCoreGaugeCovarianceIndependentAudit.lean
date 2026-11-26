import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC0FullCoreGaugeCovariance

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSUGC0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData

/-- Independent consumer on the original SU(2) source: equality of
functions for arbitrary gauge-related sections. No invariantCore premise. -/
theorem originalSU2ChargeFunctionAudit (M : AlgebraData 2) (G : M.GaugeData)
    (g : GaugeGroup 2) (α : SpinIndex) (f h : SmoothCore 2)
    (hr : ∀ x : Boson 2, h (G.boson g x) = G.fermion g (f x)) :
    ((M.charge α h : Boson 2 → Fermion 2) ∘ G.boson g) =
      (G.fermion g) ∘ (M.charge α f : Boson 2 → Fermion 2) := by
  funext x
  exact FCP.BFSSUGC0.original_charge_related M G g α f h hr x

#print axioms originalSU2ChargeFunctionAudit
end
end FCP.BFSSUGC0Independent
