import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSignedWord

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineSignedWord

example (g h : spinGroup source9Quadratic)
    (ha : ∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation g z = source9SpinVectorRepresentation h z) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9NaturalMatrix_eq_of_action_eq g h ha

example (g h : spinGroup source9Quadratic) :
    (∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation g z = source9SpinVectorRepresentation h z) ↔
      g = h ∨ g = source9NegativeCentral * h :=
  source9Action_eq_iff_two_sign_fiber g h

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ), ∃ h : spinGroup source9Quadratic,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      (g = h ∨ g = source9NegativeCentral * h) :=
  source9Spin_sourceUnitCartan_two_sign_lift g

example (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      ((g : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∨
        (g : CliffordAlgebra source9Quadratic) = -source9CliffordWord l) :=
  source9Spin_sourceUnitCartan_signed_word g

-- Both original signs really have the same natural vector action.
example : ∀ z : SpaceIndex → ℝ,
    source9SpinVectorRepresentation source9NegativeCentral z =
      source9SpinVectorRepresentation (1 : spinGroup source9Quadratic) z := by
  apply (source9Action_eq_iff_two_sign_fiber source9NegativeCentral 1).2
  exact Or.inr (mul_one source9NegativeCentral).symm

-- The identical action does not identify the actual original group elements.
example : source9NegativeCentral ≠ (1 : spinGroup source9Quadratic) ∧
    (source9NegativeCentral : CliffordAlgebra source9Quadratic) =
      -source9CliffordWord [] := by
  refine ⟨source9NegativeCentral_ne_one, ?_⟩
  exact source9NegativeCentral_coe

-- The positive empty word is the actual identity Clifford value.
example : ((1 : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic) =
    source9CliffordWord [] := rfl

-- Either source sign recovers the same original action on EVERY source vector.
example (g h : spinGroup source9Quadratic)
    (hs : g = h ∨ g = source9NegativeCentral * h) (z : SpaceIndex → ℝ) :
    source9SpinVectorRepresentation g z = source9SpinVectorRepresentation h z :=
  (source9Action_eq_iff_two_sign_fiber g h).2 hs z

#print axioms FCP.BFSSSourceNineSignedWord.source9NaturalMatrix_eq_of_action_eq
#print axioms FCP.BFSSSourceNineSignedWord.source9Action_eq_iff_two_sign_fiber
#print axioms FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_two_sign_lift
#print axioms FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_signed_word
#eval IO.println "SPECTRAL_SOURCE_NINE_SIGNED_WORD_CONSUMER_COMPLETE"

end
