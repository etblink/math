import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe

/-!
# C48-1A1a minimal exact original source-label witness preflight

Exercise the precise source G1A/S1V5 48-real-label equivalence
without importing or refactoring the genuine G4H Fock-operator action.

This is a finite indexing and dependent-statement proof-shape
preflight. Passing it does NOT qualify the full C48-1A1a Fock
covariance theorem or its independent strict consumer.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C1A1aOriginalLabelWitnessMinimalProbe

open FCP.BFSSS1V0
open FCP.BFSSS1V5

/-- Each *literal* original 48-real source label has a source-verified
(8 complex spin pair) × (2 Majorana component) × (3 color) witness. -/
theorem original_source_label_has_explicit_paired_witness
    (p : Source48Label) :
    ∃ (j : Fin 8) (s : Fin 2) (A : ColorLabel),
      sourceBlockColorLabel (j, s) A = p := by
  obtain ⟨⟨⟨j, s⟩, A⟩, hp⟩ :=
    sourceBlockColorEquiv.surjective p
  refine ⟨j, s, A, ?_⟩
  change sourceBlockColorEquiv ((j, s), A) = p
  exact hp

/-- Arbitrary downstream predicates (including a large original
Fock operator equality) can be transported at EVERY actual source
label while keeping the expensive proof goal out of inverse packing. -/
theorem every_original_label_consumes_explicit_paired_predicate
    (P : Fin 8 → Fin 2 → ColorLabel → Prop)
    (hP : ∀ j s A, P j s A)
    (p : Source48Label) :
    ∃ (j : Fin 8) (s : Fin 2) (A : ColorLabel),
      sourceBlockColorLabel (j, s) A = p ∧ P j s A := by
  obtain ⟨j, s, A, hp⟩ :=
    original_source_label_has_explicit_paired_witness p
  exact ⟨j, s, A, hp, hP j s A⟩

#print axioms original_source_label_has_explicit_paired_witness
#print axioms every_original_label_consumes_explicit_paired_predicate

end FCP.BFSSC48C1A1aOriginalLabelWitnessMinimalProbe
