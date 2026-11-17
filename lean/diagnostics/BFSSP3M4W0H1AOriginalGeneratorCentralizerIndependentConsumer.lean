import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H1AOriginalGeneratorCentralizerComap

/-!
# W0H1A — independent consumer of the original singleton-centralizer proof

The original W0B1 induction is permanently stopped and not imported.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerComap
open scoped TensorProduct

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalGenerator_mem_sourceCentralizerPullback_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w ∈
      originalSourceCentralizerPullback T :=
  originalGenerator_mem_sourceCentralizerPullback T h w

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
      (0 : ℂ ⊗[ℝ] Source48Vector) ∈ originalSourceCentralizerPullback T :=
  originalGenerator_mem_sourceCentralizerPullback_consumer T h 0

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : Source48Vector) :
    CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
      ((1 : ℂ) ⊗ₜ[ℝ] v) ∈ originalSourceCentralizerPullback T :=
  originalGenerator_mem_sourceCentralizerPullback_consumer T h ((1 : ℂ) ⊗ₜ[ℝ] v)

#print axioms originalGenerator_mem_sourceCentralizerPullback_consumer

end
end FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerIndependentConsumer
