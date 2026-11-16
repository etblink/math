import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1SOriginalSource48SkewMatrixFockBivector

/-!
# M4-LB1C0 — exact original Source48 K(A) commutator expansion

Qualified donor LB1S has the ACTUAL original Fermion 2
48-Majorana source 1/4 generator K(A); qualified LB0 has the
literal original three-Majorana CAR identity. This first
commutator gate establishes source exact bilinearity across the
two finite sums and substitutes original CAR, without attempting
the two Kronecker-delta contractions (LB1C1).

The original 24×2 paired source labels, noncommutative Fock
operator multiplication, real coefficient action and exact
A[p,q]/4 normalization are IMMUTABLE. No surrogate gamma, new
axioms, synthetic scalar tower, raised recursion/heartbeats,
global Spin9 unitary or physical charge-domain claims.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansion
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- The additive commutator with a fixed original Fock operator
distributes across a single finite sum. Multiplication remains
NONCOMMUTATIVE and no scalar-star instance is required. -/
private theorem originalFock_commutator_sum
    {ι : Type*} [Fintype ι] (b : Op) (f : ι → Op) :
    (∑ i : ι, f i) * b - b * (∑ i : ι, f i) =
      ∑ i : ι, (f i * b - b * f i) := by
  classical
  rw [Finset.sum_mul, Finset.mul_sum, Finset.sum_sub_distrib]

/-- Apply the preceding additive identity first to rows and
then to columns, BEFORE inserting the actual 48×48 expression. -/
private theorem originalFock_commutator_doubleSum
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (b : Op) (f : ι → κ → Op) :
    (∑ i : ι, ∑ j : κ, f i j) * b -
      b * (∑ i : ι, ∑ j : κ, f i j) =
      ∑ i : ι, ∑ j : κ, (f i j * b - b * f i j) := by
  classical
  calc
    (∑ i : ι, ∑ j : κ, f i j) * b -
        b * (∑ i : ι, ∑ j : κ, f i j) =
      ∑ i : ι, ((∑ j : κ, f i j) * b -
        b * (∑ j : κ, f i j)) :=
          originalFock_commutator_sum b
            (fun i : ι => ∑ j : κ, f i j)
    _ = ∑ i : ι, ∑ j : κ,
        (f i j * b - b * f i j) := by
          apply Finset.sum_congr rfl
          intro i hi
          exact originalFock_commutator_sum b (f i)

/-- Existing original Fock real-to-complex scalar interface
commutes with the additive commutator; do not assume an
unavailable instance for real scalar multiplication on Op. -/
private theorem originalFock_commutator_realSmul
    (a : ℝ) (x b : Op) :
    (a • x) * b - b * (a • x) =
      a • (x * b - b * x) := by
  calc
    (a • x) * b - b * (a • x) =
        ((a : ℂ) • x) * b - b * ((a : ℂ) • x) := by
          rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
    _ = (a : ℂ) • (x * b - b * x) := by
          rw [smul_mul_assoc, mul_smul_comm, smul_sub]
    _ = a • (x * b - b * x) :=
      (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        a (x * b - b * x)).symm

/-- The EXACT qualified original 48×48 K(A), with literal 1/4 real
coefficient, commutes by expanding each ORIGINAL ΓpΓq summand.
There is no matrix skew hypothesis: bilinearity holds for every
real source matrix A. -/
theorem originalSource48BivectorK_commutator_doubleSum
    (A : Matrix Source48Label Source48Label ℝ)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          ((sourceNormalizedGamma p * sourceNormalizedGamma q) *
              sourceNormalizedGamma k -
            sourceNormalizedGamma k *
              (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
  classical
  let f : Source48Label → Source48Label → Op :=
    fun p q => (A p q / 4 : ℝ) •
      (sourceNormalizedGamma p * sourceNormalizedGamma q)
  have hk : originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label, f p q := by
    rfl
  have hdouble : (∑ p : Source48Label, ∑ q : Source48Label, f p q) *
        sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        (∑ p : Source48Label, ∑ q : Source48Label, f p q) =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (f p q * sourceNormalizedGamma k -
          sourceNormalizedGamma k * f p q) :=
    originalFock_commutator_doubleSum (sourceNormalizedGamma k) f
  rw [hk]
  calc
    (∑ p : Source48Label, ∑ q : Source48Label, f p q) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (∑ p : Source48Label, ∑ q : Source48Label, f p q) =
        ∑ p : Source48Label, ∑ q : Source48Label,
          (f p q * sourceNormalizedGamma k -
            sourceNormalizedGamma k * f p q) := hdouble
    _ = ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          ((sourceNormalizedGamma p * sourceNormalizedGamma q) *
              sourceNormalizedGamma k -
            sourceNormalizedGamma k *
              (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
        apply Finset.sum_congr rfl
        intro p hp
        apply Finset.sum_congr rfl
        intro q hq
        exact originalFock_commutator_realSmul
          (A p q / 4)
          (sourceNormalizedGamma p * sourceNormalizedGamma q)
          (sourceNormalizedGamma k)

/-- Substitute the qualified ORIGINAL LB0 triple Majorana CAR
inside the exact real-coefficient double-sum. Kronecker delta
contractions are not hidden here; that is the next gate. -/
theorem originalSource48BivectorK_commutator_CAR_sum
    (A : Matrix Source48Label Source48Label ℝ)
    (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label, ∑ q : Source48Label,
        (A p q / 4 : ℝ) •
          ((if q = k then (2 : ℂ) else 0) •
              sourceNormalizedGamma p -
            (if p = k then (2 : ℂ) else 0) •
              sourceNormalizedGamma q) := by
  rw [originalSource48BivectorK_commutator_doubleSum]
  apply Finset.sum_congr rfl
  intro p hp
  apply Finset.sum_congr rfl
  intro q hq
  rw [originalMajorana_bivector_commutator p q k]

/-- Genuine zero real matrix sanity for source K(A) commutation. -/
theorem originalSource48BivectorK_zero_commutator
    (k : Source48Label) :
    originalSource48BivectorK
        (0 : Matrix Source48Label Source48Label ℝ) *
          sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        originalSource48BivectorK
          (0 : Matrix Source48Label Source48Label ℝ) = (0 : Op) := by
  rw [originalSource48BivectorK_zero]
  simp

#print axioms originalSource48BivectorK_commutator_doubleSum
#print axioms originalSource48BivectorK_commutator_CAR_sum
#print axioms originalSource48BivectorK_zero_commutator

end
end FCP.BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansion
