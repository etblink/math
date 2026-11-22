import Mathlib.Tactic
import Mathlib.Topology.Constructions
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D58OriginalStandardCircleOrbitQuotientEquiv

/-!
# RHOPF-P9C3D2G1D59 — source-original and standard Circle orbit quotient topology maps

D56 and D57 construct exact Gamma9 source-Q and standard complex
Circle orbit Setoids and set quotient class maps. D58 qualifies an
explicit equivalence of SET quotient types. This bounded gate
instantiates the STANDARD Mathlib coinduced topology of each exact
orbit quotient and verifies the canonical class maps are quotient
maps. The source-Q ambient topology is precisely the locally supplied
D38/D40/D41 topology from D48. No alternate source topology, globally
installed instance, quotient homeomorphism, CP¹/S² or physical claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D59
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57

/-- The canonical class map from ORIGINAL Gamma9 source-Q unit
vectors is a quotient map for the Mathlib coinduced quotient topology,
under exactly D48's locally installed source-Q norm/topology. -/
theorem relationalSourceQUnitCircleOrbitClass_isQuotientMap :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    IsQuotientMap (relationalSourceQUnitCircleOrbitClass :
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} →
        Quotient relationalSourceQUnitCircleOrbitSetoid) := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  change IsQuotientMap
    (Quotient.mk relationalSourceQUnitCircleOrbitSetoid :
      {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1} →
        Quotient relationalSourceQUnitCircleOrbitSetoid)
  exact isQuotientMap_quotient_mk'

/-- The canonical class map for the exact accepted D52 STANDARD
complex scalar Circle action is also a Mathlib quotient map,
without a replaced orbit Setoid or alternate quotient topology. -/
theorem relationalEuclideanUnitCircleOrbitClass_isQuotientMap :
    IsQuotientMap (relationalEuclideanUnitCircleOrbitClass :
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} →
        Quotient relationalEuclideanUnitCircleOrbitSetoid) := by
  change IsQuotientMap
    (Quotient.mk relationalEuclideanUnitCircleOrbitSetoid :
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} →
        Quotient relationalEuclideanUnitCircleOrbitSetoid)
  exact isQuotientMap_quotient_mk'

#print axioms relationalSourceQUnitCircleOrbitClass_isQuotientMap
#print axioms relationalEuclideanUnitCircleOrbitClass_isQuotientMap

end
end FCP.RHOPFP9C3D2G1D59
