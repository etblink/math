import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C8OriginalGammaStandardFourRadiusContinuityPositivity

/-!
# RHOPF-P9C3D2G1C9 — standard real-four radial normalization algebra

The exact Gamma9 transported Q-unit sphere has a qualified continuous
retraction (G1C7). The standard real-four Euclidean radius s(x)
is continuous and positive for nonzero x (G1C8).

Prove standard dot-self homogeneity, the radius-square identity,
and normalization into the standard dot-one sphere. This is not
yet a typed inter-sphere homeomorphism, a standard Hopf quotient,
or a physical BFSS Fock implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C9
noncomputable section

open FCP.RHOPFP9C3D2G1C8

/-- Standard Euclidean dot-self on real four-space, rather than
the default Pi product norm, is homogeneous of degree two. -/
theorem standardCoordinateDotSelf_smul (t : ℝ) (x : Fin 4 → ℝ) :
    (t • x) ⬝ᵥ (t • x) = t * (t * (x ⬝ᵥ x)) := by
  simp only [smul_dotProduct, dotProduct_smul, smul_eq_mul]

/-- Squaring the source-independent standard Euclidean radius
recovers the real-four coordinate dot-self away from zero. -/
theorem standardCoordinateRadius_mul_self
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    standardCoordinateRadius x * standardCoordinateRadius x =
      x ⬝ᵥ x := by
  change Real.sqrt (x ⬝ᵥ x) * Real.sqrt (x ⬝ᵥ x) = x ⬝ᵥ x
  exact Real.mul_self_sqrt
    (le_of_lt (Real.sqrt_pos.mp (standardCoordinateRadius_pos_of_ne_zero x hx)))

/-- Standard Euclidean radial normalization lands exactly
in the dot-one sphere; the positivity proof supplies the nonzero
denominator for cancellation. -/
theorem standardCoordinateDotSelf_inv_radius_smul
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    ((standardCoordinateRadius x)⁻¹ • x) ⬝ᵥ
      ((standardCoordinateRadius x)⁻¹ • x) = 1 := by
  have hrne : standardCoordinateRadius x ≠ 0 :=
    ne_of_gt (standardCoordinateRadius_pos_of_ne_zero x hx)
  have hsq := standardCoordinateRadius_mul_self x hx
  rw [standardCoordinateDotSelf_smul]
  rw [← hsq]
  field_simp

#print axioms standardCoordinateDotSelf_smul
#print axioms standardCoordinateRadius_mul_self
#print axioms standardCoordinateDotSelf_inv_radius_smul

end
end FCP.RHOPFP9C3D2G1C9
