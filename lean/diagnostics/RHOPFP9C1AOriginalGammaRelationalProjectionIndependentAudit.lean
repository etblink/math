import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1AOriginalGammaRelationalProjection

/-!
Independent original Gamma9 consumer of P9C1A relational source
projection. This consumer imports the original proved projector and
rechecks all THREE public types, not an abstract substitute.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C1AIndependent
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A

example :
    relationalProjector * relationalProjector = relationalProjector :=
  relationalProjector_idempotent

example :
    (gamma 1 * gamma 3) * relationalProjector =
      (-(gamma 2 * gamma 5)) * relationalProjector :=
  K13_projected_eq_K25

example :
    (gamma 1 * gamma 3) * relationalProjector =
      (-(gamma 4 * gamma 6)) * relationalProjector :=
  K13_projected_eq_K46

#print axioms FCP.RHOPFP9C1A.relationalProjector_idempotent
#print axioms FCP.RHOPFP9C1A.K13_projected_eq_K25
#print axioms FCP.RHOPFP9C1A.K13_projected_eq_K46

end FCP.RHOPFP9C1AIndependent
