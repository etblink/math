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

/-- The zero REAL scalar on genuine original complex Fock operators
is zero via the established source real-to-complex scalar bridge.
Do not install an invented StarModule ℝ instance. -/
private theorem originalRealZero_smul_FockOp (x : Op) :
    (0 : ℝ) • x = (0 : Op) := by
  rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
  exact zero_smul ℂ x

/-- Small, source-independent ADDITIVE double-Finset lemma; never
expand the full 48×48 original gamma expression while rearranging star.
This acts on the genuine original Fock-OPERATOR additive star group. -/
private theorem originalFockStar_doubleSum_neg
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (f : ι → κ → Op)
    (hf : ∀ i j, star (f i j) = -(f i j)) :
    star (∑ i, ∑ j, f i j) =
      -(∑ i, ∑ j, f i j) := by
  classical
  have hrow (i : ι) :
      star (∑ j : κ, f i j) =
        -(∑ j : κ, f i j) := by
    calc
      star (∑ j : κ, f i j) =
        ∑ j : κ, star (f i j) :=
          star_sum Finset.univ (fun j : κ => f i j)
      _ = ∑ j : κ, -(f i j) := by
        apply Finset.sum_congr rfl
        intro j hj
        exact hf i j
      _ = -(∑ j : κ, f i j) := by
        rw [Finset.sum_neg_distrib]
  calc
    star (∑ i : ι, ∑ j : κ, f i j) =
      ∑ i : ι, star (∑ j : κ, f i j) :=
        star_sum Finset.univ (fun i : ι => ∑ j : κ, f i j)
    _ = ∑ i : ι, -(∑ j : κ, f i j) := by
      apply Finset.sum_congr rfl
      intro i hi
      exact hrow i
    _ = -(∑ i : ι, ∑ j : κ, f i j) := by
      rw [Finset.sum_neg_distrib]

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
  have hrealStar (a : ℝ) (x : Op) :
      star (a • x) = a • star x := by
    calc
      star (a • x) = star ((a : ℂ) • x) := by
        rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
      _ = star (a : ℂ) • star x := star_smul _ _
      _ = (a : ℂ) • star x := by simp
      _ = a • star x :=
        (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
          a (star x)).symm
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
      simp only [hd, zero_div, originalRealZero_smul_FockOp,
        star_zero, neg_zero]
    · rw [hrealStar, originalMajorana_bivector_skewAdjoint p q hpq]
      rw [smul_neg]
  exact originalFockStar_doubleSum_neg
    (fun p q : Source48Label =>
      (A p q / 4 : ℝ) •
        (sourceNormalizedGamma p * sourceNormalizedGamma q))
    hterm

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
  change (∑ p : Source48Label, ∑ q : Source48Label,
      ((0 : ℝ) / 4) •
        (sourceNormalizedGamma p * sourceNormalizedGamma q)) = (0 : Op)
  simp only [zero_div, originalRealZero_smul_FockOp,
    Finset.sum_const_zero]

#print axioms originalSource48BivectorK
#print axioms originalSource48_matrixSkew_entries
#print axioms originalSource48BivectorK_skewAdjoint
#print axioms originalSource48BivectorK_skewAdjoint_of_transpose
#print axioms originalSource48BivectorK_zero

end
end FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
