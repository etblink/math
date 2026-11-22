import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68ANonzeroUnitNormalization

/-! Independent imported consumer of exact nonzero-to-unit normalization. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68AIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D68A

example (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalCanonicalNonzeroUnitNormalization v

example (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    relationalStandardUnitSphereProjectivePoint
        (relationalCanonicalNonzeroUnitNormalization v) =
      Projectivization.mk' ℂ v :=
  relationalCanonicalNonzeroUnitNormalization_projectivePoint v

example (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
    relationalStandardCircleOrbitQuotientProjectivizationEquiv
        (relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v)) =
      Projectivization.mk' ℂ v :=
  relationalCanonicalNonzeroUnitNormalization_orbitClass v

#print axioms FCP.RHOPFP9C3D2G1D68A.relationalCanonicalNonzeroUnitNormalization
#print axioms FCP.RHOPFP9C3D2G1D68A.relationalCanonicalNonzeroUnitNormalization_projectivePoint
#print axioms FCP.RHOPFP9C3D2G1D68A.relationalCanonicalNonzeroUnitNormalization_orbitClass

end
end FCP.RHOPFP9C3D2G1D68AIndependent
