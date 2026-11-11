import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3CDirectOriginalFockLpOutput

/-!
# NORM-0D D1-B direct original Fock FullL2 — independent consumer

Test the public source theorem against the literal original SmoothCore,
using the already-qualified original source Core.coreToL2_ae.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3CDirectOriginalFockLpOutputConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership
open FCP.BFSSNORM0D3AOriginalLpCarrierBridge
open FCP.BFSSNORM0D3CDirectOriginalFockLpOutput

/-- On the exact source SmoothCore, the original FullL2 output
agrees almost everywhere with the literal original operator field. -/
theorem originalFockLpDirect_smoothCore_ae
    (B : GammaMatrix) (f : SmoothCore 2) :
    (originalCarrierLpOfMemLp
      (fun x : Boson 2 =>
        originalNormalizedFockGramObservable x B ((coreToL2 f) x))
      (originalPointwiseFock_memLp B (coreToL2 f)) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        originalNormalizedFockGramObservable x B (f x)) := by
  filter_upwards [originalFockLpDirect_ae B (coreToL2 f), coreToL2_ae f]
    with x haction hf
  exact haction.trans (congrArg (originalNormalizedFockGramObservable x B) hf)

#print axioms FCP.BFSSNORM0D3CDirectOriginalFockLpOutput.originalFockLpDirect_ae
#print axioms originalFockLpDirect_smoothCore_ae

end
end FCP.BFSSNORM0D3CDirectOriginalFockLpOutputConsumer
