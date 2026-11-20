import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E0OriginalGammaRelationalPhaseLinearIndependence

/-!
# RHOPF-P9C3D2E1 — exact original Gamma9 Circle fixed-point criterion

On the original BFSS real 16-spinor vector carrier, the accepted
continuous source-original Circle representation leaves the rank-four
relational projector image invariant.

If a nonzero vector v in this image is fixed by a phase z : Circle,
then z must equal the identity. The proof uses the source-original
R(a,b)v = a v + b Jv adapter, real linear coefficient uniqueness,
and Mathlib Circle / Complex coordinate extensionality.

This proves a pointwise nonzero-vector fixed-point criterion, not
yet a bundled continuous free action on the relational unit sphere,
a Hopf quotient, a physical Fock implementation, or new observables.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E1
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2D
open FCP.RHOPFP9C3D2E0

/-- On the original rank-four relational projector image, no
nonidentity Mathlib Circle phase fixes a nonzero spinor vector. -/
theorem relationalCircleVector_fixed_point_implies_one
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (hfix : relationalCircleVector z v = v) :
    z = 1 := by
  have hphase :
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJ.mulVec v = v := by
    change (relationalCirclePhase (z : ℂ).re (z : ℂ).im).mulVec v = v at hfix
    rw [relationalCirclePhase_mulVec_on_projector_image _ _ v hv] at hfix
    exact hfix
  have hlinear :
      ((z : ℂ).re - 1) • v +
        (z : ℂ).im • relationalPhaseJ.mulVec v = 0 := by
    calc
      _ = ((z : ℂ).re • v +
            (z : ℂ).im • relationalPhaseJ.mulVec v) - v := by module
      _ = 0 := sub_eq_zero.mpr hphase
  obtain ⟨hre, him⟩ :=
    relationalPhaseJ_linear_coefficients_unique
      ((z : ℂ).re - 1) (z : ℂ).im v hv hne hlinear
  have hreal : (z : ℂ).re = 1 := sub_eq_zero.mp hre
  apply Circle.ext
  apply Complex.ext
  · simpa using hreal
  · simpa using him

#print axioms relationalCircleVector_fixed_point_implies_one

end
end FCP.RHOPFP9C3D2E1
