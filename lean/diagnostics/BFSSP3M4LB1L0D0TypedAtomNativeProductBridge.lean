import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-!
# BFSS M4-LB1L0 D0 — native typed atom isolation for Fock product Leibniz

R1 failed with elaborator recursion applying a generic theorem at a
source-expanded term; R2 failed with kernel timeout from `abel`
directly normalizing the same giant native expression.

This independent diagnostic DOES NOT import the failed LB1L0 module.
It uses only the qualified LB1C1 original Source48 Fock model and
tests named, type-ascribed genuine Fock operators as frozen atoms.
If this narrowly qualifies, a later separate production LB1L0 source
and independently compiled consumer can reuse the proven architecture.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1L0D0TypedAtomNativeProductBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Explicitly typed three-atom NONCOMMUTATIVE Leibniz identity,
on the real original continuous Fock operator carrier. -/
theorem originalFock_product_three_typed_atoms
    (T X Y : Op) :
    T * (X * Y) - (X * Y) * T =
      (T * X - X * T) * Y + X * (T * Y - Y * T) := by
  simp only [sub_mul, mul_sub, mul_assoc]
  abel

/-- Diagnostic only: use typed, named actual source K(A), gamma p,
and gamma q, keeping the enormous original K(A) body OUT of the
associative normalization step, then consume qualified LB1C1. -/
theorem source48_gamma_product_covariance_via_typed_atoms
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p))
    (p q : Source48Label) :
    originalSource48BivectorK A *
        (sourceNormalizedGamma p * sourceNormalizedGamma q) -
      (sourceNormalizedGamma p * sourceNormalizedGamma q) *
        originalSource48BivectorK A =
      (∑ r : Source48Label, (A r p : ℝ) • sourceNormalizedGamma r) *
        sourceNormalizedGamma q +
      sourceNormalizedGamma p *
        (∑ r : Source48Label,
          (A r q : ℝ) • sourceNormalizedGamma r) := by
  set T : Op := originalSource48BivectorK A with hT
  set X : Op := sourceNormalizedGamma p with hX
  set Y : Op := sourceNormalizedGamma q with hY
  have hp :
      T * X - X * T =
        ∑ r : Source48Label, (A r p : ℝ) • sourceNormalizedGamma r := by
    rw [hT, hX]
    exact originalSource48BivectorK_skew_commutator_gamma A hA p
  have hq :
      T * Y - Y * T =
        ∑ r : Source48Label, (A r q : ℝ) • sourceNormalizedGamma r := by
    rw [hT, hY]
    exact originalSource48BivectorK_skew_commutator_gamma A hA q
  calc
    T * (X * Y) - (X * Y) * T =
        (T * X - X * T) * Y +
          X * (T * Y - Y * T) :=
            originalFock_product_three_typed_atoms T X Y
    _ = (∑ r : Source48Label,
          (A r p : ℝ) • sourceNormalizedGamma r) * Y +
          X * (∑ r : Source48Label,
            (A r q : ℝ) • sourceNormalizedGamma r) := by
      rw [hp, hq]

#print axioms originalFock_product_three_typed_atoms
#print axioms source48_gamma_product_covariance_via_typed_atoms

end
end FCP.BFSSP3M4LB1L0D0TypedAtomNativeProductBridge
