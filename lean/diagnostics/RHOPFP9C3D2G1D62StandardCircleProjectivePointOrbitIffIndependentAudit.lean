import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D62StandardCircleProjectivePointOrbitIff

/-! Independently import the exact standard Circle/projective-point iff. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D62Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D62

example (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1})
    (hxy : relationalStandardUnitSphereProjectivePoint x =
      relationalStandardUnitSphereProjectivePoint y) :
    relationalEuclideanUnitCircleRelated x y :=
  relationalStandardUnitSphereProjectivePoint_eq_implies_related x y hxy

example (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleRelated x y ↔
      relationalStandardUnitSphereProjectivePoint x =
        relationalStandardUnitSphereProjectivePoint y :=
  relationalStandardUnitSphereRelated_iff_projectivePoint_eq x y

#print axioms FCP.RHOPFP9C3D2G1D62.relationalStandardUnitSphereProjectivePoint_eq_implies_related
#print axioms FCP.RHOPFP9C3D2G1D62.relationalStandardUnitSphereRelated_iff_projectivePoint_eq

end
end FCP.RHOPFP9C3D2G1D62Independent
