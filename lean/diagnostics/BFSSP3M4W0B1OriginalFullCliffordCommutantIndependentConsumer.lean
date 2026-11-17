import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B1OriginalFullCliffordCommutantInduction

/-!
# BFSS W0B1 — independent original full Clifford-image consumer

Exact original 24-mode Fermion 2 operator algebra and source
48-label gamma family, no surrogate, no W0A4 source import.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B1OriginalFullCliffordCommutantIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0B1OriginalFullCliffordCommutantInduction
open scoped TensorProduct

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalComplexEquiv_allClifford_commutes_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : CliffordAlgebra (source48Quadratic.baseChange ℂ)) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) :=
  originalComplexEquiv_allClifford_commutes T h a

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : CliffordAlgebra (source48Quadratic.baseChange ℂ)) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) :=
  originalComplexEquiv_allClifford_commutes_consumer T h a

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w)) :=
  originalComplexEquiv_allClifford_commutes_consumer T h _

#print axioms originalComplexEquiv_allClifford_commutes_consumer

end
end FCP.BFSSP3M4W0B1OriginalFullCliffordCommutantIndependentConsumer
