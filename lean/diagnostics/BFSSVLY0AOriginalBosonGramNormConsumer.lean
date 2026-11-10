import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0AOriginalBosonGramGaugeInvariant

/-! Independent VLY-0A consumer: original spatial color-row norm squares. -/
set_option autoImplicit false

namespace FCP.BFSSVLY0AOriginalBosonGramNormConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

theorem originalSpatialColor_normSq_gauge_invariant
    (q : GaugeGroup 2) (x : Boson 2) (i : SpaceIndex) :
    ‖spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) i‖ ^ 2 =
      ‖spatialColor x i‖ ^ 2 := by
  have h := congrArg (fun G : Matrix SpaceIndex SpaceIndex ℝ => G i i)
    (FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant.originalSpatialGram_gauge_invariant q x)
  change inner ℝ
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) i)
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) i) =
    inner ℝ (spatialColor x i) (spatialColor x i) at h
  simpa only [real_inner_self_eq_norm_sq] using h

#print axioms FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant.originalSpatialGram_gauge_invariant
#print axioms originalSpatialColor_normSq_gauge_invariant

end
end FCP.BFSSVLY0AOriginalBosonGramNormConsumer
