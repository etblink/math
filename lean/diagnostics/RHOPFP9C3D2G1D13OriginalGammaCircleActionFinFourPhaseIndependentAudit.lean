import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D13OriginalGammaCircleActionFinFourPhase

/-! Independent consumer of real-four exact original Gamma9 Circle action. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D13Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1D9
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D13

example (z : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    LinearMap.range (Matrix.toLin' relationalProjector) :=
  relationalCircleRangeAction z v

example (z : Circle) (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  relationalCircleFourAction z x

example (z : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction z v =
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJRangeLinear v :=
  relationalCircleRangeAction_phase z v

example (z : Circle) (x : Fin 4 → ℝ) :
    relationalCircleFourAction z x =
      (z : ℂ).re • x + (z : ℂ).im • relationalPhaseJFourLinear x :=
  relationalCircleFourAction_phase z x

#print axioms FCP.RHOPFP9C3D2G1D13.relationalCircleRangeAction
#print axioms FCP.RHOPFP9C3D2G1D13.relationalCircleFourAction
#print axioms FCP.RHOPFP9C3D2G1D13.relationalCircleRangeAction_phase
#print axioms FCP.RHOPFP9C3D2G1D13.relationalCircleFourAction_phase

end
end FCP.RHOPFP9C3D2G1D13Independent
