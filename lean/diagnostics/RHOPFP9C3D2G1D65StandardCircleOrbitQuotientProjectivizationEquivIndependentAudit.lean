import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D65StandardCircleOrbitQuotientProjectivizationEquiv

/-! Independent strict type consumer for exact standard Circle quotient projective Equiv. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D65Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65

example :
    Quotient relationalEuclideanUnitCircleOrbitSetoid ≃
      Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  relationalStandardCircleOrbitQuotientProjectivizationEquiv

example (x : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalStandardCircleOrbitQuotientProjectivizationEquiv
        (relationalEuclideanUnitCircleOrbitClass x) =
      relationalStandardUnitSphereProjectivePoint x :=
  relationalStandardCircleOrbitQuotientProjectivizationEquiv_class x

#print axioms FCP.RHOPFP9C3D2G1D65.relationalStandardCircleOrbitQuotientProjectivizationEquiv
#print axioms FCP.RHOPFP9C3D2G1D65.relationalStandardCircleOrbitQuotientProjectivizationEquiv_class

end
end FCP.RHOPFP9C3D2G1D65Independent
