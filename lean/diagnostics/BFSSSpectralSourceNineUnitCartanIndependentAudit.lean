import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineUnitCartan

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineCartan Submodule

example (g : spinGroup source9Quadratic) :
    EuclideanSpace ℝ SpaceIndex ≃ₗ[ℝ] EuclideanSpace ℝ SpaceIndex :=
  source9SpinEuclideanLinearEquiv g

example (g : spinGroup source9Quadratic) (x : EuclideanSpace ℝ SpaceIndex) :
    ‖source9SpinEuclideanLinearEquiv g x‖ = ‖x‖ :=
  source9SpinEuclideanLinearEquiv_norm_map g x

example (g : spinGroup source9Quadratic) :
    EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex :=
  source9SpinEuclideanIsometry g

example (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    source9SpinEuclideanIsometry g (source9ToEuclidean z) =
      source9ToEuclidean (source9SpinVectorRepresentation g z) :=
  source9SpinEuclideanIsometry_apply_source g z

example (g : spinGroup source9Quadratic) :
    LinearMap.det (source9SpinEuclideanIsometry g).toLinearMap = (1 : ℝ) :=
  source9SpinEuclideanIsometry_det_one g

example (u : EuclideanSpace ℝ SpaceIndex) (hu : u ≠ 0) :
    ‖source9EuclideanUnitNormal u‖ = 1 := source9EuclideanUnitNormal_norm_one u hu

example (u : EuclideanSpace ℝ SpaceIndex) (hu : u ≠ 0) :
    (ℝ ∙ source9EuclideanUnitNormal u) = (ℝ ∙ u) :=
  source9EuclideanUnitNormal_span_eq u hu

example (u : EuclideanSpace ℝ SpaceIndex) (hu : u ≠ 0) :
    (ℝ ∙ source9EuclideanUnitNormal u)ᗮ.reflection = (ℝ ∙ u)ᗮ.reflection :=
  source9EuclideanUnitNormal_reflection_eq u hu

example : (ℝ ∙ (0 : EuclideanSpace ℝ SpaceIndex))ᗮ.reflection = 1 :=
  source9EuclideanHyperplaneReflection_zero

example (l : List (EuclideanSpace ℝ SpaceIndex)) :
    ∀ u ∈ source9EuclideanUnitNormals l, ‖u‖ = 1 :=
  source9EuclideanUnitNormals_all_unit l

example (l : List (EuclideanSpace ℝ SpaceIndex)) :
    (source9EuclideanUnitNormals l).length ≤ l.length :=
  source9EuclideanUnitNormals_length_le l

example (l : List (EuclideanSpace ℝ SpaceIndex)) :
    (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod =
      ((source9EuclideanUnitNormals l).map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
  source9EuclideanUnitNormals_reflectionProduct_eq l

example (u : EuclideanSpace ℝ SpaceIndex) (hu : ‖u‖ = 1) :
    LinearMap.det ((ℝ ∙ u)ᗮ.reflection.toLinearMap) = (-1 : ℝ) :=
  source9EuclideanUnitHyperplane_det_neg_one u hu

example (f g : EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex) :
    LinearMap.det (f * g).toLinearMap =
      LinearMap.det f.toLinearMap * LinearMap.det g.toLinearMap :=
  source9EuclideanIsometry_mul_det f g

example (l : List (EuclideanSpace ℝ SpaceIndex)) (hall : ∀ u ∈ l, ‖u‖ = 1) :
    LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) =
      (-1 : ℝ) ^ l.length := source9EuclideanUnitReflectionList_det l hall

example (l : List (EuclideanSpace ℝ SpaceIndex)) (hall : ∀ u ∈ l, ‖u‖ = 1)
    (hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1) :
    Even l.length := source9EuclideanUnitReflectionList_even_of_det_one l hall hdet

example (g : spinGroup source9Quadratic) :
    ∃ l : List (EuclideanSpace ℝ SpaceIndex),
      (∀ u ∈ l, ‖u‖ = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
  source9SpinEuclidean_unitCartan_le_eight g

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g =
        (l.map fun u => (ℝ ∙ source9ToEuclidean u)ᗮ.reflection).prod :=
  source9Spin_sourceUnitCartan_le_eight g

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      ∀ z : SpaceIndex → ℝ, source9ToEuclidean (source9SpinVectorRepresentation g z) =
        ((l.map fun u => (ℝ ∙ source9ToEuclidean u)ᗮ.reflection).prod)
          (source9ToEuclidean z) := by
  rcases source9Spin_sourceUnitCartan_le_eight g with ⟨l, hall, hlen, heven, hfactor⟩
  refine ⟨l, hall, hlen, heven, ?_⟩
  intro z
  calc
    _ = source9SpinEuclideanIsometry g (source9ToEuclidean z) :=
      (source9SpinEuclideanIsometry_apply_source g z).symm
    _ = _ := congrArg
      (fun f : EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex =>
        f (source9ToEuclidean z)) hfactor

example : source9EuclideanUnitNormals [0] = [] := by
  simp [source9EuclideanUnitNormals]

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
#eval IO.println "SPECTRAL_SOURCE_NINE_UNIT_CARTAN_CONSUMER_COMPLETE"

end
