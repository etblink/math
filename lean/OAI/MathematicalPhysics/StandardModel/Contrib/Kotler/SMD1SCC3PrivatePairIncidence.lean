import Mathlib.Tactic
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses

/-!
# SM-D1-SCC3A: private distinguishing pairs and finite incidence coverage

The original source builds only on qualified SCC1 and SCC2 definitions.
It expresses cross-family Boolean witness discrimination as a coverage
predicate and characterizes the necessity of every retained observation
using a *private pair* of admissible model instances.

This is finite, deterministic, total-prediction mathematics. It is neither
a physical-model comparison nor a statistical statement. It does not
import any theorem from the conditional NFC SCC manuscript.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC3

open FCP.StandardModel.SMD1SCC1 FCP.StandardModel.SMD1SCC2

universe u v
variable {Model : Type u} {Obs : Type v}

/-- The set of cross-model pairs distinguished by at least one member of S.
It is an incidence cover, without assuming finite or nonempty model families. -/
def CoveredPairs (p : Model → Obs → Bool) (S : Finset Obs) :
    Set (Model × Model) :=
  {pair | FiniteSeparates p S pair.1 pair.2}

/-- Uniform distinction of model families is precisely coverage of every
admissible cross-family pair. -/
theorem uniform_iff_pairwise_cover (p : Model → Obs → Bool)
    (A B : Set Model) (S : Finset Obs) :
    UniformlySeparates p A B S ↔
      ∀ pair : Model × Model, pair.1 ∈ A → pair.2 ∈ B →
        pair ∈ CoveredPairs p S := by
  constructor
  · intro h pair ha hb
    exact h pair.1 ha pair.2 hb
  · intro h a ha b hb
    exact h (a, b) ha hb

/-- A deleted witness is indispensable if its removal leaves at least one
admissible cross-family pair observationally equal. -/
theorem deletion_failure_iff_uncovered_pair (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs]
    (S : Finset Obs) (w : Obs) :
    ¬ UniformlySeparates p A B (S.erase w) ↔
      ∃ a, a ∈ A ∧ ∃ b, b ∈ B ∧
        ∀ v, v ∈ S.erase w → p a v = p b v := by
  constructor
  · intro h
    classical
    by_contra hnone
    apply h
    intro a ha b hb
    by_contra hpair
    apply hnone
    refine ⟨a, ha, b, hb, ?_⟩
    intro v hv
    by_contra hneq
    apply hpair
    exact ⟨v, hv, hneq⟩
  · rintro ⟨a, ha, b, hb, hsame⟩ hcover
    rcases hcover a ha b hb with ⟨v, hv, hneq⟩
    exact hneq (hsame v hv)

/-- A private pair is distinguished by w but by no other retained witness. -/
def PrivatePair (p : Model → Obs → Bool) (A B : Set Model)
    [DecidableEq Obs] (S : Finset Obs) (w : Obs) : Prop :=
  ∃ a, a ∈ A ∧ ∃ b, b ∈ B ∧
    p a w ≠ p b w ∧
    ∀ v, v ∈ S.erase w → p a v = p b v

/-- Coverage plus a pair left uncovered by deleting w forces that pair to
be a genuine witness at w, not merely a missing observation. -/
theorem uncovered_pair_yields_private (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs]
    (S : Finset Obs) (w : Obs)
    (hcover : UniformlySeparates p A B S)
    (hleft : ∃ a, a ∈ A ∧ ∃ b, b ∈ B ∧
      ∀ v, v ∈ S.erase w → p a v = p b v) :
    PrivatePair p A B S w := by
  rcases hleft with ⟨a, ha, b, hb, hsame⟩
  rcases hcover a ha b hb with ⟨v, hv, hneq⟩
  have hvw : v = w := by
    by_contra hvne
    have hmem : v ∈ S.erase w := Finset.mem_erase.mpr ⟨hvne, hv⟩
    exact hneq (hsame v hmem)
  subst v
  exact ⟨a, ha, b, hb, hneq, hsame⟩

/-- A separating family is deletion-minimal exactly when every selected
witness owns a private cross-family pair. -/
theorem uniform_minimal_iff_private (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs) :
    UniformDeletionMinimal p A B S ↔
      UniformlySeparates p A B S ∧
        ∀ w, w ∈ S → PrivatePair p A B S w := by
  constructor
  · intro h
    refine ⟨h.1, ?_⟩
    intro w hw
    exact uncovered_pair_yields_private p A B S w h.1
      ((deletion_failure_iff_uncovered_pair p A B S w).mp (h.2 w hw))
  · rintro ⟨hcover, hprivate⟩
    refine ⟨hcover, ?_⟩
    intro w hw hremoved
    rcases hprivate w hw with ⟨a, ha, b, hb, _, hsame⟩
    rcases hremoved a ha b hb with ⟨v, hv, hneq⟩
    exact hneq (hsame v hv)

/-- Combining original SCC2/Mathlib minimality with the private-pair
criterion gives an independently checkable certificate of inclusion
minimality, NOT necessarily minimum cardinality or minimum cost. -/
theorem inclusion_minimal_iff_private (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs) :
    Minimal (UniformlySeparates p A B) S ↔
      UniformlySeparates p A B S ∧
        ∀ w, w ∈ S → PrivatePair p A B S w := by
  exact (uniformDeletionMinimal_iff_minimal p A B S).symm.trans
    (uniform_minimal_iff_private p A B S)

#print axioms uniform_iff_pairwise_cover
#print axioms deletion_failure_iff_uncovered_pair
#print axioms uncovered_pair_yields_private
#print axioms uniform_minimal_iff_private
#print axioms inclusion_minimal_iff_private

end FCP.StandardModel.SMD1SCC3
