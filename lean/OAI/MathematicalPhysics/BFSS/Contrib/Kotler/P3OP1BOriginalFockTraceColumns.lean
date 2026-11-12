import Mathlib.Analysis.InnerProductSpace.Trace
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1AOriginalFockTracePairing

/-!
# P3-OP1B — ordinary original Fock trace as finite orthonormal columns

This is a source-typed trace/adjoint interface on the original finite
24-complex-mode Fermion 2 Hilbert space, not on surrogate matrices.
It does not prove a new physical L² field action, gauge equivariance,
Spin(9) source-parameter continuity or a Hamiltonian-domain statement.
-/

set_option autoImplicit false

namespace FCP.BFSSP3OP1BOriginalFockTraceColumns
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- The original continuous Fock-operator trace equals the sum of its
diagonal entries in any finite orthonormal basis of actual Fermion 2. -/
theorem originalFockTrace_eq_sum_inner
    (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    originalFockTrace T = ∑ i : ι, ⟪b i, T (b i)⟫_ℂ := by
  calc
    originalFockTrace T =
        LinearMap.trace ℂ (Fermion 2) (originalFockEndAlgEquiv.symm T) :=
      originalFockTrace_apply T
    _ = ∑ i : ι, ⟪b i, (originalFockEndAlgEquiv.symm T) (b i)⟫_ℂ :=
      LinearMap.trace_eq_sum_inner (originalFockEndAlgEquiv.symm T) b
    _ = ∑ i : ι, ⟪b i, T (b i)⟫_ℂ := by
      apply Finset.sum_congr rfl
      intro i _
      rfl

/-- The original positive-adjoint trace has the exact finite-column
quadratic expression, without substituting the operator norm for HS. -/
theorem originalFockTrace_star_mul_eq_sum_inner
    (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    originalFockTrace (star T * T) =
      ∑ i : ι, ⟪T (b i), T (b i)⟫_ℂ := by
  calc
    originalFockTrace (star T * T) =
        ∑ i : ι, ⟪b i, (star T * T) (b i)⟫_ℂ :=
      originalFockTrace_eq_sum_inner b (star T * T)
    _ = ∑ i : ι, ⟪T (b i), T (b i)⟫_ℂ := by
      apply Finset.sum_congr rfl
      intro i _
      change ⟪b i, (star T) (T (b i))⟫_ℂ =
        ⟪T (b i), T (b i)⟫_ℂ
      rw [ContinuousLinearMap.star_eq_adjoint]
      exact ContinuousLinearMap.adjoint_inner_right T (b i) (T (b i))

#print axioms originalFockTrace_eq_sum_inner
#print axioms originalFockTrace_star_mul_eq_sum_inner

end
end FCP.BFSSP3OP1BOriginalFockTraceColumns
