import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D1OriginalFockFieldContinuity

/-!
# BFSS NORM-0D / D0-B — independent continuity/measurability consumer

Separate original-source consumers for the operator norm and strong
measurability under actual Boson 2 volume measure.
These are D0 facts, not yet FullL2 multiplier existence.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D1OriginalFockFieldContinuityConsumer
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D1OriginalFockFieldContinuity

/-- Continuous operator-valued coefficients have continuous norm. -/
theorem originalNormalizedFockGram_norm_continuous (B : GammaMatrix) :
    Continuous (fun x : Boson 2 =>
      ‖originalNormalizedFockGramObservable x B‖) :=
  (originalNormalizedFockGramObservable_continuous B).norm

/-- The original x-dependent bounded Fock-operator field is
almost-everywhere strongly measurable for genuine bosonic Lebesgue
volume. This is the D0 prerequisite for representative-wise L² action. -/
theorem originalNormalizedFockGram_aeStronglyMeasurable (B : GammaMatrix) :
    AEStronglyMeasurable
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B)
      (volume : Measure (Boson 2)) :=
  (originalNormalizedFockGramObservable_continuous B).aestronglyMeasurable

#print axioms FCP.BFSSNORM0D1OriginalFockFieldContinuity.originalFockGramObservable_continuous
#print axioms FCP.BFSSNORM0D1OriginalFockFieldContinuity.originalNormalizedFockGramObservable_continuous
#print axioms originalNormalizedFockGram_norm_continuous
#print axioms originalNormalizedFockGram_aeStronglyMeasurable

end
end FCP.BFSSNORM0D1OriginalFockFieldContinuityConsumer
