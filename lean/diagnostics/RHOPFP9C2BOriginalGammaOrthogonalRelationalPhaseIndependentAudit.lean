import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2BOriginalGammaOrthogonalRelationalPhase

/-! Independent original source P9C2B type/axiom consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C2BIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2B

example : relationalProjector.transpose = relationalProjector :=
  relationalProjector_transpose_eq

example : relationalPhaseJ.transpose = -relationalPhaseJ :=
  relationalPhaseJ_transpose_neg

#print axioms FCP.RHOPFP9C2B.relationalProjector_transpose_eq
#print axioms FCP.RHOPFP9C2B.relationalPhaseJ_transpose_neg

end FCP.RHOPFP9C2BIndependent
