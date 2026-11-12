import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C4BOriginalSourceIntegrability

/-!
# P2-C4B independent consumer

Use source-verified original SmoothCore 2 integrability to derive a finite
lower radial integral and a separate original coreForm consequence without
any artificial integrability assumptions. No new spectrum or model claim.
-/

set_option autoImplicit false

namespace BFSSP2C4BOriginalSourceIntegrabilityConsumer
noncomputable section

open MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C4AOriginalCoreIntegralTransfer
open FCP.BFSSP2C4BOriginalSourceIntegrability

/-- The exact original lower density has a finite integral on every smooth core. -/
example (f : SmoothCore 2) :
    Integrable (originalLowerDensity f) (volume : Measure (Boson 2)) :=
  originalLowerDensity_integrable f

/-- A distinct original radial integral bound requiring no separate
integrability premise, obtained by discarding only nonnegative kinetic energy. -/
example (f : SmoothCore 2) :
    (∫ x : Boson 2, originalLowerDensity f x) ≤
      FCP.BFSSSU2Full.concreteAlgebraData.coreForm f := by
  have h := originalMasslessCoreForm_lower f
  have hk : 0 ≤ (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
      ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 := by
    positivity
  linarith only [h, hk]

end
end BFSSP2C4BOriginalSourceIntegrabilityConsumer
