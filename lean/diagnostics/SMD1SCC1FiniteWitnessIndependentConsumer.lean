import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger

/-!
# Independent SM-D1-SCC1 source consumer

Reuses generic finite witness logic and, separately, the already-qualified
SM-Y0 one-family rational coefficient checks. Values here are *mathematical*
zero/nonzero anomaly-coefficient witnesses; NOT experimental measurements.

Counterfactual changing only Q doublet hypercharge supplies two distinct
minimal mathematical witness sets, refuting an unwarranted uniqueness claim.
No physical unification or conditional NFC SCC theorem is invoked.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC1Consumer

open FCP.StandardModel.SMD1SCC1 FCP.StandardModel.SMY0

universe u v
variable {Model : Type u} {Obs : Type v}

theorem separation_iff_not_agreement_consumer
    (p : Model → Obs → Bool) (S : Set Obs) (a b : Model) :
    SeparatesOn p S a b ↔ ¬ AgreesOn p S a b := by
  constructor
  · exact separation_not_agreement p S a b
  · exact disagreement_has_witness p S a b

theorem monotone_separation_consumer
    (p : Model → Obs → Bool) (a b : Model)
    (S T : Finset Obs) (hST : S ⊆ T)
    (hs : FiniteSeparates p S a b) :
    FiniteSeparates p T a b := by
  exact finite_separation_mono p S T a b hST hs

theorem overlap_counterexample_consumer
    (p : Model → Obs → Bool) (A B : Set Model) (S : Finset Obs)
    (shared : ∃ a, a ∈ A ∧ a ∈ B) :
    ¬ UniformlySeparates p A B S := by
  exact overlap_blocks_uniform p A B S shared

theorem missing_is_not_agreement_consumer
    (p : Model → Obs → Option Bool)
    (S : Finset Obs) (a b : Model) (w : Obs)
    (hw : w ∈ S) (hmissing : p a w = none) :
    ¬ FullyAgrees p S a b := by
  exact missing_blocks_agreement p S a b w hw hmissing

/-- Exactly the original SM-Y0 rational polynomial arithmetic, exposed
as two deterministic mathematical witnesses. -/
def smy0AnomalyWitness (x : OneFamilyHypercharges) (w : Bool) : Bool :=
  if w then decide (colorMixed x = 0) else decide (weakMixed x = 0)

theorem color_coefficient_distinguishes_consumer :
    smy0AnomalyWitness canonical true ≠
      smy0AnomalyWitness erasedQuarkDoubletCharge true := by
  have hcanon : smy0AnomalyWitness canonical true = true := by
    simp [smy0AnomalyWitness, canonical_colorMixed_zero]
  have hchanged : smy0AnomalyWitness erasedQuarkDoubletCharge true = false := by
    simp [smy0AnomalyWitness, erasedQuark_colorMixed_ne_zero]
  rw [hcanon, hchanged]
  decide

theorem weak_coefficient_distinguishes_consumer :
    smy0AnomalyWitness canonical false ≠
      smy0AnomalyWitness erasedQuarkDoubletCharge false := by
  have hcanon : smy0AnomalyWitness canonical false = true := by
    simp [smy0AnomalyWitness, canonical_weakMixed_zero]
  have hchanged : smy0AnomalyWitness erasedQuarkDoubletCharge false = false := by
    simp [smy0AnomalyWitness, erasedQuark_weakMixed_ne_zero]
  rw [hcanon, hchanged]
  decide

theorem two_distinct_minimal_witnesses_consumer :
    DeletionMinimal smy0AnomalyWitness ({true} : Finset Bool)
      canonical erasedQuarkDoubletCharge ∧
    DeletionMinimal smy0AnomalyWitness ({false} : Finset Bool)
      canonical erasedQuarkDoubletCharge ∧
    ({true} : Finset Bool) ≠ ({false} : Finset Bool) := by
  exact distinct_singleton_minimals smy0AnomalyWitness
    canonical erasedQuarkDoubletCharge true false (by decide)
    color_coefficient_distinguishes_consumer
    weak_coefficient_distinguishes_consumer

/-- A computed finite mathematical counterfactual, not a physics claim. -/
example : FiniteSeparates smy0AnomalyWitness ({true} : Finset Bool)
    canonical erasedQuarkDoubletCharge := by
  exact ⟨true, by simp, color_coefficient_distinguishes_consumer⟩

/-- No finite witness set separates a model from itself. -/
example (p : Model → Obs → Bool) (S : Finset Obs) (a : Model) :
    ¬ FiniteSeparates p S a a := by
  intro hs
  rcases hs with ⟨_, _, hne⟩
  exact hne rfl

#print axioms separation_iff_not_agreement_consumer
#print axioms monotone_separation_consumer
#print axioms overlap_counterexample_consumer
#print axioms missing_is_not_agreement_consumer
#print axioms color_coefficient_distinguishes_consumer
#print axioms weak_coefficient_distinguishes_consumer
#print axioms two_distinct_minimal_witnesses_consumer

end FCP.StandardModel.SMD1SCC1Consumer
