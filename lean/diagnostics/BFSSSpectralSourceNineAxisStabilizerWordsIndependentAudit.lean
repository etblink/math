import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisStabilizerWords

/-! Independent literal-source types, both central signs, ordered pairs and source rotors. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerWordsIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSGamma9
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineExactEightWord FCP.BFSSSourceNineGammaCovariance
open FCP.BFSSSourceNineGammaFaithfulness FCP.BFSSSourceNineAxisStabilizerWords
open Submodule

private theorem coordinate_gamma (r : SpaceIndex) :
    gammaNineRealLinear (source9CoordinateVector r) = gamma r := by
  simp [gammaNineRealLinear, source9CoordinateVector, Pi.single_apply]

private theorem coordinate_gamma_square (r : SpaceIndex) : gamma r * gamma r = 1 := by
  simpa only [coordinate_gamma, source9CoordinateVector_unit, one_smul] using
    gammaNineRealLinear_sq (source9CoordinateVector r)

private theorem coordinate_gamma_anti (r s : SpaceIndex) (hrs : r ≠ s) :
    gamma r * gamma s = -(gamma s * gamma r) := by
  exact eq_neg_of_add_eq_zero_left (by simpa [hrs] using gamma_clifford r s)

private theorem coordinate_pair_gamma (r s : SpaceIndex) :
    ((source9SpinGammaSpecialOrthogonalHom
      (source9UnitVectorPairSpin (source9CoordinateVector r) (source9CoordinateVector s)
        (source9CoordinateVector_unit r) (source9CoordinateVector_unit s))) : GammaMatrix) =
      gamma r * gamma s := by
  rw [source9UnitVectorPairSpin_gamma, coordinate_gamma, coordinate_gamma]

private theorem action_of_intertwiner
    (g : spinGroup source9Quadratic) (v w : SpaceIndex → ℝ)
    (h : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear v =
      gammaNineRealLinear w * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix)) :
    source9SpinVectorRepresentation g v = w := by
  apply gammaNineRealLinear_injective
  have he := (source9GammaSpecialOrthogonal_intertwines g v).symm.trans h
  have hinv : ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) *
      ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix) = 1 := by
    calc
      _ = ((source9SpinGammaSpecialOrthogonalHom (g * g⁻¹)) : GammaMatrix) := by
        rw [map_mul]
        rfl
      _ = 1 := by rw [mul_inv_cancel, map_one]; rfl
  have hc := congrArg (fun A : GammaMatrix =>
    A * ((source9SpinGammaSpecialOrthogonalHom g⁻¹) : GammaMatrix)) he
  simpa only [mul_assoc, hinv, mul_one] using hc

private theorem perpendicular_pair_fixes
    (u v : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1)
    (hu8 : u 8 = 0) (hv8 : v 8 = 0) :
    source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv)
      (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  have hfix (w : SpaceIndex → ℝ) (hw : w 8 = 0) :
      (ℝ ∙ source9ToEuclidean w)ᗮ.reflection (source9ToEuclidean (source9CoordinateVector 8)) =
        source9ToEuclidean (source9CoordinateVector 8) := by
    apply reflection_mem_subspace_eq_self
    rw [mem_orthogonal_singleton_iff_inner_left, source9Axis8_inner]
    exact hw
  apply source9ToEuclidean.injective
  rw [source9UnitVectorPairSpin_eq_native_hyperplane_pair, hfix v hv8, hfix u hu8]

private theorem negative_center_fixes :
    source9SpinVectorRepresentation source9NegativeCentral (source9CoordinateVector 8) =
      source9CoordinateVector 8 := by
  apply (source9SpinGamma_fixes_iff_commutes _ _).mpr
  rw [source9NegativeCentral_gamma]
  simp only [neg_mul, mul_neg, one_mul, mul_one]

private theorem mixed_pair_action : source9SpinVectorRepresentation
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8))
    (source9CoordinateVector 8) = -source9CoordinateVector 8 := by
  apply action_of_intertwiner
  rw [coordinate_pair_gamma, map_neg, coordinate_gamma]
  calc
    (gamma 0 * gamma 8) * gamma 8 = gamma 0 := by
      rw [mul_assoc, coordinate_gamma_square, mul_one]
    _ = -gamma 8 * (gamma 0 * gamma 8) := by
      rw [← mul_assoc, neg_mul, coordinate_gamma_anti 8 0 (by decide), neg_neg,
        mul_assoc, coordinate_gamma_square, mul_one]

example (g : spinGroup source9Quadratic) :
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ↔
      ∃ w : Fin 8 → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) :=
  source9Axis8Stabilizer_perpendicularWord g

example (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ w : Fin 8 → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) :=
  (source9Axis8Stabilizer_perpendicularWord g).mp hg

example (g : spinGroup source9Quadratic) (w : Fin 8 → (SpaceIndex → ℝ))
    (hu : ∀ i, source9Quadratic (w i) = 1) (hs : ∀ i, w i 8 = 0)
    (hw : (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w)) :
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 :=
  (source9Axis8Stabilizer_perpendicularWord g).mpr ⟨w, hu, hs, hw⟩

