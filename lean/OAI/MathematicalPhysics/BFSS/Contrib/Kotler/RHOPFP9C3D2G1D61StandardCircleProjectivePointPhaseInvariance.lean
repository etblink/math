import Mathlib.Tactic
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D60OriginalStandardCircleOrbitQuotientHomeomorph

/-!
# RHOPF-P9C3D2G1D61 — exact unit-C² Circle phases and algebraic projectivization

The original Gamma9 Q-unit Circle orbit quotient is now homeomorphic
to the standard unit-C² Circle orbit quotient (strict GREEN D60).
Pinned Mathlib does provide algebraic Projectivization ℂ V and
Projectivization.mk_eq_mk_iff', but not the later projectivization
topology API. This gate proves that all norm-one standard ℂ² vectors
are nonzero and that the accepted D49 standard Circle action fixes
their projective point. Hence orbit-related unit vectors have the
same projective point, with no projective quotient/topology equivalence
or CP¹/S², Hopf invariant or physical BFSS hopfion asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D61
noncomputable section

open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D50

/-- A unit vector in the accepted standard complex Euclidean
two-space cannot vanish. -/
theorem relationalStandardUnitSphere_nonzero
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    (y.val : EuclideanSpace ℂ (Fin 2)) ≠ 0 := by
  intro hz
  have hnorm : ‖(y.val : EuclideanSpace ℂ (Fin 2))‖ = 1 :=
    y.property
  rw [hz, norm_zero] at hnorm
  norm_num at hnorm

/-- The standard complex projective point of an accepted norm-one
complex two-vector, using pinned Mathlib algebraic projectivization. -/
noncomputable def relationalStandardUnitSphereProjectivePoint
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) :=
  Projectivization.mk ℂ y.val (relationalStandardUnitSphere_nonzero y)

/-- The exact accepted D49 standard scalar Circle phase does not
change a unit vector's complex projective point. -/
theorem relationalStandardUnitSphereProjectivePoint_circle_invariant
    (z : Circle)
    (y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalStandardUnitSphereProjectivePoint
        (relationalEuclideanUnitCircleAction z y) =
      relationalStandardUnitSphereProjectivePoint y := by
  unfold relationalStandardUnitSphereProjectivePoint
  apply (Projectivization.mk_eq_mk_iff' ℂ
      (relationalEuclideanUnitCircleAction z y).val y.val
      (relationalStandardUnitSphere_nonzero _)
      (relationalStandardUnitSphere_nonzero y)).2
  exact ⟨(z : ℂ), rfl⟩

/-- Standard Circle-orbit reachability implies equality of the
algebraic complex projective point. Converse and quotient topology
are explicitly outside D61's scope. -/
theorem relationalStandardUnitSphereRelated_projectivePoint_eq
    (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1})
    (hxy : relationalEuclideanUnitCircleRelated x y) :
    relationalStandardUnitSphereProjectivePoint x =
      relationalStandardUnitSphereProjectivePoint y := by
  rcases hxy with ⟨z, hz⟩
  rw [← hz]
  exact (relationalStandardUnitSphereProjectivePoint_circle_invariant z x).symm

#print axioms relationalStandardUnitSphere_nonzero
#print axioms relationalStandardUnitSphereProjectivePoint
#print axioms relationalStandardUnitSphereProjectivePoint_circle_invariant
#print axioms relationalStandardUnitSphereRelated_projectivePoint_eq

end
end FCP.RHOPFP9C3D2G1D61
