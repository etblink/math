import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2DOriginalGammaRelationalQuarterTurn

/-! Independent original-source typed quarter-turn consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C2DIndependent
open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2D

example : relationalQuarterTurn.transpose =
    (1 : GammaMatrix) - relationalProjector - relationalPhaseJ :=
  relationalQuarterTurn_transpose

example : relationalQuarterTurn.transpose * relationalQuarterTurn =
    (1 : GammaMatrix) :=
  relationalQuarterTurn_transpose_mul_self

example : relationalQuarterTurn * relationalQuarterTurn =
    (1 : GammaMatrix) - (2 : ℝ) • relationalProjector :=
  relationalQuarterTurn_square

#print axioms FCP.RHOPFP9C2D.relationalQuarterTurn_transpose
#print axioms FCP.RHOPFP9C2D.relationalQuarterTurn_transpose_mul_self
#print axioms FCP.RHOPFP9C2D.relationalQuarterTurn_square
end FCP.RHOPFP9C2DIndependent
