import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3AOriginalGammaRelationalCirclePhaseFamily

/-! Independent exact imported original-source phase-family type consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3AIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2D
open FCP.RHOPFP9C3A

example : relationalCirclePhase 1 0 = (1 : GammaMatrix) :=
  relationalCirclePhase_one_zero

example : relationalCirclePhase 0 1 = relationalQuarterTurn :=
  relationalCirclePhase_zero_one

example : relationalCirclePhase (-1) 0 =
    (1 : GammaMatrix) - (2 : ℝ) • relationalProjector :=
  relationalCirclePhase_neg_one_zero

example (a b : ℝ) :
    (relationalCirclePhase a b).transpose =
      relationalCirclePhase a (-b) :=
  relationalCirclePhase_transpose a b

#print axioms FCP.RHOPFP9C3A.relationalCirclePhase_one_zero
#print axioms FCP.RHOPFP9C3A.relationalCirclePhase_zero_one
#print axioms FCP.RHOPFP9C3A.relationalCirclePhase_neg_one_zero
#print axioms FCP.RHOPFP9C3A.relationalCirclePhase_transpose

end FCP.RHOPFP9C3AIndependent
