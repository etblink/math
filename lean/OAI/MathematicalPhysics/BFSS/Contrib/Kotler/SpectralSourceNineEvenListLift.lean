import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineUnitCartan

/-!
C0-A4a candidate: lift an ordered even original Q-unit list to an actual
source Spin element, retaining its literal Clifford word and vector action.
The construction uses actual source Spin PAIRS. An individual positive
Clifford unit vector is not asserted to belong to Spin. The bounded Cartan
specialization has the same action as g; equality to g, the central sign,
exact-eight padding, PBW continuity and compactness remain separate gates.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineEvenListLift
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineCartan Submodule

/-- Ordered product of the original Clifford embeddings, including the empty word. -/
noncomputable def source9CliffordWord (l : List (SpaceIndex → ℝ)) :
    CliffordAlgebra source9Quadratic :=
  (l.map (CliffordAlgebra.ι source9Quadratic)).prod

/-- Ordered native hyperplane-reflection product on the same nine coordinate labels. -/
noncomputable def source9NativeReflectionWord (l : List (SpaceIndex → ℝ)) :
    EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex :=
  (l.map fun u => (ℝ ∙ source9ToEuclidean u)ᗮ.reflection).prod

/-- An even Q-unit list lifts to the literal source Spin group with BOTH exact word and action. -/
theorem source9EvenUnitList_lift (l : List (SpaceIndex → ℝ))
    (hall : ∀ u ∈ l, source9Quadratic u = 1) (heven : Even l.length) :
    ∃ h : spinGroup source9Quadratic,
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      ∀ z : SpaceIndex → ℝ,
        source9ToEuclidean (source9SpinVectorRepresentation h z) =
          source9NativeReflectionWord l (source9ToEuclidean z) := by
  have aux : ∀ n : ℕ, ∀ t : List (SpaceIndex → ℝ), t.length = n →
      (∀ u ∈ t, source9Quadratic u = 1) → Even t.length →
      ∃ h : spinGroup source9Quadratic,
        (h : CliffordAlgebra source9Quadratic) = source9CliffordWord t ∧
        ∀ z : SpaceIndex → ℝ,
          source9ToEuclidean (source9SpinVectorRepresentation h z) =
            source9NativeReflectionWord t (source9ToEuclidean z) := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro t hlen htunit hteven
      cases t with
      | nil =>
        refine ⟨1, ?_, ?_⟩
        · rfl
        · intro z
          change source9ToEuclidean
            (source9SpinVectorConjugation (1 : spinGroup source9Quadratic) z) = _
          rw [source9SpinVectorConjugation_one]
          rfl
      | cons u rest =>
        cases rest with
        | nil =>
          rcases hteven with ⟨k, hk⟩
          simp only [List.length_cons, List.length_nil] at hk
          omega
        | cons v tail =>
          have hsmall : tail.length < n := by
            simp only [List.length_cons] at hlen
            omega
          have htailunit : ∀ w ∈ tail, source9Quadratic w = 1 := by
            intro w hw
            exact htunit w (by simp only [List.mem_cons]; exact Or.inr (Or.inr hw))
          have htaileven : Even tail.length := by
            rcases hteven with ⟨k, hk⟩
            simp only [List.length_cons] at hk
            refine ⟨k - 1, ?_⟩
            omega
          obtain ⟨h, hword, haction⟩ :=
            ih tail.length hsmall tail rfl htailunit htaileven
          have hu : source9Quadratic u = 1 := htunit u (by simp)
          have hv : source9Quadratic v = 1 := htunit v (by simp)
          refine ⟨source9UnitVectorPairSpin u v hu hv * h, ?_, ?_⟩
          · change (CliffordAlgebra.ι source9Quadratic u *
              CliffordAlgebra.ι source9Quadratic v) *
              (h : CliffordAlgebra source9Quadratic) = _
            rw [hword]
            simp only [source9CliffordWord, List.map_cons, List.prod_cons, mul_assoc]
          · intro z
            change source9ToEuclidean
              (source9SpinVectorConjugation (source9UnitVectorPairSpin u v hu hv * h) z) = _
            rw [source9SpinVectorConjugation_mul]
            change source9ToEuclidean
              (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv)
                (source9SpinVectorRepresentation h z)) = _
            rw [source9UnitVectorPairSpin_eq_native_hyperplane_pair u v _ hu hv, haction]
            rfl
  exact aux l.length l rfl hall heven

/-- The accepted bounded Cartan list lifts with its exact word and the ORIGINAL action of g. -/
theorem source9Spin_sourceUnitCartan_lift (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ), ∃ h : spinGroup source9Quadratic,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      ∀ z : SpaceIndex → ℝ,
        source9SpinVectorRepresentation h z = source9SpinVectorRepresentation g z := by
  obtain ⟨l, hall, hlen, heven, hfactor⟩ := source9Spin_sourceUnitCartan_le_eight g
  obtain ⟨h, hword, haction⟩ := source9EvenUnitList_lift l hall heven
  refine ⟨l, h, hall, hlen, heven, hword, ?_⟩
  intro z
  apply source9ToEuclidean.injective
  calc
    _ = source9NativeReflectionWord l (source9ToEuclidean z) := haction z
    _ = source9SpinEuclideanIsometry g (source9ToEuclidean z) :=
      (congrArg (fun f : EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex =>
        f (source9ToEuclidean z)) hfactor).symm
    _ = _ := source9SpinEuclideanIsometry_apply_source g z

#print axioms FCP.BFSSSourceNineEvenListLift.source9CliffordWord
#print axioms FCP.BFSSSourceNineEvenListLift.source9NativeReflectionWord
#print axioms FCP.BFSSSourceNineEvenListLift.source9EvenUnitList_lift
#print axioms FCP.BFSSSourceNineEvenListLift.source9Spin_sourceUnitCartan_lift
#eval IO.println "SPECTRAL_SOURCE_NINE_EVEN_LIST_LIFT_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineEvenListLift
