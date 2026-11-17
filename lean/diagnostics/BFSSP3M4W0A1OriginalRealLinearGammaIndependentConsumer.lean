import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A1OriginalRealLinearGammaTransport

/-!
# BFSS W0A1 — independently importing exact original real gamma consumer
Original Fock carrier, arbitrary source labels and real vectors, no
independent fake gamma module or native K(A) bracket.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A1OriginalRealLinearGammaIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSS1V52L9E2
open FCP.BFSSS1V52L9E4
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A1OriginalRealLinearGammaTransport

theorem originalNormalized_allSourceLabel_consumer (p : Source48Label) :
    originalNormalizedFockMajorana
        (sourceBlockColorEquiv.symm p).1
        (sourceBlockColorEquiv.symm p).2 =
      sourceNormalizedGamma p :=
  originalNormalized_allSourceLabel_eq_activeGamma p

theorem originalFockGammaRealLinear_consumer :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear =
      sourceGammaRealLinear :=
  originalFockGammaRealLinear_eq_sourceGammaRealLinear

example (p : Source48Label) :
    originalNormalizedFockMajorana
        (sourceBlockColorEquiv.symm p).1
        (sourceBlockColorEquiv.symm p).2 =
      sourceNormalizedGamma p :=
  originalNormalized_allSourceLabel_consumer p

example (v : Source48Vector) :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v =
      sourceGammaRealLinear v :=
  congrArg
    (fun f : Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2) => f v)
    originalFockGammaRealLinear_consumer

example (j : Fin 8) (s : Fin 2) (A : ColorLabel) :
    originalNormalizedFockMajorana
        (sourceBlockColorEquiv.symm (sourceBlockColorLabel (j, s) A)).1
        (sourceBlockColorEquiv.symm (sourceBlockColorLabel (j, s) A)).2 =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
  originalNormalized_allSourceLabel_consumer _

#print axioms originalNormalized_allSourceLabel_consumer
#print axioms originalFockGammaRealLinear_consumer

end
end FCP.BFSSP3M4W0A1OriginalRealLinearGammaIndependentConsumer
