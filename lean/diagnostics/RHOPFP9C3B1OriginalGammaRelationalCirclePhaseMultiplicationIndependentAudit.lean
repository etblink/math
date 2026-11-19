import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3B1OriginalGammaRelationalCirclePhaseMultiplication

/-! Independent imported type-and-axiom consumer of the original source phase multiplication. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3B1Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B1

example (a b c d : ℝ) :
    relationalCirclePhase a b * relationalCirclePhase c d =
      relationalCirclePhase (a * c - b * d) (a * d + b * c) :=
  relationalCirclePhase_mul a b c d

#print axioms FCP.RHOPFP9C3B1.relationalCirclePhase_mul

end FCP.RHOPFP9C3B1Independent
