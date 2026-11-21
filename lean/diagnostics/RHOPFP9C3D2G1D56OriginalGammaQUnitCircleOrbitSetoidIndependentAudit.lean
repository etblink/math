import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D56OriginalGammaQUnitCircleOrbitSetoid

/-!
Independent exact original Gamma9 orbit Setoid and set-quotient consumer.
Imported source, no replacement Circle action or unproved quotient topology.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D56Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D56

example : Setoid {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} :=
  relationalSourceQUnitCircleOrbitSetoid

example (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    Quotient relationalSourceQUnitCircleOrbitSetoid :=
  relationalSourceQUnitCircleOrbitClass x

example (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalSourceQUnitCircleOrbitSetoid x y :=
  relationalSourceQUnitCircleRelated_iff_orbitSetoid x y

example (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalSourceQUnitCircleOrbitClass x =
        relationalSourceQUnitCircleOrbitClass y :=
  relationalSourceQUnitCircleRelated_iff_orbitClass_eq x y

#print axioms FCP.RHOPFP9C3D2G1D56.relationalSourceQUnitCircleOrbitSetoid
#print axioms FCP.RHOPFP9C3D2G1D56.relationalSourceQUnitCircleOrbitClass
#print axioms FCP.RHOPFP9C3D2G1D56.relationalSourceQUnitCircleRelated_iff_orbitSetoid
#print axioms FCP.RHOPFP9C3D2G1D56.relationalSourceQUnitCircleRelated_iff_orbitClass_eq

end
end FCP.RHOPFP9C3D2G1D56Independent
