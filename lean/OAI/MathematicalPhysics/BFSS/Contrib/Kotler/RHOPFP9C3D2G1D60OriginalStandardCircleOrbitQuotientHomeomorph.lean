import Mathlib.Tactic
import Mathlib.Topology.Constructions
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D59OriginalStandardOrbitQuotientTopologyMaps

/-!
# RHOPF-P9C3D2G1D60 — original Gamma9 and standard Circle orbit quotient homeomorphism

Accepted D48 gives an exact ORIGINAL Gamma9 source-Q unit sphere
homeomorphism H to the standard complex unit sphere; D56/D57 supply the
true source/standard Circle orbit Setoids. D58 supplies the exact SET
orbit quotient equivalence, and D59 proves both canonical class maps
are Topology.IsQuotientMap. This gate transports continuity across
these genuine quotient maps, in both directions, upgrading D58 to
a Homeomorph under the original locally scoped Q topology.

No new global instances, alternative phase, CP¹/S² identification,
Hopf/Chern invariant, or physical BFSS soliton is asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D60
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D40
open FCP.RHOPFP9C3D2G1D41
open FCP.RHOPFP9C3D2G1D48
open FCP.RHOPFP9C3D2G1D56
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D58
open FCP.RHOPFP9C3D2G1D59

/-- Genuine homeomorphism of the original source-Q Gamma9 Circle
orbit topological quotient with the standard complex Circle orbit
topological quotient. The underlying Equiv is exactly accepted D58. -/
noncomputable def relationalSourceToStandardOrbitQuotientHomeomorph :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    Quotient relationalSourceQUnitCircleOrbitSetoid ≃ₜ
      Quotient relationalEuclideanUnitCircleOrbitSetoid := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  let H := relationalSourceQUnitEuclideanUnitHomeomorph
  let E := relationalSourceToStandardOrbitQuotientEquiv
  have hSource : Topology.IsQuotientMap
      (relationalSourceQUnitCircleOrbitClass :
        {x : RelationalSourceComplexFour //
          relationalRangeCoordinateDotSelf x.coordinates = 1} →
        Quotient relationalSourceQUnitCircleOrbitSetoid) :=
    relationalSourceQUnitCircleOrbitClass_isQuotientMap
  have hStandard : Topology.IsQuotientMap
      (relationalEuclideanUnitCircleOrbitClass :
        {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} →
        Quotient relationalEuclideanUnitCircleOrbitSetoid) :=
    relationalEuclideanUnitCircleOrbitClass_isQuotientMap
  refine {
    toEquiv := E
    continuous_toFun := ?_
    continuous_invFun := ?_
  }
  · apply hSource.continuous_iff.mpr
    have hComp : Continuous (fun x :
        {x : RelationalSourceComplexFour //
          relationalRangeCoordinateDotSelf x.coordinates = 1} =>
          relationalEuclideanUnitCircleOrbitClass (H x)) :=
      hStandard.continuous.comp H.continuous
    have hPoint (x : {x : RelationalSourceComplexFour //
        relationalRangeCoordinateDotSelf x.coordinates = 1}) :
        E (relationalSourceQUnitCircleOrbitClass x) =
          relationalEuclideanUnitCircleOrbitClass (H x) :=
      relationalSourceToStandardOrbitQuotientEquiv_class x
    have hFun :
        (fun x : {x : RelationalSourceComplexFour //
          relationalRangeCoordinateDotSelf x.coordinates = 1} =>
          E (relationalSourceQUnitCircleOrbitClass x)) =
        (fun x : {x : RelationalSourceComplexFour //
          relationalRangeCoordinateDotSelf x.coordinates = 1} =>
          relationalEuclideanUnitCircleOrbitClass (H x)) :=
      funext hPoint
    change Continuous (fun x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1} =>
        E (relationalSourceQUnitCircleOrbitClass x))
    rw [hFun]
    exact hComp
  · apply hStandard.continuous_iff.mpr
    have hComp : Continuous (fun y :
        {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
          relationalSourceQUnitCircleOrbitClass (H.symm y)) :=
      hSource.continuous.comp H.symm.continuous
    have hPoint (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
        E.symm (relationalEuclideanUnitCircleOrbitClass y) =
          relationalSourceQUnitCircleOrbitClass (H.symm y) := by
      apply E.injective
      change E (E.symm (relationalEuclideanUnitCircleOrbitClass y)) =
        E (relationalSourceQUnitCircleOrbitClass (H.symm y))
      rw [E.apply_symm_apply, relationalSourceToStandardOrbitQuotientEquiv_class]
      exact congrArg relationalEuclideanUnitCircleOrbitClass
        (H.apply_symm_apply y).symm
    have hFun :
        (fun y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
          E.symm (relationalEuclideanUnitCircleOrbitClass y)) =
        (fun y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
          relationalSourceQUnitCircleOrbitClass (H.symm y)) :=
      funext hPoint
    change Continuous (fun y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
      E.symm (relationalEuclideanUnitCircleOrbitClass y))
    rw [hFun]
    exact hComp

/-- The new HOMEOMORPHISM acts on each original Gamma9 orbit class
by the original D48 homeomorphism before taking the standard class. -/
theorem relationalSourceToStandardOrbitQuotientHomeomorph_class :
    letI : NormedAddCommGroup RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedAddCommGroup;
    letI : NormedSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourNormedSpace;
    letI : InnerProductSpace ℂ RelationalSourceComplexFour :=
      relationalSourceComplexFourInnerProductSpace;
    ∀ x : {x : RelationalSourceComplexFour //
      relationalRangeCoordinateDotSelf x.coordinates = 1},
      relationalSourceToStandardOrbitQuotientHomeomorph
          (relationalSourceQUnitCircleOrbitClass x) =
        relationalEuclideanUnitCircleOrbitClass
          (relationalSourceQUnitEuclideanUnitHomeomorph x) := by
  let : NormedAddCommGroup RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedAddCommGroup
  let : NormedSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourNormedSpace
  let : InnerProductSpace ℂ RelationalSourceComplexFour :=
    relationalSourceComplexFourInnerProductSpace
  intro x
  exact relationalSourceToStandardOrbitQuotientEquiv_class x

#print axioms relationalSourceToStandardOrbitQuotientHomeomorph
#print axioms relationalSourceToStandardOrbitQuotientHomeomorph_class

end
end FCP.RHOPFP9C3D2G1D60
