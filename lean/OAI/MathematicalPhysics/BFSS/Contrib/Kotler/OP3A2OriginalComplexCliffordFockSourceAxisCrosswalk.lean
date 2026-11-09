import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3AOriginalCliffordFockGeneratorAxisCrosswalk

/-!
# OP3-A2 — the original complex Clifford/Fock algebra equivalence
# agrees with the active normalized Majorana source-axis generators.

Reuse exactly the already strict-qualified original M3I AlgEquiv,
the original M2 Clifford generator calculation, and the original
OP3-A1 donor-to-active 48-label axis crosswalk.

An algebra equivalence by itself does not establish a star
automorphism, Spin(9) group action, continuity, gauge compatibility,
the original physical Hamiltonian or a spectral theorem. Nor does
this theorem claim the full active real gamma maps are equal on all
vectors, or discharge the blocked literal production F1F formula.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk
open scoped TensorProduct

/-- At an arbitrary original source vector, the previously accepted
M3I complex algebra equivalence agrees with the original M2 donor
representation on the actual base-changed Clifford generator.

This theorem makes NO comparison with the active gamma map on
arbitrary vectors: that is a separate unqualified interface. -/
theorem originalComplexEquiv_generator_eq_donor
    (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v := by
  calc
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
        FCP.BFSSS1V52M2.originalComplexCliffordFockAlgHom
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v)) :=
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv_apply _
    _ = FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v :=
      FCP.BFSSS1V52M2.originalComplexCliffordFockAlgHom_generator v

/-- The actual original complexified source Clifford generator
at a genuine source 8 × 2 × 3 coordinate axis acts by the active
sqrt(2)-normalized original Fermion 2 Majorana, not by any
surrogate operator or an arbitrary representation. -/
theorem originalComplexEquiv_sourceAxis_eq_activeGamma
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (sourceBlockColorAxis (j, s) A))) =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) := by
  calc
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] (sourceBlockColorAxis (j, s) A))) =
        FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
          (sourceBlockColorAxis (j, s) A) :=
      originalComplexEquiv_generator_eq_donor _
    _ = sourceGammaRealLinear (sourceBlockColorAxis (j, s) A) :=
      donor_real_gamma_eq_active_on_source_axis j s A
    _ = sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
      sourceGammaRealLinear_axis j s A

#print axioms originalComplexEquiv_generator_eq_donor
#print axioms originalComplexEquiv_sourceAxis_eq_activeGamma

end
end FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis
