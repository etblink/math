import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1C0OriginalSource48BivectorCommutatorExpansion

/-!
# M4-LB1C1 — original Source48 skew K(A) on genuine Fock Majoranas

FULL source-typed infinitesimal covariance of the immutable original
K(A) = 1/4 ∑_(p,q : Source48Label) A[p,q] Γ_p Γ_q
for real skew 48×48 A on genuine Fermion 2 bounded Fock operators:

  [K(A), Γ_k] = ∑_p A[p,k] Γ_p.

Import only QUALIFIED LB1C0 commutator-CAR expansion, LB1S K(A),
LB0 true 24×2 source Majorana gamma. Algebraic delta collapse is
proved in a GENERIC finite index type on the actual Fock-operator
carrier before source specialization, to avoid the repeated concrete
double-sum elaboration failures seen in LB1S R1–R4.

This does NOT assert [K(A),K(B)] = K([A,B]), group-level Spin9
unitarity on Fock vectors, source charge domains, gauge action,
a physical singlet, or any spectral result. No axiom, sorry,
new scalar-tower instance, fake operator commutativity, artificial
dimension/model or increased resource limits.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansion

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Literal original 1/4 real coefficient times a 2-complex scalar
on true original Fock operator equals 1/2 real coefficient.
Use the qualified source real-to-complex scalar bridge rather
than guessing a real-complex scalar-tower instance. -/
private theorem originalFock_quarter_two (a : ℝ) (x : Op) :
    (a / 4 : ℝ) • ((2 : ℂ) • x) =
      (a / 2 : ℝ) • x := by
  have h : (a / 4 : ℝ) * 2 = a / 2 := by ring
  have hc : ((a / 4 : ℝ) : ℂ) * (2 : ℂ) =
      ((a / 2 : ℝ) : ℂ) := by
    exact_mod_cast h
  calc
    (a / 4 : ℝ) • ((2 : ℂ) • x) =
        ((a / 4 : ℝ) : ℂ) • ((2 : ℂ) • x) :=
      FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        (a / 4) ((2 : ℂ) • x)
    _ = (((a / 4 : ℝ) : ℂ) * (2 : ℂ)) • x := by
      rw [smul_smul]
    _ = ((a / 2 : ℝ) : ℂ) • x := by rw [hc]
    _ = (a / 2 : ℝ) • x :=
      (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        (a / 2) x).symm

/-- A real coefficient acting on the genuine zero original
Fock operator is zero. This avoids the historical real-zero
source simplifier failure. -/
private theorem originalFock_real_smul_zero (a : ℝ) :
    a • (0 : Op) = (0 : Op) := by
  rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
  simpa only using (smul_zero (a : ℂ) : (a : ℂ) • (0 : Op) = (0 : Op))

