import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E2OriginalGammaCirclePreservesNonzeroProjectorImage

/-! Independent exact original-source real-spinor nonzero support audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E2Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2E2

example (z : Circle) (v : SpinIndex → ℝ) (hne : v ≠ 0) :
    relationalCircleVector z v ≠ 0 :=
  relationalCircleVector_ne_zero z v hne

example (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) (hne : v ≠ 0) :
    relationalProjector.mulVec (relationalCircleVector z v) =
      relationalCircleVector z v ∧
      relationalCircleVector z v ≠ 0 :=
  relationalCircleVector_preserves_nonzero_projector_image z v hv hne

#print axioms FCP.RHOPFP9C3D2E2.relationalCircleVector_ne_zero
#print axioms FCP.RHOPFP9C3D2E2.relationalCircleVector_preserves_nonzero_projector_image

end FCP.RHOPFP9C3D2E2Independent
