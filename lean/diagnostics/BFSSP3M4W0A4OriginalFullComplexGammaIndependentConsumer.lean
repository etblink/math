import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A4OriginalFullComplexGammaTransport

/-!
# BFSS W0A4 — independent original complexified source consumer
Actual original Source48Vector and Fermion 2 only; no physical K(A).
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A4OriginalFullComplexGammaIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A4OriginalFullComplexGammaTransport
open scoped TensorProduct

theorem activeGammaComplexLinear_tmul_consumer
    (z : ℂ) (v : Source48Vector) :
    activeGammaComplexLinear (z ⊗ₜ[ℝ] v) =
      z • sourceGammaRealLinear v :=
  activeGammaComplexLinear_tmul z v

theorem originalComplexEquiv_allComplexGenerators_consumer
    (w : ℂ ⊗[ℝ] Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w) =
      activeGammaComplexLinear w :=
  originalComplexEquiv_allComplexGenerators_eq_activeGamma w

example (w : ℂ ⊗[ℝ] Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w) =
      activeGammaComplexLinear w :=
  originalComplexEquiv_allComplexGenerators_consumer w

example (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v := by
  calc
    _ = activeGammaComplexLinear (z ⊗ₜ[ℝ] v) :=
      originalComplexEquiv_allComplexGenerators_consumer _
    _ = z • sourceGammaRealLinear v :=
      activeGammaComplexLinear_tmul_consumer z v

#print axioms activeGammaComplexLinear_tmul_consumer
#print axioms originalComplexEquiv_allComplexGenerators_consumer

end
end FCP.BFSSP3M4W0A4OriginalFullComplexGammaIndependentConsumer
