import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0AOriginalGramTraceBound

/-!
# NORM-0A independent original-gauge and normalized Gram consumer

Only the newly staged source theorem is imported; no diagnostic modules
are imported as source (JOIN-0B3 first-red lesson). This downstream
consumer checks genuine G2A gauge-invariance of the trace and
normalized off-diagonal Gram coefficient envelope independently.
No operator-valued FullL2 multiplier or source Hamiltonian claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0AOriginalGramTraceBoundConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant
open FCP.BFSSNORM0AOriginalGramTraceBound

/-- Original SU2 bosonic gauge changes neither the source Gram trace
nor the eventual normalization denominator. -/
theorem originalGramTrace_gauge_invariant
    (g : GaugeGroup 2) (x : Boson 2) :
    originalGramTrace (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) =
      originalGramTrace x := by
  simp only [originalGramTrace, originalSpatialGram_gauge_invariant]

/-- The literal normalization has a strictly positive real denominator. -/
theorem originalGramTrace_denominator_positive (x : Boson 2) :
    0 < 1 + originalGramTrace x := by
  have hT := originalGramTrace_nonneg x
  linarith

/-- A genuinely downstream quantitative consequence:
the original normalized Gram coefficients lie within the unit envelope. -/
theorem originalGram_normalized_abs_le_one
    (x : Boson 2) (i j : SpaceIndex) :
    |originalSpatialGram x i j| / (1 + originalGramTrace x) ≤ 1 := by
  apply (div_le_iff₀ (originalGramTrace_denominator_positive x)).2
  have hM := originalGram_abs_le_trace x i j
  linarith

#print axioms FCP.BFSSNORM0AOriginalGramTraceBound.originalGramTrace_nonneg
#print axioms FCP.BFSSNORM0AOriginalGramTraceBound.originalGram_abs_le_trace
#print axioms originalGramTrace_gauge_invariant
#print axioms originalGram_normalized_abs_le_one

end
end FCP.BFSSNORM0AOriginalGramTraceBoundConsumer
