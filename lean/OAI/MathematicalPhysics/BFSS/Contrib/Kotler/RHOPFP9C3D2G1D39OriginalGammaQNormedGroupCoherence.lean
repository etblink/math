import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D38OriginalGammaSourceQNormAndNormedGroup

/-!
# RHOPF-P9C3D2G1D39 — original Gamma9 source-Q normed-group coherence

D37 strictly qualified the original Gamma9-Q positive complex
InnerProductSpace.Core on the D31 isolated complex carrier, and
D38 R2 strictly constructed both explicit QNorm := sqrt(Q) and a
standalone NormedAddCommGroup from this Core.

This bounded gate shows that the NORM OF THE ACTUAL CONSTRUCTED
STANDALONE GROUP is the exact original-source QNorm, then
proves its square is original source Q. No new global norm
instance or complex NormedSpace/InnerProductSpace is installed.

No coordinate Euclidean norm replacement, C2 isometry,
classical Hopf quotient, or original BFSS physical conclusion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D39
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D37
open FCP.RHOPFP9C3D2G1D38

/-- Evaluate the norm of the actual D38 detached normed group.
The instance is local to this definition, not global or ambient. -/
noncomputable def relationalSourceComplexFourGroupNorm
    (x : RelationalSourceComplexFour) : ℝ := by
  letI : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  exact ‖x‖

/-- The detached D38 normed additive group actually carries the
exact Gamma9 transported Q length; no norm is substituted. -/
theorem relationalSourceComplexFourGroupNorm_eq_QNorm
    (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm x =
      relationalSourceComplexFourQNorm x := by
  unfold relationalSourceComplexFourGroupNorm
  change Real.sqrt
      ((relationalSourceComplexFourInnerProductCore.inner x x).re) =
    relationalSourceComplexFourQNorm x
  exact (relationalSourceComplexFourQNorm_eq_core_sqrt x).symm

/-- Squared norm induced by the original Core matches exactly
the original source Gamma9 transported quadratic Q. -/
theorem relationalSourceComplexFourGroupNorm_sq
    (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourGroupNorm x) ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates := by
  rw [relationalSourceComplexFourGroupNorm_eq_QNorm]
  exact relationalSourceComplexFourQNorm_sq x

/-- The detached source-derived group norm is strictly positive
on nonzero isolated original Gamma9 vectors. -/
theorem relationalSourceComplexFourGroupNorm_pos_of_ne_zero
    (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < relationalSourceComplexFourGroupNorm x := by
  rw [relationalSourceComplexFourGroupNorm_eq_QNorm]
  exact relationalSourceComplexFourQNorm_pos_of_ne_zero x hx

#print axioms relationalSourceComplexFourGroupNorm
#print axioms relationalSourceComplexFourGroupNorm_eq_QNorm
#print axioms relationalSourceComplexFourGroupNorm_sq
#print axioms relationalSourceComplexFourGroupNorm_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D39
