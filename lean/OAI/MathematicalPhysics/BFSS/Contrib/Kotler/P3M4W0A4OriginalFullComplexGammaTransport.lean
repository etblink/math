import Mathlib.LinearAlgebra.TensorProduct.Tower
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A3OriginalComplexPureTensorGammaTransport

/-!
# BFSS × QIT × SCC W0A4 — all original complexified gamma vectors

Construct the complex-linear extension of the actual original active
real Source48 gamma map by the pinned heterobasic tensor-product lift.
Then identify its value on every complexified original source vector
with the accepted M3I complex Clifford/Fock equivalence on ι.

Uses only the accepted W0A3 pure-tensor bridge and additive tensor
induction. Does not claim whole Clifford algebra generation, center,
trace separation, original K(A) bracket or any BFSS physical state.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A4OriginalFullComplexGammaTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A3OriginalComplexPureTensorGammaTransport
open scoped TensorProduct

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Complex-linear extension of the original real source 48-gamma map.
No surrogate Fock carrier and no new Clifford algebra action. -/
noncomputable def activeGammaComplexLinear :
    (ℂ ⊗[ℝ] Source48Vector) →ₗ[ℂ] Op :=
  AlgebraTensorModule.lift
    { toFun := fun z : ℂ => z • sourceGammaRealLinear
      map_add' := by
        intro z w
        exact add_smul z w sourceGammaRealLinear
      map_smul' := by
        intro z w
        exact smul_smul z w sourceGammaRealLinear }

/-- The genuine complex-linear extension evaluates a pure complex
tensor by scalar multiplication of the accepted real gamma map. -/
theorem activeGammaComplexLinear_tmul (z : ℂ) (v : Source48Vector) :
    activeGammaComplexLinear (z ⊗ₜ[ℝ] v) =
      z • sourceGammaRealLinear v := by
  change (z • sourceGammaRealLinear) v = z • sourceGammaRealLinear v
  rfl

/-- On EVERY original complexified source vector, not just a
pure tensor, the actual original complex Clifford/Fock algebra
equivalence maps the canonical Clifford generator to the source-exact
complex-linear extension of the original normalized Majoranas. -/
theorem originalComplexEquiv_allComplexGenerators_eq_activeGamma
    (w : ℂ ⊗[ℝ] Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w) =
      activeGammaComplexLinear w := by
  induction w using TensorProduct.inductionOn with
  | tmul z v =>
      exact (originalComplexEquiv_pureTensorGenerator_eq_activeGamma z v).trans
        (activeGammaComplexLinear_tmul z v).symm
  | add x y hx hy =>
      calc
        FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
            (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (x + y)) =
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
            (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) x) +
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
            (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) y) := by
          rw [map_add, map_add]
        _ = activeGammaComplexLinear x + activeGammaComplexLinear y := by
          rw [hx, hy]
        _ = activeGammaComplexLinear (x + y) := by
          rw [map_add]

#print axioms activeGammaComplexLinear_tmul
#print axioms originalComplexEquiv_allComplexGenerators_eq_activeGamma

end
end FCP.BFSSP3M4W0A4OriginalFullComplexGammaTransport
