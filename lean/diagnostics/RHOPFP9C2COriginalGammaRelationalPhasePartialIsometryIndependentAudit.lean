import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2COriginalGammaRelationalPhasePartialIsometry

/-! Independent source-original P9C2C partial-isometry typed consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C2CIndependent

open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2C

example :
    relationalPhaseJ.transpose * relationalPhaseJ =
      relationalProjector :=
  relationalPhaseJ_transpose_mul_self

example :
    relationalPhaseJ * relationalPhaseJ.transpose =
      relationalProjector :=
  relationalPhaseJ_mul_transpose_self

example :
    relationalPhaseJ * relationalProjector =
      relationalPhaseJ :=
  relationalPhaseJ_mul_projector

example :
    relationalProjector * relationalPhaseJ =
      relationalPhaseJ :=
  relationalProjector_mul_phaseJ

#print axioms FCP.RHOPFP9C2C.relationalPhaseJ_transpose_mul_self
#print axioms FCP.RHOPFP9C2C.relationalPhaseJ_mul_transpose_self
#print axioms FCP.RHOPFP9C2C.relationalPhaseJ_mul_projector
#print axioms FCP.RHOPFP9C2C.relationalProjector_mul_phaseJ

end FCP.RHOPFP9C2CIndependent
