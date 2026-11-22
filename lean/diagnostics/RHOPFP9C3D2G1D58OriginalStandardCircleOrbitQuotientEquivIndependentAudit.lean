import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D58OriginalStandardCircleOrbitQuotientEquiv

/-! Independent exact original Gamma9-to-standard Circle SET quotient Equiv audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D58Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D58

example :
    Quotient relationalSourceQUnitCircleOrbitSetoid ≃
      Quotient relationalEuclideanUnitCircleOrbitSetoid :=
  relationalSourceToStandardOrbitQuotientEquiv

example (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceToStandardOrbitQuotientEquiv
        (relationalSourceQUnitCircleOrbitClass x) =
      relationalEuclideanUnitCircleOrbitClass
        (relationalSourceQUnitEuclideanUnitHomeomorph x) :=
  relationalSourceToStandardOrbitQuotientEquiv_class x

#print axioms FCP.RHOPFP9C3D2G1D58.relationalSourceToStandardOrbitQuotientEquiv
#print axioms FCP.RHOPFP9C3D2G1D58.relationalSourceToStandardOrbitQuotientEquiv_class

end
end FCP.RHOPFP9C3D2G1D58Independent
