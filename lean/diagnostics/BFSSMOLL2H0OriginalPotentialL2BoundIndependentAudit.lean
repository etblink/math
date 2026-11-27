import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2H0OriginalPotentialL2Bound

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2H0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2H0
open MeasureTheory

theorem originalSU2PotentialMemLpAudit (M : AlgebraData 2) (a : SpinIndex)
    (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u) (h2 : MemLp u 2 volume)
    (R : ℝ) (hs : tsupport u ⊆ Metric.closedBall 0 R) :
    MemLp (potentialField M a u) 2 volume :=
  potentialField_memLp M a u hsm h2 R hs

theorem originalSU2PotentialL2DifferenceAudit (M : AlgebraData 2) (a : SpinIndex) (R : ℝ) :
    ∃ K : ℝ, 0 ≤ K ∧
      ∀ (u v : Boson 2 → Fermion 2)
        (hu : MemLp u 2 volume) (hv : MemLp v 2 volume)
        (hVu : MemLp (potentialField M a u) 2 volume)
        (hVv : MemLp (potentialField M a v) 2 volume),
        tsupport u ⊆ Metric.closedBall 0 R →
        tsupport v ⊆ Metric.closedBall 0 R →
        ‖hVu.toLp (potentialField M a u) - hVv.toLp (potentialField M a v)‖ ≤
          K * ‖hu.toLp u - hv.toLp v‖ :=
  potentialField_L2_difference M a R

#print axioms originalSU2PotentialMemLpAudit
#print axioms originalSU2PotentialL2DifferenceAudit
end
end FCP.BFSSMOLL2H0Independent
