import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D63StandardCircleOrbitQuotientProjectivizationInjection

/-! Independently type-check the exact D57 Circle orbit quotient/projective-point map. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D63Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D63

example (q : Quotient relationalEuclideanUnitCircleOrbitSetoid) :
    Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  relationalStandardCircleOrbitQuotientToProjectivization q

example (x : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalStandardCircleOrbitQuotientToProjectivization
        (relationalEuclideanUnitCircleOrbitClass x) =
      relationalStandardUnitSphereProjectivePoint x :=
  relationalStandardCircleOrbitQuotientToProjectivization_class x

example :
    Function.Injective relationalStandardCircleOrbitQuotientToProjectivization :=
  relationalStandardCircleOrbitQuotientToProjectivization_injective

#print axioms FCP.RHOPFP9C3D2G1D63.relationalStandardCircleOrbitQuotientToProjectivization
#print axioms FCP.RHOPFP9C3D2G1D63.relationalStandardCircleOrbitQuotientToProjectivization_class
#print axioms FCP.RHOPFP9C3D2G1D63.relationalStandardCircleOrbitQuotientToProjectivization_injective

end
end FCP.RHOPFP9C3D2G1D63Independent
