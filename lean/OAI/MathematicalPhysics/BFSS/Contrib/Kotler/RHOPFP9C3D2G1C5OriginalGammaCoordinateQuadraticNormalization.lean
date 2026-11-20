import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C4OriginalGammaCoordinateQuadraticHomogeneity

/-!
# RHOPF-P9C3D2G1C5 — source-exact Q-unit radial normalization

The accepted exact original Gamma9 coordinate quadratic Q is
strictly positive away from zero, its sqrt radius r is continuous
and positive away from zero, and Q is quadratically homogeneous.

Certify two exact equations: r(x)*r(x)=Q(x) and
Q(r(x)⁻¹ • x)=1 for x≠0. The second uses cancellation justified
by a positive denominator. This is not a full sphere
homeomorphism, Hopf quotient or physical Fock construction.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C5
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C4

/-- Squaring the exact transported Gamma9 coordinate radius
recovers the original Euclidean dot-self on nonzero coordinates. -/
theorem relationalRangeCoordinateRadius_mul_self
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateRadius x *
      relationalRangeCoordinateRadius x =
        relationalRangeCoordinateDotSelf x := by
  change Real.sqrt (relationalRangeCoordinateDotSelf x) *
    Real.sqrt (relationalRangeCoordinateDotSelf x) =
      relationalRangeCoordinateDotSelf x
  exact Real.mul_self_sqrt
    (le_of_lt (relationalRangeCoordinateDotSelf_pos_of_ne_zero x hx))

/-- Radial normalization into the exact source-original quadratic
unit level set. No topology or circle equivariance is assumed. -/
theorem relationalRangeCoordinateDotSelf_inv_radius_smul
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateDotSelf
      ((relationalRangeCoordinateRadius x)⁻¹ • x) = 1 := by
  have hrne : relationalRangeCoordinateRadius x ≠ 0 :=
    ne_of_gt (relationalRangeCoordinateRadius_pos_of_ne_zero x hx)
  have hsq := relationalRangeCoordinateRadius_mul_self x hx
  rw [relationalRangeCoordinateDotSelf_smul]
  rw [← hsq]
  field_simp

#print axioms relationalRangeCoordinateRadius_mul_self
#print axioms relationalRangeCoordinateDotSelf_inv_radius_smul

end
end FCP.RHOPFP9C3D2G1C5
