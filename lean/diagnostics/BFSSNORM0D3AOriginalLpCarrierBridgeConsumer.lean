import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3AOriginalLpCarrierBridge

/-!
# NORM-0D original-carrier bridge — independent diagnostic consumer

Three independently reported interfaces: an arbitrary original
FullL2 input, the actual source SmoothCore inclusion, and the
accepted original normalized Fock pointwise MemLp field.
Only the importing consumer performs the last specialization.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3AOriginalLpCarrierBridgeConsumer
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership
open FCP.BFSSNORM0D3AOriginalLpCarrierBridge

/-- The new bridge returns precisely the original FullL2 input
for the existing representative and its existing MemLp proof. -/
theorem originalCarrierLp_originalInput (f : FullL2 2) :
    originalCarrierLpOfMemLp (f : Boson 2 → Fermion 2) (Lp.memLp f) = f := by
  apply Lp.ext
  exact originalCarrierLpOfMemLp_ae
    (f : Boson 2 → Fermion 2) (Lp.memLp f)

/-- Compatibility with the pre-existing original compactly supported
smooth core, using the exact source Core.coreToL2_ae theorem. -/
theorem originalCarrierLp_smoothCore (f : SmoothCore 2) :
    originalCarrierLpOfMemLp
      (f : Boson 2 → Fermion 2)
      (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport) =
      coreToL2 f := by
  apply Lp.ext
  exact (originalCarrierLpOfMemLp_ae
    (f : Boson 2 → Fermion 2)
    (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport)).trans
      (coreToL2_ae f).symm

/-- The smallest discriminating source-specialization test:
accepted original Fock-field MemLp flows into the new a.e. bridge.
This is NOT a bounded linear multiplier or the held D1-B theorem. -/
theorem originalCarrierLp_originalFockField_ae
    (B : GammaMatrix) (f : FullL2 2) :
    (originalCarrierLpOfMemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      (originalPointwiseFock_memLp B f) : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  exact originalCarrierLpOfMemLp_ae
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (originalPointwiseFock_memLp B f)

#print axioms FCP.BFSSNORM0D3AOriginalLpCarrierBridge.originalCarrierLpOfMemLp_ae
#print axioms FCP.BFSSNORM0D3AOriginalLpCarrierBridge.originalCarrierLpOfMemLp_congr
#print axioms originalCarrierLp_originalInput
#print axioms originalCarrierLp_smoothCore
#print axioms originalCarrierLp_originalFockField_ae

end
end FCP.BFSSNORM0D3AOriginalLpCarrierBridgeConsumer
