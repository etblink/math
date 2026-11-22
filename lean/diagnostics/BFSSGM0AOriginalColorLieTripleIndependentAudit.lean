import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM0AOriginalColorLieTripleGaugeInvariant

/-!
GM0A independent source-exact consumer.
Merely imports and checks the genuinely paired SU(2) invariant:
no second boson/Fock model, no assumption of massless Fock covariance.
-/
set_option autoImplicit false

namespace FCP.BFSSGM0AIndependent
open OAI.BFSSQuantum

theorem pairedOriginalSpatialColorLieTripleGaugeInvariant
    (g : GaugeGroup 2) (x : Boson 2) (i j k : SpaceIndex) :
    inner ℝ
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.colorLie
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) i)
        (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) j))
      (spatialColor (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) k) =
    inner ℝ
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.colorLie
        (spatialColor x i) (spatialColor x j))
      (spatialColor x k) :=
  FCP.BFSSGM0A.pairedOriginalSpatialColorLieTriple_gauge_invariant g x i j k

#print axioms pairedOriginalSpatialColorLieTripleGaugeInvariant

end FCP.BFSSGM0AIndependent
