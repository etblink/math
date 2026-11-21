import Mathlib.Tactic.Abel
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D29OriginalGammaComplexScalarAction

/-!
# RHOPF-P9C3D2G1D30 — original Gamma9 complex scalar associativity

The accepted original source Gamma9 real-linear J4 squares to -I (D10).
The standalone source-derived complex action (D29) is z⊙x := z.re•x + z.im•J4 x.
This gate tests the remaining nontrivial complex multiplication law
(z*w)⊙x = z⊙(w⊙x), using exact Complex.mul_re/im from pinned Mathlib.
It also records J4 action on z⊙x and the zero-vector law.

No global Module ℂ instance, surrogate Euclidean metric, standard
Hopf action equivalence/quotient, physical Fock or soliton claimed.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D30
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D29

/-- Source J4 on the candidate complex action, from the actual
original Gamma9 real-linear J4 and its J4²=-I identity. -/
theorem relationalPhaseJFourLinear_complexScalarAction
    (w : ℂ) (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear (relationalSourceComplexScalarAction w x) =
      w.re • relationalPhaseJFourLinear x - w.im • x := by
  unfold relationalSourceComplexScalarAction
  rw [map_add, map_smul, map_smul,
    relationalPhaseJFourLinear_square, smul_neg]
  rfl

/-- Scalar associativity of the original Gamma9 source-derived
complex action, without installing a global complex module instance. -/
theorem relationalSourceComplexScalarAction_mul
    (z w : ℂ) (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction (z * w) x =
      relationalSourceComplexScalarAction z
        (relationalSourceComplexScalarAction w x) := by
  change
    (z * w).re • x + (z * w).im • relationalPhaseJFourLinear x =
    z.re • (w.re • x + w.im • relationalPhaseJFourLinear x) +
      z.im • relationalPhaseJFourLinear
        (w.re • x + w.im • relationalPhaseJFourLinear x)
  rw [Complex.mul_re, Complex.mul_im,
    map_add, map_smul, map_smul,
    relationalPhaseJFourLinear_square]
  simp only [add_smul, sub_smul, smul_add, smul_smul, smul_neg]
  abel

/-- The standalone source-derived complex scalar action maps zero to
zero, as required for eventual Module ℂ packaging on a safe carrier. -/
theorem relationalSourceComplexScalarAction_zero_vector
    (z : ℂ) :
    relationalSourceComplexScalarAction z (0 : Fin 4 → ℝ) = 0 := by
  simp [relationalSourceComplexScalarAction]

#print axioms relationalPhaseJFourLinear_complexScalarAction
#print axioms relationalSourceComplexScalarAction_mul
#print axioms relationalSourceComplexScalarAction_zero_vector

end
end FCP.RHOPFP9C3D2G1D30
