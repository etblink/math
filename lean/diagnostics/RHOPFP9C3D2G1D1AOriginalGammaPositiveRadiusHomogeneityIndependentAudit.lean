import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D1AOriginalGammaPositiveRadiusHomogeneity

/-! Independent source-typed consumers for both source and standard radius homogeneity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D1AIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1D1A

example (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateRadius (t • x) =
      t * relationalRangeCoordinateRadius x :=
  relationalRangeCoordinateRadius_smul_nonneg t ht x

example (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    standardCoordinateRadius (t • x) =
      t * standardCoordinateRadius x :=
  standardCoordinateRadius_smul_nonneg t ht x

#print axioms FCP.RHOPFP9C3D2G1D1A.relationalRangeCoordinateRadius_smul_nonneg
#print axioms FCP.RHOPFP9C3D2G1D1A.standardCoordinateRadius_smul_nonneg

end
end FCP.RHOPFP9C3D2G1D1AIndependent
