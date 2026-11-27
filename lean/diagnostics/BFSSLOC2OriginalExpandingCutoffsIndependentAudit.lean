import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC2OriginalExpandingCutoffs

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC2Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC2
open Filter
open scoped Topology

theorem originalSU2ExpandingCutoffAudit (n : ℕ) :
    ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (expandingCutoff 2 n) ∧
      HasCompactSupport (expandingCutoff 2 n) ∧
      (∀ x, 0 ≤ expandingCutoff 2 n x ∧ expandingCutoff 2 n x ≤ 1) :=
  ⟨expandingCutoff_smooth 2 n, expandingCutoff_compact 2 n, expandingCutoff_bounds 2 n⟩

theorem originalSU2GradientDecayAudit :
    ∃ K : ℝ, 0 ≤ K ∧
      (∀ n x, ‖cutoffGradient (expandingCutoff 2 n) x‖ ≤ K * cutoffScale n) ∧
      Tendsto (fun n => K * cutoffScale n) atTop (𝓝 0) :=
  expandingCutoff_uniform_gradient 2

theorem originalSU2EventuallyOneAudit (x : Boson 2) :
    ∀ᶠ n in atTop, expandingCutoff 2 n x = 1 :=
  expandingCutoff_eventually_one 2 x

#print axioms originalSU2ExpandingCutoffAudit
#print axioms originalSU2GradientDecayAudit
#print axioms originalSU2EventuallyOneAudit
end
end FCP.BFSSLOC2Independent
