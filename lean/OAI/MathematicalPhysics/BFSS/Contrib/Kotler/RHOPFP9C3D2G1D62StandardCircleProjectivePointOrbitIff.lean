import Mathlib.Tactic
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D61StandardCircleProjectivePointPhaseInvariance

/-!
# RHOPF-P9C3D2G1D62 — converse: projective equality implies exact standard Circle orbit

Pinned Mathlib algebraic Projectivization.mk_eq_mk_iff' expresses equality
of projective points by a complex scalar. On the accepted D49 standard
unit Euclidean C² sphere, taking norms forces that scalar to have norm
one, so it is an actual Circle phase. D61 proved the forward direction.
D62 qualifies this algebraic iff only. It does not assert a quotient
Equiv, a projective topology, CP¹/S² Homeomorph, Hopf invariant,
or physical BFSS Fock/Gauss/Hamiltonian solution.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D62
noncomputable section

open FCP.RHOPFP9C3D2G1D49
open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D61

/-- Equality of two complex projective points represented by norm-one
standard C² vectors forces an *actual unit-modulus complex Circle phase*
taking the first vector to the second. This is the reverse of D61. -/
theorem relationalStandardUnitSphereProjectivePoint_eq_implies_related
    (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1})
    (hxy : relationalStandardUnitSphereProjectivePoint x =
      relationalStandardUnitSphereProjectivePoint y) :
    relationalEuclideanUnitCircleRelated x y := by
  have hProjective :
      Projectivization.mk ℂ y.val (relationalStandardUnitSphere_nonzero y) =
        Projectivization.mk ℂ x.val (relationalStandardUnitSphere_nonzero x) :=
    hxy.symm
  obtain ⟨a, ha⟩ :=
    (Projectivization.mk_eq_mk_iff' ℂ
      y.val x.val (relationalStandardUnitSphere_nonzero y)
      (relationalStandardUnitSphere_nonzero x)).1 hProjective
  have haNorm : ‖a‖ = 1 := by
    have hnorm := congrArg (fun v : EuclideanSpace ℂ (Fin 2) => ‖v‖) ha
    simpa [norm_smul, x.property, y.property] using hnorm
  let z : Circle := ⟨a, (mem_sphere_zero_iff_norm).2 haNorm⟩
  refine ⟨z, ?_⟩
  apply Subtype.ext
  change (z : ℂ) • x.val = y.val
  exact ha

/-- For the exact D49 standard complex scalar Circle action, equality
of projective points is *equivalent* to Circle-orbit reachability.
This does not yet package an equivalence of quotient types. -/
theorem relationalStandardUnitSphereRelated_iff_projectivePoint_eq
    (x y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalEuclideanUnitCircleRelated x y ↔
      relationalStandardUnitSphereProjectivePoint x =
        relationalStandardUnitSphereProjectivePoint y := by
  constructor
  · exact relationalStandardUnitSphereRelated_projectivePoint_eq x y
  · exact relationalStandardUnitSphereProjectivePoint_eq_implies_related x y

#print axioms relationalStandardUnitSphereProjectivePoint_eq_implies_related
#print axioms relationalStandardUnitSphereRelated_iff_projectivePoint_eq

end
end FCP.RHOPFP9C3D2G1D62
