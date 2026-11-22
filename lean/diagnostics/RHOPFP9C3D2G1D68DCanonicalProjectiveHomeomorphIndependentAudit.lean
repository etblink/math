import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68DCanonicalProjectiveHomeomorph

/-! Independent imported consumer of exact original D65 canonical homeomorphism. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68DIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D66
open FCP.RHOPFP9C3D2G1D68D

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Quotient relationalEuclideanUnitCircleOrbitSetoid ≃ₜ
      Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  relationalStandardCircleOrbitCanonicalProjectivizationHomeomorph

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    ∀ y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1},
      relationalStandardCircleOrbitCanonicalProjectivizationHomeomorph
        (relationalEuclideanUnitCircleOrbitClass y) =
      relationalStandardUnitSphereProjectivePoint y :=
  relationalStandardCircleOrbitCanonicalProjectivizationHomeomorph_class

#print axioms FCP.RHOPFP9C3D2G1D68D.relationalStandardCircleOrbitCanonicalProjectivizationHomeomorph
#print axioms FCP.RHOPFP9C3D2G1D68D.relationalStandardCircleOrbitCanonicalProjectivizationHomeomorph_class

end
end FCP.RHOPFP9C3D2G1D68DIndependent
