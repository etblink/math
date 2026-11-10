import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG2ABosonGaugeProbe

/-!
# VLY-0A: original spatial Gram matrix invariant under genuine bosonic SU(2) gauge action

Use literal `Boson 2`, `SpaceIndex`, `ColorIndex 2`, and the original
paired AlgebraData, without introducing any replacement gauge action.
The subsequent valley spectral and original Fock bilinear gates are separate.
-/
set_option autoImplicit false

namespace FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A

private abbrev M : AlgebraData 2 := pairedAlgebraData

/-- The nine-by-nine real spatial Gram matrix of the three original color columns. -/
noncomputable def originalSpatialGram (x : Boson 2) :
    Matrix SpaceIndex SpaceIndex ℝ :=
  fun i j => inner ℝ (spatialColor x i) (spatialColor x j)

/-- Gauge invariance on the actual original bosonic configuration carrier. -/
theorem originalSpatialGram_gauge_invariant
    (q : GaugeGroup 2) (x : Boson 2) :
    originalSpatialGram (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) =
      originalSpatialGram x := by
  ext i j
  change inner ℝ
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) i)
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv q x) j) =
    inner ℝ (spatialColor x i) (spatialColor x j)
  simp only [FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv_apply,
    M.spatialColor_gaugeConjugate]
  exact M.colorConjugate_inner
    (q : ColorMatrix 2) q.prop.1 (spatialColor x i) (spatialColor x j)

#print axioms originalSpatialGram_gauge_invariant

end
end FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
