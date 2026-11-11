import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3AOriginalLpCarrierBridge

/-!
# NORM-0D D1-B — directly reusable original Fock L² output interface

This module promotes the *exact proof shape* that strictly compiled in
the independent carrier-bridge consumer (run #43084968990): apply the
already-qualified original-carrier MemLp.toLp representative theorem
directly to the accepted normalized original Fock field.

There is intentionally NO new named wrapper definition. The previous
named-output source is HELD after its separate recursion failure.
This establishes a genuinely original FullL2 2 class and a.e. law,
not a continuous linear multiplier, closed domain or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3CDirectOriginalFockLpOutput
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership
open FCP.BFSSNORM0D3AOriginalLpCarrierBridge

/-- Exact source-original normalized Fock multiplication produces a
genuine original FullL2 2 class with its a.e. pointwise action. -/
theorem originalFockLpDirect_ae
    (B : GammaMatrix) (f : FullL2 2) :
    (originalCarrierLpOfMemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      (originalPointwiseFock_memLp B f) : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  exact originalCarrierLpOfMemLp_ae
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
    (originalPointwiseFock_memLp B f)

#print axioms originalFockLpDirect_ae

end
end FCP.BFSSNORM0D3CDirectOriginalFockLpOutput
