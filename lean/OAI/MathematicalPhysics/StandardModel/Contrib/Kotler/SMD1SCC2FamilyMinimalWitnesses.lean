import Mathlib.Tactic
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation

/-!
# SM-D1-SCC2: family-level deletion-minimal distinguishing witnesses

This source imports the accepted SCC1 finite deterministic Boolean witness
definitions, and reuses the exact pinned Mathlib Finset minimality theorem.
Neither the original NFC/SCC conditional manuscript nor any physical
BFSS/Standard Model model-to-experiment map is assumed.

In this gate "minimal" is relative to an explicit pair of *scenario families*,
and means inclusion-minimal among finite witness sets that separate EVERY
admissible cross-family pair. No uniqueness or experimental power follows.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC2

open FCP.StandardModel.SMD1SCC1

universe u v
variable {Model : Type u} {Obs : Type v}

/-- All selected observables are necessary for separating the two families. -/
def UniformDeletionMinimal (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs) : Prop :=
  UniformlySeparates p A B S ∧
    ∀ w, w ∈ S → ¬ UniformlySeparates p A B (S.erase w)

/-- For upward-closed separation, one-at-a-time deletion checks characterize
global inclusion minimality; direct reuse of pinned Mathlib. -/
theorem uniformDeletionMinimal_iff_minimal (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs) :
    UniformDeletionMinimal p A B S ↔
      Minimal (UniformlySeparates p A B) S := by
  have hmono :
      ∀ ⦃s t : Finset Obs⦄, UniformlySeparates p A B t →
        t ⊆ s → UniformlySeparates p A B s := by
    intro s t ht hts
    exact uniform_separation_mono p A B t s hts ht
  exact (Finset.minimal_iff_forall_erase
    (P := UniformlySeparates p A B) (s := S) hmono).symm

theorem uniformDeletionMinimal_is_uniform (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs)
    (h : UniformDeletionMinimal p A B S) :
    UniformlySeparates p A B S :=
  h.1

/-- Distinct scenario identities can have identical predictions on the whole
chosen witness family, so non-overlapping model names alone cannot suffice. -/
theorem equivalent_pair_blocks_uniform (p : Model → Obs → Bool)
    (A B : Set Model) (S : Finset Obs) (a b : Model)
    (ha : a ∈ A) (hb : b ∈ B)
    (heq : ∀ w, w ∈ S → p a w = p b w) :
    ¬ UniformlySeparates p A B S := by
  intro h
  rcases h a ha b hb with ⟨w, hw, hne⟩
  exact hne (heq w hw)

/-- No nonempty pair of admissible families can be separated by zero
witnesses; the observational statement is vacuous only if a family is empty. -/
theorem empty_witnesses_blocked (p : Model → Obs → Bool)
    (A B : Set Model) (a b : Model) (ha : a ∈ A) (hb : b ∈ B) :
    ¬ UniformlySeparates p A B (∅ : Finset Obs) := by
  intro h
  rcases h a ha b hb with ⟨w, hw, _⟩
  exact Finset.not_mem_empty w hw

theorem family_minimal_implies_uniform (p : Model → Obs → Bool)
    (A B : Set Model) [DecidableEq Obs] (S : Finset Obs)
    (h : Minimal (UniformlySeparates p A B) S) :
    UniformlySeparates p A B S := by
  exact (uniformDeletionMinimal_iff_minimal p A B S).mpr h |>.1

#print axioms uniformDeletionMinimal_iff_minimal
#print axioms uniformDeletionMinimal_is_uniform
#print axioms equivalent_pair_blocks_uniform
#print axioms empty_witnesses_blocked
#print axioms family_minimal_implies_uniform

end FCP.StandardModel.SMD1SCC2
