import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D30OriginalGammaComplexScalarAssociativity

/-! Independent source-exact imported consumer for J4 action,
complex scalar associativity and zero-vector scalar law. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D30Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D30

example (w : ℂ) (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear (relationalSourceComplexScalarAction w x) =
      w.re • relationalPhaseJFourLinear x - w.im • x :=
  relationalPhaseJFourLinear_complexScalarAction w x

example (z w : ℂ) (x : Fin 4 → ℝ) :
    relationalSourceComplexScalarAction (z * w) x =
      relationalSourceComplexScalarAction z
        (relationalSourceComplexScalarAction w x) :=
  relationalSourceComplexScalarAction_mul z w x

example (z : ℂ) :
    relationalSourceComplexScalarAction z (0 : Fin 4 → ℝ) = 0 :=
  relationalSourceComplexScalarAction_zero_vector z

#print axioms FCP.RHOPFP9C3D2G1D30.relationalPhaseJFourLinear_complexScalarAction
#print axioms FCP.RHOPFP9C3D2G1D30.relationalSourceComplexScalarAction_mul
#print axioms FCP.RHOPFP9C3D2G1D30.relationalSourceComplexScalarAction_zero_vector

end
end FCP.RHOPFP9C3D2G1D30Independent
