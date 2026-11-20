import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F0OriginalGammaCircleQuadraticFormInvariance

/-! Independent source original real-spinor dot-self invariant audit. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F0Independent

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2F0

example (z : Circle) (v : SpinIndex → ℝ) :
    (relationalCircleVector z v) ⬝ᵥ
        (relationalCircleVector z v) = v ⬝ᵥ v :=
  relationalCircleVector_dot_self z v

#print axioms FCP.RHOPFP9C3D2F0.relationalCircleVector_dot_self

end FCP.RHOPFP9C3D2F0Independent
