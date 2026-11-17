import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Group.Action.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A3OriginalComplexPureTensorGammaTransport

/-!
# BFSS × QIT × SCC W0B0 — direct original Clifford generator commutant

A source-exact, bounded commutator-predicate induction on the actual
48 original normalized Fock Majoranas and original Fermion 2 carrier.

Unlike stopped W0A4, constructs NO new ℂ-linear gamma extension.
Only W0A3 pure tensor equality and additive tensor induction are used.
No full Clifford commutant, Schur scalar, trace or physical claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B0OriginalGammaCommutantInduction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSP3M4W0A3OriginalComplexPureTensorGammaTransport
open scoped TensorProduct

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Commutation with each ORIGINAL normalized 48-index Fock Majorana
extends to the ACTUAL finite real coordinate gamma sum, without
opening the 24-mode Fock representation. -/
theorem sourceGammaRealLinear_commute
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : Source48Vector) :
    Commute T (sourceGammaRealLinear v) := by
  change Commute T (∑ p : Source48Label, (v p) • sourceNormalizedGamma p)
  apply Commute.sum_right
  intro p hp
  rw [RCLike.real_smul_eq_coe_smul (K := ℂ)
    (v p) (sourceNormalizedGamma p)]
  exact (h p).smul_right (v p : ℂ)

/-- The original M3I complex Clifford/Fock equivalence sends every
complexified original generator into the commutant of T when T
commutes with the 48 literal normalized Fock Majoranas.

Induction is over the commute PREDICATE, not a new linear map.
This does NOT assert all Clifford elements commute with T. -/
theorem originalComplexEquiv_generator_commutes
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    Commute T
      (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w)) := by
  induction w using TensorProduct.inductionOn with
  | tmul z v =>
      rw [originalComplexEquiv_pureTensorGenerator_eq_activeGamma z v]
      exact (sourceGammaRealLinear_commute T h v).smul_right z
  | add x y hx hy =>
      simpa only [map_add] using hx.add_right hy

#print axioms sourceGammaRealLinear_commute
#print axioms originalComplexEquiv_generator_commutes

end
end FCP.BFSSP3M4W0B0OriginalGammaCommutantInduction
