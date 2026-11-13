import OAI.RepresentationTheory.RowColumn.CopyOverlap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2AOriginalFockHSFiber

/-!
# P3-M2B2A — original source operator norm versus separate HS norm

The genuine original bounded operator `Fermion 2 →L[ℂ] Fermion 2`
retains its OPERATOR NORM. The accepted transparent HS column carrier
is a separately normed space. No original operator-valued L², gauge,
closed physical Hamiltonian, or spectrum is established.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3D5AOriginalFockHilbertColumns
open FCP.BFSSP3M2AOriginalFockHSFiber

variable {ι : Type*} [Fintype ι]

/-- Exactly the original Fock ONB sum of squared output-column norms. -/
theorem originalFockOperatorHS_norm_sq
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : Fermion 2 →L[ℂ] Fermion 2) :
    ‖originalFockOperatorToHSFiber b T‖ ^ 2 =
      ∑ i : ι, ‖T (b i)‖ ^ 2 := by
  change ‖originalFockHilbertColumns b T‖ ^ 2 =
    ∑ i : ι, ‖T (b i)‖ ^ 2
  simpa only [originalFockHilbertColumns_apply] using
    (PiLp.norm_sq_eq_of_L2 (fun _ : ι => Fermion 2)
      (originalFockHilbertColumns b T))

/-- Original operator norm is at most the separate HS Hilbert norm. -/
theorem originalFockOperator_norm_le_hs
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : Fermion 2 →L[ℂ] Fermion 2) :
    ‖T‖ ≤ ‖originalFockOperatorToHSFiber b T‖ := by
  have h := OAI.RowColumn.norm_sq_le_hilbertSchmidtSq T
  rw [OAI.RowColumn.hilbertSchmidtSq_eq_sum T b,
    ← originalFockOperatorHS_norm_sq b T] at h
  exact (sq_le_sq₀ (norm_nonneg T)
    (norm_nonneg (originalFockOperatorToHSFiber b T))).mp h

/-- For a finite original Fock ONB, the separate HS norm is bounded by
sqrt(cardinal) times the original operator norm. -/
theorem originalFockOperator_hs_le_sqrt_card_mul_norm
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T : Fermion 2 →L[ℂ] Fermion 2) :
    ‖originalFockOperatorToHSFiber b T‖ ≤
      Real.sqrt (Fintype.card ι : ℝ) * ‖T‖ := by
  have hcol (i : ι) : ‖T (b i)‖ ≤ ‖T‖ := by
    simpa only [b.norm_eq_one, mul_one] using T.le_opNorm (b i)
  have hsum : (∑ i : ι, ‖T (b i)‖ ^ 2) ≤
      (Fintype.card ι : ℝ) * ‖T‖ ^ 2 := by
    calc
      (∑ i : ι, ‖T (b i)‖ ^ 2) ≤
          ∑ _i : ι, ‖T‖ ^ 2 := by
        apply Finset.sum_le_sum
        intro i hi
        exact pow_le_pow_left₀ (norm_nonneg _) (hcol i) 2
      _ = (Fintype.card ι : ℝ) * ‖T‖ ^ 2 := by simp
  have hsq : ‖originalFockOperatorToHSFiber b T‖ ^ 2 ≤
      (Fintype.card ι : ℝ) * ‖T‖ ^ 2 := by
    rw [originalFockOperatorHS_norm_sq b T]
    exact hsum
  have hcard : 0 ≤ (Fintype.card ι : ℝ) := Nat.cast_nonneg _
  have hroot : (Real.sqrt (Fintype.card ι : ℝ) * ‖T‖) ^ 2 =
      (Fintype.card ι : ℝ) * ‖T‖ ^ 2 := by
    rw [mul_pow, Real.sq_sqrt hcard]
  apply (sq_le_sq₀ (norm_nonneg _)
    (mul_nonneg (Real.sqrt_nonneg _) (norm_nonneg T))).mp
  rw [hroot]
  exact hsq

#print axioms originalFockOperatorHS_norm_sq
#print axioms originalFockOperator_norm_le_hs
#print axioms originalFockOperator_hs_le_sqrt_card_mul_norm

end
end FCP.BFSSP3M2B2AOriginalFockOperatorHSNorm
