import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineExactEightWord

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineExactEightWord

example (u : SpaceIndex → ℝ) : ℕ → List (SpaceIndex → ℝ) := source9UnitPairPadding u

example (u : SpaceIndex → ℝ) (n : ℕ) :
    (source9UnitPairPadding u n).length = 2 * n := source9UnitPairPadding_length u n

example (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) (n : ℕ) :
    ∀ v ∈ source9UnitPairPadding u n, source9Quadratic v = 1 :=
  source9UnitPairPadding_all_unit u hu n

example (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) (n : ℕ) :
    source9CliffordWord (source9UnitPairPadding u n) = 1 := source9UnitPairPadding_word u hu n

example (l t : List (SpaceIndex → ℝ)) :
    source9CliffordWord (l ++ t) = source9CliffordWord l * source9CliffordWord t :=
  source9CliffordWord_append l t

example (u : SpaceIndex → ℝ) (l : List (SpaceIndex → ℝ)) :
    source9CliffordWord ((-u) :: l) = -source9CliffordWord (u :: l) :=
  source9CliffordWord_neg_head u l

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length = 8 ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord l :=
  source9Spin_exact_eight_list g

example (g : spinGroup source9Quadratic) :
    ∃ w : Fin 8 → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧
      (g : CliffordAlgebra source9Quadratic) = source9CliffordWord (List.ofFn w) :=
  source9Spin_exact_eight_word g

-- Empty positive source sign: eight actual unit factors, not an external sign.
example : ∃ w : Fin 8 → (SpaceIndex → ℝ),
    (∀ i, source9Quadratic (w i) = 1) ∧
    source9CliffordWord (List.ofFn w) = (1 : CliffordAlgebra source9Quadratic) := by
  obtain ⟨w, hall, hword⟩ := source9Spin_exact_eight_word (1 : spinGroup source9Quadratic)
  exact ⟨w, hall, hword.symm⟩

-- Empty negative source sign: the sign is inside the eight-vector word.
example : ∃ w : Fin 8 → (SpaceIndex → ℝ),
    (∀ i, source9Quadratic (w i) = 1) ∧
    source9CliffordWord (List.ofFn w) = (-1 : CliffordAlgebra source9Quadratic) := by
  obtain ⟨w, hall, hword⟩ := source9Spin_exact_eight_word source9NegativeCentral
  exact ⟨w, hall, hword.symm.trans source9NegativeCentral_coe⟩

#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_length
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_all_unit
#print axioms FCP.BFSSSourceNineExactEightWord.source9UnitPairPadding_word
#print axioms FCP.BFSSSourceNineExactEightWord.source9CliffordWord_append
#print axioms FCP.BFSSSourceNineExactEightWord.source9CliffordWord_neg_head
#print axioms FCP.BFSSSourceNineExactEightWord.source9Spin_exact_eight_list
#print axioms FCP.BFSSSourceNineExactEightWord.source9Spin_exact_eight_word
#eval IO.println "SPECTRAL_SOURCE_NINE_EXACT_EIGHT_WORD_CONSUMER_COMPLETE"

end
