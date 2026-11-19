import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2AOriginalGammaRelationalPhaseSquare

/-! Independent exact original-source P9C2A consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C2AIndependent

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A

example :
    (gamma 1 * gamma 3) * relationalProjector =
      relationalProjector * (gamma 1 * gamma 3) :=
  original_K13_commutes_relationalProjector

example : relationalPhaseJ * relationalPhaseJ = -relationalProjector :=
  relationalPhaseJ_square_neg_projector

#print axioms FCP.RHOPFP9C2A.original_K13_commutes_relationalProjector
#print axioms FCP.RHOPFP9C2A.relationalPhaseJ_square_neg_projector

end FCP.RHOPFP9C2AIndependent