example : ∃ w : Fin 8 → (SpaceIndex → ℝ),
    (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
    (1 : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
  apply (source9Axis8Stabilizer_perpendicularWord (1 : spinGroup source9Quadratic)).mp
  rw [map_one]
  rfl

example : ∃ w : Fin 8 → (SpaceIndex → ℝ),
    (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
    source9CliffordWord (List.ofFn w) = (-1 : CliffordAlgebra source9Quadratic) := by
  obtain ⟨w, hu, hs, hw⟩ :=
    (source9Axis8Stabilizer_perpendicularWord source9NegativeCentral).mp negative_center_fixes
  exact ⟨w, hu, hs, hw.symm.trans source9NegativeCentral_coe⟩

example : source9NegativeCentral ≠ 1 ∧
    ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) = -1 :=
  ⟨source9NegativeCentral_ne_one, source9NegativeCentral_gamma⟩

example : source9SpinVectorRepresentation
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 1)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 1))
    (source9CoordinateVector 8) = source9CoordinateVector 8 :=
  perpendicular_pair_fixes _ _ (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 1)
    (by norm_num [source9CoordinateVector]) (by norm_num [source9CoordinateVector])

example : source9SpinVectorRepresentation
    (source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8))
    (source9CoordinateVector 8) = -source9CoordinateVector 8 := mixed_pair_action

example : ¬ ∃ w : Fin 8 → (SpaceIndex → ℝ),
    (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
    ((source9UnitVectorPairSpin (source9CoordinateVector 0) (source9CoordinateVector 8)
      (source9CoordinateVector_unit 0) (source9CoordinateVector_unit 8)) :
        CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
  intro hw
  have hfix := (source9Axis8Stabilizer_perpendicularWord _).mpr hw
  rw [mixed_pair_action] at hfix
  have hc := congrFun hfix (8 : SpaceIndex)
  norm_num [source9CoordinateVector] at hc

example (t : ℝ) : source9SpinVectorRepresentation
    (source9PlaneSpinCurve (0 : SpaceIndex) 1 (by decide) t)
    (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  unfold source9PlaneSpinCurve
  apply perpendicular_pair_fixes
  · norm_num [source9CoordinateVector]
  · simp [source9PlaneUnitVector, source9CoordinateVector]

example (t : ℝ) : source9SpinVectorRepresentation
    (source9PlaneSpinCurve (6 : SpaceIndex) 7 (by decide) t)
    (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  unfold source9PlaneSpinCurve
  apply perpendicular_pair_fixes
  · norm_num [source9CoordinateVector]
  · simp [source9PlaneUnitVector, source9CoordinateVector]

example (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) (hs : u 8 = 0)
    (l : List (SpaceIndex → ℝ)) : source9Quadratic (-u) = 1 ∧ (-u) 8 = 0 ∧
      source9CliffordWord ((-u) :: l) = -source9CliffordWord (u :: l) := by
  refine ⟨?_, ?_, source9CliffordWord_neg_head u l⟩
  · rw [QuadraticMap.map_neg, hu]
  · simpa only [Pi.neg_apply, neg_zero] using congrArg (fun x : ℝ => -x) hs

example : source9CliffordWord (source9UnitPairPadding (source9CoordinateVector 0) 4) = 1 ∧
    ∀ u ∈ source9UnitPairPadding (source9CoordinateVector 0) 4, u 8 = 0 :=
  ⟨source9UnitPairPadding_word _ (source9CoordinateVector_unit 0) 4,
    source9UnitPairPadding_axis8 _ (by norm_num [source9CoordinateVector]) 4⟩

example : (source9NegativeCentral : CliffordAlgebra source9Quadratic) =
    source9CliffordWord ((-source9CoordinateVector 0) :: source9CoordinateVector 0 ::
      source9UnitPairPadding (source9CoordinateVector 0) 3) := by
  have hpad : source9CliffordWord (source9CoordinateVector 0 :: source9CoordinateVector 0 ::
      source9UnitPairPadding (source9CoordinateVector 0) 3) = 1 :=
    source9UnitPairPadding_word _ (source9CoordinateVector_unit 0) 4
  rw [source9NegativeCentral_coe, source9CliffordWord_neg_head, hpad]

example (u v z : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9ToEuclidean (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) =
      (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
        ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z)) :=
  source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv

example (g : spinGroup source9Quadratic) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gamma 8 =
        gamma 8 * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) ↔
      ∃ w : Fin 8 → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) :=
  source9Gamma8_commutes_iff_perpendicularWord g

#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8_inner
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8_unitNormals_support
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8Euclidean_unitCartan
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8_sourceUnitCartan
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9PerpendicularReflectionWord_fixesAxis
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9PerpendicularEvenUnitList_fixesAxis
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8_signed_word
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9UnitPairPadding_axis8
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8_exact_eight_list
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Axis8Stabilizer_perpendicularWord
#print axioms FCP.BFSSSourceNineAxisStabilizerWords.source9Gamma8_commutes_iff_perpendicularWord
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_WORDS_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerWordsIndependentAudit
