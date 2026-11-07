import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEvenListLift
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers

/-!
C0-A4b candidate: recover the two actual source signs of an attained action,
then specialize the qualified ordered even-list lift to a signed Clifford word.
No injectivity of the natural action is assumed: its two signs are distinct.
The word has even length at most eight; exact-eight padding, sign absorption,
PBW continuity, source compactness and physical spectral claims remain separate.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineSignedWord
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift

/-- Pointwise equality of the ORIGINAL action identifies its ORIGINAL attained matrices. -/
theorem source9NaturalMatrix_eq_of_action_eq (g h : spinGroup source9Quadratic)
    (ha : ∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation g z = source9SpinVectorRepresentation h z) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) =
      ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ) := by
  apply Matrix.mulVec_injective
  funext z
  rw [source9SpinVectorOrthogonalHom_mulVec, source9SpinVectorOrthogonalHom_mulVec]
  exact ha z

/-- Exact action fibers contain the two ACTUAL source group signs, without a replacement carrier. -/
theorem source9Action_eq_iff_two_sign_fiber (g h : spinGroup source9Quadratic) :
    (∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation g z = source9SpinVectorRepresentation h z) ↔
      g = h ∨ g = source9NegativeCentral * h := by
  constructor
  · intro ha
    exact (source9NaturalMatrix_eq_iff_two_sign_fiber g h).1
      (source9NaturalMatrix_eq_of_action_eq g h ha)
  · intro hs
    have hm := (source9NaturalMatrix_eq_iff_two_sign_fiber g h).2 hs
    intro z
    calc
      _ = ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z :=
        (source9SpinVectorOrthogonalHom_mulVec g z).symm
      _ = ((source9SpinVectorOrthogonalHom h) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z :=
        congrArg (fun A : Matrix SpaceIndex SpaceIndex ℝ => A.mulVec z) hm
      _ = _ := source9SpinVectorOrthogonalHom_mulVec h z

/-- The bounded actual Spin lift recovers g up to precisely its original negative central sign. -/
theorem source9Spin_sourceUnitCartan_two_sign_lift (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ), ∃ h : spinGroup source9Quadratic,
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      (h : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∧
      (g = h ∨ g = source9NegativeCentral * h) := by
  obtain ⟨l, h, hall, hlen, heven, hword, haction⟩ := source9Spin_sourceUnitCartan_lift g
  refine ⟨l, h, hall, hlen, heven, hword, ?_⟩
  exact (source9Action_eq_iff_two_sign_fiber g h).1 (fun z => (haction z).symm)

/-- Every original source element is a bounded even Q-unit Clifford word OR its negative. -/
theorem source9Spin_sourceUnitCartan_signed_word (g : spinGroup source9Quadratic) :
    ∃ l : List (SpaceIndex → ℝ),
      (∀ u ∈ l, source9Quadratic u = 1) ∧ l.length ≤ 8 ∧ Even l.length ∧
      ((g : CliffordAlgebra source9Quadratic) = source9CliffordWord l ∨
        (g : CliffordAlgebra source9Quadratic) = -source9CliffordWord l) := by
  obtain ⟨l, h, hall, hlen, heven, hword, hsign⟩ := source9Spin_sourceUnitCartan_two_sign_lift g
  refine ⟨l, hall, hlen, heven, ?_⟩
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
      _ = -source9CliffordWord l := congrArg
        (fun x : CliffordAlgebra source9Quadratic => -x) hword

#print axioms FCP.BFSSSourceNineSignedWord.source9NaturalMatrix_eq_of_action_eq
#print axioms FCP.BFSSSourceNineSignedWord.source9Action_eq_iff_two_sign_fiber
#print axioms FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_two_sign_lift
#print axioms FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_signed_word
#eval IO.println "SPECTRAL_SOURCE_NINE_SIGNED_WORD_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineSignedWord
