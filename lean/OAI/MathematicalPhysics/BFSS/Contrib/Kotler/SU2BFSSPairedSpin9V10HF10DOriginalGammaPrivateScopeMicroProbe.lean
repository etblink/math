import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF9GeneratorDeterminantMagnitudeProbe
import all OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-!
K1D18V10H-F10D — TWO-CELL MICRO DIAGNOSTIC.
Three independent strict F10 attempts failed to reduce the
original imported private signed-permutation gammaInt at the
eight negative diagonal cells. Gate 3 further showed that
a blind "change" tactic was applied to still-unreduced
matrix goals (100 errors before limit).

Test whether explicitly importing the EXACT original gamma
module private scope permits definitional reduction of
TWO actual original gamma(8) entries: (0,0)=+1 and
(8,8)=-1. No replacement matrix or copied signed-perm
table, and NO changes to original accepted source.

This is only a microprobe of the original source's
private implementation visibility; it does NOT prove
the 16x16 matrix diagonal identity or determinant one.
Both theorems must pass independent exact type and axiom
audits before a larger 256-cell theorem is reattempted.

F10D CANDIDATE; existing F10 original full theorem is RED.
-/

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9DetFixture
noncomputable section

open FCP.BFSSGamma9
open OAI.BFSSQuantum
open Matrix

/-- The original imported signed-permutation's first
positive diagonal cell, with unchanged source gamma. -/
theorem originalGamma8_entry00 :
    (gamma (8 : SpaceIndex)) (0 : SpinIndex) (0 : SpinIndex) =
      (1 : ℝ) := by
  first
  | rfl
  | norm_num [gamma, Matrix.map_apply] <;> rfl

/-- The FIRST negative diagonal cell of the same
original source matrix, isolated from the 256-cell
proof. This is the decisive private-scope test. -/
theorem originalGamma8_entry88 :
    (gamma (8 : SpaceIndex)) (8 : SpinIndex) (8 : SpinIndex) =
      (-1 : ℝ) := by
  first
  | rfl
  | norm_num [gamma, Matrix.map_apply] <;> rfl

#print axioms originalGamma8_entry00
#print axioms originalGamma8_entry88

end
end FCP.BFSSPairedSpin9DetFixture
