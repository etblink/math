import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineOrientation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineReflectionPair
import Mathlib.Algebra.Ring.Parity
import Mathlib.LinearAlgebra.Span.Defs

/-!
Candidate bounded native Cartan factorization of the original source action.
Transport the SAME original nine-vector representation via the already
qualified same-label Euclidean equivalence. Remove zero identity factors,
normalize the other normals, preserve order and prove determinant parity.
The final witnesses are original source-Q-unit vectors, with even length
at most eight. This is NOT an exact source Clifford-word factorization,
nor continuity/compactness, a covering, Fock action or a spectral result.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineCartan
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineOrientation Submodule

private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : (SpaceIndex → ℝ) ≃ₗ[ℝ] Euc9 := source9ToEuclidean

/-- Same-label Euclidean conjugate of the actual source quadratic isometry. -/
noncomputable def source9SpinEuclideanLinearEquiv (g : spinGroup source9Quadratic) :
    Euc9 ≃ₗ[ℝ] Euc9 :=
  E.symm.trans
    ((source9SpinVectorQuadraticIsometryEquiv g :
      (SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ)).trans E)

/-- L2 norm preservation follows from the original Q and its accepted explicit Euclidean bridge. -/
theorem source9SpinEuclideanLinearEquiv_norm_map
    (g : spinGroup source9Quadratic) (x : Euc9) :
    ‖source9SpinEuclideanLinearEquiv g x‖ = ‖x‖ := by
  change ‖E (source9SpinVectorRepresentation g (E.symm x))‖ = ‖x‖
  have hsq : ‖E (source9SpinVectorRepresentation g (E.symm x))‖ ^ 2 = ‖x‖ ^ 2 := by
    rw [← source9Quadratic_eq_euclidean_norm_sq,
      source9SpinVectorRepresentation_preserves_quadratic,
      source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply]
  nlinarith [norm_nonneg (E (source9SpinVectorRepresentation g (E.symm x))), norm_nonneg x]

