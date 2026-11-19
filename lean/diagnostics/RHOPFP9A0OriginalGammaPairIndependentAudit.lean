import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A0OriginalGammaPairClifford

/-! Independent original source consumer: no alternate gamma carriers or axioms. -/
set_option autoImplicit false

namespace FCP.RHOPFP9A0IndependentAudit
open OAI.BFSSQuantum
open FCP.RHOPFP9A0
open FCP.BFSSGamma9

example : (gamma 1 * gamma 3) * (gamma 1 * gamma 3) =
    -(1 : GammaMatrix) := by
  exact originalGammaPair_sq_neg_one 1 3 (by decide)

example : (gamma 2 * gamma 5).transpose =
    -(gamma 2 * gamma 5) := by
  exact originalGammaPair_skew 2 5 (by decide)

example : (gamma 4 * gamma 6) * (gamma 4 * gamma 6) =
    -(1 : GammaMatrix) := by
  exact originalGammaPair_sq_neg_one 4 6 (by decide)

#print axioms FCP.RHOPFP9A0.originalGamma_sq
#print axioms FCP.RHOPFP9A0.originalGamma_anticommute
#print axioms FCP.RHOPFP9A0.originalGammaPair_sq_neg_one
#print axioms FCP.RHOPFP9A0.originalGammaPair_skew
#print axioms FCP.RHOPFP9A0.K13_sq
#print axioms FCP.RHOPFP9A0.K25_sq
#print axioms FCP.RHOPFP9A0.K46_sq
#print axioms FCP.RHOPFP9A0.K13_skew
#print axioms FCP.RHOPFP9A0.K25_skew
#print axioms FCP.RHOPFP9A0.K46_skew

end FCP.RHOPFP9A0IndependentAudit
