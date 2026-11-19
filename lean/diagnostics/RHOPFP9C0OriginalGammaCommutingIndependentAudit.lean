import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C0OriginalGammaCommutingTriple

/-! RHOPF-P9C0: independent exact original-source type and axiom consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C0IndependentConsumer
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C0

example :
    (gamma 1 * gamma 3) * (-(gamma 2 * gamma 5)) =
      (-(gamma 2 * gamma 5)) * (gamma 1 * gamma 3) :=
  K13_K25_commute

example :
    (gamma 1 * gamma 3) * (-(gamma 4 * gamma 6)) =
      (-(gamma 4 * gamma 6)) * (gamma 1 * gamma 3) :=
  K13_K46_commute

example :
    (-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6)) =
      (-(gamma 4 * gamma 6)) * (-(gamma 2 * gamma 5)) :=
  K25_K46_commute

example :
    ((gamma 1 * gamma 3) * (-(gamma 2 * gamma 5))) *
      ((gamma 1 * gamma 3) * (-(gamma 2 * gamma 5))) =
        (1 : GammaMatrix) :=
  K13K25_involution

example :
    ((gamma 1 * gamma 3) * (-(gamma 4 * gamma 6))) *
      ((gamma 1 * gamma 3) * (-(gamma 4 * gamma 6))) =
        (1 : GammaMatrix) :=
  K13K46_involution

example :
    ((-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6))) *
      ((-(gamma 2 * gamma 5)) * (-(gamma 4 * gamma 6))) =
        (1 : GammaMatrix) :=
  K25K46_involution

#print axioms FCP.RHOPFP9C0.K13_K25_commute
#print axioms FCP.RHOPFP9C0.K13_K46_commute
#print axioms FCP.RHOPFP9C0.K25_K46_commute
#print axioms FCP.RHOPFP9C0.K13K25_involution
#print axioms FCP.RHOPFP9C0.K13K46_involution
#print axioms FCP.RHOPFP9C0.K25K46_involution

end FCP.RHOPFP9C0IndependentConsumer