/-- The actual transported source action as a native Euclidean linear isometry equivalence. -/
noncomputable def source9SpinEuclideanIsometry (g : spinGroup source9Quadratic) :
    Euc9 ≃ₗᵢ[ℝ] Euc9 :=
  { source9SpinEuclideanLinearEquiv g with
    norm_map' := source9SpinEuclideanLinearEquiv_norm_map g }

/-- Exact compatibility with the original action and SAME coordinate-to-L2 map. -/
theorem source9SpinEuclideanIsometry_apply_source
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinEuclideanIsometry g (E z) = E (source9SpinVectorRepresentation g z) := by
  change E (source9SpinVectorRepresentation g (E.symm (E z))) = _
  rw [E.symm_apply_apply]

/-- Determinant transport uses the qualified original orientation and actual linear conjugacy. -/
theorem source9SpinEuclideanIsometry_det_one (g : spinGroup source9Quadratic) :
    LinearMap.det (source9SpinEuclideanIsometry g).toLinearMap = (1 : ℝ) := by
  have hdet : LinearEquiv.det (source9SpinEuclideanIsometry g).toLinearEquiv = 1 := by
    change LinearEquiv.det
      (E.symm.trans ((source9SpinVectorQuadraticIsometryEquiv g :
        (SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ)).trans E)) = 1
    calc
      _ = LinearEquiv.det (source9SpinVectorQuadraticIsometryEquiv g :
          (SpaceIndex → ℝ) ≃ₗ[ℝ] (SpaceIndex → ℝ)) :=
        LinearEquiv.det_conj _ E
      _ = 1 := by
        apply Units.ext
        rw [LinearEquiv.coe_det]
        change LinearMap.det (source9SpinVectorRepresentation g) = 1
        exact source9SpinVectorRepresentation_det_one g
  have hval := congrArg (fun u : ℝˣ => (u : ℝ)) hdet
  simpa only [LinearEquiv.coe_det, Units.val_one] using hval

/-- Normalize a nonzero native Euclidean reflection normal without changing its labels. -/
noncomputable def source9EuclideanUnitNormal (u : Euc9) : Euc9 := ‖u‖⁻¹ • u

/-- The nonzero premise is essential for normalization. -/
theorem source9EuclideanUnitNormal_norm_one (u : Euc9) (hu : u ≠ 0) :
    ‖source9EuclideanUnitNormal u‖ = 1 := by
  have hnorm : ‖u‖ ≠ 0 := norm_ne_zero_iff.mpr hu
  calc
    _ = ‖(‖u‖ : ℝ)⁻¹‖ * ‖u‖ := by rw [source9EuclideanUnitNormal, norm_smul]
    _ = (‖u‖ : ℝ)⁻¹ * ‖u‖ := by
      rw [Real.norm_eq_abs, abs_inv, abs_of_nonneg (norm_nonneg u)]
    _ = 1 := inv_mul_cancel₀ hnorm

/-- Normalization preserves the actual real line and hence its orthogonal hyperplane. -/
theorem source9EuclideanUnitNormal_span_eq (u : Euc9) (hu : u ≠ 0) :
    (ℝ ∙ source9EuclideanUnitNormal u) = (ℝ ∙ u) := by
  have hnorm : ‖u‖ ≠ 0 := norm_ne_zero_iff.mpr hu
  have hunit : IsUnit ((‖u‖ : ℝ)⁻¹) := isUnit_iff_ne_zero.mpr (inv_ne_zero hnorm)
  change (ℝ ∙ ((‖u‖ : ℝ)⁻¹ • u)) = (ℝ ∙ u)
  exact Submodule.span_singleton_smul_eq hunit u

/-- Exact native hyperplane-reflection equality after nonzero normalization. -/
theorem source9EuclideanUnitNormal_reflection_eq (u : Euc9) (hu : u ≠ 0) :
    (ℝ ∙ source9EuclideanUnitNormal u)ᗮ.reflection = (ℝ ∙ u)ᗮ.reflection := by
  simp only [source9EuclideanUnitNormal_span_eq u hu]

/-- A zero-normal HYPERPLANE factor is identity, so it can be removed. -/
theorem source9EuclideanHyperplaneReflection_zero :
    (ℝ ∙ (0 : Euc9))ᗮ.reflection = 1 := by
  ext x
  rw [Submodule.reflection_orthogonal_apply, Submodule.reflection_singleton_apply]
  simp

/-- Remove zero identity factors and normalize the others, preserving list order. -/
noncomputable def source9EuclideanUnitNormals : List Euc9 → List Euc9
  | [] => []
  | u :: tail =>
    if _h : u = 0 then source9EuclideanUnitNormals tail
    else source9EuclideanUnitNormal u :: source9EuclideanUnitNormals tail

/-- Every retained Euclidean normal has norm one. -/
theorem source9EuclideanUnitNormals_all_unit (l : List Euc9) :
    ∀ u ∈ source9EuclideanUnitNormals l, ‖u‖ = 1 := by
  induction l with
  | nil => simp [source9EuclideanUnitNormals]
  | cons u tail ih =>
    intro v hv
    by_cases hu : u = 0
    · have hv' : v ∈ source9EuclideanUnitNormals tail := by
        simpa [source9EuclideanUnitNormals, hu] using hv
      exact ih v hv'
    · have hv' : v = source9EuclideanUnitNormal u ∨ v ∈ source9EuclideanUnitNormals tail := by
        simpa [source9EuclideanUnitNormals, hu] using hv
      rcases hv' with h | h
      · subst v
        exact source9EuclideanUnitNormal_norm_one u hu
      · exact ih v h

/-- Deleting zero normals does not increase the number of factors. -/
theorem source9EuclideanUnitNormals_length_le (l : List Euc9) :
    (source9EuclideanUnitNormals l).length ≤ l.length := by
  induction l with
  | nil => simp [source9EuclideanUnitNormals]
  | cons u tail ih =>
    by_cases hu : u = 0
    · simp only [source9EuclideanUnitNormals, dite_eq_left hu, List.length_cons]
      exact ih.trans (Nat.le_succ _)
    · simp only [source9EuclideanUnitNormals, dite_eq_right hu, List.length_cons]
      exact Nat.succ_le_succ ih

/-- The ENTIRE ordered native reflection product is unchanged. -/
theorem source9EuclideanUnitNormals_reflectionProduct_eq (l : List Euc9) :
    (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod =
      ((source9EuclideanUnitNormals l).map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  induction l with
  | nil => rfl
  | cons u tail ih =>
    by_cases hu : u = 0
    · subst u
      simp only [List.map_cons, List.prod_cons, source9EuclideanUnitNormals]
      rw [source9EuclideanHyperplaneReflection_zero, one_mul]
      exact ih
    · simp only [List.map_cons, List.prod_cons, source9EuclideanUnitNormals, dite_eq_right hu]
      rw [source9EuclideanUnitNormal_reflection_eq u hu, ih]

/-- A native unit hyperplane reflection has determinant -1 on the SAME nine-label Euclidean space. -/
theorem source9EuclideanUnitHyperplane_det_neg_one (u : Euc9) (hu : ‖u‖ = 1) :
    LinearMap.det ((ℝ ∙ u)ᗮ.reflection.toLinearMap) = (-1 : ℝ) := by
  have hne : u ≠ 0 := by
    intro h
    simp [h] at hu
  have hline : (ℝ ∙ u : Submodule ℝ Euc9)ᗮᗮ = (ℝ ∙ u : Submodule ℝ Euc9) :=
    Submodule.orthogonal_orthogonal (ℝ ∙ u : Submodule ℝ Euc9)
  have hdim : Module.finrank ℝ ((ℝ ∙ u)ᗮᗮ) = 1 := by
    calc
      _ = Module.finrank ℝ (ℝ ∙ u) :=
        congrArg (fun K : Submodule ℝ Euc9 => Module.finrank ℝ K) hline
      _ = 1 := finrank_span_singleton hne
  calc
    _ = (-1 : ℝ) ^ Module.finrank ℝ ((ℝ ∙ u)ᗮᗮ) :=
      Submodule.det_reflection ((ℝ ∙ u)ᗮ)
    _ = -1 := by rw [hdim, pow_one]

/-- Multiplication of the actual native isometries transports to composition of linear maps. -/
theorem source9EuclideanIsometry_mul_det (f g : Euc9 ≃ₗᵢ[ℝ] Euc9) :
    LinearMap.det (f * g).toLinearMap =
      LinearMap.det f.toLinearMap * LinearMap.det g.toLinearMap := by
  have hcomp : (f * g).toLinearMap = f.toLinearMap.comp g.toLinearMap := by
    ext x
    rfl
  rw [hcomp, LinearMap.det_comp]

/-- The determinant of a native unit reflection list is exactly (-1)^length. -/
theorem source9EuclideanUnitReflectionList_det (l : List Euc9) :
    (∀ u ∈ l, ‖u‖ = 1) →
      LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) =
        (-1 : ℝ) ^ l.length := by
  induction l with
  | nil =>
    intro _
    change LinearMap.det (LinearMap.id : Euc9 →ₗ[ℝ] Euc9) = 1
    exact LinearMap.det_id
  | cons u tail ih =>
    intro hall
    have hu : ‖u‖ = 1 := hall u (by simp)
    have htail : ∀ v ∈ tail, ‖v‖ = 1 := by
      intro v hv
      exact hall v (by simp [hv])
    calc
      _ = LinearMap.det (((ℝ ∙ u)ᗮ.reflection *
          (tail.map fun v => (ℝ ∙ v)ᗮ.reflection).prod).toLinearMap) := rfl
      _ = LinearMap.det ((ℝ ∙ u)ᗮ.reflection.toLinearMap) *
          LinearMap.det (((tail.map fun v => (ℝ ∙ v)ᗮ.reflection).prod).toLinearMap) :=
        source9EuclideanIsometry_mul_det _ _
      _ = (-1 : ℝ) * (-1 : ℝ) ^ tail.length := by
        rw [source9EuclideanUnitHyperplane_det_neg_one u hu, ih htail]
      _ = (-1 : ℝ) ^ (u :: tail).length := by
        simp only [List.length_cons, pow_succ]
        ring

/-- Actual determinant one forces even length after normalization and zero removal. -/
theorem source9EuclideanUnitReflectionList_even_of_det_one
    (l : List Euc9) (hall : ∀ u ∈ l, ‖u‖ = 1)
    (hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1) :
    Even l.length := by
  have hpow : (-1 : ℝ) ^ l.length = 1 :=
    (source9EuclideanUnitReflectionList_det l hall).symm.trans hdet
  exact (neg_one_pow_eq_one_iff_even (by norm_num : (-1 : ℝ) ≠ 1)).mp hpow

/-- Ordered unit Cartan normals for the ACTUAL source action, even and bounded by EIGHT. -/
theorem source9SpinEuclidean_unitCartan_le_eight (g : spinGroup source9Quadratic) :
    ∃ l : List Euc9, (∀ u ∈ l, ‖u‖ = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  rcases LinearIsometryEquiv.reflections_generate_dim (source9SpinEuclideanIsometry g) with
    ⟨normals, hlen, hfactor⟩
  let l := source9EuclideanUnitNormals normals
  have hall : ∀ u ∈ l, ‖u‖ = 1 := source9EuclideanUnitNormals_all_unit normals
  have hlen9 : l.length ≤ 9 := by
    have hraw : normals.length ≤ 9 := by
      simpa [Euc9, SpaceIndex] using hlen
    exact (source9EuclideanUnitNormals_length_le normals).trans hraw
  have hfact : source9SpinEuclideanIsometry g =
      (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
    hfactor.trans (source9EuclideanUnitNormals_reflectionProduct_eq normals)
  have hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1 :=
    (congrArg (fun f : Euc9 ≃ₗᵢ[ℝ] Euc9 => LinearMap.det f.toLinearMap) hfact.symm).trans
      (source9SpinEuclideanIsometry_det_one g)
  have heven : Even l.length := source9EuclideanUnitReflectionList_even_of_det_one l hall hdet
  have hlen8 : l.length ≤ 8 := by
    rcases heven with ⟨k, hk⟩
    omega
  exact ⟨l, hall, hlen8, heven, hfact⟩

/-- The witnesses are ORIGINAL source-Q-unit vectors; no unit assumption about the Pi norm is used. -/
theorem source9Spin_sourceUnitCartan_le_eight (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g =
        (l.map fun u => (ℝ ∙ source9ToEuclidean u)ᗮ.reflection).prod := by
  rcases source9SpinEuclidean_unitCartan_le_eight g with ⟨normals, hall, hlen, heven, hfactor⟩
  refine ⟨normals.map E.symm, ?_, ?_, ?_, ?_⟩
  · intro a ha
    rcases List.mem_map.mp ha with ⟨u, hu, rfl⟩
    rw [source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply, hall u hu]
    norm_num
  · simpa only [List.length_map] using hlen
  · simpa only [List.length_map] using heven
  · simpa only [List.map_map, Function.comp_def, E.apply_symm_apply] using hfactor

#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclideanLinearEquiv
#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclideanLinearEquiv_norm_map
#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry
#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry_apply_source
#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry_det_one
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_norm_one
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_span_eq
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_reflection_eq
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanHyperplaneReflection_zero
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_all_unit
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_length_le
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_reflectionProduct_eq
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitHyperplane_det_neg_one
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanIsometry_mul_det
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitReflectionList_det
#print axioms FCP.BFSSSourceNineCartan.source9EuclideanUnitReflectionList_even_of_det_one
#print axioms FCP.BFSSSourceNineCartan.source9SpinEuclidean_unitCartan_le_eight
#print axioms FCP.BFSSSourceNineCartan.source9Spin_sourceUnitCartan_le_eight
#eval IO.println "SPECTRAL_SOURCE_NINE_UNIT_CARTAN_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineCartan
