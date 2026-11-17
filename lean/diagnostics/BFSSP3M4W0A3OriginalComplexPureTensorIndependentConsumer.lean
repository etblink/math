import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A3OriginalComplexPureTensorGammaTransport

/-!
# BFSS W0A3 — independent original pure-tensor complex Clifford consumer
Two controls: arbitrary original complex scalar and scalar one.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A3OriginalComplexPureTensorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A3OriginalComplexPureTensorGammaTransport
open scoped TensorProduct

theorem originalComplexEquiv_pureTensorGenerator_consumer
    (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v :=
  originalComplexEquiv_pureTensorGenerator_eq_activeGamma z v

example (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v :=
  originalComplexEquiv_pureTensorGenerator_consumer z v

example (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        ((1 : ℂ) ⊗ₜ[ℝ] v)) =
      sourceGammaRealLinear v := by
  simpa only [one_smul] using
    (originalComplexEquiv_pureTensorGenerator_consumer (1 : ℂ) v)

#print axioms originalComplexEquiv_pureTensorGenerator_consumer

end
end FCP.BFSSP3M4W0A3OriginalComplexPureTensorIndependentConsumer
