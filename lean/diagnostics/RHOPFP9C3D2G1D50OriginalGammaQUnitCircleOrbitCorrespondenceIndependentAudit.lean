import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D50OriginalGammaQUnitCircleOrbitCorrespondence

/-! Independent source-exact Gamma9 Q-unit Circle-orbit correspondence audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D50Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D50

example
    (x y : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceQUnitCircleRelated x y ↔
      relationalEuclideanUnitCircleRelated
        (relationalSourceQUnitEuclideanUnitHomeomorph x)
        (relationalSourceQUnitEuclideanUnitHomeomorph y) :=
  relationalSourceQUnitCircleRelated_iff_euclidean x y

#print axioms FCP.RHOPFP9C3D2G1D50.relationalSourceQUnitCircleRelated
#print axioms FCP.RHOPFP9C3D2G1D50.relationalEuclideanUnitCircleRelated
#print axioms FCP.RHOPFP9C3D2G1D50.relationalSourceQUnitCircleRelated_iff_euclidean

end
end FCP.RHOPFP9C3D2G1D50Independent
