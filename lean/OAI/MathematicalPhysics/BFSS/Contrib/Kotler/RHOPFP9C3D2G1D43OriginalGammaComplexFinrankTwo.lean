import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D42OriginalGammaCircleComplexScalarBridge

/-!
# RHOPF-P9C3D2G1D43 — original Gamma9 source complex finrank two

D31 equipped the isolated original Gamma9 real-four carrier with the
complex scalar action induced by its original phase endomorphism J4.
D42 proved the real source Gamma9 Circle representation agrees with
the restriction of this complex scalar action.

This gate independently constructs a REAL-linear equivalence of the
original isolated complex module's underlying real vector space with
Fin 4 → ℝ. It then uses the pinned Mathlib rank-of-complex-as-real
formula to prove complex finrank exactly two.

A dimension equality does NOT construct a basis, isometry, Hopf
quotient, Chern number, or physical BFSS hopfion.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D43
noncomputable section

open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31

/-- The source-complex carrier's underlying REAL linear structure is
the original accepted noncanonical four-real-coordinate structure.
No metric or complex orthonormal basis is transported here. -/
noncomputable def relationalSourceComplexFourRealLinearEquiv :
    RelationalSourceComplexFour ≃ₗ[ℝ] (Fin 4 → ℝ) where
  toFun := RelationalSourceComplexFour.coordinates
  invFun := fun x => ⟨x⟩
  left_inv := by
    intro x
    cases x
    rfl
  right_inv := by
    intro x
    rfl
  map_add' := by
    intro x y
    rfl
  map_smul' := by
    intro a x
    change relationalSourceComplexScalarAction (a : ℂ) x.coordinates =
      a • x.coordinates
    simp [relationalSourceComplexScalarAction]

/-- The genuine original Gamma9 isolated complex carrier has four
real degrees of freedom under its inherited real module structure. -/
theorem relationalSourceComplexFour_finrank_real :
    Module.finrank ℝ RelationalSourceComplexFour = 4 := by
  calc
    Module.finrank ℝ RelationalSourceComplexFour =
        Module.finrank ℝ (Fin 4 → ℝ) :=
      relationalSourceComplexFourRealLinearEquiv.finrank_eq
    _ = 4 := by
      exact Module.finrank_fin_fun ℝ

/-- Two complex dimensions, from four REAL dimensions and the
original Gamma9 J4-induced complex module, without any frame choice. -/
theorem relationalSourceComplexFour_finrank_complex :
    Module.finrank ℂ RelationalSourceComplexFour = 2 := by
  have h := finrank_real_of_complex RelationalSourceComplexFour
  rw [relationalSourceComplexFour_finrank_real] at h
  omega

#print axioms relationalSourceComplexFourRealLinearEquiv
#print axioms relationalSourceComplexFour_finrank_real
#print axioms relationalSourceComplexFour_finrank_complex

end
end FCP.RHOPFP9C3D2G1D43
