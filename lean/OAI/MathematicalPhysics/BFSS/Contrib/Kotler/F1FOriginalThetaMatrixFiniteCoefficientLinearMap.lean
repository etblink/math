import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction
import Mathlib.Algebra.Module.BigOperators

/-!
F1F — finite real-linear coefficient lift on the actual original 24-mode Fock
operators with the source's 48 paired Majorana labels.

The literal delta-one Majorana theta operators and the exact real
48-by-48 matrix carrier are unchanged. The coefficient is 1/2 because
for a skew elementary plane E_pq - E_qp, the intended F1E implementer
is the ordered original theta_p theta_q, not a normalized gamma product.

This gate proves only an actual real LinearMap on the full matrix space;
coordinate-plane evaluation, the skew-adjoint image, commutator action,
Lie-bracket preservation, Spin group integration, physical Hamiltonian
symmetry and spectral conclusions are separate obligations.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCoefficientLinearMap
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open scoped BigOperators

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The original-source 48-matrix finite coefficient expression,
using the actual original (unnormalized) Fock Majoranas. -/
noncomputable def originalThetaCoefficientFiniteLift
    (A : Matrix Source48Label Source48Label ℝ) : FockOp :=
  (1 / 2 : ℝ) •
    ∑ p : Source48Label, ∑ q : Source48Label,
      (A p q) • (majoranaCandidate p * majoranaCandidate q)

/-- Exact real-linearity of the original-Fock theta coefficient lift
on all 48-by-48 matrices. This is not yet a Lie algebra homomorphism. -/
noncomputable def originalThetaCoefficientLinearMap :
    Matrix Source48Label Source48Label ℝ →ₗ[ℝ] FockOp where
  toFun := originalThetaCoefficientFiniteLift
  map_add' := by
    intro A B
    -- First discharge scalar additivity on the literal real FockOp module.
    -- This type-specific identity is the missing step in the first red gate.
    have hentry (p q : Source48Label) :
        (A p q + B p q) • (majoranaCandidate p * majoranaCandidate q) =
          A p q • (majoranaCandidate p * majoranaCandidate q) +
            B p q • (majoranaCandidate p * majoranaCandidate q) :=
      add_smul (A p q) (B p q) (majoranaCandidate p * majoranaCandidate q)
    -- Only after the typed entry identity, distribute both finite sums
    -- and the outer one-half real action.
    simp only [originalThetaCoefficientFiniteLift, Matrix.add_apply,
      hentry, Finset.sum_add_distrib, smul_add]
  map_smul' := by
    intro c A
    simp only [originalThetaCoefficientFiniteLift, Matrix.smul_apply,
      Finset.smul_sum, smul_smul, smul_eq_mul]
    apply Finset.sum_congr rfl
    intro p hp
    apply Finset.sum_congr rfl
    intro q hq
    exact congrArg
      (fun z : ℝ => z • (majoranaCandidate p * majoranaCandidate q))
      (show (1 / 2 : ℝ) * (c * A p q) =
        c * ((1 / 2 : ℝ) * A p q) by ring)

/-- The new typed linear map uses precisely the literal source
coefficient finite sum, with no replacement Fock representation. -/
theorem originalThetaCoefficientLinearMap_apply
    (A : Matrix Source48Label Source48Label ℝ) :
    originalThetaCoefficientLinearMap A =
      originalThetaCoefficientFiniteLift A := rfl

#print axioms originalThetaCoefficientFiniteLift
#print axioms originalThetaCoefficientLinearMap
#print axioms originalThetaCoefficientLinearMap_apply

end
end FCP.BFSSF1FOriginalThetaCoefficientLinearMap
