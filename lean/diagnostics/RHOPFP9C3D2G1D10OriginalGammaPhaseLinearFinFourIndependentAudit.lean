import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D10OriginalGammaPhaseLinearFinFour

/-! Independent imported consumer: original Gamma9 real-four coordinate phase. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D10Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1D9
open FCP.RHOPFP9C3D2G1D10

example : (Fin 4 → ℝ) →ₗ[ℝ] (Fin 4 → ℝ) :=
  relationalPhaseJFourLinear

example (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear x =
      relationalRangeContinuousLinearEquivFinFour
        (relationalPhaseJRangeLinear
          (relationalRangeContinuousLinearEquivFinFour.symm x)) :=
  relationalPhaseJFourLinear_apply x

example (x : Fin 4 → ℝ) :
    relationalPhaseJFourLinear (relationalPhaseJFourLinear x) = -x :=
  relationalPhaseJFourLinear_square x

#print axioms FCP.RHOPFP9C3D2G1D10.relationalPhaseJFourLinear
#print axioms FCP.RHOPFP9C3D2G1D10.relationalPhaseJFourLinear_apply
#print axioms FCP.RHOPFP9C3D2G1D10.relationalPhaseJFourLinear_square

end
end FCP.RHOPFP9C3D2G1D10Independent
