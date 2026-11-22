import Mathlib.Tactic
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D63StandardCircleOrbitQuotientProjectivizationInjection

/-!
# RHOPF-P9C3D2G1D64 — unit representatives and surjectivity onto algebraic projective space

D63 qualified the well-defined and injective map from the exact D57
standard Circle-orbit quotient into algebraic complex projectivization.
Every nonzero complex two-vector can be normalized by its real norm,
without changing the complex line it represents. This bounded gate
proves surjectivity of the D61 standard unit-sphere projective map
and, consequently, of D63's quotient-to-projectivization map.

Does NOT package an Equiv; no projectivization topology or homeomorphism,
CP¹/S² topology, Hopf/Chern number, or physical BFSS soliton is asserted.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D64
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D63

/-- Every algebraic complex projective point in complex Euclidean
two-space has a representative whose Euclidean norm is exactly one. -/
theorem relationalStandardUnitSphereProjectivePoint_surjective :
    Function.Surjective relationalStandardUnitSphereProjectivePoint := by
  intro p
  induction p using Projectivization.ind with
  | h v hv =>
    have hn : ‖v‖ ≠ 0 := norm_ne_zero_iff.mpr hv
    let w : EuclideanSpace ℂ (Fin 2) := (((‖v‖⁻¹ : ℝ) : ℂ) • v)
    have hw : ‖w‖ = 1 := by
      dsimp [w]
      rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_inv,
        abs_of_nonneg (norm_nonneg v)]
      exact inv_mul_cancel₀ hn
    let y : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1} := ⟨w, hw⟩
    refine ⟨y, ?_⟩
    have hmk :
        Projectivization.mk ℂ y.val (relationalStandardUnitSphere_nonzero y) =
          Projectivization.mk ℂ v hv := by
      apply (Projectivization.mk_eq_mk_iff' ℂ y.val v
        (relationalStandardUnitSphere_nonzero y) hv).2
      exact ⟨((‖v‖⁻¹ : ℝ) : ℂ), rfl⟩
    exact hmk

/-- Surjectivity of the exact D63 quotient projective-point map,
following from the independently witnessed norm-one representative. -/
theorem relationalStandardCircleOrbitQuotientToProjectivization_surjective :
    Function.Surjective relationalStandardCircleOrbitQuotientToProjectivization := by
  intro p
  obtain ⟨y, hy⟩ := relationalStandardUnitSphereProjectivePoint_surjective p
  refine ⟨relationalEuclideanUnitCircleOrbitClass y, ?_⟩
  rw [relationalStandardCircleOrbitQuotientToProjectivization_class]
  exact hy

#print axioms relationalStandardUnitSphereProjectivePoint_surjective
#print axioms relationalStandardCircleOrbitQuotientToProjectivization_surjective

end
end FCP.RHOPFP9C3D2G1D64
