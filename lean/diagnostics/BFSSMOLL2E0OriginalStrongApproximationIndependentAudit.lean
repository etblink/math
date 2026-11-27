import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2E0OriginalStrongApproximation

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2E0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open MeasureTheory Filter
open scoped Topology

theorem originalSU2ShrinkingRadiusAudit :
    Tendsto (fun n => (shrinkingBump 2 n).rOut) atTop (𝓝 0) :=
  shrinkingBump_radius 2

theorem originalSU2StrongApproximationAudit
    (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    Tendsto (fun n => coreToL2 (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hs))
      atTop (𝓝 (h2.toLp u : FullL2 2)) :=
  concrete_mollified_tendsto u hsm h2 hu hs

#print axioms originalSU2ShrinkingRadiusAudit
#print axioms originalSU2StrongApproximationAudit
end
end FCP.BFSSMOLL2E0Independent
