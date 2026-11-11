import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D0OriginalGramContinuity

/-!
# NORM-0D / D0-A — independent original denominator consumer

Test the source theorem at the actual positive normalizing
denominator. Not a FullL2 operator or a full Fock-field continuity gate.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D0OriginalGramContinuityConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSNORM0AOriginalGramTraceBound
open FCP.BFSSNORM0D0OriginalGramContinuity

/-- The actual source normalization denominator is continuous. -/
theorem originalGramTrace_one_add_continuous :
    Continuous (fun x : Boson 2 => (1 : ℝ) + originalGramTrace x) := by
  exact continuous_const.add originalGramTrace_continuous

/-- The denominator is everywhere positive on the original carrier. -/
theorem originalGramTrace_one_add_pos (x : Boson 2) :
    0 < (1 : ℝ) + originalGramTrace x := by
  have h := originalGramTrace_nonneg x
  linarith

#print axioms FCP.BFSSNORM0D0OriginalGramContinuity.originalSpatialGram_continuous
#print axioms FCP.BFSSNORM0D0OriginalGramContinuity.originalGramTrace_continuous
#print axioms originalGramTrace_one_add_continuous
#print axioms originalGramTrace_one_add_pos

end
end FCP.BFSSNORM0D0OriginalGramContinuityConsumer
