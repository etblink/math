import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D0OriginalGammaContinuousInterSphereMaps

/-!
# RHOPF-P9C3D2G1D1A — positive scalar homogeneity of both radii

The accepted G1D0 typed maps from the original Gamma9 Q-unit
sphere to the standard Euclidean dot-one sphere and back are
continuous. To prove they are mutually inverse, we need exact
positive-scalar degree-one homogeneity of their source-original
and standard Euclidean square-root radii.

This gate proves only those two radius identities, using the
already qualified quadratic homogeneity and pinned real square
root multiplication lemmas. It does not yet prove the maps
mutually inverse, construct a Homeomorph, or prove a Hopf
quotient, equivariance or a physical Fock implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D1A
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1C3
open FCP.RHOPFP9C3D2G1C4
open FCP.RHOPFP9C3D2G1C8
open FCP.RHOPFP9C3D2G1C9

/-- The source-original Gamma9 transported radius is homogeneous
of degree one under nonnegative real scalar multiplication. -/
theorem relationalRangeCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateRadius (t • x) =
      t * relationalRangeCoordinateRadius x := by
  change Real.sqrt (relationalRangeCoordinateDotSelf (t • x)) =
    t * Real.sqrt (relationalRangeCoordinateDotSelf x)
  rw [relationalRangeCoordinateDotSelf_smul, ← mul_assoc]
  rw [Real.sqrt_mul (mul_self_nonneg t)]
  rw [Real.sqrt_mul_self ht]

/-- The standard Euclidean dot-self radius on real four-space is
homogeneous of degree one under nonnegative scalar multiplication. -/
theorem standardCoordinateRadius_smul_nonneg
    (t : ℝ) (ht : 0 ≤ t) (x : Fin 4 → ℝ) :
    standardCoordinateRadius (t • x) =
      t * standardCoordinateRadius x := by
  change Real.sqrt ((t • x) ⬝ᵥ (t • x)) =
    t * Real.sqrt (x ⬝ᵥ x)
  rw [standardCoordinateDotSelf_smul, ← mul_assoc]
  rw [Real.sqrt_mul (mul_self_nonneg t)]
  rw [Real.sqrt_mul_self ht]

#print axioms relationalRangeCoordinateRadius_smul_nonneg
#print axioms standardCoordinateRadius_smul_nonneg

end
end FCP.RHOPFP9C3D2G1D1A
