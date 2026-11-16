import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C1OriginalSource48SkewKMajoranaCovariance

/-!
# M4-LB1L0 — original Fock product commutator and gamma covariance

The first bounded step toward [K(A),K(B)] = K(A*B-B*A).
Work entirely on the true Fermion 2 complex continuous-linear-map
operator carrier, preserving the exact original Source48Label,
gamma normalization and accepted K(A) coefficient 1/4.

This proves only the associative Leibniz commutator product rule and
its original source gamma-product specialization, not Lie brackets,
Spin9 Fock group action, physical domains or spectral conclusions.
No new axiom, sorry, fake commutativity or resource limit changes.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1L0OriginalFockProductCommutator
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Pure associative NONCOMMUTATIVE Leibniz identity on genuine
original Fermion 2 continuous Fock operators, not a surrogate ring. -/
theorem originalFock_commutator_product
    (T X Y : Op) :
    T * (X * Y) - (X * Y) * T =
      (T * X - X * T) * Y + X * (T * Y - Y * T) := by
  simp only [sub_mul, mul_sub, mul_assoc]
  abel

/-- Exact original 48-label physical Fock K(A) commutator on the
product of TWO normalized source Majorana operators, obtained
from the separately qualified LB1C1 gamma covariance. -/
theorem originalSource48BivectorK_skew_commutator_gamma_product
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
  calc
    originalSource48BivectorK A *
        (sourceNormalizedGamma p * sourceNormalizedGamma q) -
      (sourceNormalizedGamma p * sourceNormalizedGamma q) *
        originalSource48BivectorK A =
      (originalSource48BivectorK A * sourceNormalizedGamma p -
        sourceNormalizedGamma p * originalSource48BivectorK A) *
          sourceNormalizedGamma q +
        sourceNormalizedGamma p *
          (originalSource48BivectorK A * sourceNormalizedGamma q -
            sourceNormalizedGamma q * originalSource48BivectorK A) :=
              originalFock_commutator_product
                (originalSource48BivectorK A)
                (sourceNormalizedGamma p) (sourceNormalizedGamma q)
    _ = (∑ r : Source48Label,
          (A r p : ℝ) • sourceNormalizedGamma r) *
            sourceNormalizedGamma q +
          sourceNormalizedGamma p *
            (∑ r : Source48Label,
              (A r q : ℝ) • sourceNormalizedGamma r) := by
      rw [originalSource48BivectorK_skew_commutator_gamma A hA p,
          originalSource48BivectorK_skew_commutator_gamma A hA q]

/-- The same actual 48×48 source Fock product commutator under
the NATIVE real matrix transpose-skew hypothesis. -/
theorem originalSource48BivectorK_skew_commutator_gamma_product_of_transpose
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A)
    (p q : Source48Label) :
    originalSource48BivectorK A *
        (sourceNormalizedGamma p * sourceNormalizedGamma q) -
      (sourceNormalizedGamma p * sourceNormalizedGamma q) *
        originalSource48BivectorK A =
      (∑ r : Source48Label, (A r p : ℝ) • sourceNormalizedGamma r) *
        sourceNormalizedGamma q +
      sourceNormalizedGamma p *
        (∑ r : Source48Label,
          (A r q : ℝ) • sourceNormalizedGamma r) :=
  originalSource48BivectorK_skew_commutator_gamma_product A
    (originalSource48_matrixSkew_entries A hA) p q

#print axioms originalFock_commutator_product
#print axioms originalSource48BivectorK_skew_commutator_gamma_product
#print axioms originalSource48BivectorK_skew_commutator_gamma_product_of_transpose

end
end FCP.BFSSP3M4LB1L0OriginalFockProductCommutator
