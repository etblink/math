import Mathlib.Tactic
import Mathlib.Topology.Constructions
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68BNonzeroUnitNormalizationContinuity

/-!
# RHOPF-P9C3D2G1D68C — inverse continuity of original D65 projective Equiv

D66 gives the actual independently constructed projective quotient
topology and verifies that Projectivization.mk' is a quotient map.
D68A proves exact normalized orbit-class equality. D68B proves that
this SAME normalization is continuous.

Descend inverse continuity of D65's exact algebraic Equiv along the
D66 original projectivization quotient map; do not transport topology.
This gate asserts NO Homeomorph, CP¹ ≃ₜ S², Hopf/Chern charge, or
physical BFSS Fock/Gauss/Hamiltonian or soliton conclusion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68C
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D59
open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D66
open FCP.RHOPFP9C3D2G1D68A
open FCP.RHOPFP9C3D2G1D68B

/-- The inverse of the ORIGINAL accepted D65 algebraic Equiv is
continuous for the INDEPENDENT canonical quotient topology of D66.
The topology is introduced only locally, and is not transported
through the Equiv. -/
theorem relationalStandardCircleOrbitProjectivizationEquiv_symm_continuous :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm := by
  let : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalComplexProjectivizationTopology
  have hProjectiveQuot : Topology.IsQuotientMap
      (Projectivization.mk' ℂ :
        {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} →
          Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalProjectivizationMk_isQuotientMap
  have hOrbit : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v)) :=
    relationalEuclideanUnitCircleOrbitClass_isQuotientMap.continuous.comp
      relationalCanonicalNonzeroUnitNormalization_continuous
  have hPoint (v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}) :
      relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
          (Projectivization.mk' ℂ v) =
        relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v) := by
    calc
      relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
          (Projectivization.mk' ℂ v) =
          relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
            (relationalStandardCircleOrbitQuotientProjectivizationEquiv
              (relationalEuclideanUnitCircleOrbitClass
                (relationalCanonicalNonzeroUnitNormalization v))) :=
        congrArg relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
          (relationalCanonicalNonzeroUnitNormalization_orbitClass v).symm
      _ = relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v) :=
        relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm_apply_apply _
  have hFun :
      (fun v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
          (Projectivization.mk' ℂ v)) =
      (fun v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        relationalEuclideanUnitCircleOrbitClass
          (relationalCanonicalNonzeroUnitNormalization v)) :=
    funext hPoint
  apply hProjectiveQuot.continuous_iff.mpr
  change Continuous (fun v :
    {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
      relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm
        (Projectivization.mk' ℂ v))
  rw [hFun]
  exact hOrbit

#print axioms relationalStandardCircleOrbitProjectivizationEquiv_symm_continuous

end
end FCP.RHOPFP9C3D2G1D68C
