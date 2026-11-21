import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D44OriginalGammaComplexLinearEquivFinTwo

/-! Independent original-source D44 consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D44Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D42
open FCP.RHOPFP9C3D2G1D44

example :
    RelationalSourceComplexFour ≃ₗ[ℂ] (Fin 2 → ℂ) :=
  relationalSourceComplexFourLinearEquivFinTwo

example (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourLinearEquivFinTwo
      (relationalSourceComplexFourCircleAction z x) =
        (z : ℂ) • relationalSourceComplexFourLinearEquivFinTwo x :=
  relationalSourceComplexFourLinearEquivFinTwo_circle z x

#print axioms FCP.RHOPFP9C3D2G1D44.relationalSourceComplexFourLinearEquivFinTwo
#print axioms FCP.RHOPFP9C3D2G1D44.relationalSourceComplexFourLinearEquivFinTwo_circle

end
end FCP.RHOPFP9C3D2G1D44Independent