/-- A single delta picks out the exact original source coefficient
with factor 1/2 from the two inside the LB0 CAR. This is proved
for ANY finite index set, before binding 48 specific gammas. -/
private theorem originalFock_single_delta
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (a : ι → ℝ) (x : Op) (k : ι) :
    (∑ q : ι, (a q / 4 : ℝ) •
      ((if q = k then (2 : ℂ) else 0) • x)) =
        (a k / 2 : ℝ) • x := by
  classical
  calc
    (∑ q : ι, (a q / 4 : ℝ) •
      ((if q = k then (2 : ℂ) else 0) • x)) =
      ∑ q : ι, (if q = k then
        (a q / 2 : ℝ) • x else (0 : Op)) := by
          apply Finset.sum_congr rfl
          intro q hq
          by_cases h : q = k
          · simp only [ite_eq_left h]
            exact originalFock_quarter_two (a q) x
          · simp only [ite_eq_right h]
            rw [zero_smul ℂ x, originalFock_real_smul_zero]
    _ = (a k / 2 : ℝ) • x := by
      simp only [Fintype.sum_ite_eq']

/-- Generic original-operator double delta collapse for any finite
real skew matrix. Noncommutative operator multiplication was already
consumed at qualified LB1C0; this lemma is entirely in the additive
group of the genuine original Fock operators. -/
theorem originalFock_skew_delta_doubleSum_contract
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (a : ι → ι → ℝ) (x : ι → Op) (k : ι)
    (ha : ∀ p q : ι, a p q = -(a q p)) :
    (∑ p : ι, ∑ q : ι, (a p q / 4 : ℝ) •
      (((if q = k then (2 : ℂ) else 0) • x p) -
        ((if p = k then (2 : ℂ) else 0) • x q))) =
      ∑ p : ι, (a p k : ℝ) • x p := by
  classical
  let P : ι → ι → Op :=
    fun p q => (a p q / 4 : ℝ) •
      ((if q = k then (2 : ℂ) else 0) • x p)
  let Q : ι → ι → Op :=
    fun p q => (a p q / 4 : ℝ) •
      ((if p = k then (2 : ℂ) else 0) • x q)
  have hseparate :
      (∑ p : ι, ∑ q : ι, (a p q / 4 : ℝ) •
        (((if q = k then (2 : ℂ) else 0) • x p) -
          ((if p = k then (2 : ℂ) else 0) • x q))) =
      (∑ p : ι, ∑ q : ι, P p q) -
        (∑ p : ι, ∑ q : ι, Q p q) := by
    calc
      (∑ p : ι, ∑ q : ι, (a p q / 4 : ℝ) •
        (((if q = k then (2 : ℂ) else 0) • x p) -
          ((if p = k then (2 : ℂ) else 0) • x q))) =
        ∑ p : ι, ∑ q : ι, (P p q - Q p q) := by
          apply Finset.sum_congr rfl
          intro p hp
          apply Finset.sum_congr rfl
          intro q hq
          exact smul_sub (a p q / 4 : ℝ) _ _
      _ = (∑ p : ι, ∑ q : ι, P p q) -
          (∑ p : ι, ∑ q : ι, Q p q) := by
            simp only [Finset.sum_sub_distrib]
  have hP :
      (∑ p : ι, ∑ q : ι, P p q) =
      ∑ p : ι, (a p k / 2 : ℝ) • x p := by
    apply Finset.sum_congr rfl
    intro p hp
    exact originalFock_single_delta (fun q => a p q) (x p) k
  have hQ :
      (∑ p : ι, ∑ q : ι, Q p q) =
      ∑ q : ι, (a k q / 2 : ℝ) • x q := by
    calc
      (∑ p : ι, ∑ q : ι, Q p q) =
        ∑ q : ι, ∑ p : ι, Q p q := Finset.sum_comm
      _ = ∑ q : ι, (a k q / 2 : ℝ) • x q := by
          apply Finset.sum_congr rfl
          intro q hq
          exact originalFock_single_delta (fun p => a p q) (x q) k
  have hterm (p : ι) :
      (a p k / 2 : ℝ) • x p -
        (a k p / 2 : ℝ) • x p =
        (a p k : ℝ) • x p := by
    have hcoeff :
        (a p k / 2 : ℝ) - (a k p / 2 : ℝ) = a p k := by
      rw [ha k p]
      ring
    have hc :
        ((a p k / 2 : ℝ) : ℂ) - ((a k p / 2 : ℝ) : ℂ) =
          ((a p k : ℝ) : ℂ) := by
      exact_mod_cast hcoeff
    calc
      (a p k / 2 : ℝ) • x p - (a k p / 2 : ℝ) • x p =
        ((a p k / 2 : ℝ) : ℂ) • x p -
          ((a k p / 2 : ℝ) : ℂ) • x p := by
            rw [
              FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
                (a p k / 2) (x p),
              FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
                (a k p / 2) (x p)]
      _ = (((a p k / 2 : ℝ) : ℂ) -
            ((a k p / 2 : ℝ) : ℂ)) • x p := by
              exact (sub_smul
                (((a p k / 2 : ℝ) : ℂ))
                (((a k p / 2 : ℝ) : ℂ))
                (x p)).symm
      _ = ((a p k : ℝ) : ℂ) • x p := by rw [hc]
      _ = (a p k : ℝ) • x p :=
        (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
          (a p k) (x p)).symm
  calc
    (∑ p : ι, ∑ q : ι, (a p q / 4 : ℝ) •
      (((if q = k then (2 : ℂ) else 0) • x p) -
        ((if p = k then (2 : ℂ) else 0) • x q))) =
      (∑ p : ι, ∑ q : ι, P p q) -
        (∑ p : ι, ∑ q : ι, Q p q) := hseparate
    _ = (∑ p : ι, (a p k / 2 : ℝ) • x p) -
        (∑ p : ι, (a k p / 2 : ℝ) • x p) := by
          rw [hP, hQ]
    _ = ∑ p : ι, (a p k : ℝ) • x p := by
          rw [← Finset.sum_sub_distrib]
          apply Finset.sum_congr rfl
          intro p hp
          exact hterm p

/-- The target FULL source exact 48-Majorana infinitesimal
covariance: a REAL skew A acts through the previously QUALIFIED
physical Fock skew generator K(A), with original delta-one
Majoranas and the fixed 1/4 coefficient. -/
theorem originalSource48BivectorK_skew_commutator_gamma
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : ∀ p q : Source48Label, A p q = -(A q p))
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, (A p k : ℝ) •
        sourceNormalizedGamma p := by
  classical
  let a : Source48Label → Source48Label → ℝ :=
    fun p q => A p q
  let x : Source48Label → Op := sourceNormalizedGamma
  have ha : ∀ p q : Source48Label, a p q = -(a q p) := by
    intro p q
    exact hA p q
  have hcarNative :
      originalSource48BivectorK A * sourceNormalizedGamma k -
        sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          (((if q = k then (2 : ℂ) else 0) • sourceNormalizedGamma p) -
            ((if p = k then (2 : ℂ) else 0) • sourceNormalizedGamma q)) :=
    originalSource48BivectorK_commutator_CAR_sum A k
  have hcollapse :
      (∑ p : Source48Label, ∑ q : Source48Label,
        (a p q / 4 : ℝ) •
          (((if q = k then (2 : ℂ) else 0) • x p) -
            ((if p = k then (2 : ℂ) else 0) • x q))) =
        ∑ p : Source48Label, (a p k : ℝ) • x p :=
    originalFock_skew_delta_doubleSum_contract a x k ha
  calc
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
        ∑ p : Source48Label, ∑ q : Source48Label,
          (A p q / 4 : ℝ) •
            (((if q = k then (2 : ℂ) else 0) • sourceNormalizedGamma p) -
              ((if p = k then (2 : ℂ) else 0) • sourceNormalizedGamma q)) := hcarNative
    _ = ∑ p : Source48Label, (A p k : ℝ) •
          sourceNormalizedGamma p := hcollapse

/-- The same original Fock source theorem under the true native
matrix transpose skewness hypothesis (not a surrogate Lie carrier). -/
theorem originalSource48BivectorK_skew_commutator_gamma_of_transpose
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, (A p k : ℝ) •
        sourceNormalizedGamma p :=
  originalSource48BivectorK_skew_commutator_gamma A
    (originalSource48_matrixSkew_entries A hA) k

#print axioms originalFock_skew_delta_doubleSum_contract
#print axioms originalSource48BivectorK_skew_commutator_gamma
#print axioms originalSource48BivectorK_skew_commutator_gamma_of_transpose

end
end FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance
