import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation
import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional

/-!
C0-A1 candidate: the actual source Spin9 normalized Clifford pair acts
as the ordered pair of native Mathlib hyperplane reflections.
The auxiliary Euclidean space has precisely the original nine labels.
Its L2 norm is not identified definitionally with the source Pi norm.
Single positive Clifford vectors act by LINE reflection, hence minus
hyperplane reflection. Only their pair is asserted to belong to Spin.
No determinant theorem, compactness, Fock action or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineReflection
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open Submodule

/-- Same-label coordinate transport; the original quadratic form is unchanged. -/
noncomputable def source9ToEuclidean :
    (SpaceIndex → ℝ) ≃ₗ[ℝ] EuclideanSpace ℝ SpaceIndex :=
  (WithLp.linearEquiv 2 ℝ (SpaceIndex → ℝ)).symm

/-- The original source Q is squared L2 norm after explicit transport. -/
theorem source9Quadratic_eq_euclidean_norm_sq (z : SpaceIndex → ℝ) :
    source9Quadratic z = ‖source9ToEuclidean z‖ ^ 2 := by
  rw [source9Quadratic_eq_dot]
  change (∑ i : SpaceIndex, z i * z i) =
    ‖(WithLp.toLp 2 z : EuclideanSpace ℝ SpaceIndex)‖ ^ 2
  calc
    _ = ∑ i : SpaceIndex, ‖(WithLp.toLp 2 z : EuclideanSpace ℝ SpaceIndex) i‖ ^ 2 := by
      apply Finset.sum_congr rfl
      intro i _
      change z i * z i = ‖z i‖ ^ 2
      rw [Real.norm_eq_abs, sq_abs, pow_two]
    _ = _ := by
      rw [EuclideanSpace.norm_eq, Real.sq_sqrt]
      exact Finset.sum_nonneg (fun i _ => sq_nonneg _)

/-- Polarization is transported to twice the real Euclidean inner product. -/
theorem source9Polar_eq_two_euclidean_inner (u z : SpaceIndex → ℝ) :
    QuadraticMap.polar source9Quadratic u z =
      2 * inner ℝ (source9ToEuclidean u) (source9ToEuclidean z) := by
  rw [QuadraticMap.polar, source9Quadratic_eq_euclidean_norm_sq (u + z),
    source9Quadratic_eq_euclidean_norm_sq u,
    source9Quadratic_eq_euclidean_norm_sq z, map_add, norm_add_sq_real]
  ring

