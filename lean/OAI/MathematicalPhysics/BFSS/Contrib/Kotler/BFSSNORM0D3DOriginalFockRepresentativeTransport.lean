import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3CDirectOriginalFockLpOutput

/-!
# NORM-0D D1-B — original pointwise Fock-image representative transport

The source-original normalized Fock field acts on a.e.-equal input
representatives by a.e.-equal pointwise output functions. The alternate
output inherits MemLp via the already accepted D1-A certificate.

This deliberately avoids a named FullL2 output wrapper. Class-level
equality is checked independently in a separate consumer, so an
elaboration failure cannot obscure the two small source interfaces.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership

/-- Changing an original FullL2 representative on a null set changes
the genuine normalized Fock pointwise image only on a null set. -/
theorem originalFockImage_ae_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) := by
  filter_upwards [hfg] with x hx
  exact congrArg (originalNormalizedFockGramObservable x B) hx

/-- Original Fock multiplication of any alternate a.e.-equal input
representative remains MemLp 2 on the original bosonic Lebesgue space. -/
theorem originalFockImage_memLp_of_rep
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    MemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x))
      2 (volume : Measure (Boson 2)) := by
  apply MemLp.ae_eq ?_ (originalPointwiseFock_memLp B f)
  exact originalFockImage_ae_of_rep B f g hfg

#print axioms originalFockImage_ae_of_rep
#print axioms originalFockImage_memLp_of_rep

end
end FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport
