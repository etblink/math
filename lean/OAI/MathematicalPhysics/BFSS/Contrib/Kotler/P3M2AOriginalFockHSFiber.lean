import Mathlib.Analysis.Normed.Operator.LinearIsometry
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3D5AOriginalFockHilbertColumns

/-!
# P3-M2A — source-original operator Hilbert–Schmidt fiber

The original Fermion 2 bounded operator type retains its OPERATOR norm.
Use a distinct finite PiLp2 Hilbert column carrier, with a source-exact
linear equivalence back to the genuine original Fock operators.
The source physical-star trace pairing equals the new Hilbert inner
product. No L² operator fields, gauge, H domain or spectrum here.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M2AOriginalFockHSFiber
noncomputable section

open scoped InnerProductSpace
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3D5AOriginalFockHilbertColumns

/-- A Hilbert-normalized operator fiber represented by genuine original
Fock columns, distinct from the original operator-norm carrier. -/
abbrev OriginalFockHSFiber (ι : Type*) [Fintype ι] : Type _ :=
  PiLp 2 (fun _ : ι => Fermion 2)

variable {ι : Type*} [Fintype ι]

/-- Source bounded operator to true original-Fock Hilbert columns. A
linear equivalence, NOT an isometry for the original operator norm. -/
noncomputable def originalFockOperatorToHSFiber
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    (Fermion 2 →L[ℂ] Fermion 2) ≃ₗ[ℂ] OriginalFockHSFiber ι :=
  originalFockHilbertColumns b

/-- Reconstruct the actual original bounded operator from the HS fiber. -/
noncomputable def originalFockHSFiberToOperator
    (b : OrthonormalBasis ι ℂ (Fermion 2)) :
    OriginalFockHSFiber ι ≃ₗ[ℂ] (Fermion 2 →L[ℂ] Fermion 2) :=
  (originalFockHilbertColumns b).symm

/-- The source operator corresponding to a fiber evaluates to its
original orthonormal-basis columns. -/
theorem originalFockHSFiberToOperator_apply
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) (i : ι) :
    (originalFockHSFiberToOperator b u) (b i) = u i := by
  change ((originalFockHilbertColumns b).symm u) (b i) = u i
  calc
    ((originalFockHilbertColumns b).symm u) (b i) =
        (originalFockHilbertColumns b
          ((originalFockHilbertColumns b).symm u)) i := by
      rw [originalFockHilbertColumns_apply]
    _ = u i := congrArg (fun v : PiLp 2 (fun _ : ι => Fermion 2) => v i)
      ((originalFockHilbertColumns b).apply_symm_apply u)

/-- Original physical-star trace is exactly HS fiber inner product,
without changing the original operator-norm carrier. -/
theorem originalFockHSFiber_tracePairing
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u v : OriginalFockHSFiber ι) :
    originalFockTracePairing (originalFockHSFiberToOperator b u)
        (originalFockHSFiberToOperator b v) = ⟪u, v⟫_ℂ := by
  change originalFockTracePairing
    ((originalFockHilbertColumns b).symm u)
    ((originalFockHilbertColumns b).symm v) = ⟪u, v⟫_ℂ
  rw [originalFockTracePairing_eq_hilbertColumns_inner b]
  rw [(originalFockHilbertColumns b).apply_symm_apply u,
      (originalFockHilbertColumns b).apply_symm_apply v]

/-- Trace of the original source operator's adjoint-square agrees
with the HS fiber norm squared, NOT the operator norm squared. -/
theorem originalFockHSFiber_traceSelf
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (u : OriginalFockHSFiber ι) :
    originalFockTracePairing (originalFockHSFiberToOperator b u)
        (originalFockHSFiberToOperator b u) = (‖u‖ : ℂ) ^ 2 := by
  rw [originalFockHSFiber_tracePairing b]
  exact inner_self_eq_norm_sq_to_K u

/-- The separate HS fiber carries the ordinary genuine PiLp2
isometric structure, not the source operator norm. -/
noncomputable def originalFockHSFiberColumnsIsometry :
    OriginalFockHSFiber ι ≃ₗᵢ[ℂ] PiLp 2 (fun _ : ι => Fermion 2) :=
  LinearIsometryEquiv.refl ℂ (OriginalFockHSFiber ι)

#print axioms originalFockOperatorToHSFiber
#print axioms originalFockHSFiberToOperator
#print axioms originalFockHSFiberToOperator_apply
#print axioms originalFockHSFiber_tracePairing
#print axioms originalFockHSFiber_traceSelf
#print axioms originalFockHSFiberColumnsIsometry

end
end FCP.BFSSP3M2AOriginalFockHSFiber
