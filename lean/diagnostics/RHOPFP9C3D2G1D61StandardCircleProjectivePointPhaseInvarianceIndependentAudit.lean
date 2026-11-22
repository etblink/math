import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D61StandardCircleProjectivePointPhaseInvariance

/-! Independent imported projective-point phase invariance type contract. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D61Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D61

example (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    (y.val : EuclideanSpace ℂ (Fin 2)) ≠ 0 :=
  relationalStandardUnitSphere_nonzero y

example (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  relationalStandardUnitSphereProjectivePoint y

example (z : Circle) (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalStandardUnitSphereProjectivePoint
        (relationalEuclideanUnitCircleAction z y) =
      relationalStandardUnitSphereProjectivePoint y :=
  relationalStandardUnitSphereProjectivePoint_circle_invariant z y

example (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1})
    (hxy : relationalEuclideanUnitCircleRelated x y) :
    relationalStandardUnitSphereProjectivePoint x =
      relationalStandardUnitSphereProjectivePoint y :=
  relationalStandardUnitSphereRelated_projectivePoint_eq x y hxy

#print axioms FCP.RHOPFP9C3D2G1D61.relationalStandardUnitSphere_nonzero
#print axioms FCP.RHOPFP9C3D2G1D61.relationalStandardUnitSphereProjectivePoint
#print axioms FCP.RHOPFP9C3D2G1D61.relationalStandardUnitSphereProjectivePoint_circle_invariant
#print axioms FCP.RHOPFP9C3D2G1D61.relationalStandardUnitSphereRelated_projectivePoint_eq

end
end FCP.RHOPFP9C3D2G1D61Independent
