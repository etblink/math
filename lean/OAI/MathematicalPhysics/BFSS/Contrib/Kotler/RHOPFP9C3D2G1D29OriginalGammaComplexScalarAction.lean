import Mathlib.Tactic.Abel
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D28OriginalGammaHermitianJ4ComplexIdentities

/-!
# RHOPF-P9C3D2G1D29 — exact original Gamma9 complex scalar action intake

D28 qualified the full complex equations H(J4x,y)=I*H(x,y)
and H(x,J4y)=-(I*H(x,y)). D10 qualified the original source
real-linear J4 with J4²=-I. This gate defines only a standalone
source-derived scalar-action function z⋅x := z.re•x+z.im•J4(x).
It proves zero, one, I, scalar additivity and vector additivity.

Do not install a global Module ℂ instance, change the existing
coordinate norm, use synthetic Gamma9, or assert associativity,
complex sesquilinearity, standard Hopf quotient/Chern or BFSS soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D29
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D28

/-- Original Gamma9 transported J4 defines a candidate complex scalar
action on the accepted noncanonical source four-real-coordinate space.
Not registered as any typeclass instance. -/
noncomputable def relationalSourceComplexScalarAction
    (z : ℂ) (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  z.re • x + z.im • relationalPhaseJFourLinear x

theorem relationalSourceComplexScalarAction_zero (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction 0 x = 0 := by
  simp [relationalSourceComplexScalarAction]

theorem relationalSourceComplexScalarAction_one (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction 1 x = x := by
  simp [relationalSourceComplexScalarAction]

/-- Acting with the complex unit uses the exact original Gamma9 J4. -/
theorem relationalSourceComplexScalarAction_I (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction Complex.I x =
      relationalPhaseJFourLinear x := by
  simp [relationalSourceComplexScalarAction]

theorem relationalSourceComplexScalarAction_add_scalar
    (z w : ℂ) (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction (z + w) x =
      relationalSourceComplexScalarAction z x +
        relationalSourceComplexScalarAction w x := by
  simp only [relationalSourceComplexScalarAction, Complex.add_re,
    Complex.add_im, add_smul]
  abel

theorem relationalSourceComplexScalarAction_add_vector
    (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction z (x + y) =
      relationalSourceComplexScalarAction z x +
        relationalSourceComplexScalarAction z y := by
  simp only [relationalSourceComplexScalarAction, map_add, smul_add]
  abel

#print axioms relationalSourceComplexScalarAction
#print axioms relationalSourceComplexScalarAction_zero
#print axioms relationalSourceComplexScalarAction_one
#print axioms relationalSourceComplexScalarAction_I
#print axioms relationalSourceComplexScalarAction_add_scalar
#print axioms relationalSourceComplexScalarAction_add_vector

end
end FCP.RHOPFP9C3D2G1D29
