import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A0OriginalSourceAxisWitness

/-!
# W0A0 — independent all-original-label consumer

This consumer imports only the public W0A0 theorem. It does not
recalculate the original 48-component source matrices, construct a
surrogate representation, or assert spanning/witness completeness.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A0OriginalSourceAxisIndependentConsumer
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0A0OriginalSourceAxisWitness
open scoped TensorProduct

theorem originalComplexEquiv_allLabelAxis_consumer (p : Source48Label) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (Pi.single p (1 : ℝ)))) =
      sourceNormalizedGamma p :=
  originalComplexEquiv_allLabelAxis_eq_activeGamma p

example (p : Source48Label) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (Pi.single p (1 : ℝ)))) =
      sourceNormalizedGamma p :=
  originalComplexEquiv_allLabelAxis_consumer p

example (j : Fin 8) (s : Fin 2) (A : ColorLabel) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (Pi.single (sourceBlockColorLabel (j, s) A) (1 : ℝ)))) =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
  originalComplexEquiv_allLabelAxis_consumer _

#print axioms originalComplexEquiv_allLabelAxis_consumer

end
end FCP.BFSSP3M4W0A0OriginalSourceAxisIndependentConsumer
