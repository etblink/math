import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B0OriginalGammaCommutantInduction

/-!
# BFSS W0B0 — independent original 48-generator commutator consumer

Only actual Source48Vector, original Fermion 2 operators,
original M3I Clifford/Fock equivalence, and W0A3 qualified donor.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B0OriginalGammaCommutantIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0B0OriginalGammaCommutantInduction
open scoped TensorProduct

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem sourceGammaRealLinear_commute_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : Source48Vector) :
    Commute T (sourceGammaRealLinear v) :=
  sourceGammaRealLinear_commute T h v

theorem originalComplexEquiv_generator_commutes_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w)) :=
  originalComplexEquiv_generator_commutes T h w

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w)) :=
  originalComplexEquiv_generator_commutes_consumer T h w

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (z : ℂ) (v : Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (z ⊗ₜ[ℝ] v))) :=
  originalComplexEquiv_generator_commutes_consumer T h (z ⊗ₜ[ℝ] v)

#print axioms sourceGammaRealLinear_commute_consumer
#print axioms originalComplexEquiv_generator_commutes_consumer

end
end FCP.BFSSP3M4W0B0OriginalGammaCommutantIndependentConsumer
