import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC1OriginalCutoffL2Bounds

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC1Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC0 FCP.BFSSLOC1
open MeasureTheory

theorem originalSU2CutoffSupportAudit (M : AlgebraData 2) (a : SpinIndex)
    (χ : Boson 2 → ℝ) (u : Boson 2 → Fermion 2) :
    tsupport (cutoffField χ u) ⊆ tsupport χ ∧
      tsupport (cutoffError M a χ u) ⊆ tsupport χ :=
  ⟨cutoffField_support χ u, cutoffError_support M a χ u⟩

theorem originalSU2CutoffErrorBoundAudit (M : AlgebraData 2)
    (a : SpinIndex) (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (u : Boson 2 → Fermion 2) (hu : StronglyMeasurable u) (h2 : MemLp u 2 volume)
    (G : ℝ) (hG : 0 ≤ G) (hb : ∀ x, ‖cutoffGradient χ x‖ ≤ G) :
    ‖(cutoffError_memLp M a χ hχ u hu h2 G hG hb).toLp
      (cutoffError M a χ u)‖ ≤ G * ‖h2.toLp u‖ :=
  cutoffError_L2_bound M a χ u h2 _ G hG hb

#print axioms originalSU2CutoffSupportAudit
#print axioms originalSU2CutoffErrorBoundAudit
end
end FCP.BFSSLOC1Independent
