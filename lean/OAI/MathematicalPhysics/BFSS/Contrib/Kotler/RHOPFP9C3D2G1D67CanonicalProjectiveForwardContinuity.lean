import Mathlib.Tactic
import Mathlib.Topology.Constructions
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D66CanonicalComplexProjectiveTopology

/-!
# RHOPF-P9C3D2G1D67 — canonical projective forward continuity

D59 proves the actual standard Circle orbit-class map is a quotient
map; D61 provides the representative projective point; D65 provides
the exact algebraic Equiv; D66 independently constructs the canonical
complex projectivization quotient topology and proves mk' quotient.

First prove that the D61 projective point of a unit vector is continuous
for D66's EXACT canonical topology. Then descend continuity across
D59's actual standard Circle-orbit quotient to D65's original Equiv.
NO transported projective topology, global topology instance, inverse
continuity, Homeomorph, CP1 ≃ₜ S2 or physical BFSS claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D67
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D59
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D66

/-- The actual D61 complex projective point is continuous from the
standard unit-C² sphere for the independently constructed D66
projectivization topology. -/
theorem relationalStandardUnitSphereProjectivePoint_continuous :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardUnitSphereProjectivePoint := by
  let : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalComplexProjectivizationTopology
  have hInto : Continuous (fun y :
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
        (⟨y.val, relationalStandardUnitSphere_nonzero y⟩ :
          {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0})) :=
    continuous_subtype_val.subtype_mk _
  have hProjective : Continuous
      (Projectivization.mk' ℂ :
        {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} →
          Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalProjectivizationMk_isQuotientMap.continuous
  have hComp : Continuous (fun y :
      {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
        Projectivization.mk' ℂ
          (⟨y.val, relationalStandardUnitSphere_nonzero y⟩ :
            {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0})) :=
    hProjective.comp hInto
  change Continuous (fun y :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
      Projectivization.mk' ℂ
        (⟨y.val, relationalStandardUnitSphere_nonzero y⟩ :
          {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}))
  exact hComp

/-- The exact D65 standard Circle-orbit algebraic Equiv is continuous
when its codomain has the INDEPENDENT D66 canonical projective topology.
This is one direction only and is NOT a Homeomorph. -/
theorem relationalStandardCircleOrbitProjectivizationEquiv_continuous :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardCircleOrbitQuotientProjectivizationEquiv := by
  let : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalComplexProjectivizationTopology
  have hStandard : Topology.IsQuotientMap
      (relationalEuclideanUnitCircleOrbitClass :
        {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} →
          Quotient relationalEuclideanUnitCircleOrbitSetoid) :=
    relationalEuclideanUnitCircleOrbitClass_isQuotientMap
  apply hStandard.continuous_iff.mpr
  have hComp : Continuous relationalStandardUnitSphereProjectivePoint :=
    relationalStandardUnitSphereProjectivePoint_continuous
  have hPoint (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
      relationalStandardCircleOrbitQuotientProjectivizationEquiv
          (relationalEuclideanUnitCircleOrbitClass y) =
        relationalStandardUnitSphereProjectivePoint y :=
    relationalStandardCircleOrbitQuotientProjectivizationEquiv_class y
  have hFun :
      (fun y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
        relationalStandardCircleOrbitQuotientProjectivizationEquiv
          (relationalEuclideanUnitCircleOrbitClass y)) =
        relationalStandardUnitSphereProjectivePoint :=
    funext hPoint
  change Continuous (fun y :
    {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} =>
      relationalStandardCircleOrbitQuotientProjectivizationEquiv
        (relationalEuclideanUnitCircleOrbitClass y))
  rw [hFun]
  exact hComp

#print axioms relationalStandardUnitSphereProjectivePoint_continuous
#print axioms relationalStandardCircleOrbitProjectivizationEquiv_continuous

end
end FCP.RHOPFP9C3D2G1D67
