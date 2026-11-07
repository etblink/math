import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEvenListLift

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineEvenListLift Submodule

example (l : List (SpaceIndex → ℝ)) : CliffordAlgebra source9Quadratic :=
  source9CliffordWord l

example (l : List (SpaceIndex → ℝ)) :
    EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex :=
  source9NativeReflectionWord l

example (l : List (SpaceIndex → ℝ))
    (hall : ∀ u ∈ l, source9Quadratic u = 1) (heven : Even l.length) :
    ∃ h : spinGroup source9Quadratic,
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      ∀ z : SpaceIndex → ℝ,
        source9ToEuclidean (source9SpinVectorRepresentation h z) =
          source9NativeReflectionWord l (source9ToEuclidean z) :=
  source9EvenUnitList_lift l hall heven

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ), ∃ h : spinGroup source9Quadratic,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      ∀ z : SpaceIndex → ℝ,
        source9SpinVectorRepresentation h z = source9SpinVectorRepresentation g z :=
  source9Spin_sourceUnitCartan_lift g

-- The empty list must lift to the actual identity element, not just its action.
example : ∃ h : spinGroup source9Quadratic,
    h = 1 ∧ ∀ z : SpaceIndex → ℝ, source9SpinVectorRepresentation h z = z := by
  obtain ⟨h, hword, haction⟩ := source9EvenUnitList_lift [] (by simp) ⟨0, rfl⟩
  have hone : h = 1 := Subtype.ext hword
  refine ⟨h, hone, ?_⟩
  intro z
  apply source9ToEuclidean.injective
  exact haction z

-- An arbitrary ordered pair retains both the Clifford order and the reflection order.
example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    ∃ h : spinGroup source9Quadratic,
      (h : CliffordAlgebra source9Quadratic) =
        CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic v ∧
      ∀ z : SpaceIndex → ℝ,
        source9ToEuclidean (source9SpinVectorRepresentation h z) =
          (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
            ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z)) := by
  have hall : ∀ w ∈ [u, v], source9Quadratic w = 1 := by
    intro w hw
    simp only [List.mem_cons, List.mem_singleton] at hw
    rcases hw with rfl | rfl
    · exact hu
    · exact hv
  obtain ⟨h, hword, haction⟩ := source9EvenUnitList_lift [u, v] hall ⟨1, rfl⟩
  refine ⟨h, ?_, ?_⟩
  · simpa only [source9CliffordWord, List.map_cons, List.map_nil, List.prod_cons,
      List.prod_nil, mul_one] using hword
  · intro z
    exact haction z

-- Repeating a Q-unit vector twice yields the actual source identity.
example (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    ∃ h : spinGroup source9Quadratic,
      h = 1 ∧ (h : CliffordAlgebra source9Quadratic) = source9CliffordWord [u, u] := by
  have hall : ∀ w ∈ [u, u], source9Quadratic w = 1 := by
    intro w hw
    simp only [List.mem_cons, List.mem_singleton, or_self] at hw
    subst w
    exact hu
  obtain ⟨h, hword, _haction⟩ := source9EvenUnitList_lift [u, u] hall ⟨1, rfl⟩
  refine ⟨h, ?_, hword⟩
  apply Subtype.ext
  change (h : CliffordAlgebra source9Quadratic) = 1
  rw [hword]
  simp only [source9CliffordWord, List.map_cons, List.map_nil, List.prod_cons,
    List.prod_nil, mul_one, CliffordAlgebra.ι_sq_scalar, hu, map_one]

-- The bounded lift preserves the original Q under its original source action.
example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ), ∃ h : spinGroup source9Quadratic,
      l.length ≤ 8 ∧ (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      ∀ z : SpaceIndex → ℝ, source9Quadratic (source9SpinVectorRepresentation h z) =
        source9Quadratic z := by
  obtain ⟨l, h, _hall, hlen, _heven, hword, _haction⟩ := source9Spin_sourceUnitCartan_lift g
  exact ⟨l, h, hlen, hword, source9SpinVectorRepresentation_preserves_quadratic h⟩

#print axioms FCP.BFSSSourceNineEvenListLift.source9CliffordWord
#print axioms FCP.BFSSSourceNineEvenListLift.source9NativeReflectionWord
#print axioms FCP.BFSSSourceNineEvenListLift.source9EvenUnitList_lift
#print axioms FCP.BFSSSourceNineEvenListLift.source9Spin_sourceUnitCartan_lift
#eval IO.println "SPECTRAL_SOURCE_NINE_EVEN_LIST_LIFT_CONSUMER_COMPLETE"

end
