import Mathlib.Analysis.Real.Sqrt
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C2OriginalGammaCoordinateQuadraticContinuity

/-!
# RHOPF-P9C3D2G1C3 — source-exact coordinate radius continuity and positivity

The accepted original Gamma9 relational coordinate quadratic Q is
positive away from zero (C1) and continuous everywhere (C2). Define
r(x) = sqrt (Q(x)) and separately certify continuity everywhere and
strict positivity for x ≠ 0, using pinned Real sqrt lemmas.

No radial homeomorphism, S³ identification, Hopf quotient, isometry,
circle-equivariance or physical Fock implementation follows here.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C3
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C2

/-- The nonnegative radius associated to the original Gamma9
real Euclidean dot-self transported into the accepted R4 model. -/
noncomputable def relationalRangeCoordinateRadius (x : Fin 4 → ℝ) : ℝ :=
  Real.sqrt (relationalRangeCoordinateDotSelf x)

/-- Original source-exact transported coordinate radius is continuous
without introducing an alternate Euclidean norm. -/
theorem relationalRangeCoordinateRadius_continuous :
    Continuous relationalRangeCoordinateRadius := by
  exact Real.continuous_sqrt.comp relationalRangeCoordinateDotSelf_continuous

/-- Positive-definite source-original dot-self produces a strictly
positive radius at every nonzero real-four coordinate. -/
theorem relationalRangeCoordinateRadius_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateRadius x := by
  exact Real.sqrt_pos.mpr (relationalRangeCoordinateDotSelf_pos_of_ne_zero x hx)

#print axioms relationalRangeCoordinateRadius_continuous
#print axioms relationalRangeCoordinateRadius_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C3
