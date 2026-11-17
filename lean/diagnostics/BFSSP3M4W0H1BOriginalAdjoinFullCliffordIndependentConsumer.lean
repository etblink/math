import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H1BOriginalAdjoinFullCliffordCommutant

/-!
# W0H1B — independent original Clifford generation/full commutant consumer

Uses only the newly proved source-exact W0H1B theorems and their accepted
W0H1A/W0B0/M3I dependencies; no surrogate model or stopped W0B1 import.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerComapR2
open FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordCommutant
open scoped TensorProduct

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalSourceCentralizerPullback_eq_top_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    originalSourceCentralizerPullback T = (⊤ : Subalgebra ℂ A) :=
  originalSourceCentralizerPullback_eq_top T h

theorem originalComplexEquiv_fullClifford_commutes_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) :
    Commute T (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) :=
  originalComplexEquiv_fullClifford_commutes T h a

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    originalSourceCentralizerPullback T = (⊤ : Subalgebra ℂ A) :=
  originalSourceCentralizerPullback_eq_top_consumer T h

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    Commute T (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv (0 : A)) :=
  originalComplexEquiv_fullClifford_commutes_consumer T h 0

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) ((1 : ℂ) ⊗ₜ[ℝ] v))) :=
  originalComplexEquiv_fullClifford_commutes_consumer T h
    (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) ((1 : ℂ) ⊗ₜ[ℝ] v))

#print axioms originalSourceCentralizerPullback_eq_top_consumer
#print axioms originalComplexEquiv_fullClifford_commutes_consumer

end
end FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordIndependentConsumer
