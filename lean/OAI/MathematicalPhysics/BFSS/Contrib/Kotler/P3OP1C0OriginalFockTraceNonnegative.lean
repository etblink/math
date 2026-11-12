import Mathlib.Basic.Complex.BigOperators
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1BOriginalFockTraceColumns

/-!
# P3-OP1C0 — nonnegative diagonal original Fock trace

Source-exact real-part positivity of the ordinary trace of T†T
on the *actual* original Fermion 2 operator carrier. This uses only
the accepted OP1B finite-column theorem, pinned Complex.re_sum,
and the standard nonnegativity of the inner product of a vector
with itself. No Hilbert--Schmidt norm instance, positive definiteness,
source Spin continuity, gauge covariance, Hamiltonian or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSP3OP1C0OriginalFockTraceNonnegative
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3OP1BOriginalFockTraceColumns

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Generic finite-column positivity on an abstract complex inner-product space.
Its proof is deliberately elaborated before specialization to the large
original Fock carrier; no replacement physical model is introduced. -/
private theorem finite_inner_self_re_nonneg
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (v : ι → E) :
    0 ≤ (∑ i : ι, ⟪v i, v i⟫_ℂ).re := by
  rw [Complex.re_sum]
  exact Finset.sum_nonneg (fun i _ =>
    inner_self_nonneg (𝕜 := ℂ) (x := v i))

/-- The real part of the original Fock-operator Hilbert-adjoint
trace is nonnegative. The basis is arbitrary and is not enumerated. -/
theorem originalFockTrace_star_mul_re_nonneg
    (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    0 ≤ (originalFockTrace (star T * T)).re := by
  rw [originalFockTrace_star_mul_eq_sum_inner b T]
  exact finite_inner_self_re_nonneg (fun i : ι => T (b i))

#print axioms originalFockTrace_star_mul_re_nonneg

end
end FCP.BFSSP3OP1C0OriginalFockTraceNonnegative
