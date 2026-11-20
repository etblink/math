import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C4OriginalGammaCoordinateQuadraticHomogeneity

/-! Independent original-source Gamma9 coordinate quadratic scalar homogeneity test. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C4Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C4

example (t : ℝ) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (t • x) =
      t * (t * relationalRangeCoordinateDotSelf x) :=
  relationalRangeCoordinateDotSelf_smul t x

#print axioms FCP.RHOPFP9C3D2G1C4.relationalRangeCoordinateDotSelf_smul

end
end FCP.RHOPFP9C3D2G1C4Independent
