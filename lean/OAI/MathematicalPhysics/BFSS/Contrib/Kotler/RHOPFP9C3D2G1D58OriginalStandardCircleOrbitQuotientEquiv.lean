import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D57StandardCircleOrbitClassCorrespondence

/-!
# RHOPF-P9C3D2G1D58 — exact original-to-standard Circle orbit SET quotient equivalence

D56 supplies Mathlib's Setoid and set quotient for the ORIGINAL Gamma9
Circle action. D57 constructs the standard Circle set quotient and
proves class-equality equivalence under the original-Q D48 homeomorphism.

This gate uses pinned Mathlib Quotient.congr to package their genuine
set quotient EQUIVALENCE, without a global topology, replacement phase,
topological quotient homeomorphism, CP¹/S² or physical BFSS claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D58
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57

/-- An actual equivalence of the two SET orbit quotient types.
Its forward map is induced by D48's source-exact Gamma9 Q-unit
homeomorphism H; its inverse is induced by H.symm. The well-definedness
and inverse laws follow solely from accepted D57 orbit class equality. -/
noncomputable def relationalSourceToStandardOrbitQuotientEquiv :
    Quotient relationalSourceQUnitCircleOrbitSetoid ≃
      Quotient relationalEuclideanUnitCircleOrbitSetoid := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  refine Quotient.congr
    relationalSourceQUnitEuclideanUnitHomeomorph.toEquiv ?_
  intro x y
  have hSource :
      relationalSourceQUnitCircleOrbitSetoid x y ↔
        relationalSourceQUnitCircleOrbitClass x =
          relationalSourceQUnitCircleOrbitClass y := by
    change relationalSourceQUnitCircleOrbitSetoid x y ↔
      (Quotient.mk relationalSourceQUnitCircleOrbitSetoid x =
        Quotient.mk relationalSourceQUnitCircleOrbitSetoid y)
    exact (Quotient.eq).symm
  have hStandard :
      relationalEuclideanUnitCircleOrbitSetoid
        (relationalSourceQUnitEuclideanUnitHomeomorph x)
        (relationalSourceQUnitEuclideanUnitHomeomorph y) ↔
        relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph x) =
        relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph y) := by
    change relationalEuclideanUnitCircleOrbitSetoid
      (relationalSourceQUnitEuclideanUnitHomeomorph x)
      (relationalSourceQUnitEuclideanUnitHomeomorph y) ↔
        (Quotient.mk relationalEuclideanUnitCircleOrbitSetoid
          (relationalSourceQUnitEuclideanUnitHomeomorph x) =
         Quotient.mk relationalEuclideanUnitCircleOrbitSetoid
          (relationalSourceQUnitEuclideanUnitHomeomorph y))
    exact (Quotient.eq).symm
  exact hSource.trans
    ((relationalSourceOrbitClass_eq_iff_standard x y).trans hStandard.symm)

/-- The set-quotient equivalence sends the exact ORIGINAL Gamma9
orbit class of x to the exact STANDARD complex Circle orbit class
of D48's H(x). This is not a continuity theorem for quotient spaces. -/
theorem relationalSourceToStandardOrbitQuotientEquiv_class
    (x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1}) :
    relationalSourceToStandardOrbitQuotientEquiv
        (relationalSourceQUnitCircleOrbitClass x) =
      relationalEuclideanUnitCircleOrbitClass
        (relationalSourceQUnitEuclideanUnitHomeomorph x) := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  rfl

#print axioms relationalSourceToStandardOrbitQuotientEquiv
#print axioms relationalSourceToStandardOrbitQuotientEquiv_class

end
end FCP.RHOPFP9C3D2G1D58
