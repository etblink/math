import Mathlib.LinearAlgebra.Matrix.DotProduct
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C0OriginalGammaRangeContinuousLinearEquivFinFour

/-!
# RHOPF-P9C3D2G1C1 — source-exact coordinate quadratic positivity

The accepted noncanonical continuous linear equivalence sends the actual
original Gamma9 relational image to Fin 4 → ℝ. Pull the original Euclidean
dot-self scalar back through the inverse of that very equivalence.

Prove it is strictly positive for nonzero real coordinates, directly
from injectivity and the pinned finite real dot-self zero criterion.
No claim is made that the chosen linear equivalence is an isometry,
that coordinate unit vectors represent original unit spinors, or that
the standard Hopf quotient has been proved.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C1
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0

/-- Dot-self of the source-original spinor corresponding to an arbitrary
real-4 coordinate through the accepted continuous linear equivalence. -/
noncomputable def relationalRangeCoordinateDotSelf (x : Fin 4 → ℝ) : ℝ :=
  let w : LinearMap.range (Matrix.toLin' relationalProjector) :=
    relationalRangeContinuousLinearEquivFinFour.symm x
  w.1 ⬝ᵥ w.1

/-- The source Euclidean dot-self form transported to R4 is positive
definite, even though the abstract coordinate map need not be isometric. -/
theorem relationalRangeCoordinateDotSelf_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalRangeCoordinateDotSelf x := by
  let w : LinearMap.range (Matrix.toLin' relationalProjector) :=
    relationalRangeContinuousLinearEquivFinFour.symm x
  have hw : w ≠ 0 := by
    intro hz
    apply hx
    have hzero :
        relationalRangeContinuousLinearEquivFinFour.symm x =
          relationalRangeContinuousLinearEquivFinFour.symm (0 : Fin 4 → ℝ) := by
      simpa only [map_zero] using hz
    exact relationalRangeContinuousLinearEquivFinFour.symm.injective hzero
  have hwval : (w.1 : SpinIndex → ℝ) ≠ 0 := by
    intro hz
    apply hw
    exact Subtype.ext hz
  have hnonneg : 0 ≤ w.1 ⬝ᵥ w.1 := by
    change 0 ≤ ∑ i, w.1 i * w.1 i
    exact Finset.sum_nonneg (fun i _ => mul_self_nonneg (w.1 i))
  have hnonzero : w.1 ⬝ᵥ w.1 ≠ 0 := by
    intro hz
    exact hwval (dotProduct_self_eq_zero.mp hz)
  change 0 < w.1 ⬝ᵥ w.1
  exact lt_of_le_of_ne hnonneg (Ne.symm hnonzero)

#print axioms relationalRangeCoordinateDotSelf_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C1
