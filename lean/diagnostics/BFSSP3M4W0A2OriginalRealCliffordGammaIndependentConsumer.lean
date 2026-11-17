import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A2OriginalRealCliffordGammaTransport

/-!
# BFSS W0A2 — independently importing original real Clifford generator
consumer, two original source controls, no replacement Fock model.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A2OriginalRealCliffordGammaIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A2OriginalRealCliffordGammaTransport
open scoped TensorProduct

theorem originalComplexEquiv_realGenerator_consumer (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      sourceGammaRealLinear v :=
  originalComplexEquiv_realGenerator_eq_activeGamma v

example (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      sourceGammaRealLinear v :=
  originalComplexEquiv_realGenerator_consumer v

example (j : Fin 8) (s : Fin 2) (A : ColorLabel) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (sourceBlockColorAxis (j, s) A))) =
      sourceGammaRealLinear (sourceBlockColorAxis (j, s) A) :=
  originalComplexEquiv_realGenerator_consumer _

#print axioms originalComplexEquiv_realGenerator_consumer

end
end FCP.BFSSP3M4W0A2OriginalRealCliffordGammaIndependentConsumer
