import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0AOriginalBosonGram

/-!
# IBI-G0A independent consumer

A separately compiled downstream consumer of the source-exact Gram theorem,
on genuine Boson 2, SpaceIndex and GaugeGroup 2. No replacement rotation
model or hidden axioms. Not an IBI-G0B/G0C or physical quotient result.
-/

set_option autoImplicit false

namespace BFSSIBIG0AIndependentConsumer

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSIBIG0AOriginalBosonGram

/-- Consume the theorem after expanding the original Gram definition.
Both spatial indices remain distinct variables. -/
example (g : GaugeGroup 2) (x : Boson 2) (i j : SpaceIndex) :
    inner ℝ (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i)
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGauge g x) j) =
    inner ℝ (spatialColor x i) (spatialColor x j) := by
  change originalGram (FCP.BFSSSU2GaugeG2A.bosonGauge g x) i j =
    originalGram x i j
  exact originalGram_gauge g x i j

/-- Original group products, not an independent SO(3) substitute. -/
example (g h : GaugeGroup 2) (x : Boson 2) (i j : SpaceIndex) :
    originalGram (FCP.BFSSSU2GaugeG2A.bosonGauge (g * h) x) i j =
      originalGram x i j := by
  exact originalGram_gauge (g * h) x i j

/-- Check the gauge-arrow consequence at the actual source carriers. -/
example {x y : Boson 2}
    (related : ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG2A.bosonGauge g x = y)
    (i j : SpaceIndex) :
    originalGram x i j = originalGram y i j := by
  exact originalGram_eq_of_gauge_related related i j

end BFSSIBIG0AIndependentConsumer
