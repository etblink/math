import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3B0OriginalGammaRelationalComplementSupport

/-! Independent original Gamma9 complement support consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3B0Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B0

example :
    relationalComplement * relationalComplement =
      relationalComplement :=
  relationalComplement_idempotent

example :
    relationalComplement * relationalProjector = 0 :=
  relationalComplement_mul_projector

example :
    relationalProjector * relationalComplement = 0 :=
  relationalProjector_mul_complement

example :
    relationalComplement * relationalPhaseJ = 0 :=
  relationalComplement_mul_phaseJ

example :
    relationalPhaseJ * relationalComplement = 0 :=
  relationalPhaseJ_mul_complement

example (a b : ℝ) :
    relationalCirclePhase a b =
      relationalComplement + a • relationalProjector + b • relationalPhaseJ :=
  relationalCirclePhase_eq_complement_sum a b

#print axioms FCP.RHOPFP9C3B0.relationalComplement_idempotent
#print axioms FCP.RHOPFP9C3B0.relationalComplement_mul_projector
#print axioms FCP.RHOPFP9C3B0.relationalProjector_mul_complement
#print axioms FCP.RHOPFP9C3B0.relationalComplement_mul_phaseJ
#print axioms FCP.RHOPFP9C3B0.relationalPhaseJ_mul_complement
#print axioms FCP.RHOPFP9C3B0.relationalCirclePhase_eq_complement_sum

end FCP.RHOPFP9C3B0Independent
