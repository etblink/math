import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0BOriginalGramGammaCoefficient

/-!
# VLY-0B independent trace-test consumer

The source proves full equality of original real 16×16 coefficients.
This consumer checks a distinct observable: the trace pairing of
the gauge-transformed coefficient matrix with an independent real
SpinIndex test matrix, a useful later entry point for Kx moment tests.
-/
set_option autoImplicit false

namespace FCP.BFSSVLY0BOriginalGramGammaTraceConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSVLY0BOriginalGramGammaCoefficient

theorem originalGramGammaTracePair_gauge_invariant
    (g : GaugeGroup 2) (x : Boson 2) (B C : GammaMatrix) :
    Matrix.trace
      (originalGramGammaCoefficient
        (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B * C) =
      Matrix.trace (originalGramGammaCoefficient x B * C) := by
  exact congrArg
    (fun M : GammaMatrix => Matrix.trace (M * C))
    (originalGramGammaCoefficient_gauge_invariant g x B)

#print axioms FCP.BFSSVLY0BOriginalGramGammaCoefficient.originalGramGammaCoefficient_gauge_invariant
#print axioms originalGramGammaTracePair_gauge_invariant

end
end FCP.BFSSVLY0BOriginalGramGammaTraceConsumer
