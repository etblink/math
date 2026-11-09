import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk

/-!
OP3-A2 independent consumer at the ORIGINAL source Clifford
and Fermion 2 operator carriers.

This consumer tests both the exact M3I-to-M2 Clifford generator
interface on arbitrary real source vectors and its source-axis
specialization to the OP3-A1 active positive-sqrt(2) Majorana.
It claims NO full active real gamma map equality or Spin action.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3A2IndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open scoped TensorProduct

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v :=
  FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_generator_eq_donor v

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (sourceBlockColorAxis (j, s) A))) =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
  FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_sourceAxis_eq_activeGamma j s A

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) : FockOp :=
  sourceNormalizedGamma (sourceBlockColorLabel (j, s) A)

#print axioms FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_generator_eq_donor
#print axioms FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis.originalComplexEquiv_sourceAxis_eq_activeGamma

end
end FCP.BFSSOP3A2IndependentAudit
