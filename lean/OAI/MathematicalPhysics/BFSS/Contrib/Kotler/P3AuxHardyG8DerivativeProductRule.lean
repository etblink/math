import OAI.MathematicalPhysics.BFSS.CliffordSymbols

/-! Original product rule with variable AlgebraData; no native data or tau imports. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG8DerivativeProductRule
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem originalFermionMultiplier_derivative_apply (M : AlgebraData 2)
    (k : SpaceIndex) (B A : ColorIndex 2) (β : SpinIndex)
    (g : Boson 2 → ℂ) (hg : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) g)
    (f : SmoothCore 2) (X : Boson 2) :
    coordinateDerivative k B (M.fermionAction β A (smoothMultiplier g hg f)) X =
      g X • M.theta β A (coordinateDerivative k B f X) +
        (fderiv ℝ g X (EuclideanSpace.single (k, B) 1)) • M.theta β A (f X) := by
  have hc :
      coordinateDerivative k B (M.fermionAction β A (smoothMultiplier g hg f)) =
        M.fermionAction β A (coordinateDerivative k B (smoothMultiplier g hg f)) := by
    exact (LinearMap.congr_fun (M.fermionAction_derivative_commute β A B k)
      (smoothMultiplier g hg f)).symm
  rw [hc, fermionAction_apply, coordinateDerivative_multiplier]
  simp only [map_add, map_smul]

#print axioms FCP.BFSSP3AuxHardyG8DerivativeProductRule.originalFermionMultiplier_derivative_apply

end
end FCP.BFSSP3AuxHardyG8DerivativeProductRule
