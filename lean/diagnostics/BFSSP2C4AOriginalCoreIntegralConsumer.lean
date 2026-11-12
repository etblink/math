import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C4AOriginalCoreIntegralTransfer

/-!
# P2-C4A independent original-source radial integral consumer

Derive a distinct consequence of the actual smooth-core form estimate by
dropping only its nonnegative kinetic term. The density integrability
requirements remain explicit and are not silently assumed.
-/

set_option autoImplicit false

namespace BFSSP2C4AOriginalCoreIntegralConsumer
noncomputable section

open MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C4AOriginalCoreIntegralTransfer

/-- Actual BFSS massless core form bounds the original lower radial integral
under the precisely stated integrability hypotheses. -/
example (f : SmoothCore 2)
    (hLower : Integrable (originalLowerDensity f) (volume : Measure (Boson 2)))
    (hActual : Integrable (originalActualDensity f) (volume : Measure (Boson 2))) :
    (∫ x : Boson 2, originalLowerDensity f x) ≤
      FCP.BFSSSU2Full.concreteAlgebraData.coreForm f := by
  have h := originalMasslessCoreForm_lower_of_integrable f hLower hActual
  have hk : 0 ≤ (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
      ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 := by
    positivity
  linarith only [h, hk]

end
end BFSSP2C4AOriginalCoreIntegralConsumer
