import OAI.MathematicalPhysics.StandardModel.Contrib.Kotler.SMY0OneFamilyAnomalyLedger

/-!
# SM-Y0 independent import consumer

This module has its own theorem declarations and explicit claims. It
checks the source ledger charge inputs, independently consumes its
four anomaly coefficients, and tests the known perturbation counterexample.
No BFSS source, Spin(10) unification or physical prediction is imported.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMY0Consumer
noncomputable section

open FCP.StandardModel.SMY0

theorem canonical_inputs_consumer :
    canonical.qDoublet = (1 / 6 : ℚ) ∧
    canonical.upConj = (-(2 / 3) : ℚ) ∧
    canonical.downConj = (1 / 3 : ℚ) ∧
    canonical.leptonDoublet = (-(1 / 2) : ℚ) ∧
    canonical.electronConj = (1 : ℚ) := by
  norm_num [canonical]

theorem colorMixed_consumer : colorMixed canonical = 0 := by
  exact canonical_colorMixed_zero

theorem weakMixed_consumer : weakMixed canonical = 0 := by
  exact canonical_weakMixed_zero

theorem cubicAbelian_consumer : cubicAbelian canonical = 0 := by
  exact canonical_cubicAbelian_zero

theorem gravityMixed_consumer : gravityMixed canonical = 0 := by
  exact canonical_gravityMixed_zero

theorem all_hypercharge_coefficients_consumer :
    HyperchargeCoefficientsVanish canonical := by
  exact canonical_hypercharge_coefficients_vanish

theorem perturbed_charge_detected_consumer :
    ¬ HyperchargeCoefficientsVanish erasedQuarkDoubletCharge := by
  exact erasedQuark_not_anomaly_free

theorem weak_doublets_even_consumer : Even (3 + 1 : ℕ) := by
  exact canonical_weak_doublet_count_even

/-- The four anomaly coefficients and the negative control agree
with the actual source definitions, not only with a theorem name. -/
example : colorMixed canonical = 0 ∧ weakMixed canonical = 0 := by
  exact ⟨colorMixed_consumer, weakMixed_consumer⟩

example : cubicAbelian canonical = 0 ∧ gravityMixed canonical = 0 := by
  exact ⟨cubicAbelian_consumer, gravityMixed_consumer⟩

example : colorMixed erasedQuarkDoubletCharge ≠ 0 := by
  exact erasedQuark_colorMixed_ne_zero

#print axioms canonical_inputs_consumer
#print axioms colorMixed_consumer
#print axioms weakMixed_consumer
#print axioms cubicAbelian_consumer
#print axioms gravityMixed_consumer
#print axioms all_hypercharge_coefficients_consumer
#print axioms perturbed_charge_detected_consumer
#print axioms weak_doublets_even_consumer

end
end FCP.StandardModel.SMY0Consumer
