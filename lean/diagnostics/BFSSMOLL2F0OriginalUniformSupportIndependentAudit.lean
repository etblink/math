import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2F0OriginalUniformSupport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2F0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0 FCP.BFSSMOLL2F0
open MeasureTheory

theorem originalSU2UniformSupportAudit
    (u : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (R : ℝ)
    (hR : tsupport u ⊆ Metric.closedBall 0 R) (n : ℕ) :
    tsupport (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hs :
      Boson 2 → Fermion 2) ⊆ Metric.closedBall 0 (R + 1) :=
  concrete_mollified_uniform_support u hu hs R hR n

#print axioms originalSU2UniformSupportAudit
end
end FCP.BFSSMOLL2F0Independent
