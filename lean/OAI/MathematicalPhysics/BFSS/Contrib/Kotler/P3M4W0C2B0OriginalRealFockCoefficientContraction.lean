import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0AOriginalFockWeightedQuadraticCovariance
import Mathlib.Tactic

/-!
# W0C2B0 — real-scalar original Fock coefficient contraction

The original Fermion 2 bounded complex-linear operator carrier has its
qualified REAL scalar action. The finite-index matrix contraction is
proved before binding Source48Label = Fin 24 × Fin 2. This is NOT a proof
that the original Lie defect commutes with any Majorana. That is W0C2B1.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0OriginalRealFockCoefficientContraction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- Exact REAL scalar commutator transport on the original Fermion 2
operator carrier, via the already qualified source real/complex bridge. -/
theorem originalFock_commutator_real_smul
    (T X : Op) (c : ℝ) :
    T * (c • X) - (c • X) * T =
      c • (T * X - X * T) := by
  calc
    T * (c • X) - (c • X) * T =
        T * ((c : ℂ) • X) - ((c : ℂ) • X) * T := by
          rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
    _ = (c : ℂ) • (T * X - X * T) :=
          originalFock_commutator_complex_smul T X (c : ℂ)
    _ = c • (T * X - X * T) :=
          (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
            c (T * X - X * T)).symm

/-- The LEFT real coefficient contraction on the actual original Fock
operator module. No permutation of any noncommuting operator products. -/
private theorem originalFock_real_left_matrix_contraction
    {ι : Type*} [Fintype ι] (x : ι → Op)
    (A B : Matrix ι ι ℝ) (k : ι) :
    (∑ p : ι, (B p k : ℝ) •
      (∑ q : ι, (A q p : ℝ) • x q)) =
    ∑ q : ι, ((A * B) q k : ℝ) • x q := by
  classical
  calc
    (∑ p : ι, (B p k : ℝ) •
      (∑ q : ι, (A q p : ℝ) • x q)) =
        ∑ p : ι, ∑ q : ι, (B p k * A q p : ℝ) • x q := by
          apply Finset.sum_congr rfl
          intro p hp
          rw [Finset.smul_sum]
          apply Finset.sum_congr rfl
          intro q hq
          rw [smul_smul]
    _ = ∑ q : ι, ∑ p : ι, (A q p * B p k : ℝ) • x q := by
          rw [Finset.sum_comm]
          apply Finset.sum_congr rfl
          intro q hq
          apply Finset.sum_congr rfl
          intro p hp
          rw [mul_comm (B p k) (A q p)]
    _ = ∑ q : ι, ((A * B) q k : ℝ) • x q := by
          apply Finset.sum_congr rfl
          intro q hq
          simp only [Matrix.mul_apply, Finset.sum_smul]

/-- The REAL finite-index coefficient bracket, with the exact sign and
index order expected by nested original Majorana covariance. -/
theorem originalFock_real_matrix_bracket_contraction
    {ι : Type*} [Fintype ι] (x : ι → Op)
    (A B : Matrix ι ι ℝ) (k : ι) :
    (∑ p : ι, (B p k : ℝ) •
      (∑ q : ι, (A q p : ℝ) • x q)) -
    (∑ p : ι, (A p k : ℝ) •
      (∑ q : ι, (B q p : ℝ) • x q)) =
    ∑ q : ι, ((A * B - B * A) q k : ℝ) • x q := by
  classical
  calc
    (∑ p : ι, (B p k : ℝ) •
      (∑ q : ι, (A q p : ℝ) • x q)) -
    (∑ p : ι, (A p k : ℝ) •
      (∑ q : ι, (B q p : ℝ) • x q)) =
      (∑ q : ι, ((A * B) q k : ℝ) • x q) -
      (∑ q : ι, ((B * A) q k : ℝ) • x q) := by
        rw [originalFock_real_left_matrix_contraction x A B k,
            originalFock_real_left_matrix_contraction x B A k]
    _ = ∑ q : ι, ((A * B - B * A) q k : ℝ) • x q := by
          rw [← Finset.sum_sub_distrib]
          apply Finset.sum_congr rfl
          intro q hq
          rw [Matrix.sub_apply, sub_smul]

/-- Exact source48 specialization on the original 48 normalized
Majoranas, no source bivector Lie-bracket claim. -/
theorem originalSource48_gamma_real_bracket_contraction
    (A B : Mat) (k : Source48Label) :
    (∑ p : Source48Label, (B p k : ℝ) •
      (∑ q : Source48Label, (A q p : ℝ) • sourceNormalizedGamma q)) -
    (∑ p : Source48Label, (A p k : ℝ) •
      (∑ q : Source48Label, (B q p : ℝ) • sourceNormalizedGamma q)) =
    ∑ q : Source48Label,
      ((A * B - B * A) q k : ℝ) • sourceNormalizedGamma q :=
  originalFock_real_matrix_bracket_contraction sourceNormalizedGamma A B k

#print axioms originalFock_commutator_real_smul
#print axioms originalFock_real_matrix_bracket_contraction
#print axioms originalSource48_gamma_real_bracket_contraction

end
end FCP.BFSSP3M4W0C2B0OriginalRealFockCoefficientContraction
