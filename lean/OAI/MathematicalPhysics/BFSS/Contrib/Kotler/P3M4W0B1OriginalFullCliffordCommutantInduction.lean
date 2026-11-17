import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B0OriginalGammaCommutantInduction

/-!
# BFSS × QIT × SCC W0B1 — full original complex Clifford image commutation

Source-exact extension from the W0B0 strict-qualified original
complexified Clifford GENERATOR commutant to ALL elements of the
actual original complex Clifford algebra using Mathlib induction.

The original Fock carrier is Fermion 2 and operator algebra is
Fermion 2 →L[ℂ] Fermion 2. This does not construct a new gamma
extension or assume the original BFSS K(A) Lie bracket.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B1OriginalFullCliffordCommutantInduction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0B0OriginalGammaCommutantInduction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Pointwise commutation with the original 48 normalized Fock
Majoranas implies commutation with the image of EVERY element
of the actual original complex Clifford algebra under the accepted
original M3I Clifford/Fock algebra equivalence.

This is not a Schur scalar-commutant conclusion or a BFSS
physical operator/gauge/domain result. -/
theorem originalComplexEquiv_allClifford_commutes
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : CliffordAlgebra (source48Quadratic.baseChange ℂ)) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) := by
  induction a using CliffordAlgebra.induction with
  | algebraMap z =>
      simpa only [map_algebraMap] using
        (Algebra.commutes z T).symm
  | ι w =>
      exact originalComplexEquiv_generator_commutes T h w
  | mul a b ha hb =>
      simpa only [map_mul] using ha.mul_right hb
  | add a b ha hb =>
      simpa only [map_add] using ha.add_right hb

#print axioms originalComplexEquiv_allClifford_commutes

end
end FCP.BFSSP3M4W0B1OriginalFullCliffordCommutantInduction
