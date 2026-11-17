import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1L2AbstractOriginalFockCovarianceLeibniz
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4CT0OriginalSkewBivectorTrace

/-!
# BFSS M4 CT1-G0 — opaque Jacobi on actual original Fock operators

A deliberately bounded first CT1 root: the noncommutative Jacobi
commutator identity and commutator subtraction, on the literal
Fermion 2 complex continuous-linear Fock endomorphism carrier.

The source adapter substitutes the exact original source48 K(A), K(B)
and normalized Majorana Gamma(k), without expanding any 48x48
coefficient sum. The subsequent finite-index covariance contraction
and vanishing Lie-bracket defect are NOT proved here.

No new axioms, no fake commuting Fock operator representation, no
changed original gamma, no replacement spinorial model.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4CT1G0OriginalFockJacobiSource48Adapter
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Jacobi in the literal NONCOMMUTATIVE original bounded Fock
operator algebra. All three operators stay opaque; no K expansion. -/
theorem originalFock_commutator_jacobi
    (T S X : Op) :
    (T * S - S * T) * X - X * (T * S - S * T) =
      (T * (S * X - X * S) - (S * X - X * S) * T) -
        (S * (T * X - X * T) - (T * X - X * T) * S) := by
  simp only [sub_mul, mul_sub, mul_assoc]
  abel

/-- Distributing an original Fock commutator across an opaque
operator difference; a later CT1 defect proof will use this
without unfolding either source K(A) or the source Gamma(k). -/
theorem originalFock_commutator_sub
    (T S X : Op) :
    (T - S) * X - X * (T - S) =
      (T * X - X * T) - (S * X - X * S) := by
  simp only [sub_mul, mul_sub]
  abel

/-- Source EXACT Jacobi instance with unchanged source48 label order,
actual original 1/4 bivector, and original Gamma(k) on Fermion 2.
No skewness assumption is needed for this algebraic identity. -/
theorem originalSource48K_commutator_jacobi
    (A B : Matrix Source48Label Source48Label ℝ)
    (k : Source48Label) :
    (originalSource48BivectorK A * originalSource48BivectorK B -
       originalSource48BivectorK B * originalSource48BivectorK A) *
        sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) =
      (originalSource48BivectorK A *
          (originalSource48BivectorK B * sourceNormalizedGamma k -
            sourceNormalizedGamma k * originalSource48BivectorK B) -
        (originalSource48BivectorK B * sourceNormalizedGamma k -
          sourceNormalizedGamma k * originalSource48BivectorK B) *
            originalSource48BivectorK A) -
      (originalSource48BivectorK B *
          (originalSource48BivectorK A * sourceNormalizedGamma k -
            sourceNormalizedGamma k * originalSource48BivectorK A) -
        (originalSource48BivectorK A * sourceNormalizedGamma k -
          sourceNormalizedGamma k * originalSource48BivectorK A) *
            originalSource48BivectorK B) :=
  originalFock_commutator_jacobi
    (originalSource48BivectorK A)
    (originalSource48BivectorK B)
    (sourceNormalizedGamma k)

#print axioms originalFock_commutator_jacobi
#print axioms originalFock_commutator_sub
#print axioms originalSource48K_commutator_jacobi

end
end FCP.BFSSP3M4CT1G0OriginalFockJacobiSource48Adapter
