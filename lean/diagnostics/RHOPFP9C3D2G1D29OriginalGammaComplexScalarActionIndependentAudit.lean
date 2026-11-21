import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D29OriginalGammaComplexScalarAction

/-! Independent original-source imported consumer of the stand-alone
complex scalar-action function induced by the exact original Gamma9 J4. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D29Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D29

example (z : ℂ) (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  relationalSourceComplexScalarAction z x

example (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction 0 x = 0 :=
  relationalSourceComplexScalarAction_zero x

example (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction 1 x = x :=
  relationalSourceComplexScalarAction_one x

example (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction Complex.I x =
      relationalPhaseJFourLinear x :=
  relationalSourceComplexScalarAction_I x

example (z w : ℂ) (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction (z + w) x =
      relationalSourceComplexScalarAction z x +
        relationalSourceComplexScalarAction w x :=
  relationalSourceComplexScalarAction_add_scalar z w x

example (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction z (x + y) =
      relationalSourceComplexScalarAction z x +
        relationalSourceComplexScalarAction z y :=
  relationalSourceComplexScalarAction_add_vector z x y

#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction
#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction_zero
#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction_one
#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction_I
#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction_add_scalar
#print axioms FCP.RHOPFP9C3D2G1D29.relationalSourceComplexScalarAction_add_vector

end
end FCP.RHOPFP9C3D2G1D29Independent
