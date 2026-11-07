import diagnostics.BFSSAxisCartanSupportDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineExactEightWord
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineGammaFaithfulness

/-!
Candidate original ninth-axis stabilizer / exact-eight perpendicular-word
equivalence. Reuse the checked fixed-axis induction, original normalization,
ordered even-list lift, actual two-sign fibers, padding and sign absorption.
No replacement Clifford algebra, even-Clifford injectivity, topological
Spin(8) classification, Fock action or physical spectral claim is introduced.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisStabilizerWords
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSGamma9
open FCP.BFSSSourceNineReflection FCP.BFSSSourceNineCartan
open FCP.BFSSSourceNineEvenListLift FCP.BFSSSourceNineSignedWord
open FCP.BFSSSourceNineExactEightWord FCP.BFSSSourceNineGammaFaithfulness
open Submodule

private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : (SpaceIndex → ℝ) ≃ₗ[ℝ] Euc9 := source9ToEuclidean

/-- Orthogonality to the original ninth axis is exactly zero original coordinate 8. -/
theorem source9Axis8_inner (u : SpaceIndex → ℝ) :
    inner ℝ (E (source9CoordinateVector 8)) (E u) = u 8 := by
  change dotProduct u (star (source9CoordinateVector 8)) = u 8
  simp [source9CoordinateVector]

/-- Removing zero normals and normalizing nonzero ones preserves the fixed-axis support. -/
theorem source9Axis8_unitNormals_support (l : List Euc9) :
    (∀ u ∈ l, inner ℝ (E (source9CoordinateVector 8)) u = 0) →
    ∀ u ∈ source9EuclideanUnitNormals l,
      inner ℝ (E (source9CoordinateVector 8)) u = 0 := by
  induction l with
  | nil => simp [source9EuclideanUnitNormals]
  | cons u tail ih =>
    intro hs v hv
    have htail : ∀ z ∈ tail, inner ℝ (E (source9CoordinateVector 8)) z = 0 := by
      intro z hz
      exact hs z (List.mem_cons.mpr (Or.inr hz))
    by_cases hu : u = 0
    · have hv' : v ∈ source9EuclideanUnitNormals tail := by
        simpa [source9EuclideanUnitNormals, hu] using hv
      exact ih htail v hv'
    · have hv' : v = source9EuclideanUnitNormal u ∨
          v ∈ source9EuclideanUnitNormals tail := by
        simpa [source9EuclideanUnitNormals, hu] using hv
      rcases hv' with hhead | hrest
      · subst v
        have horth := hs u (List.mem_cons.mpr (Or.inl rfl))
        simp only [source9EuclideanUnitNormal, inner_smul_right, horth, mul_zero]
      · exact ih htail v hrest

/-- Support-preserving, zero-free unit Cartan list for the actual original source action. -/
theorem source9Axis8Euclidean_unitCartan
    (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List Euc9, (∀ u ∈ l, ‖u‖ = 1) ∧
      (∀ u ∈ l, inner ℝ (E (source9CoordinateVector 8)) u = 0) ∧
      l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  have he0 : source9CoordinateVector (8 : SpaceIndex) ≠ 0 := by
    intro he
    have hc := congrFun he (8 : SpaceIndex)
    norm_num [source9CoordinateVector] at hc
  have hE0 : E (source9CoordinateVector 8) ≠ 0 := by
    intro he
    exact he0 (E.injective (he.trans (map_zero E).symm))
  have hfix : source9SpinEuclideanIsometry g (E (source9CoordinateVector 8)) =
      E (source9CoordinateVector 8) := by
    rw [source9SpinEuclideanIsometry_apply_source, hg]
  obtain ⟨raw, hlen, hs, hf⟩ :=
    FCP.BFSSAxisCartanSupportDiagnostic.reflections_generate_fixing_nine
      (source9SpinEuclideanIsometry g) (E (source9CoordinateVector 8)) hE0 hfix
  let l := source9EuclideanUnitNormals raw
  have hall : ∀ u ∈ l, ‖u‖ = 1 := source9EuclideanUnitNormals_all_unit raw
  have hsupport : ∀ u ∈ l, inner ℝ (E (source9CoordinateVector 8)) u = 0 :=
    source9Axis8_unitNormals_support raw hs
  have hbound : l.length ≤ 8 := (source9EuclideanUnitNormals_length_le raw).trans hlen
  have hfactor : source9SpinEuclideanIsometry g =
      (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod :=
    hf.trans (source9EuclideanUnitNormals_reflectionProduct_eq raw)
  have hdet : LinearMap.det (((l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod).toLinearMap) = 1 :=
    (congrArg (fun f : Euc9 ≃ₗᵢ[ℝ] Euc9 => LinearMap.det f.toLinearMap) hfactor.symm).trans
      (source9SpinEuclideanIsometry_det_one g)
  exact ⟨l, hall, hsupport, hbound,
    source9EuclideanUnitReflectionList_even_of_det_one l hall hdet, hfactor⟩

/-- The supported Cartan witnesses are original Q-unit vectors in the original nine coordinates. -/
theorem source9Axis8_sourceUnitCartan
    (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List (SpaceIndex → ℝ), (∀ u ∈ l, source9Quadratic u = 1) ∧
      (∀ u ∈ l, u 8 = 0) ∧ l.length ≤ 8 ∧ Even l.length ∧
      source9SpinEuclideanIsometry g = source9NativeReflectionWord l := by
  obtain ⟨normals, hall, hs, hlen, heven, hf⟩ := source9Axis8Euclidean_unitCartan g hg
  refine ⟨normals.map E.symm, ?_, ?_, ?_, ?_, ?_⟩
  · intro u hu
    rcases List.mem_map.mp hu with ⟨v, hv, rfl⟩
    rw [source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply, hall v hv]
    norm_num
  · intro u hu
    rcases List.mem_map.mp hu with ⟨v, hv, rfl⟩
    have hc := source9Axis8_inner (E.symm v)
    rw [E.apply_symm_apply] at hc
    exact hc.symm.trans (hs v hv)
  · simpa only [List.length_map] using hlen
  · simpa only [List.length_map] using heven
  · simpa only [source9NativeReflectionWord, List.map_map, Function.comp_def,
      E.apply_symm_apply] using hf

/-- Every ordered perpendicular reflection word fixes the actual original ninth axis. -/
theorem source9PerpendicularReflectionWord_fixesAxis
    (l : List (SpaceIndex → ℝ)) (hs : ∀ u ∈ l, u 8 = 0) :
    source9NativeReflectionWord l (E (source9CoordinateVector 8)) =
      E (source9CoordinateVector 8) := by
  revert hs
  induction l with
  | nil => intro _; rfl
  | cons u tail ih =>
    intro hs
    have htail : ∀ v ∈ tail, v 8 = 0 := by
      intro v hv
      exact hs v (List.mem_cons.mpr (Or.inr hv))
    have hu : u 8 = 0 := hs u (List.mem_cons.mpr (Or.inl rfl))
    calc
      _ = (ℝ ∙ E u)ᗮ.reflection
          (source9NativeReflectionWord tail (E (source9CoordinateVector 8))) := rfl
      _ = (ℝ ∙ E u)ᗮ.reflection (E (source9CoordinateVector 8)) := by rw [ih htail]
      _ = E (source9CoordinateVector 8) := by
        apply reflection_mem_subspace_eq_self
        rw [mem_orthogonal_singleton_iff_inner_left, source9Axis8_inner]
        exact hu

/-- An actual source element equal to an even perpendicular Q-unit word fixes the source axis. -/
theorem source9PerpendicularEvenUnitList_fixesAxis
    (g : spinGroup source9Quadratic) (l : List (SpaceIndex → ℝ))
    (hall : ∀ u ∈ l, source9Quadratic u = 1) (hs : ∀ u ∈ l, u 8 = 0)
    (heven : Even l.length)
    (hword : (g : CliffordAlgebra source9Quadratic) = source9CliffordWord l) :
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 := by
  obtain ⟨h, hhword, haction⟩ := source9EvenUnitList_lift l hall heven
  have hgh : g = h := Subtype.ext (hword.trans hhword.symm)
  apply E.injective
  calc
    _ = E (source9SpinVectorRepresentation h (source9CoordinateVector 8)) := by rw [hgh]
    _ = source9NativeReflectionWord l (E (source9CoordinateVector 8)) := haction _
    _ = E (source9CoordinateVector 8) := source9PerpendicularReflectionWord_fixesAxis l hs

/-- Recover the actual source element up to its actual negative central sign, retaining support. -/
theorem source9Axis8_signed_word
    (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List (SpaceIndex → ℝ), (∀ u ∈ l, source9Quadratic u = 1) ∧
      (∀ u ∈ l, u 8 = 0) ∧ l.length ≤ 8 ∧ Even l.length ∧
      ((g : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∨
       (g : CliffordAlgebra source9Quadratic) = -source9CliffordWord l) := by
  obtain ⟨l, hall, hs, hlen, heven, hf⟩ := source9Axis8_sourceUnitCartan g hg
  obtain ⟨h, hword, haction⟩ := source9EvenUnitList_lift l hall heven
  have ha : ∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation h z = source9SpinVectorRepresentation g z := by
    intro z
    apply E.injective
    calc
      _ = source9NativeReflectionWord l (E z) := haction z
      _ = source9SpinEuclideanIsometry g (E z) :=
        (congrArg (fun f : Euc9 ≃ₗᵢ[ℝ] Euc9 => f (E z)) hf).symm
      _ = _ := source9SpinEuclideanIsometry_apply_source g z
  have hsign := (source9Action_eq_iff_two_sign_fiber g h).mp (fun z => (ha z).symm)
  refine ⟨l, hall, hs, hlen, heven, ?_⟩
  rcases hsign with hpos | hneg
  · left
    exact (congrArg (fun k : spinGroup source9Quadratic =>
      (k : CliffordAlgebra source9Quadratic)) hpos).trans hword
  · right
    calc
      (g : CliffordAlgebra source9Quadratic) =
          ((source9NegativeCentral * h : spinGroup source9Quadratic) :
            CliffordAlgebra source9Quadratic) :=
        congrArg (fun k : spinGroup source9Quadratic =>
          (k : CliffordAlgebra source9Quadratic)) hneg
      _ = -(h : CliffordAlgebra source9Quadratic) := by
        change (source9NegativeCentral : CliffordAlgebra source9Quadratic) *
          (h : CliffordAlgebra source9Quadratic) = _
        rw [source9NegativeCentral_coe, neg_one_mul]
      _ = -source9CliffordWord l := congrArg (fun x : CliffordAlgebra source9Quadratic => -x) hword

/-- Neutral repeated pairs preserve the coordinate support as well as the Clifford value. -/
theorem source9UnitPairPadding_axis8 (u : SpaceIndex → ℝ) (hu : u 8 = 0) (n : ℕ) :
    ∀ v ∈ source9UnitPairPadding u n, v 8 = 0 := by
  induction n with
  | zero => simp [source9UnitPairPadding]
  | succ n ih =>
    intro v hv
    change v ∈ u :: u :: source9UnitPairPadding u n at hv
    rcases List.mem_cons.mp hv with hhead | htail
    · rw [hhead]
      exact hu
    · rcases List.mem_cons.mp htail with hhead | htail
      · rw [hhead]
        exact hu
      · exact ih v htail

/-- Pad first, then absorb the central sign, including the empty-list and negative-center cases. -/
theorem source9Axis8_exact_eight_list
    (g : spinGroup source9Quadratic)
    (hg : source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8) :
    ∃ l : List (SpaceIndex → ℝ), (∀ u ∈ l, source9Quadratic u = 1) ∧
      (∀ u ∈ l, u 8 = 0) ∧ l.length = 8 ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord l := by
  obtain ⟨l, hall, hs, hlen, heven, hsign⟩ := source9Axis8_signed_word g hg
  rcases heven with ⟨k, hk⟩
  have hkbound : k ≤ 4 := by omega
  let e : SpaceIndex → ℝ := source9CoordinateVector (0 : SpaceIndex)
  have he : source9Quadratic e = 1 := source9CoordinateVector_unit 0
  have he8 : e 8 = 0 := by norm_num [e, source9CoordinateVector]
  let t := l ++ source9UnitPairPadding e (4 - k)
  have htunit : ∀ u ∈ t, source9Quadratic u = 1 := by
    intro u hu
    change u ∈ l ++ source9UnitPairPadding e (4 - k) at hu
    rcases List.mem_append.mp hu with horiginal | hpad
    · exact hall u horiginal
    · exact source9UnitPairPadding_all_unit e he (4 - k) u hpad
  have htsupport : ∀ u ∈ t, u 8 = 0 := by
    intro u hu
    change u ∈ l ++ source9UnitPairPadding e (4 - k) at hu
    rcases List.mem_append.mp hu with horiginal | hpad
    · exact hs u horiginal
    · exact source9UnitPairPadding_axis8 e he8 (4 - k) u hpad
  have htlen : t.length = 8 := by
    change (l ++ source9UnitPairPadding e (4 - k)).length = 8
    rw [List.length_append, source9UnitPairPadding_length]
    omega
  have htword : source9CliffordWord t = source9CliffordWord l := by
    change source9CliffordWord (l ++ source9UnitPairPadding e (4 - k)) = _
    rw [source9CliffordWord_append, source9UnitPairPadding_word e he, mul_one]
  have htsign : (g : CliffordAlgebra source9Quadratic) = source9CliffordWord t ∨
      (g : CliffordAlgebra source9Quadratic) = -source9CliffordWord t := by
    rw [htword]
    exact hsign
  rcases htsign with hpos | hneg
  · exact ⟨t, htunit, htsupport, htlen, hpos⟩
  · cases ht : t with
    | nil =>
      have hzero : t.length = 0 := congrArg List.length ht
      omega
    | cons u tail =>
      have hconsunit : ∀ v ∈ u :: tail, source9Quadratic v = 1 := ht ▸ htunit
      have hconssupport : ∀ v ∈ u :: tail, v 8 = 0 := ht ▸ htsupport
      have hconslen : (u :: tail).length = 8 := ht ▸ htlen
      have hconsneg : (g : CliffordAlgebra source9Quadratic) =
          -source9CliffordWord (u :: tail) := ht ▸ hneg
      refine ⟨(-u) :: tail, ?_, ?_, hconslen, ?_⟩
      · intro v hv
        rcases List.mem_cons.mp hv with hhead | htail
        · rw [hhead, QuadraticMap.map_neg]
          exact hconsunit u (List.mem_cons.mpr (Or.inl rfl))
        · exact hconsunit v (List.mem_cons.mpr (Or.inr htail))
      · intro v hv
        rcases List.mem_cons.mp hv with hhead | htail
        · rw [hhead]
          simpa only [Pi.neg_apply, neg_zero] using
            congrArg (fun x : ℝ => -x) (hconssupport u (List.mem_cons.mpr (Or.inl rfl)))
        · exact hconssupport v (List.mem_cons.mpr (Or.inr htail))
      · exact hconsneg.trans (source9CliffordWord_neg_head u tail).symm

/-- Exact requested characterization in the literal original source group and Clifford algebra. -/
theorem source9Axis8Stabilizer_perpendicularWord (g : spinGroup source9Quadratic) :
    source9SpinVectorRepresentation g (source9CoordinateVector 8) = source9CoordinateVector 8 ↔
      ∃ w : Fin 8 → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
  constructor
  · intro hg
    obtain ⟨l, hall, hs, hlen, hword⟩ := source9Axis8_exact_eight_list g hg
    have aux : ∃ w : Fin l.length → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
      refine ⟨l.get, ?_, ?_, ?_⟩
      · intro i
        exact hall (l.get i) (List.get_mem l i)
      · intro i
        exact hs (l.get i) (List.get_mem l i)
      · rw [List.ofFn_get]
        exact hword
    have transport : ∀ n : ℕ, l.length = n →
        ∃ w : Fin n → (SpaceIndex → ℝ),
          (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
          (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
      intro n hn
      subst n
      exact aux
    exact transport 8 hlen
  · rintro ⟨w, hall, hs, hword⟩
    apply source9PerpendicularEvenUnitList_fixesAxis g (List.ofFn w) _ _ _ hword
    · intro u hu
      rcases List.mem_ofFn.mp hu with ⟨i, rfl⟩
      exact hall i
    · intro u hu
      rcases List.mem_ofFn.mp hu with ⟨i, rfl⟩
      exact hs i
    · simpa only [List.length_ofFn] using (show Even 8 by exact ⟨4, rfl⟩)

/-- Bind the word characterization to the qualified original gamma stabilizer criterion. -/
theorem source9Gamma8_commutes_iff_perpendicularWord (g : spinGroup source9Quadratic) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gamma 8 =
        gamma 8 * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) ↔
      ∃ w : Fin 8 → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧ (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
  have hgamma : gammaNineRealLinear (source9CoordinateVector 8) = gamma 8 := by
    simp [gammaNineRealLinear, source9CoordinateVector, Pi.single_apply]
  have hfix := source9SpinGamma_fixes_iff_commutes g (source9CoordinateVector 8)
  rw [hgamma] at hfix
  exact hfix.symm.trans (source9Axis8Stabilizer_perpendicularWord g)

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
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_WORDS_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisStabilizerWords
