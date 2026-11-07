import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSignedWord
import Mathlib.Data.List.OfFn

/-!
C0-A4c candidate: pad the qualified signed source word BEFORE absorbing
its sign. Repeated original Q-unit pairs have literal Clifford product one.
The resulting eight-factor list is nonempty, so negating its first factor
handles both source signs even when the original Cartan list was empty.
Retain original coordinates, Q, embedding and the literal source element.
This is algebraic existence, not PBW continuity or source compactness.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineExactEightWord
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineSignedWord

/-- An explicit ordered list of n repeated pairs of the SAME original vector. -/
noncomputable def source9UnitPairPadding (u : SpaceIndex → ℝ) : ℕ → List (SpaceIndex → ℝ)
  | 0 => []
  | n + 1 => u :: u :: source9UnitPairPadding u n

/-- Pair padding contributes exactly twice its pair count. -/
theorem source9UnitPairPadding_length (u : SpaceIndex → ℝ) (n : ℕ) :
    (source9UnitPairPadding u n).length = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change (source9UnitPairPadding u n).length + 1 + 1 = 2 * (n + 1)
    rw [ih]
    omega

/-- Every padding entry remains an original Q-unit vector. -/
theorem source9UnitPairPadding_all_unit (u : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (n : ℕ) :
    ∀ v ∈ source9UnitPairPadding u n, source9Quadratic v = 1 := by
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

/-- Every repeated Q-unit pair is the literal Clifford identity, in the original order. -/
theorem source9UnitPairPadding_word (u : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (n : ℕ) :
    source9CliffordWord (source9UnitPairPadding u n) = 1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change CliffordAlgebra.ι source9Quadratic u *
      (CliffordAlgebra.ι source9Quadratic u *
        source9CliffordWord (source9UnitPairPadding u n)) = 1
    rw [ih, mul_one, CliffordAlgebra.ι_sq_scalar, hu, map_one]

/-- Append preserves the exact noncommutative word order. -/
theorem source9CliffordWord_append (l t : List (SpaceIndex → ℝ)) :
    source9CliffordWord (l ++ t) = source9CliffordWord l * source9CliffordWord t := by
  simp only [source9CliffordWord, List.map_append, List.prod_append]

/-- Negating just the first vector negates the full original Clifford word. -/
theorem source9CliffordWord_neg_head (u : SpaceIndex → ℝ) (l : List (SpaceIndex → ℝ)) :
    source9CliffordWord ((-u) :: l) = -source9CliffordWord (u :: l) := by
  simp only [source9CliffordWord, List.map_cons, List.prod_cons, map_neg, neg_mul]

/-- Every literal source Spin element is EXACTLY an eight-factor original Q-unit Clifford word. -/
theorem source9Spin_exact_eight_list (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length = 8 ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord l := by
  obtain ⟨l, hall, hlen, heven, hsign⟩ := source9Spin_sourceUnitCartan_signed_word g
  rcases heven with ⟨k, hk⟩
  have hkbound : k ≤ 4 := by omega
  let e : SpaceIndex → ℝ := source9CoordinateVector (0 : SpaceIndex)
  have he : source9Quadratic e = 1 := source9CoordinateVector_unit 0
  let t := l ++ source9UnitPairPadding e (4 - k)
  have htunit : ∀ u ∈ t, source9Quadratic u = 1 := by
    intro u hu
    change u ∈ l ++ source9UnitPairPadding e (4 - k) at hu
    rcases List.mem_append.mp hu with horiginal | hpad
    · exact hall u horiginal
    · exact source9UnitPairPadding_all_unit e he (4 - k) u hpad
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
  · exact ⟨t, htunit, htlen, hpos⟩
  · cases t with
    | nil => simp at htlen
    | cons u tail =>
      refine ⟨(-u) :: tail, ?_, htlen, ?_⟩
      · intro v hv
        rcases List.mem_cons.mp hv with hhead | htail
        · rw [hhead, QuadraticMap.map_neg]
          exact htunit u (List.mem_cons.mpr (Or.inl rfl))
        · exact htunit v (List.mem_cons.mpr (Or.inr htail))
      · exact hneg.trans (source9CliffordWord_neg_head u tail).symm

/-- The eight witnesses use the natural Fin 8 order, with no continuous-choice assertion. -/
theorem source9Spin_exact_eight_word (g : spinGroup source9Quadratic) :
    ∃ w : Fin 8 → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
  obtain ⟨l, hall, hlen, hword⟩ := source9Spin_exact_eight_list g
  have aux : ∃ w : Fin l.length → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) := by
    refine ⟨l.get, ?_, ?_⟩
    · intro i
      exact hall (l.get i) (List.get_mem l i)
    · rw [List.ofFn_get]
      exact hword
  simpa only [hlen] using aux

#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_length
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_all_unit
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_word
#print axioms FCP.BFSSSourceNineExactEightWord.source9CliffordWord_append
#print axioms FCP.BFSSSourceNineExactEightWord.source9CliffordWord_neg_head
#print axioms FCP.BFSSSourceNineExactEightWord.source9Spin_exact_eight_list
#print axioms FCP.BFSSSourceNineExactEightWord.source9Spin_exact_eight_word
#eval IO.println "SPECTRAL_SOURCE_NINE_EXACT_EIGHT_WORD_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineExactEightWord
