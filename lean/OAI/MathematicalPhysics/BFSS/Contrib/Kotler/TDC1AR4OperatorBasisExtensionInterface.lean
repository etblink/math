import Mathlib.Algebra.Algebra.Bilinear
import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.StdBasis

/-!
# TD-C1A R4 P0: abstract operator-algebra basis extension

Prospective interface probe. Keep basis extension and multiplication linearity
abstract, before instantiating any original BFSS Fock definitions.
-/
set_option autoImplicit false

namespace FCP.BFSSTDC1AR4OperatorBasisExtensionInterface
noncomputable section

/-- Extend a basis intertwiner inside an arbitrary real algebra.
Multiplication linearity is supplied by pinned Mathlib, without a
pointwise vector-valued map or a new scalar compatibility proof. -/
theorem operator_covariance_of_basis
    {ι A : Type*} [Fintype ι] [DecidableEq ι]
    [Ring A] [Algebra ℝ A]
    (Γ : (ι → ℝ) →ₗ[ℝ] A)
    (C : (ι → ℝ) →ₗ[ℝ] (ι → ℝ)) (U : A)
    (haxis : ∀ p : ι,
      U * Γ (Pi.single p 1) = Γ (C (Pi.single p 1)) * U)
    (v : ι → ℝ) :
    U * Γ v = Γ (C v) * U := by
  classical
  let L : (ι → ℝ) →ₗ[ℝ] A := (LinearMap.mulLeft ℝ U).comp Γ
  let R : (ι → ℝ) →ₗ[ℝ] A :=
    (LinearMap.mulRight ℝ U).comp (Γ.comp C)
  have hLR : L = R := by
    apply (Pi.basisFun ℝ ι).ext
    intro p
    rw [Pi.basisFun_apply]
    exact haxis p
  exact congrArg (fun f : (ι → ℝ) →ₗ[ℝ] A => f v) hLR

#print axioms operator_covariance_of_basis

end
end FCP.BFSSTDC1AR4OperatorBasisExtensionInterface