/-- Q-unit source vectors, rather than arbitrary Pi-unit vectors, have unit L2 norm. -/
theorem source9Unit_euclidean_norm_one
    (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    ‖source9ToEuclidean u‖ = 1 := by
  have hsq : ‖source9ToEuclidean u‖ ^ 2 = 1 := by
    rw [← source9Quadratic_eq_euclidean_norm_sq, hu]
  nlinarith [norm_nonneg (source9ToEuclidean u)]

/-- Exact positive-Clifford single-vector conjugation; no Spin membership is asserted. -/
theorem source9Unit_clifford_conjugation
    (u z : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    (CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic z) *
        CliffordAlgebra.ι source9Quadratic u =
      CliffordAlgebra.ι source9Quadratic
        ((QuadraticMap.polar source9Quadratic u z) • u - z) := by
  have huu : CliffordAlgebra.ι source9Quadratic u *
      CliffordAlgebra.ι source9Quadratic u = 1 := by
    rw [CliffordAlgebra.ι_sq_scalar, hu, map_one]
  calc
    _ = (algebraMap ℝ (CliffordAlgebra source9Quadratic)
          (QuadraticMap.polar source9Quadratic u z) -
          CliffordAlgebra.ι source9Quadratic z * CliffordAlgebra.ι source9Quadratic u) *
        CliffordAlgebra.ι source9Quadratic u := by
      rw [CliffordAlgebra.ι_mul_ι_comm u z]
    _ = _ := by
      simp only [sub_mul, mul_assoc, huu, mul_one, Algebra.algebraMap_eq_smul_one,
        smul_mul_assoc, one_mul, map_sub, map_smul]

/-- Inverting the literal accepted source pair reverses the two Clifford factors. -/
theorem source9UnitVectorPairSpin_inverse
    (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    (((source9UnitVectorPairSpin u v hu hv)⁻¹ : spinGroup source9Quadratic) :
        CliffordAlgebra source9Quadratic) =
      CliffordAlgebra.ι source9Quadratic v * CliffordAlgebra.ι source9Quadratic u := by
  change star (CliffordAlgebra.ι source9Quadratic u *
    CliffordAlgebra.ι source9Quadratic v) = _
  rw [star_mul, CliffordAlgebra.star_ι, CliffordAlgebra.star_ι, neg_mul_neg]

/-- Same-order pair action on the literal F10BP representation and original nine-vector carrier. -/
theorem source9UnitVectorPairSpin_polar_action
    (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z =
      (QuadraticMap.polar source9Quadratic u
        ((QuadraticMap.polar source9Quadratic v z) • v - z)) • u -
        ((QuadraticMap.polar source9Quadratic v z) • v - z) := by
  apply source9CliffordVectorEmbedding_injective
  change CliffordAlgebra.ι source9Quadratic
    (source9SpinVectorConjugation (source9UnitVectorPairSpin u v hu hv) z) = _
  rw [source9SpinVectorConjugation_ι, source9UnitVectorPairSpin_inverse]
  change (CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v) *
      CliffordAlgebra.ι source9Quadratic z *
      (CliffordAlgebra.ι source9Quadratic v * CliffordAlgebra.ι source9Quadratic u) = _
  calc
    _ = (CliffordAlgebra.ι source9Quadratic u *
        ((CliffordAlgebra.ι source9Quadratic v * CliffordAlgebra.ι source9Quadratic z) *
          CliffordAlgebra.ι source9Quadratic v)) * CliffordAlgebra.ι source9Quadratic u := by
      simp only [mul_assoc]
    _ = _ := by
      rw [source9Unit_clifford_conjugation v z hv,
        source9Unit_clifford_conjugation u _ hu]

/-- Single Clifford line reflection is MINUS the native hyperplane reflection. -/
theorem source9Unit_polar_action_eq_negative_hyperplane
    (u z : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    source9ToEuclidean ((QuadraticMap.polar source9Quadratic u z) • u - z) =
      -((ℝ ∙ source9ToEuclidean u)ᗮ.reflection (source9ToEuclidean z)) := by
  have hline :
      (ℝ ∙ source9ToEuclidean u).reflection (source9ToEuclidean z) =
        (2 * inner ℝ (source9ToEuclidean u) (source9ToEuclidean z)) •
          source9ToEuclidean u - source9ToEuclidean z := by
    simpa [source9Unit_euclidean_norm_one u hu, two_smul, two_mul, add_smul] using
      (Submodule.reflection_singleton_apply (𝕜 := ℝ)
        (source9ToEuclidean u) (source9ToEuclidean z))
  rw [map_sub, map_smul, source9Polar_eq_two_euclidean_inner, ← hline,
    Submodule.reflection_orthogonal_apply]
  simp

/-- C0-A1 target: the literal Spin9 pair gives two NATIVE hyperplane reflections in source order. -/
theorem source9UnitVectorPairSpin_eq_native_hyperplane_pair
    (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9ToEuclidean
        (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) =
      (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
        ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z)) := by
  rw [source9UnitVectorPairSpin_polar_action,
    source9Unit_polar_action_eq_negative_hyperplane u _ hu,
    source9Unit_polar_action_eq_negative_hyperplane v z hv]
  simp

#print axioms FCP.BFSSSourceNineReflection.source9ToEuclidean
#print axioms FCP.BFSSSourceNineReflection.source9Quadratic_eq_euclidean_norm_sq
#print axioms FCP.BFSSSourceNineReflection.source9Polar_eq_two_euclidean_inner
#print axioms FCP.BFSSSourceNineReflection.source9Unit_euclidean_norm_one
#print axioms FCP.BFSSSourceNineReflection.source9Unit_clifford_conjugation
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_inverse
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_polar_action
#print axioms FCP.BFSSSourceNineReflection.source9Unit_polar_action_eq_negative_hyperplane
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_eq_native_hyperplane_pair
#eval IO.println "SPECTRAL_SOURCE_NINE_REFLECTION_PAIR_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineReflection
