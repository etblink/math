import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2I0OriginalPotentialConvergence

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2I0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0 FCP.BFSSMOLL2F0
open FCP.BFSSMOLL2H0 FCP.BFSSMOLL2I0
open MeasureTheory Filter
open scoped Topology

theorem originalSU2PotentialConvergenceAudit (M : AlgebraData 2)
    (a : SpinIndex) (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (R : ℝ)
    (hR : tsupport u ⊆ Metric.closedBall 0 R) :
    Tendsto (fun n => corePotentialL2 M a
      (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hs) (R + 1)
      (concrete_mollified_uniform_support u hu hs R hR n)) atTop
      (𝓝 (potentialL2 M a u hsm h2 (R + 1) (input_support_enlarged u R hR))) :=
  concrete_mollified_potential_tendsto M a u hsm h2 hu hs R hR

theorem originalSU2PotentialRepresentativeAudit (M : AlgebraData 2)
    (a : SpinIndex) (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (R : ℝ)
    (hs : tsupport u ⊆ Metric.closedBall 0 R) :
    (potentialL2 M a u hsm h2 R hs : Boson 2 → Fermion 2) =ᵐ[volume]
      potentialField M a u :=
  potentialL2_ae M a u hsm h2 R hs

#print axioms originalSU2PotentialConvergenceAudit
#print axioms originalSU2PotentialRepresentativeAudit
end
end FCP.BFSSMOLL2I0Independent
