import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses

/-!
# Independent SCC2 finite-family witness necessity consumer

All scenarios and observations are synthetic Boolean finite objects.
There is no observed datum, likelihood, unique MCS, physical model or
original NFC SCC theorem in this example.

Two scenario instances a0,a1 comprise one family and b comprises another.
The a0/b pair differs only on 'true'; the a1/b pair only on 'false'.
The set {true,false} uniformly separates both pairs, but neither singleton
does. The scenario families are finite and explicit.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC2Consumer

open FCP.StandardModel.SMD1SCC1 FCP.StandardModel.SMD1SCC2

/-- Synthetic models 0,1 are in A, 2 is in B. -/
def toyA : Set (Fin 3) := {0, 1}
def toyB : Set (Fin 3) := {2}

/-- First witness distinguishes model 0; second distinguishes model 1. -/
def toyPredict (m : Fin 3) (w : Bool) : Bool :=
  if m = 0 then w else if m = 1 then !w else false

theorem two_witnesses_uniform_consumer :
    UniformlySeparates toyPredict toyA toyB
      ({true, false} : Finset Bool) := by
  intro a ha b hb
  have ha' : a = (0 : Fin 3) ∨ a = (1 : Fin 3) := by
    simpa [toyA] using ha
  have hb' : b = (2 : Fin 3) := by
    simpa [toyB] using hb
  rcases ha' with h0 | h1
  · subst a
    subst b
    exact ⟨true, by simp, by decide⟩
  · subst a
    subst b
    exact ⟨false, by simp, by decide⟩

theorem removing_true_blocks_uniform_consumer :
    ¬ UniformlySeparates toyPredict toyA toyB
      ({false} : Finset Bool) := by
  intro h
  rcases h (0 : Fin 3) (by simp [toyA]) (2 : Fin 3) (by simp [toyB]) with
    ⟨w, hw, hne⟩
  have hw' : w = false := Finset.mem_singleton.mp hw
  subst w
  exact hne (by decide)

theorem removing_false_blocks_uniform_consumer :
    ¬ UniformlySeparates toyPredict toyA toyB
      ({true} : Finset Bool) := by
  intro h
  rcases h (1 : Fin 3) (by simp [toyA]) (2 : Fin 3) (by simp [toyB]) with
    ⟨w, hw, hne⟩
  have hw' : w = true := Finset.mem_singleton.mp hw
  subst w
  exact hne (by decide)

/-- Each of the two original witnesses is mathematically indispensable. -/
theorem both_witnesses_necessary_consumer :
    UniformDeletionMinimal toyPredict toyA toyB
      ({true, false} : Finset Bool) := by
  constructor
  · exact two_witnesses_uniform_consumer
  · intro w hw
    cases w with
    | false =>
        have herase :
            (({true, false} : Finset Bool).erase false) =
              ({true} : Finset Bool) := by decide
        rw [herase]
        exact removing_false_blocks_uniform_consumer
    | true =>
        have herase :
            (({true, false} : Finset Bool).erase true) =
              ({false} : Finset Bool) := by decide
        rw [herase]
        exact removing_true_blocks_uniform_consumer

/-- Direct use of the Mathlib-powered generic minimality equivalence. -/
theorem two_witnesses_globally_minimal_consumer :
    Minimal (UniformlySeparates toyPredict toyA toyB)
      ({true, false} : Finset Bool) := by
  exact (uniformDeletionMinimal_iff_minimal toyPredict toyA toyB
    ({true, false} : Finset Bool)).mp both_witnesses_necessary_consumer

/-- No singleton can do the whole two-model-family job. -/
example :
    ¬ UniformlySeparates toyPredict toyA toyB
      ({true} : Finset Bool) := by
  exact removing_false_blocks_uniform_consumer

/-- A nonexistent experiment cannot be a universal distinguishing set. -/
example :
    ¬ UniformlySeparates toyPredict toyA toyB
      (∅ : Finset Bool) := by
  exact empty_witnesses_blocked toyPredict toyA toyB (0 : Fin 3)
    (2 : Fin 3) (by simp [toyA]) (by simp [toyB])

#print axioms two_witnesses_uniform_consumer
#print axioms removing_true_blocks_uniform_consumer
#print axioms removing_false_blocks_uniform_consumer
#print axioms both_witnesses_necessary_consumer
#print axioms two_witnesses_globally_minimal_consumer

end FCP.StandardModel.SMD1SCC2Consumer
