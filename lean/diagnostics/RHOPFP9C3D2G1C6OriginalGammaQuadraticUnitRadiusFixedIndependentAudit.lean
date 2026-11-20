import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C6OriginalGammaQuadraticUnitRadiusFixed

/-! Independent original-source Gamma9 quadratic unit radius and fixedness audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C6Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C6

example : relationalRangeCoordinateDotSelf (0 : Fin 4 → ℝ) = 0 :=
  relationalRangeCoordinateDotSelf_zero

example (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) : x ≠ 0 :=
  relationalRangeCoordinateDotSelf_one_ne_zero x hx

example (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) :
    relationalRangeCoordinateRadius x = 1 :=
  relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one x hx

example (x : Fin 4 → ℝ)
    (hx : relationalRangeCoordinateDotSelf x = 1) :
    (relationalRangeCoordinateRadius x)⁻¹ • x = x :=
  relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one x hx

#print axioms FCP.RHOPFP9C3D2G1C6.relationalRangeCoordinateDotSelf_zero
#print axioms FCP.RHOPFP9C3D2G1C6.relationalRangeCoordinateDotSelf_one_ne_zero
#print axioms FCP.RHOPFP9C3D2G1C6.relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one
#print axioms FCP.RHOPFP9C3D2G1C6.relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one

end
end FCP.RHOPFP9C3D2G1C6Independent
