import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D57StandardCircleOrbitClassCorrespondence

/-! Independent original Gamma9 and standard Circle orbit-class bridge. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D57Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57

example : Setoid {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} :=
  relationalEuclideanUnitCircleOrbitSetoid

example (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    Quotient relationalEuclideanUnitCircleOrbitSetoid :=
  relationalEuclideanUnitCircleOrbitClass y

example (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleRelated x y ↔
      relationalEuclideanUnitCircleOrbitClass x =
        relationalEuclideanUnitCircleOrbitClass y :=
  relationalEuclideanUnitCircleRelated_iff_orbitClass_eq x y

example (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleOrbitClass x =
        relationalSourceQUnitCircleOrbitClass y ↔
      relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph x) =
        relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph y) :=
  relationalSourceOrbitClass_eq_iff_standard x y

#print axioms FCP.RHOPFP9C3D2G1D57.relationalEuclideanUnitCircleOrbitSetoid
#print axioms FCP.RHOPFP9C3D2G1D57.relationalEuclideanUnitCircleOrbitClass
#print axioms FCP.RHOPFP9C3D2G1D57.relationalEuclideanUnitCircleRelated_iff_orbitClass_eq
#print axioms FCP.RHOPFP9C3D2G1D57.relationalSourceOrbitClass_eq_iff_standard

end
end FCP.RHOPFP9C3D2G1D57Independent
