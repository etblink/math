import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC3PrivatePairIncidence
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC2FamilyMinimalWitnesses
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMD1SCC1FiniteWitnessSeparation
import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger

/-!
Independent original consumer of SCC3A using the already-qualified SCC2
Boolean toy predictor and model families. No physical data, likelihood,
parameter inference, NFC SCC theorem, or BFSS confirmation occurs here.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC3Consumer

open FCP.StandardModel.SMD1SCC1
open FCP.StandardModel.SMD1SCC2
open FCP.StandardModel.SMD1SCC2Consumer
open FCP.StandardModel.SMD1SCC3

/-- Exact incidence-cover form of the accepted SCC2 two-witness example. -/
theorem toy_incidence_cover_consumer :
    ∀ pair : Fin 3 × Fin 3, pair.1 ∈ toyA → pair.2 ∈ toyB →
      pair ∈ CoveredPairs toyPredict ({true, false} : Finset Bool) := by
  exact (uniform_iff_pairwise_cover toyPredict toyA toyB
    ({true, false} : Finset Bool)).mp two_witnesses_uniform_consumer

/-- The (0,2) pair belongs exclusively to the true-witness column. -/
theorem true_private_pair_consumer :
    PrivatePair toyPredict toyA toyB
      ({true, false} : Finset Bool) true := by
  refine ⟨0, by simp [toyA], 2, by simp [toyB], by decide, ?_⟩
  intro v hv
  have herase :
      (({true, false} : Finset Bool).erase true) =
        ({false} : Finset Bool) := by decide
  rw [herase] at hv
  have hfalse : v = false := Finset.mem_singleton.mp hv
  subst v
  decide

/-- The (1,2) pair belongs exclusively to the false-witness column. -/
theorem false_private_pair_consumer :
    PrivatePair toyPredict toyA toyB
      ({true, false} : Finset Bool) false := by
  refine ⟨1, by simp [toyA], 2, by simp [toyB], by decide, ?_⟩
  intro v hv
  have herase :
      (({true, false} : Finset Bool).erase false) =
        ({true} : Finset Bool) := by decide
  rw [herase] at hv
  have htrue : v = true := Finset.mem_singleton.mp hv
  subst v
  decide

theorem all_witnesses_have_private_pair_consumer :
    ∀ w, w ∈ ({true, false} : Finset Bool) →
      PrivatePair toyPredict toyA toyB
        ({true, false} : Finset Bool) w := by
  intro w _
  cases w with
  | false => exact false_private_pair_consumer
  | true => exact true_private_pair_consumer

/-- Independent second proof of inclusion minimality through private pairs,
instead of invoking the SCC2 minimal witness theorem as the conclusion. -/
theorem minimal_from_private_pair_consumer :
    Minimal (UniformlySeparates toyPredict toyA toyB)
      ({true, false} : Finset Bool) := by
  apply (inclusion_minimal_iff_private toyPredict toyA toyB
    ({true, false} : Finset Bool)).mpr
  exact ⟨two_witnesses_uniform_consumer,
    all_witnesses_have_private_pair_consumer⟩

example :
    ((0 : Fin 3), (2 : Fin 3)) ∈
      CoveredPairs toyPredict ({true, false} : Finset Bool) := by
  exact toy_incidence_cover_consumer (0, 2)
    (by simp [toyA]) (by simp [toyB])

example :
    ¬ ((0 : Fin 3), (2 : Fin 3)) ∈
      CoveredPairs toyPredict ({false} : Finset Bool) := by
  intro h
  rcases h with ⟨v, hv, hneq⟩
  have hfalse : v = false := Finset.mem_singleton.mp hv
  subst v
  exact hneq (by decide)

#print axioms toy_incidence_cover_consumer
#print axioms true_private_pair_consumer
#print axioms false_private_pair_consumer
#print axioms all_witnesses_have_private_pair_consumer
#print axioms minimal_from_private_pair_consumer

end FCP.StandardModel.SMD1SCC3Consumer
