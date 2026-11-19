import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3COriginalGammaRelationalUnitCircleOrthogonality

/-! Independent original-source phase orthogonality typed consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3CIndependent
open OAI.BFSSQuantum
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3C

example (a b : ℝ) :
    (relationalCirclePhase a b).transpose * relationalCirclePhase a b =
      relationalCirclePhase (a * a + b * b) 0 :=
  relationalCirclePhase_transpose_mul_self a b

example (a b : ℝ) (hunit : a * a + b * b = 1) :
    (relationalCirclePhase a b).transpose * relationalCirclePhase a b =
      (1 : GammaMatrix) :=
  relationalCirclePhase_orthogonal_of_unit a b hunit

#print axioms FCP.RHOPFP9C3C.relationalCirclePhase_transpose_mul_self
#print axioms FCP.RHOPFP9C3C.relationalCirclePhase_orthogonal_of_unit

end FCP.RHOPFP9C3CIndependent
