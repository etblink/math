import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1SOriginalSource48SkewMatrixFockBivector

/-!
# QTC1G0 — source-independent real/complex one-quarter scalar lemma

This new gate isolates the generic scalar normalization whose axioms were
standard-only in failed QTC1 R2. The original Source48 specialized K(B)
join and gamma are NOT present or inferred. Genuine original
Fermion 2 complex-linear operators, arbitrary Finite indices and ordered
opaque word values are used; no commutation or topology substitution.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC1G0OriginalFockGenericRealQuarter
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Generic real-quarter to complex outer-quarter normalization
on true original Fermion 2 endomorphisms, with arbitrary real B
and arbitrary words w. Not a native source K(B) equivalence. -/
theorem originalFock_real_quarter_quadratic_generic
    {ι : Type*} [Fintype ι]
    (w : ι → ι → Op) (B : Matrix ι ι ℝ) :
    (∑ p : ι, ∑ q : ι, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) := by
  classical
  calc
    _ = ∑ p : ι, ∑ q : ι,
        (1 / 4 : ℂ) • (((B p q : ℝ) : ℂ) • w p q) := by
      apply Finset.sum_congr rfl
      intro p hp
      apply Finset.sum_congr rfl
      intro q hq
      have hr : (B p q / 4 : ℝ) = (1 / 4 : ℝ) * B p q := by
        ring
      have hc : ((B p q / 4 : ℝ) : ℂ) =
          (1 / 4 : ℂ) * ((B p q : ℝ) : ℂ) := by
        push_cast
        ring
      calc
        (B p q / 4 : ℝ) • w p q =
          ((B p q / 4 : ℝ) : ℂ) • w p q :=
            FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
              (B p q / 4) (w p q)
        _ = ((1 / 4 : ℂ) * ((B p q : ℝ) : ℂ)) • w p q := by
          rw [hc]
        _ = (1 / 4 : ℂ) • (((B p q : ℝ) : ℂ) • w p q) := by
          rw [smul_smul]
    _ = (1 / 4 : ℂ) •
        (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) := by
      simp only [Finset.smul_sum]

#print axioms originalFock_real_quarter_quadratic_generic

end
end FCP.BFSSP3M4QTC1G0OriginalFockGenericRealQuarter
