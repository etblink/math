import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2E1OriginalGammaCircleNonzeroFixedPointCriterion

/-! Independent source-original Circle nonzero fixed-point type audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2E1Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2E1

example (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hne : v ≠ 0)
    (hfix : relationalCircleVector z v = v) :
    z = 1 :=
  relationalCircleVector_fixed_point_implies_one z v hv hne hfix

#print axioms FCP.RHOPFP9C3D2E1.relationalCircleVector_fixed_point_implies_one

end FCP.RHOPFP9C3D2E1Independent
