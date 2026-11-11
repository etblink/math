import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3DOriginalFockRepresentativeTransport

/-!
# NORM-0D D1-B — independent original representative-class equality test

Test equality of the *actual* original FullL2 2 classes arising from
the same normalized original Fock operator applied to two a.e.-equal
input representatives. This is not a new wrapper, bounded multiplier,
gauge-domain argument or Hamiltonian spectral result.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3DOriginalFockRepresentativeTransportConsumer
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership
open FCP.BFSSNORM0D3AOriginalLpCarrierBridge
open FCP.BFSSNORM0D3CDirectOriginalFockLpOutput
open FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport

/-- The pointwise original Fock image yields the same genuine
original FullL2 quotient class for any a.e.-equal input representative. -/
theorem originalFockLpDirect_class_eq_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    originalCarrierLpOfMemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      (originalPointwiseFock_memLp B f) =
    originalCarrierLpOfMemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
      (originalFockImage_memLp_of_rep B f g hfg) := by
  apply Lp.ext
  exact (originalFockLpDirect_ae B f).trans
    ((originalFockImage_ae_of_rep B f g hfg).trans
      (originalCarrierLpOfMemLp_ae
        (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
        (originalFockImage_memLp_of_rep B f g hfg)).symm)

#print axioms FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport.originalFockImage_ae_of_rep
#print axioms FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport.originalFockImage_memLp_of_rep
#print axioms originalFockLpDirect_class_eq_of_rep

end
end FCP.BFSSNORM0D3DOriginalFockRepresentativeTransportConsumer
