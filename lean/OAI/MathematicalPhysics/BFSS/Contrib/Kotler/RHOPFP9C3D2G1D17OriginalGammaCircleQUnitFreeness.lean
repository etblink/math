import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D16OriginalGammaCircleQUnitJointContinuity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E1OriginalGammaCircleNonzeroFixedPointCriterion

/-!
# RHOPF-P9C3D2G1D17 — freeness of source-original Gamma9 Circle on Q-unit

The source-qualified native Gamma9 Circle fixed-point criterion proves
that a nonzero projector-image vector fixed by a Circle element
forces that phase to equal one. The D14–D16 Q-unit action is the same
original action transported through the accepted noncanonical E.

Prove trivial point stabilizers on the exact Q-unit sphere directly,
without inventing a new action, orthonormal basis, classical Hopf
identification, quotient, Fock implementer or physical topological charge.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D17
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2E1
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14

/-- A phase fixing a point of the original Gamma9 Q-unit sphere
must be the identity; the source-derived Q-unit Circle action is free. -/
theorem relationalCircleQUnitAction_fixed_point_implies_one
    (z : Circle) (v : RelationalQUnitCoordinates)
    (hfix : relationalCircleQUnitAction z v = v) :
    z = 1 := by
  let E := relationalRangeContinuousLinearEquivFinFour
  let w : LinearMap.range (Matrix.toLin' relationalProjector) := E.symm v.1
  have hProj : LinearMap.IsProj
      (LinearMap.range (Matrix.toLin' relationalProjector))
      (Matrix.toLin' relationalProjector) :=
    (LinearMap.isProj_range_iff_isIdempotentElem
      (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
  have hwProj : relationalProjector.mulVec w.1 = w.1 :=
    hProj.map_id w.1 w.2
  have hwUnit : w.1 ⬝ᵥ w.1 = (1 : ℝ) := by
    exact v.2
  have hwNe : (w.1 : SpinIndex → ℝ) ≠ 0 := by
    intro hz
    have hf : (0 : ℝ) = 1 := by
      simpa [hz] using hwUnit
    norm_num at hf
  have hfixFour : relationalCircleFourAction z v.1 = v.1 :=
    congrArg Subtype.val hfix
  have hfixRange : relationalCircleRangeAction z w = w := by
    apply E.injective
    change E (relationalCircleRangeAction z (E.symm v.1)) = E w
    exact hfixFour
  have hfixSource : relationalCircleVector z w.1 = w.1 :=
    congrArg Subtype.val hfixRange
  exact relationalCircleVector_fixed_point_implies_one
    z w.1 hwProj hwNe hfixSource

#print axioms relationalCircleQUnitAction_fixed_point_implies_one

end
end FCP.RHOPFP9C3D2G1D17
