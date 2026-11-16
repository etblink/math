import Mathlib.Tactic
import Mathlib.Algebra.Star.BigOperators
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB0OriginalSource48MajoranaBivectorCAR

/-!
# P3-M4-LB1S — source 48×48 skew matrix Fock bivector generator

Define the actual original normalized Fermion 2 Fock-operator bivector

  K(A) = 1/4 ∑_{p,q : Source48Label} A[p,q] Γ_p Γ_q

with real, paired original 24×2 Majorana indices. The coefficient is
literal ONE QUARTER, implemented by (A[p,q] / 4 : ℝ) • Γ_pΓ_q,
not a surrogate Clifford/Fock representation or different source
Majorana normalization.

The first microgate certifies that K(A) is skew-adjoint for an ACTUAL
real skew 48×48 matrix. The full [K(A),Γ_k] contraction, Lie bracket,
Spin9 group lift and physical BFSS charge-domain covariance remain
independent future strict gates.

No additional axioms, sorry, reindexed Fock labels, global algebraic
commutativity assumption or unbounded heartbeats.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- A literal finite real 48×48 matrix of original source Majorana
coefficients contracts original source square-one Majoranas with exact
factor 1/4. Original continuous-linear Fock operators are NONCOMMUTATIVE. -/
noncomputable def originalSource48BivectorK
    (A : Matrix Source48Label Source48Label ℝ) : Op :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    (A p q / 4 : ℝ) •
      (sourceNormalizedGamma p * sourceNormalizedGamma q)

/-- This is the original source real-matrix transpose skewness,
expressed entrywise on the ACTUAL Source48Label carrier. -/
theorem originalSource48_matrixSkew_entries
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A)
    (p q : Source48Label) : A p q = -(A q p) := by
  have h := congrArg
    (fun M : Matrix Source48Label Source48Label ℝ => M q p) hA
  simpa using h

/-- Original 48×48 REAL skew coefficient matrices yield genuinely
skew-adjoint original Fock-vector infinitesimal operators.

Each off-diagonal Majorana bivector is already certified skew-adjoint
by LB0; diagonal coefficients vanish from the real skew hypothesis.
No matrix-entry swapping or unproved Clifford star transfer is needed. -/
theorem originalSource48BivectorK_skewAdjoint
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p)) :
    star (originalSource48BivectorK A) =
      -(originalSource48BivectorK A) := by
  classical
  have hterm (p q : Source48Label) :
      star ((A p q / 4 : ℝ) •
        (sourceNormalizedGamma p * sourceNormalizedGamma q)) =
      -((A p q / 4 : ℝ) •
        (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
    by_cases hpq : p = q
    · subst q
      have hd : A p p = 0 := by
        have hs := hA p p
        linarith
      simp [hd]
    · rw [star_smul, originalMajorana_bivector_skewAdjoint p q hpq]
      simp
  unfold originalSource48BivectorK
  calc
    star (∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) =
      ∑ p : Source48Label, ∑ q : Source48Label,
        star ((A p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
          simp only [star_sum]
    _ = ∑ p : Source48Label, ∑ q : Source48Label,
        -((A p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
          apply Finset.sum_congr rfl
          intro p hp
          apply Finset.sum_congr rfl
          intro q hq
          exact hterm p q
    _ = -(∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
          simp only [Finset.sum_neg_distrib]

/-- Transpose-skew matrices use the same exact Fock K(A) generator;
no alternate Lie carrier or surrogate spinor model is constructed. -/
theorem originalSource48BivectorK_skewAdjoint_of_transpose
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A) :
    star (originalSource48BivectorK A) =
      -(originalSource48BivectorK A) :=
  originalSource48BivectorK_skewAdjoint A
    (originalSource48_matrixSkew_entries A hA)

/-- The original source zero skew matrix produces the zero Fock
operator, a basic non-surrogate coefficient sanity control. -/
theorem originalSource48BivectorK_zero :
    originalSource48BivectorK
      (0 : Matrix Source48Label Source48Label ℝ) = (0 : Op) := by
  simp [originalSource48BivectorK]

#print axioms originalSource48BivectorK
#print axioms originalSource48_matrixSkew_entries
#print axioms originalSource48BivectorK_skewAdjoint
#print axioms originalSource48BivectorK_skewAdjoint_of_transpose
#print axioms originalSource48BivectorK_zero

end
end FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
