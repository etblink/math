import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG1AOriginalLieTriple

/-!
# IBI-G1A independent consumer

Separately compiled examples on the actual original Boson 2 carrier and
GaugeGroup 2, not an independent textbook SO(3) action. This checks
source-reuse, genuine composition and gauge-arrow consequences.
No determinant/epsilon normalization or physical quotient is claimed.
-/

set_option autoImplicit false

namespace BFSSIBIG1AOriginalLieTripleIndependentConsumer

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1AOriginalLieTriple

/-- Expand the original color Lie product, rather than merely matching
the theorem's displayed originalLieTriple abbreviation. -/
example (g : GaugeGroup 2) (x : Boson 2)
    (i j k : SpaceIndex) :
    inner ℝ
      (pairedAlgebraData.colorLie
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i)
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) j))
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) k) =
    inner ℝ (pairedAlgebraData.colorLie
      (spatialColor x i) (spatialColor x j)) (spatialColor x k) := by
  change originalLieTriple (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j k =
    originalLieTriple x i j k
  exact originalLieTriple_gauge g x i j k

/-- The certified source color action's group product acts invariantly. -/
example (g h : GaugeGroup 2) (x : Boson 2)
    (i j k : SpaceIndex) :
    originalLieTriple (FCP.BFSSSU2GaugeG2A.bosonGauge (g * h) x) i j k =
      originalLieTriple x i j k := by
  exact originalLieTriple_gauge (g * h) x i j k

/-- An actual original SU(2) gauge arrow implies matching incidence. -/
example {x y : Boson 2}
    (h : ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG2A.bosonGauge g x = y)
    (i j k : SpaceIndex) :
    originalLieTriple x i j k = originalLieTriple y i j k := by
  exact originalLieTriple_eq_of_gauge_related h i j k

end BFSSIBIG1AOriginalLieTripleIndependentConsumer
