import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A1OriginalRealLinearGammaTransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk

/-!
# BFSS × QIT × SCC W0A2 — original real source vector Clifford generator

The actual original complex Clifford/Fock algebra equivalence
sends the Clifford generator at 1 ⊗ₜ[ℝ] v, for each genuine
v : Source48Vector, to the active original normalized source
real-linear gamma on Fermion 2.

Only an exact source-two-donor composition: qualified OP3-A2,
then qualified W0A1. No complex spanning, commutant, trace, W0
completeness, source K bracket or physical BFSS assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A2OriginalRealCliffordGammaTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48RealLinearGamma
open scoped TensorProduct

/-- Exact original 24-mode Fock action of every REAL source-vector
generator under the existing complex Clifford algebra equivalence. -/
theorem originalComplexEquiv_realGenerator_eq_activeGamma
    (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      sourceGammaRealLinear v := by
  calc
    _ = FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v :=
      FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_generator_eq_donor v
    _ = sourceGammaRealLinear v := by
      rw [FCP.BFSSP3M4W0A1OriginalRealLinearGammaTransport.originalFockGammaRealLinear_eq_sourceGammaRealLinear]

#print axioms originalComplexEquiv_realGenerator_eq_activeGamma

end
end FCP.BFSSP3M4W0A2OriginalRealCliffordGammaTransport
